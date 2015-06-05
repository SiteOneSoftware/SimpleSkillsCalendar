using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CalSpike.Startup))]
namespace CalSpike
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
