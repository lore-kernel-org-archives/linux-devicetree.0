From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] usb: chipidea: add xilinx zynq platform data
Date: Tue, 1 Sep 2015 08:55:46 +0800
Message-ID: <20150901005545.GB10030@shlinux2>
References: <1441032592-8121-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441032592-8121-1-git-send-email-nathan.sullivan-acOepvfBmUk@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 31, 2015 at 09:49:51AM -0500, Nathan Sullivan wrote:
> Due to having hardware tx buffers less than 512 bytes in size, streaming
> must be enabled on the Zynq for the udc to work at all.  Add platform data
> specific to the Zynq udc, which does not set the CI_HDRC_DISABLE_STREAMING
> flag.
> 
> Based on a patch by the same name from the Xilinx vendor tree.
> 
> Signed-off-by: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
> ---
> Changes from v1 - better describe the issue in the description, the root cause
> is that the Zynq hardware does not have big enough tx buffers to hold entire
> packets, so streaming must be on.
> ---
>  drivers/usb/chipidea/ci_hdrc_usb2.c |   25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
> index 9eae1a1..4456d2c 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -12,6 +12,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/usb/chipidea.h>
> @@ -30,18 +31,36 @@ static const struct ci_hdrc_platform_data ci_default_pdata = {
>  	.flags		= CI_HDRC_DISABLE_STREAMING,
>  };
>  
> +static struct ci_hdrc_platform_data ci_zynq_pdata = {
> +	.capoffset	= DEF_CAPOFFSET,
> +};
> +
> +static const struct of_device_id ci_hdrc_usb2_of_match[] = {
> +	{ .compatible = "chipidea,usb2"},
> +	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
> +
>  static int ci_hdrc_usb2_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct ci_hdrc_usb2_priv *priv;
>  	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
>  	int ret;
> +	const struct of_device_id *match;
>  
>  	if (!ci_pdata) {
>  		ci_pdata = devm_kmalloc(dev, sizeof(*ci_pdata), GFP_KERNEL);
>  		*ci_pdata = ci_default_pdata;	/* struct copy */
>  	}
>  
> +	match = of_match_device(ci_hdrc_usb2_of_match, &pdev->dev);
> +	if (match && match->data) {
> +		/* struct copy */
> +		*ci_pdata = *(struct ci_hdrc_platform_data *)match->data;
> +	}
> +
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> @@ -96,12 +115,6 @@ static int ci_hdrc_usb2_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id ci_hdrc_usb2_of_match[] = {
> -	{ .compatible = "chipidea,usb2" },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
> -
>  static struct platform_driver ci_hdrc_usb2_driver = {
>  	.probe	= ci_hdrc_usb2_probe,
>  	.remove	= ci_hdrc_usb2_remove,
> -- 
> 1.7.10.4
> 

Thanks, I will queue it, and send it as bug fix for v4.3

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
