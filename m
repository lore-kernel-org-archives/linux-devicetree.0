From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V4 5/5] net/fec: add device tree matching support
Date: Tue, 15 Mar 2011 01:14:04 -0600
Message-ID: <20110315071404.GE23050@angua.secretlab.ca>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-6-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1299733185-2172-6-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 10, 2011 at 12:59:45PM +0800, Jason Liu wrote:
> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/net/fec.c |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/net/fec.c b/drivers/net/fec.c
> index 02cdd71..fcb9768 100644
> --- a/drivers/net/fec.c
> +++ b/drivers/net/fec.c
> @@ -45,6 +45,9 @@
>  #include <linux/phy.h>
>  #include <linux/fec.h>
>  
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +

Should be mixed in with the rest of the linux/*.h includes (don't put
a blank line between them.

>  #include <asm/cacheflush.h>
>  
>  #ifndef CONFIG_ARM
> @@ -1523,6 +1526,13 @@ static const struct dev_pm_ops fec_pm_ops = {
>  };
>  #endif
>  
> +#ifdef CONFIG_OF
> +static struct of_device_id fec_matches[] = {
> +	{ .compatible = "fsl,imx-fec" },

Must have documentation for this binding in
Documentation/devicetree/bindings before I can pick this up.  Same
goes for the uart driver patch.

Also, I recommend being more specific on the compatible property.
fsl,imx51-fec would be better.  Newer parts can claim compatibility
with this one if you're concerned about supporting multiple parts.

ie. for imx 53, this would be appropriate:

	compatible = "fsl,imx53-fec", "fsl,imx51-fec";

> +	{},
> +};
> +#endif
> +
>  static struct platform_driver fec_driver = {
>  	.driver	= {
>  		.name	= DRIVER_NAME,
> @@ -1530,6 +1540,9 @@ static struct platform_driver fec_driver = {
>  #ifdef CONFIG_PM
>  		.pm	= &fec_pm_ops,
>  #endif
> +#ifdef CONFIG_OF
> +		.of_match_table = fec_matches,
> +#endif
>  	},
>  	.id_table = fec_devtype,
>  	.probe	= fec_probe,
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
