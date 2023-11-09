FROM mcr.microsoft.com/dotnet/core/sdk:latest AS build-env

COPY mslearn-tailspin-spacegame-web-main/Tailspin.SpaceGame.Web/Tailspin.SpaceGame.Web.csproj ./

RUN dotnet restore

COPY mslearn-tailspin-spacegame-web-main .

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:latest AS runtime

EXPOSE 80

COPY --from=build-env /out .

ENTRYPOINT [ "dotnet", "Tailspin.SpaceGame.Web.dll"]