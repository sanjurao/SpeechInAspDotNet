using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VoiceReconitionWebAppDemo.Startup))]
namespace VoiceReconitionWebAppDemo
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
