From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] SDHCI: S3C: Add support for retrieving memory and
	irq resource information from device tree.
Date: Mon, 31 Jan 2011 11:00:45 -0600
Message-ID: <4D46EABD.8010903@gmail.com>
References: <1296491294-11030-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1296491294-11030-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: kgene.kim-Sze3O3UU22LR7s880joybQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Thomas Abraham <thomas.abraham-68IGFXMjmZ7QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thomas,

On 01/31/2011 10:28 AM, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Thomas Abraham<thomas.abraham-68IGFXMjmZ7QT0dZR+AlfA@public.gmane.org>
>
> Add support for retrieving memory and irq resource information
> from device tree for Samsung's SDHCI controller driver.
>
> Signed-off-by: Thomas Abraham<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>
> The modification will be made more generic to support both
> DT and non-DT versions of the driver without the #ifdef's.
> For now, this patch is for review and to understand if the
> approach adopted to obtain resource information from the
> device tree is appropriate.
>

There is already an OF SDHCI driver. Some fixes from me for ARM have 
gone into .38.

>   drivers/mmc/host/sdhci-s3c.c |   32 ++++++++++++++++++++++++++++++++
>   1 files changed, 32 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
> index 1720358..f536061 100644
> --- a/drivers/mmc/host/sdhci-s3c.c
> +++ b/drivers/mmc/host/sdhci-s3c.c
> @@ -19,6 +19,9 @@
>   #include<linux/clk.h>
>   #include<linux/io.h>
>   #include<linux/gpio.h>
> +#include<linux/of.h>
> +#include<linux/of_irq.h>
> +#include<linux/of_address.h>
>
>   #include<linux/mmc/host.h>
>
> @@ -348,23 +351,52 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
>   	struct sdhci_s3c *sc;
>   	struct resource *res;
>   	int ret, irq, ptr, clks;
> +	struct device_node *np = NULL;
> +#ifdef CONFIG_OF
> +	struct resource iores;
> +#endif
>
>   	if (!pdata) {
>   		dev_err(dev, "no device data specified\n");
>   		return -ENOENT;
>   	}
>
> +#ifdef CONFIG_OF
> +	for_each_compatible_node(np, NULL, "samsung,sdhci-s3c") {
> +		const u32 *id = of_get_property(np, "cell-index", NULL);

Per Grant, using cell-index should be avoided.

> +		if (be32_to_cpu(*id) == pdev->id)

Any drivers that depend on pdev->id being an index will break for device 
tree.

> +			break;
> +	}
> +
> +	if (!np) {
> +		dev_err(dev, "no matching device node specified in device tree\n");
> +		return -ENOENT;
> +	}
> +#endif
> +
> +#ifndef CONFIG_OF
>   	irq = platform_get_irq(pdev, 0);

Using platform_get_irq works for OF drivers too.

> +#else
> +	irq = of_irq_to_resource(np, 0, NULL);
> +#endif
>   	if (irq<  0) {
>   		dev_err(dev, "no irq specified\n");
>   		return irq;
>   	}
>
> +#ifndef CONFIG_OF
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);

Ditto

>   	if (!res) {
>   		dev_err(dev, "no memory specified\n");
>   		return -ENOENT;
>   	}
> +#else
> +	if (of_address_to_resource(np, 0,&iores)) {
> +		dev_err(dev, "no memory specified in device tree\n");
> +		return -ENOENT;
> +	}
> +	res =&iores;
> +#endif
>
>   	host = sdhci_alloc_host(dev, sizeof(struct sdhci_s3c));
>   	if (IS_ERR(host)) {

You are missing an of_match_table. This patch could not work without it.

The primary things you need to do for OF support on a driver are add the 
match table and convert platform data to OF bindings.

Rob
