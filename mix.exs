defmodule Ueberauth.PagerDuty.Mixfile do
  use Mix.Project

  @source_url "https://github.com/sourdoughdev/ueberauth_pagerduty"
  @version "0.1.0"

  def project do
    [
      app: :ueberauth_pagerduty,
      version: @version,
      name: "Üeberauth PagerDuty",
      elixir: "~> 1.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:oauth2, "~> 2.1"},
      {:ueberauth, "== 0.10.5"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: [
        "README.md",
        "CHANGELOG.md",
        "LICENSE.md"
      ]
    ]
  end

  defp package do
    [
      description: "An Ueberauth strategy for using PagerDuty to authenticate your users.",
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Thomas Edgesmith"],
      licenses: ["MIT"],
      links: %{
        Changelog: "https://hexdocs.pm/ueberauth_pagerduty/changelog.html",
        GitHub: @source_url
      }
    ]
  end
end
