defmodule Mixcord.Shard.Dispatch do
  @moduledoc false

  require Logger

  def handle_event(payload) do
    Logger.debug payload.t
    case payload.t do
      :CHANNEL_CREATE ->
        :noop
      :CHANNEL_DELETE ->
        :noop
      :CHANNEL_UPDATE ->
        :noop
      :GUILD_BAN_ADD ->
        :noop
      :BUILD_BAN_REMOVE ->
        :noop
      :GUILD_CREATE ->
        Mixcord.Cache.Guilds.create!(payload.d)
      :GUILD_DELETE ->
        :noop
      :GUILD_EMOJI_UPDATE ->
        :noop
      :GUILD_INTEGRATIONS_UPDATE ->
        :noop
      :GUILD_MEMBER_ADD ->
        :noop
      :GUILD_MEMBER_CHUNK ->
        :noop
      :GUILD_MEMBER_REMOVE ->
        :noop
      :GUILD_MEMBER_UPDATE ->
        :noop
      :GUILD_ROLE_CREATE ->
        :noop
      :GUILD_ROLE_DELETE ->
        :noop
      :GUILD_ROLE_UPDATE ->
        :noop
      :GUILD_UPDATE ->
        :noop
      :MESSAGE_CREATE ->
        :noop
      :MESSAGE_DELETE ->
        :noop
      :MESSAGE_DELETE_BULK ->
        :noop
      :MESSAGE_UPDATE ->
        :noop
      :PRESENCE_UPDATE ->
        :noop
      :READY ->
        :noop
      :RESUMED ->
        :noop
      :TYPING_START ->
        :noop
      :USER_SETTINGS_UPDATE ->
        :noop
      :USER_UPDATE ->
        :noop
      :VOICE_STATE_UPDATE ->
        :noop
      :VOICE_SERVER_UPDATE ->
        :noop
      _ ->
        Logger.warn "UNHANDLED GATEWAY DISPATCH EVENT TYPE: #{payload.t}"
    end
  end

end