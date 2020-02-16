using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Sessions.AspNetCore.HelloWorld.Controllers
{
    [ApiController]
    [Route("info")]
    public class InfoController : ControllerBase
    {
        [HttpGet]
        public object GetInfo()
        {
            return new
            {
                AppEnvironment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT"), 
                User = Environment.GetEnvironmentVariable("USER")
            };
        }
    }}