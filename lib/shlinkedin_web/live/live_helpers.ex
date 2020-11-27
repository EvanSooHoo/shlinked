defmodule ShlinkedinWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers
  import Phoenix.LiveView
  alias Shlinkedin.Accounts

  @doc """
  Renders a component inside the `ShlinkedinWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, ShlinkedinWeb.PostLive.FormComponent,
        id: @post.id || :new,
        action: @live_action,
        post: @post,
        return_to: Routes.post_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, ShlinkedinWeb.ModalComponent, modal_opts)
  end

  def is_user(%{"user_token" => token}, socket) do
    assign(socket, current_user: Accounts.get_user_by_session_token(token))
  end

  def is_user(_, socket) do
    assign(socket, current_user: nil)
  end

  def assign_defaults(%{"user_token" => token}, socket) do
    case Accounts.get_user_by_session_token(token) do
      {:ok, user} ->
        assign(socket, current_user: user)

      _ ->
        socket
    end
  end
end
