

Skip to content
Using Gmail with screen readers
label:@backlog 
Meet
Hangouts

1 of 1,613
(no subject)
@Backlog

Nelio Machado <neliomachado@gmail.com>
Attachments
10:48 PM (0 minutes ago)
to me


Cumprimentos,

Nelio Machado
Data {Engineer, Scientist}
Attachments area
Infinitas Data Warehouse
========================
A [dbt](https://www.getdbt.com/) project for Infinitas Data Warehouse. [The T](https://blog.getdbt.com/what--exactly--is-dbt-/) in [ELT](https://en.wikipedia.org/wiki/Extract,_load,_transform) - with [Fivetran](https://fivetran.com/blog/etl-vs-elt) doing the EL.


Usage
-----
### Prerequisites
- [Python ^3.8](https://github.com/pyenv/pyenv)
- [Make](https://www.gnu.org/software/make/)
- [Poetry](https://python-poetry.org/)
- [Infinitas Snowflake](https://infinitaslearning.west-europe.azure.snowflakecomputing.com) account with connection details and own development database (e.g. `DEV_DB_YOURNAME`)

### Build
As dbt is implemented in [Python](https://www.python.org/), the project uses [Poetry](https://python-poetry.org/) one of the modern python project build tools. To simplify interactions with Poetry and tools installed by Poetry, including dealing with different environments we wrap commonly used commands into [Make](https://www.gnu.org/software/make/) targets.

#### Installing dependencies
Use make to install all dependencies used by the project by issuing.
```
$ make install
```

This target will install Python dependencies of this project (including dbt) as well as any additional tools specific dependencies (e.g. dbt packages).

It uses Poetry to manage Python dependencies, which will ensure they're installed in a [virtual environment](https://realpython.com/python-virtual-environments-a-primer/) to ensure project's dependencies are isolated from other projects or operating system.

#### Configuring a profile
To be able to connect to the warehouse, you need to configure your (local development) [profile](https://docs.getdbt.com/dbt-cli/configure-your-profile/).

The profiles file is located at `~/.dbt/profiles.yml` and can store many profiles in a [yaml](https://en.wikipedia.org/wiki/YAML) map. The one we need is the one that's configured in our [dbt_project.yml](./dbt_project.yml) - `infinitas_dwh`. You can use this template:
```yaml
infinitas_dwh:
  target: local
  outputs:
    local:
      type: snowflake
      account: infinitaslearning.west-europe.azure
      user: your_username
      password: your_password
      role: local_developer
      database: your_development_database
      warehouse: engineering
      schema: dev
      threads: 4
```

### Run

#### Executions
The project has three main executions in which it executes corresponding dbt commands.

##### Snapshot
Takes a [historical snapshot](https://docs.getdbt.com/docs/building-a-dbt-project/snapshots/) of landing data.

**It is important to ensure we snapshot all landing tables we use as sources.**

##### Seed
Copies all the [CSV seed data](https://docs.getdbt.com/docs/building-a-dbt-project/seeds/) into warehouse.

##### Run
Builds all [models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models)

#### Running commands
As dbt is installed in a virtual environment you can't just execute it outside of it. Use [make targets](#use-make-to-run-commands) for common commands to bypass the complexity.

To execute a single command in poetry managed virtual environment use `poetry run` command.
```
$ poetry run dbt snapshot
```

To start a session in which you may execute many dbt commands (or other tools installed in virtual environment) run `poetry shell` command to enter virtual environment. Execute `exit` to exit the environment (or just send the end of file signal `Ctrl+D` if you're lazy like Dali).
```
$ poetry shell
(.venv) $ dbt snapshot
(.venv) $ dbt run
(.venv) $ exit
$
```

#### Use Make to run commands
As running "raw" commands by hand can be a bit tedius, repetitive and thusly error prone, most frequently used operations are configured as Make targets. Here are some examples:
- `$ make install` - Installs all the dependencies related to the project
- `$ make lint` - Runs linters on the codebase
- dbt commands
    - `$ make seed` - Load seed (csv) data
    - `$ make snapshot` - Take snapshot of incoming data
    - `$ make run` - Build models

Resources
---------
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
new 1.txt
Displaying new 1.txt.

