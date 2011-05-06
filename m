From: "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
Subject: Re: [PATCH v5] uio/pdrv_genirq: Add OF support
Date: Fri, 6 May 2011 02:47:49 +0200
Message-ID: <20110506004748.GB2790@local>
References: <1304577644-4024-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1304577644-4024-1-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 05, 2011 at 08:40:44AM +0200, Michal Simek wrote:

I think we've got it.

Thanks,
Hans

> Adding OF binding to genirq.
> Version string is setup to the "devicetree".
> 
> Compatible string is not setup for now but you can add your
> custom compatible string to uio_of_genirq_match structure.
> 
> For example with "vendor,device" compatible string:
> static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
> 	{ .compatible = "vendor,device", },
> 	{ /* empty for now */ },
> };
> 
> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>

Signed-off-by: Hans J. Koch <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>

> CC: Hans J. Koch <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
> CC: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> CC: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
> CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> CC: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> ---
> v5: Free uioinfo in genirq_remove
>     Use pdev->dev.of_node for OF detection
> 
> v4: Remove dev_info messages
>     Check irq against -ENXIO for no irq
> 
> v3: Fix irq binding
>     Use "devicetree" as version string
> 
> v2: Remove additional resource binding
>     Setup correct version string
>     Clear compatible string
> ---
>  drivers/uio/uio_pdrv_genirq.c |   44 +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 44 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
> index 7174d51..24bb395 100644
> --- a/drivers/uio/uio_pdrv_genirq.c
> +++ b/drivers/uio/uio_pdrv_genirq.c
> @@ -23,6 +23,10 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +
>  #define DRIVER_NAME "uio_pdrv_genirq"
>  
>  struct uio_pdrv_genirq_platdata {
> @@ -97,6 +101,27 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
>  	int ret = -EINVAL;
>  	int i;
>  
> +	if (!uioinfo) {
> +		int irq;
> +
> +		/* alloc uioinfo for one device */
> +		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
> +		if (!uioinfo) {
> +			ret = -ENOMEM;
> +			dev_err(&pdev->dev, "unable to kmalloc\n");
> +			goto bad2;
> +		}
> +		uioinfo->name = pdev->dev.of_node->name;
> +		uioinfo->version = "devicetree";
> +
> +		/* Multiple IRQs are not supported */
> +		irq = platform_get_irq(pdev, 0);
> +		if (irq == -ENXIO)
> +			uioinfo->irq = UIO_IRQ_NONE;
> +		else
> +			uioinfo->irq = irq;
> +	}
> +
>  	if (!uioinfo || !uioinfo->name || !uioinfo->version) {
>  		dev_err(&pdev->dev, "missing platform_data\n");
>  		goto bad0;
> @@ -180,6 +205,10 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
>  	kfree(priv);
>  	pm_runtime_disable(&pdev->dev);
>   bad0:
> +	/* kfree uioinfo for OF */
> +	if (pdev->dev.of_node)
> +		kfree(uioinfo);
> + bad2:
>  	return ret;
>  }
>  
> @@ -189,6 +218,11 @@ static int uio_pdrv_genirq_remove(struct platform_device *pdev)
>  
>  	uio_unregister_device(priv->uioinfo);
>  	pm_runtime_disable(&pdev->dev);
> +
> +	/* kfree uioinfo for OF */
> +	if (pdev->dev.of_node)
> +		kfree(priv->uioinfo);
> +
>  	kfree(priv);
>  	return 0;
>  }
> @@ -215,6 +249,15 @@ static const struct dev_pm_ops uio_pdrv_genirq_dev_pm_ops = {
>  	.runtime_resume = uio_pdrv_genirq_runtime_nop,
>  };
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
> +	{ /* empty for now */ },
> +};
> +MODULE_DEVICE_TABLE(of, uio_of_genirq_match);
> +#else
> +# define uio_of_genirq_match NULL
> +#endif
> +
>  static struct platform_driver uio_pdrv_genirq = {
>  	.probe = uio_pdrv_genirq_probe,
>  	.remove = uio_pdrv_genirq_remove,
> @@ -222,6 +265,7 @@ static struct platform_driver uio_pdrv_genirq = {
>  		.name = DRIVER_NAME,
>  		.owner = THIS_MODULE,
>  		.pm = &uio_pdrv_genirq_dev_pm_ops,
> +		.of_match_table = uio_of_genirq_match,
>  	},
>  };
>  
> -- 
> 1.5.5.6
> 
> 
