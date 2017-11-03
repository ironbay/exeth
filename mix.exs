defmodule Exeth.MixProject do
  use Mix.Project

  def project do
    [
      app: :exeth,
      version: "0.1.0",
      elixir: "~> 1.6-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Exeth.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:sha3, "~> 2.0"},
      {:keccak, "~> 2.0"},
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"}
    ]
  end
end
