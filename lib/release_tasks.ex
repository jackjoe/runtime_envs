defmodule RuntimeEnvs.ReleaseTasks do
  require Logger

  @start_apps []

  @app :runtime_envs

  def migrate_and_seed do
    Logger.info("|> MIGRATE_AND_SEED")

    start_services()
    run_migrate()
    run_seed()
    stop_services()
  end

  def migrate do
    Logger.info("|> MIGRATE")

    start_services()
    run_migrate()
    stop_services()
  end

  def seed do
    Logger.info("|> SEED")

    start_services()
    run_seed()
    stop_services()
  end


  def run_migrate, do: Logger.info("|> run_migrate...")

  def run_seed, do: Enum.each(repos(), &run_seeds_for/1)

  #################

  defp start_services do
    Logger.info("|> Starting dependencies...")
    # Start apps necessary for executing migrations
    Enum.each(@start_apps, &Application.ensure_all_started/1)
    # Start the Repo(s) for app
    Logger.info("|> Starting repos...")
    # Switch pool_size to 2 for ecto > 3.0
    Enum.each(repos(), & &1.start_link(pool_size: 2))
  end

  defp stop_services do
    Logger.info("|> Success!")
    :init.stop()
  end

  defp run_seeds_for(_), do: Logger.info("|> run_seeds_for...")

  defp repos do
    Application.load(@app)
  end
end