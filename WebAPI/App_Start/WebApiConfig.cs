using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Net.Http.Headers; // Necesario para poder usar 'HttpResponseMessage'
using System.Web.Http.Cors; // Necesario para que el API responda a algun llamado fuera de este proyecto


// Ir a Tools -> NuGet Package Manager -> Package Manager Console
//
// Install-Package Microsoft.AspNet.WebApi.Cors


namespace WebAPI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));

            config.EnableCors(new EnableCorsAttribute("*", "*", "*")); // Con * le das permiso que el API responda a una solicitud desde cualquier lugar
        }
    }
}
