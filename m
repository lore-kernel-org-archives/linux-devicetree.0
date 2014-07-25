From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Fri, 25 Jul 2014 10:18:54 +0800
Message-ID: <20140725021853.GA11052@shlinux1.ap.freescale.net>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
 <1405499166-6726-8-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405499166-6726-8-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 16, 2014 at 10:26:01AM +0200, Antoine T=E9nart wrote:
> Add a USB2 ChipIdea driver for ci13xxx, with optional PHY, clock
> and DMA mask, to support USB2 ChipIdea controllers that don't need
> specific functions.

You may need to indicate it is a generic usb2 glue layer driver at both
subject and context.
>=20
> Needed for the Marvell Berlin SoCs USB controllers.

You can say it is tested at Marvell Berlin SoCs USB controllers.

>=20
> Signed-off-by: Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/usb/chipidea/Makefile       |   1 +
>  drivers/usb/chipidea/ci_hdrc_usb2.c | 147 ++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 148 insertions(+)
>  create mode 100644 drivers/usb/chipidea/ci_hdrc_usb2.c
>=20
> diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Mak=
efile
> index 2f099c7df7b5..1fc86a2ca22d 100644
> --- a/drivers/usb/chipidea/Makefile
> +++ b/drivers/usb/chipidea/Makefile
> @@ -10,6 +10,7 @@ ci_hdrc-$(CONFIG_USB_OTG_FSM)		+=3D otg_fsm.o
> =20
>  # Glue/Bridge layers go here
> =20
> +obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci_hdrc_usb2.o
>  obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci_hdrc_msm.o
>  obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci_hdrc_zevio.o
> =20
> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipid=
ea/ci_hdrc_usb2.c
> new file mode 100644
> index 000000000000..4ec2240d00a1
> --- /dev/null
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -0,0 +1,147 @@
> +/*
> + * Copyright (C) 2014 Marvell Technology Group Ltd.
> + *
> + * Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/chipidea.h>
> +#include <linux/usb/hcd.h>
> +#include <linux/usb/ulpi.h>
> +
> +#include "ci.h"
> +
> +struct ci_hdrc_usb2_priv {
> +	struct platform_device	*ci_pdev;
> +	struct clk		*clk;
> +	u32			dma_mask;
> +};
> +
> +static int ci_hdrc_usb2_dt_probe(struct device *dev,
> +				    struct ci_hdrc_platform_data *ci_pdata,
> +				    struct ci_hdrc_usb2_priv *priv)
> +{
> +	u32 mask;
> +	int ret;
> +
> +	priv->clk =3D devm_clk_get(dev, NULL);
> +	if (!IS_ERR(priv->clk)) {
> +		ret =3D clk_prepare_enable(priv->clk);
> +		if (ret) {
> +			dev_err(dev, "failed to enable the clock: %d\n", ret);
> +			return ret;
> +		}
> +	}

The clk API may be needed for both DT and non-DT cases.

> +
> +	ci_pdata->phy =3D of_phy_get(dev->of_node, 0);
> +	if (IS_ERR(ci_pdata->phy)) {
> +		if (PTR_ERR(ci_pdata->phy) =3D=3D -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		/* PHY is optional */
> +		ci_pdata->phy =3D NULL;
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "dma-mask", &mask))
> +		priv->dma_mask =3D mask;
> +
According to discussion, you may not need dma_mask in driver any more,
and use below API for both DT and non-DT case.

        err =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32))=
;
        if (err)
        	                handle error;

Peter

> +	return 0;
> +}
> +
> +static struct ci_hdrc_platform_data ci_default_pdata =3D {
> +	.capoffset	=3D DEF_CAPOFFSET,
> +	.flags		=3D CI_HDRC_REQUIRE_TRANSCEIVER |
> +			  CI_HDRC_DISABLE_STREAMING,
> +};
> +
> +static int ci_hdrc_usb2_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ci_hdrc_usb2_priv *priv;
> +	struct ci_hdrc_platform_data *ci_pdata =3D dev_get_platdata(&pdev->=
dev);
> +	int ret;
> +
> +	if (!ci_pdata)
> +		ci_pdata =3D &ci_default_pdata;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (dev->of_node) {
> +		ret =3D ci_hdrc_usb2_dt_probe(dev, ci_pdata, priv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ci_pdata->name =3D dev_name(&pdev->dev);
> +
> +	if (priv->dma_mask) {
> +		ret =3D dma_coerce_mask_and_coherent(&pdev->dev, priv->dma_mask);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	priv->ci_pdev =3D ci_hdrc_add_device(dev, pdev->resource,
> +				     pdev->num_resources, ci_pdata);
> +	if (IS_ERR(priv->ci_pdev)) {
> +		ret =3D PTR_ERR(priv->ci_pdev);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(dev,
> +				"failed to register ci_hdrc platform device: %d\n",
> +				ret);
> +		goto clk_err;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	pm_runtime_no_callbacks(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +clk_err:
> +	if (!IS_ERR(priv->clk))
> +		clk_disable_unprepare(priv->clk);
> +	return ret;
> +}
> +
> +static int ci_hdrc_usb2_remove(struct platform_device *pdev)
> +{
> +	struct ci_hdrc_usb2_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	ci_hdrc_remove_device(priv->ci_pdev);
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ci_hdrc_usb2_of_match[] =3D {
> +	{ .compatible =3D "chipidea,usb2" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
> +
> +static struct platform_driver ci_hdrc_usb2_driver =3D {
> +	.probe	=3D ci_hdrc_usb2_probe,
> +	.remove	=3D ci_hdrc_usb2_remove,
> +	.driver	=3D {
> +		.name		=3D "chipidea-usb2",
> +		.owner		=3D THIS_MODULE,
> +		.of_match_table	=3D of_match_ptr(ci_hdrc_usb2_of_match),
> +	},
> +};
> +module_platform_driver(ci_hdrc_usb2_driver);
> +
> +MODULE_DESCRIPTION("ChipIdea HDRC USB2 binding for ci13xxx");
> +MODULE_AUTHOR("Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>"=
);
> +MODULE_LICENSE("GPL");
> --=20
> 1.9.1
>=20

--=20

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
