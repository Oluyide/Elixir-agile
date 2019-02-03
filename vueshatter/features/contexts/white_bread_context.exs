defmodule WhiteBreadContext do
  use WhiteBread.Context
  use Hound.Helpers

  feature_starting_state fn  ->
    Application.ensure_all_started(:hound)
    %{}
  end
  scenario_starting_state fn _state ->
    Hound.start_session
    %{}
  end
  scenario_finalize fn _status, _state ->
    # Hound.end_session
    nil
  end

  given_ ~r/^the following items are to be added$/, fn state ->
    navigate_to "www.google.com"
    {:ok, state}
  end
end
