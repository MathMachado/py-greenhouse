import os.path
import sys
import toml
import yaml


def read_config():
    try:
        with open("./pyproject.toml", "r") as f:
            return toml.load(f)["tool"]["gatekeeper"]
    except IOError:
        print("pyproject.toml does not exist")
        sys.exit(1)


def read_sources():
    try:
        with open(config["sources_path"], "r") as f:
            return yaml.load(f, Loader=yaml.FullLoader)
    except IOError:
        print(f'{config["source_path"]} does not exist')
        sys.exit(1)


def get_sources():
    sources_doc = read_sources()
    result = {}
    for key in sources_doc["sources"]:
        source_name = key["name"].split("_")[0]
        tables = [table["name"] for table in key["tables"]]
        result[source_name] = tables
    return result


def get_excluded_sources():
    return config["exclude-sources"]


def filter_sources(sources, excluded_sources):
    result = {}
    for key in sources:
        result[key] = list(set(sources[key]).difference(excluded_sources[key]))
    return result


def file_paths_from_source(filtered_sources):
    def snapshot_path_from(key, source):
        return f"./snapshots/{key}/{key}__{source}_history.sql"

    result = []
    for key in filtered_sources:
        result.extend(
            [snapshot_path_from(key, source) for source in filtered_sources[key]]
        )
    return result


def missing_file_paths(snapshot_file_paths):
    results = []
    for file in snapshot_file_paths:
        if not os.path.exists(file):
            results.append(file)
    return results


def help(missing_files):
    print(
        f"""
The following snapshot files do not exist, have you added new Sources?
{missing_files}

If you are sure you do not need to snapshot these new sources you can
exclude them from this check in the pyproject.toml gatekeeper configuration.
"""
    )


def main():
    global config
    config = read_config()
    filtered_sources = filter_sources(get_sources(), get_excluded_sources())
    file_paths = file_paths_from_source(filtered_sources)
    missing_files = missing_file_paths(file_paths)
    if len(missing_files) > 0:
        help(missing_files)
        sys.exit(1)
    sys.exit(0)


if __name__ == "__main__":
    main()
