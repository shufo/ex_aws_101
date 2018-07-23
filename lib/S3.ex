defmodule ExAws101.S3 do
  def put_object(bucket, path, contents) do
    request = ExAws.S3.put_object(bucket, path, contents)

    case ExAws.request(request) do
      {:ok, _} -> {:ok, "put object"}
      _ -> {:error, nil}
    end
  end

  def put_object!(bucket, path, contents) do
    request = ExAws.S3.put_object(bucket, path, contents)

    case ExAws.request(request) do
      {:ok, _} ->
        %{status_code: 200}

      _ ->
        {:error, nil}
    end
  end

  def delete_object(bucket, path) do
    request = ExAws.S3.delete_object(bucket, path)

    case ExAws.request(request) do
      {:ok, _} -> {:ok, "deleted object"}
      _ -> {:error, nil}
    end
  end

  def put_object_acl(bucket, path, acl) do
    request = ExAws.S3.put_object_acl(bucket, path, acl)

    case ExAws.request(request) do
      {:ok, _} ->
        {:ok, "changed object"}

      _ ->
        {:error, nil}
    end
  end

  def put_bucket(bucket, region) do
    ExAws.S3.put_bucket(bucket, region) |> ExAws.request!()
  end

  def force_delete_bucket(bucket) do
    %{body: %{contents: contents}} = ExAws.S3.list_objects(bucket) |> ExAws.request!()
    objects = contents |> Enum.map(& &1.key)
    ExAws.S3.delete_all_objects(bucket, objects) |> ExAws.request!()
    ExAws.S3.delete_bucket(bucket) |> ExAws.request!()
  end
end
