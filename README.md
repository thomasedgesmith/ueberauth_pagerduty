# Überauth PagerDuty

> PagerDuty OAuth2 strategy for Überauth.

## Installation

1.  Setup your application at [PagerDuty Developer](https://developer.pagerduty.com).

2.  Add `:ueberauth_pagerduty` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [
        {:ueberauth_pagerduty, "~> 0.1"}
      ]
    end
    ```

3.  Add PagerDuty to your Überauth configuration:

    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        pagerduty: {Ueberauth.Strategy.PagerDuty, []}
      ]
    ```

4.  Update your provider configuration:

    ```elixir
    config :ueberauth, Ueberauth.Strategy.PagerDuty.OAuth,
      client_id: System.get_env("PAGERDUTY_CLIENT_ID"),
      client_secret: System.get_env("PAGERDUTY_CLIENT_SECRET")
    ```

    Or, to read the client credentials at runtime:

    ```elixir
    config :ueberauth, Ueberauth.Strategy.PagerDuty.OAuth,
      client_id: {:system, "PAGERDUTY_CLIENT_ID"},
      client_secret: {:system, "PAGERDUTY_CLIENT_SECRET"}
    ```

5.  Include the Überauth plug in your router:

    ```elixir
    defmodule MyApp.Router do
      use MyApp.Web, :router

      pipeline :browser do
        plug Ueberauth
        ...
       end
    end
    ```

6.  Create the request and callback routes if you haven't already:

    ```elixir
    scope "/auth", MyApp do
      pipe_through :browser

      get "/:provider", AuthController, :request
      get "/:provider/callback", AuthController, :callback
    end
    ```

7.  Your controller needs to implement callbacks to deal with `Ueberauth.Auth`
    and `Ueberauth.Failure` responses.

For an example implementation see the [Überauth Example](https://github.com/ueberauth/ueberauth_example) application.

## Calling

Depending on the configured url you can initiate the request through:

    /auth/pagerduty

Or with options:

    /auth/pagerduty?scope=write

By default the requested scope is `"write"`. This provides both read
and write access to the PagerDuty API (via classic auth).

Scope can be configured either explicitly as a `scope` query value on the
request path or in your configuration:

```elixir
config :ueberauth, Ueberauth,
  providers: [
    pagerduty: {Ueberauth.Strategy.PagerDuty, [default_scope: "write"]}
  ]
```

## Credits

Originally a fork of the [GitHub ueberauth strategy](https://github.com/ueberauth/ueberauth_github).
