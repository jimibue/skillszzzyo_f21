import React from "react";
import useAxiosOnMount from "../hooks/useAxiosOnMount";
import SemanticLoadError from "./SemanticError";
import SematicLoader from "./SemanticLoader";

export default function ListLoader({ url, renderData, header, errorMessage }) {
  console.log();
  const { data, loading, error } = useAxiosOnMount(url);

  const renderList = () => {
    if (loading) return <SematicLoader />;
    if (error)
      return (
        <SemanticLoadError
          header={errorMessage ? errorMessage : "Error Occurred "}
          error={error}
        />
      );
    return data.map(renderData);
  };
  return (
    <div>
      <h1>{header}</h1>
      {renderList()}
    </div>
  );
}
