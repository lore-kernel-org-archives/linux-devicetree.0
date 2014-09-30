From: Dann Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH v5 3/4] edac: Add APM X-Gene SoC EDAC driver
Date: Tue, 30 Sep 2014 08:45:20 -0600
Message-ID: <CALdTtntGh6kcz+UxOsUsUO_mNZQAzUsgECvzD7CBeEGMswrPsw@mail.gmail.com>
References: <1408778588-3215-1-git-send-email-lho@apm.com>
	<1408778588-3215-2-git-send-email-lho@apm.com>
	<1408778588-3215-3-git-send-email-lho@apm.com>
	<1408778588-3215-4-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408778588-3215-4-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Craig Magina <craig.magina-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 23, 2014 at 1:23 AM, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org> wrote:
> This patch adds support for the APM X-Gene SoC EDAC driver. It
> requires ARM64 EDAC support patch [1] to compile due to
> dependence on MC module which calls an unused software memory
> scrub function.
>
> [1] http://www.spinics.net/lists/arm-kernel/msg324093.html
>
> Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> ---
>  drivers/edac/Kconfig      |    9 +-
>  drivers/edac/Makefile     |    3 +
>  drivers/edac/xgene_edac.c | 2132 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2143 insertions(+), 1 deletions(-)
>  create mode 100644 drivers/edac/xgene_edac.c
>
[...]
> +#ifdef CONFIG_OF
> +static struct of_device_id xgene_edac_mc_of_match[] = {
> +       { .compatible = "apm,xgene-edac-mc" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, xgene_edac_of_match);
> +#endif

Something I apparently forgot to mention when I tested v3 was that I
had to manually fix this up to get it to build:

diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
index d69c2e5..2f436d45 100644
--- a/drivers/edac/xgene_edac.c
+++ b/drivers/edac/xgene_edac.c
@@ -452,7 +452,7 @@ static struct of_device_id xgene_edac_mc_of_match[] = {
     { .compatible = "apm,xgene-edac-mc" },
     {},
 };
-MODULE_DEVICE_TABLE(of, xgene_edac_of_match);
+MODULE_DEVICE_TABLE(of, xgene_edac_mc_of_match);
 #endif

 static struct platform_driver xgene_edac_mc_driver = {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
