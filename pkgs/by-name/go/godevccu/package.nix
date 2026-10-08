{
  lib,
  buildGo127Module,
  fetchFromGitHub,
  nix-update-script,
}:

buildGo127Module (finalAttrs: {
  pname = "godevccu";
  version = "0.9.0";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "SukramJ";
    repo = "godevccu";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lf7xCnUIUTsh23S5LYvyD4QxZ3VmpJsCDlog5dhOuYs=";
  };

  vendorHash = null;

  ldflags = [ "-s" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Virtual HomeMatic CCU with XML-RPC & JSON-RPC servers — a standalone Go port of pydevccu for testing Home Assistant / aiohomematic integrations";
    homepage = "https://github.com/SukramJ/godevccu";
    changelog = "https://github.com/SukramJ/godevccu/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      dotlambda
      fab
    ];
    mainProgram = "godevccu";
  };
})
