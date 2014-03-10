From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 1/7] watchdog: orion: Introduce a SoC-specific RSTOUT
 mapping
Date: Sun, 09 Mar 2014 19:09:11 -0700
Message-ID: <531D1EC7.4090701@roeck-us.net>
References: <1393949244-5011-1-git-send-email-ezequiel.garcia@free-electrons.com> <1393949244-5011-2-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393949244-5011-2-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/04/2014 08:07 AM, Ezequiel Garcia wrote:
> This commit separates the RSTOUT register mapping for the different
> compatible strings supported by the driver. This is needed as
> preparation work to support other SoCs.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   drivers/watchdog/orion_wdt.c | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 6f9b4c6..383da34 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -263,10 +263,6 @@ static void __iomem *orion_wdt_ioremap_rstout(struct platform_device *pdev,
>   		return devm_ioremap(&pdev->dev, res->start,
>   				    resource_size(res));
>
> -	/* This workaround works only for "orion-wdt", DT-enabled */
> -	if (!of_device_is_compatible(pdev->dev.of_node, "marvell,orion-wdt"))
> -		return NULL;
> -
>   	rstout = internal_regs + ORION_RSTOUT_MASK_OFFSET;
>
>   	WARN(1, FW_BUG "falling back to harcoded RSTOUT reg %pa\n", &rstout);
> @@ -317,6 +313,7 @@ MODULE_DEVICE_TABLE(of, orion_wdt_of_match_table);
>   static int orion_wdt_probe(struct platform_device *pdev)
>   {
>   	struct orion_watchdog *dev;
> +	struct device_node *node = pdev->dev.of_node;
>   	const struct of_device_id *match;
>   	unsigned int wdt_max_duration;	/* (seconds) */
>   	struct resource *res;
> @@ -346,10 +343,27 @@ static int orion_wdt_probe(struct platform_device *pdev)
>   	if (!dev->reg)
>   		return -ENOMEM;
>
> -	dev->rstout = orion_wdt_ioremap_rstout(pdev, res->start &
> -						     INTERNAL_REGS_MASK);
> -	if (!dev->rstout)
> +	if (of_device_is_compatible(node, "marvell,orion-wdt")) {
> +
> +		dev->rstout = orion_wdt_ioremap_rstout(pdev, res->start &
> +						       INTERNAL_REGS_MASK);
> +		if (!dev->rstout)
> +			return -ENODEV;
> +
> +	} else if (of_device_is_compatible(node, "marvell,armada-370-wdt") ||
> +		   of_device_is_compatible(node, "marvell,armada-xp-wdt")) {
> +
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +		if (!res)
> +			return -ENODEV;
> +		dev->rstout = devm_ioremap(&pdev->dev, res->start,
> +					   resource_size(res));

Better use devm_ioremap_resource, and then you don't have to check for
the error from platform_get_resource() since devm_ioremap_resource()
takes care of it.

The same change should be made for the other calls call to devm_ioremap;
different patch though.

On a side note, the resource is always assigned, only a workaround exists
for "marvell,orion-wdt" if it isn't. Wonder if it would make sense
to move the calls to platform_get_resource and devm_ioremap[_resource]
further up and have it just in this function.


> +		if (!dev->rstout)
> +			return -ENOMEM;
> +
> +	} else {
>   		return -ENODEV;

Is this stricter than the original code on purpose ?

Previously the driver would instantiate successfully in this case
as long as IORESOURCE_MEM, 1 was defined.


> +	}
>
>   	ret = dev->data->clock_init(pdev, dev);
>   	if (ret) {
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
