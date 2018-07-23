defmodule ExAws101 do
  @moduledoc """
  Documentation for ExAws101.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ExAws101.hello
      :world

  """
  def hello do
    :world
  end

  # ------------------------------------------------------------

  defmodule S3 do
    def put_object(bucket, object, body) do
      ExAws.S3.put_object(bucket, object, body)
      |> ExAws.request()
    end

    def put_object!(bucket, object, body) do
      case ExAws.S3.put_object(bucket, object, body)
           |> ExAws.request() do
        {:ok, _} -> %{status_code: 200}
      end
    end

    def put_object_acl(bucket, object, acl) do
      ExAws.S3.put_object_acl(bucket, object, acl)
      |> ExAws.request()
    end

    def delete_object(bucket, object) do
      ExAws.S3.delete_object(bucket, object)
      |> ExAws.request()
    end

    def put_bucket(bucket, region) do
      ExAws.S3.put_bucket(bucket, region)
      |> ExAws.request()
    end

    def force_delete_bucket(bucket) do
      %{body: %{contents: contents}} =
        ExAws.S3.list_objects(bucket)
        |> ExAws.request!()

      objects =
        contents
        |> Enum.map(& &1.key)

      ExAws.S3.delete_all_objects(bucket, objects)
      |> ExAws.request!()

      ExAws.S3.delete_bucket(bucket)
      |> ExAws.request()
    end
  end
end
