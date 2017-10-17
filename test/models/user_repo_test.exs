defmodule Rumbl.UsreRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.User

  @valid_attrs %{name: "a User", username: "eva"}

  test "converts unique_constraint on usrename to error" do
    insert_user(username: "eric")
    attrs = Map.put(@valid_attrs, :username, "eric")
    changeset = User.changeset(%User{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert username: {"has already been taken"} in changeset.errors
  end
end
