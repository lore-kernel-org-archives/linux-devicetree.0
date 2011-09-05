From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 3/3] dmaengine: imx-sdma: add device tree probe support
Date: Mon, 5 Sep 2011 11:24:21 +0200
Message-ID: <20110905092421.GD19678@pengutronix.de>
References: <1310723066-567-1-git-send-email-shawn.guo@linaro.org>
	<1310723066-567-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1310723066-567-4-git-send-email-shawn.guo@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: patches@linaro.org, Vinod Koul <vinod.koul@intel.com>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Fri, Jul 15, 2011 at 05:44:26PM +0800, Shawn Guo wrote:
> It adds device tree probe support for imx-sdma driver.
> =

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Vinod Koul <vinod.koul@intel.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/dma/fsl-imx-sdma.txt       |   17 ++++++++
>  drivers/dma/imx-sdma.c                             |   41 ++++++++++++++=
++++-
>  2 files changed, 55 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> =

> diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt b/Doc=
umentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> new file mode 100644
> index 0000000..d1e3f44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> @@ -0,0 +1,17 @@
> +* Freescale Smart Direct Memory Access (SDMA) Controller for i.MX
> +
> +Required properties:
> +- compatible : Should be "fsl,<chip>-sdma"
> +- reg : Should contain SDMA registers location and length
> +- interrupts : Should contain SDMA interrupt
> +- fsl,sdma-ram-script-name : Should contain the full path of SDMA RAM
> +  scripts firmware
> +
> +Examples:
> +
> +sdma@83fb0000 {
> +	compatible =3D "fsl,imx51-sdma", "fsl,imx35-sdma";
> +	reg =3D <0x83fb0000 0x4000>;
> +	interrupts =3D <6>;
> +	fsl,sdma-ram-script-name =3D "sdma-imx51.bin";
> +};
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 6b839a2..20504f0 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -32,6 +32,8 @@
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
>  #include <linux/dmaengine.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  =

>  #include <asm/irq.h>
>  #include <mach/sdma.h>
> @@ -331,6 +333,12 @@ static struct platform_device_id sdma_devtypes[] =3D=
 {
>  	}
>  };
>  =

> +static const struct of_device_id sdma_dt_ids[] =3D {
> +	{ .compatible =3D "fsl,imx31-sdma", .data =3D &sdma_devtypes[IMX31_SDMA=
], },
> +	{ .compatible =3D "fsl,imx35-sdma", .data =3D &sdma_devtypes[IMX35_SDMA=
], },
> +	{ /* sentinel */ }
> +};
> +
>  #define SDMA_H_CONFIG_DSPDMA	(1 << 12) /* indicates if the DSPDMA is use=
d */
>  #define SDMA_H_CONFIG_RTD_PINS	(1 << 11) /* indicates if Real-Time Debug=
 pins are enabled */
>  #define SDMA_H_CONFIG_ACR	(1 << 4)  /* indicates if AHB freq /core freq =
=3D 2 or 1 */
> @@ -1249,6 +1257,10 @@ err_dma_alloc:
>  =

>  static int __init sdma_probe(struct platform_device *pdev)
>  {
> +	const struct of_device_id *of_id =3D
> +			of_match_device(sdma_dt_ids, &pdev->dev);
> +	struct device_node *np =3D pdev->dev.of_node;
> +	const char *fw_name;
fw_name could have a more local scope.

>  	int ret;
>  	int irq;
>  	struct resource *iores;
> @@ -1264,7 +1276,7 @@ static int __init sdma_probe(struct platform_device=
 *pdev)
>  =

>  	iores =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (!iores || irq < 0 || !pdata) {
> +	if (!iores || irq < 0) {
>  		ret =3D -EINVAL;
>  		goto err_irq;
>  	}
> @@ -1294,6 +1306,8 @@ static int __init sdma_probe(struct platform_device=
 *pdev)
>  	if (!sdma->script_addrs)
>  		goto err_alloc;
>  =

> +	if (of_id)
> +		pdev->id_entry =3D of_id->data;
I don't know much about of (yet), is it allowed to assign to
pdev->id_entry?

>  	sdma->devtype =3D pdev->id_entry->driver_data;
>  =

>  	dma_cap_set(DMA_SLAVE, sdma->dma_device.cap_mask);
> @@ -1324,10 +1338,30 @@ static int __init sdma_probe(struct platform_devi=
ce *pdev)
>  	if (ret)
>  		goto err_init;
>  =

> -	if (pdata->script_addrs)
> +	if (pdata && pdata->script_addrs)
>  		sdma_add_scripts(sdma, pdata->script_addrs);
>  =

> -	sdma_get_firmware(sdma, pdata->fw_name);
> +	if (pdata) {
> +		sdma_get_firmware(sdma, pdata->fw_name);
> +	} else {
> +		/*
> +		 * Because that device tree does not encode ROM script address,
> +		 * the RAM script in firmware is mandatory for device tree
> +		 * probe, otherwise it fails.
> +		 */
> +		ret =3D of_property_read_string(np, "fsl,sdma-ram-script-name",
> +					      &fw_name);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to get firmware name\n");
> +			goto err_init;
> +		}
> +
> +		ret =3D sdma_get_firmware(sdma, fw_name);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to get firmware\n");
> +			goto err_init;
> +		}
> +	}
>  =

>  	sdma->dma_device.dev =3D &pdev->dev;
>  =

> @@ -1375,6 +1409,7 @@ static int __exit sdma_remove(struct platform_devic=
e *pdev)
>  static struct platform_driver sdma_driver =3D {
>  	.driver		=3D {
>  		.name	=3D "imx-sdma",
> +		.of_match_table =3D sdma_dt_ids,
>  	},
>  	.id_table	=3D sdma_devtypes,
>  	.remove		=3D __exit_p(sdma_remove),
> -- =

> 1.7.4.1
> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> =


-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
