defmodule Mixcord.Struct.Message do
  @moduledoc """
  Struct representing a Discord message.
  """

  alias Mixcord.Struct.Guild.Role
  alias Mixcord.Struct.Message.Attachment
  alias Mixcord.Struct.User
  alias Mixcord.Util

  @typedoc "The id of the message"
  @type id :: integer

  @typedoc "The id of the channel"
  @type channel_id :: integer

  @typedoc "The user struct of the author"
  @type author :: User.t

  @typedoc "The content of the message"
  @type content :: String.t

  @typedoc "When the message was sent"
  @type timestamp :: String.t

  @typedoc "When the message was edited"
  @type edited_timestamp :: String.t | nil

  @typedoc "Whether this was a TTS message"
  @type tts :: boolean

  @typedoc "Whether this messsage mentions everyone"
  @type mention_everyone :: boolean

  @typedoc "List of users mentioned in the message"
  @type mentions :: list(User.t)

  @typedoc "List of roles mentioned in the message"
  @type mention_roles :: list(Role.t)

  @typedoc "List of attached files in the message"
  @type attachments :: list(Attachment.t)

  @typedoc "List of embedded content in the message"
  @type embeds :: list(Map.t)

  @typedoc "Validates if a message was sent"
  @type nonce :: String.t

  @typedoc "Whether this message is pinned"
  @type pinned :: boolean

  @typedoc "Message type"
  @type type :: Integer.test

  @type t :: %__MODULE__{
    attachments: attachments,
    author: author,
    channel_id: channel_id,
    content: content,
    edited_timestamp: edited_timestamp,
    embeds: embeds,
    id: id,
    mention_everyone: mention_everyone,
    mention_roles: mention_roles,
    mentions: mentions,
    nonce: nonce,
    pinned: pinned,
    timestamp: timestamp,
    tts: tts,
    type: type
  }

  @derive [Poison.Encoder]
  defstruct [
    :attachments,
    :author,
    :channel_id,
    :content,
    :edited_timestamp,
    :embeds,
    :id,
    :mention_everyone,
    :mention_roles,
    :mentions,
    :nonce,
    :pinned,
    :timestamp,
    :tts,
    :type,
  ]

  @doc false
  def to_struct(map) do
    new = map
    |> Map.update(:author, %{}, &User.to_struct(&1))
    |> Map.update(:attachments, %{}, &Util.list_to_struct_list(&1, Attachment))
    |> Map.update(:mentions, %{}, &Util.list_to_struct_list(&1, User))
    |> Map.update(:mention_roles, %{}, &Util.list_to_struct_list(&1, Role))
    struct(__MODULE__, new)
  end
end