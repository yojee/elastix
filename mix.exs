defmodule Elastix.Mixfile do
  use Mix.Project

  @source_url "https://github.com/werbitzky/elastix"
  @version "0.10.0"

  def project do
    [
      app: :elastix,
      name: "Elastix",
      version: @version,
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      applications: [:logger, :httpoison, :retry]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:httpoison, "~> 1.4 or ~> 2.0"},
      {:retry, "~> 0.8"}
    ]
  end

  defp package do
    [
      description: "A DSL-free Elastic / Elasticsearch client for Elixir.",
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md", "LICENSE"],
      maintainers: ["El Werbitzky", "evuez <helloevuez@gmail.com>"],
      licenses: ["WTFPL-2"],
      links: %{
        "Changelog" => "https://hexdocs.pm/elastix/changelog.html",
        "GitHub" => @source_url
      }
    ]
  end

  defp aliases do
    [compile: ["compile --warnings-as-errors"]]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md",
        {:LICENSE, [title: "License"]},
        "README.md",
        "pages/custom-json-codec.md"
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end
end
