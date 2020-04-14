using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebTienda.Startup))]
namespace WebTienda
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
