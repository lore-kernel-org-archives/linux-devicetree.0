From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] PCI: imx6: Add reset-gpio-active-high boolean
 property to DT
Date: Wed, 06 Apr 2016 14:40:02 +0200
Message-ID: <1459946402.14999.1.camel@pengutronix.de>
References: <1459936100.2256.30.camel@pengutronix.de>
	 <1459946207-11923-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459946207-11923-1-git-send-email-ynezz-knWk7/PSn+s@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr =?UTF-8?Q?=C5=A0tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Zhu <Richard.Zhu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa-NlWvg49iv0c@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 06.04.2016, 14:36 +0200 schrieb Petr =C5=A0tetiar:
> Currently the reset-gpio DT property which controls the PCI bus devic=
e
> reset signal defaults to active-low reset sequence (L=3Dreset state,
> H=3Doperation state) plus the code in reset function isn't GPIO polar=
ity
> aware - it doesn't matter if the defined reset-gpio is active-low or
> active-high, it will always result into active-low reset sequence.
>=20
> I've tried to fix it properly and changed the reset-gpio reset sequen=
ce
> to be polarity aware, but this patch has been accepted and then rever=
ted
> as it has introduced few backward incompatible issues:
>=20
> 1. Some of the DTBs as for example imx6qdl-sabresd, doesn't define
> reset-gpio polarity correctly:
>=20
>   reset-gpio =3D <&gpio7 12 0>;
>=20
> which means, that it's defined as active-high, but in reality it's
> active-low, thus it wouldn't work without DTS fix.
>=20
> 2. The logic in reset function is inverted:
>=20
> 	gpio_set_value_cansleep(imx6_pcie->reset_gpio, 0)
> 	msleep(100);
> 	gpio_set_value_cansleep(imx6_pcie->reset_gpio, 1);
>=20
> so even if some of the i.MX6 boards had reset-gpio polarity defined
> correctly in their DTSes, they would stop working.
>=20
> As we can't break old DTBs, we can't fix them and that's why we need =
to
> introduce this new DT reset-gpio-active-high boolean property, so we =
can
> support boards with active-high reset sequence.
>=20
> This active-high reset sequence is for example needed on Apalis SoMs,
> where GPIO1_IO28, used to PCIe reset is not connected directly to PER=
ST#
> PCIe signal, but it's ORed with RESETBMCU coming off the PMIC, and th=
us
> is inverted, active-high.
>=20
> Signed-off-by: Petr =C5=A0tetiar <ynezz-knWk7/PSn+s@public.gmane.org>

Reviewed-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> ---
>  Changes since v1:
>=20
>   * Added documentation of reset-gpio and reset-gpio-active-high DT p=
roperties
>   * Removed unnecessary double negation of GPIO value
>=20
>  Changes since v2:
>=20
>   * Changed commit message so it explains in more detail why we need =
new DT
>     property
>   * Changed PHY to 'bus device' in binding's documentation
>=20
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt |  6 ++++++
>  drivers/pci/host/pci-imx6.c                              | 14 ++++++=
+++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt=
 b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> index 3be80c6..072efbf 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> @@ -19,6 +19,12 @@ Optional properties:
>  - fsl,tx-deemph-gen2-6db: Gen2 (6db) De-emphasis value. Default: 20
>  - fsl,tx-swing-full: Gen2 TX SWING FULL value. Default: 127
>  - fsl,tx-swing-low: TX launch amplitude swing_low value. Default: 12=
7
> +- reset-gpio: Should specify the GPIO for controlling the PCI bus de=
vice reset
> +  signal. Its not polarity aware and defaults to active-low reset se=
quence
> +  (L=3Dreset state, H=3Doperation state).
> +- reset-gpio-active-high: If present then the reset sequence using t=
he GPIO
> +  specified in the "reset-gpio" property is reversed (H=3Dreset stat=
e,
> +  L=3Doperation state).
> =20
>  Example:
> =20
> diff --git a/drivers/pci/host/pci-imx6.c b/drivers/pci/host/pci-imx6.=
c
> index 2f817fa..17f4cc3 100644
> --- a/drivers/pci/host/pci-imx6.c
> +++ b/drivers/pci/host/pci-imx6.c
> @@ -33,6 +33,7 @@
> =20
>  struct imx6_pcie {
>  	int			reset_gpio;
> +	bool			gpio_active_high;
>  	struct clk		*pcie_bus;
>  	struct clk		*pcie_phy;
>  	struct clk		*pcie;
> @@ -310,9 +311,11 @@ static int imx6_pcie_deassert_core_reset(struct =
pcie_port *pp)
> =20
>  	/* Some boards don't have PCIe reset GPIO. */
>  	if (gpio_is_valid(imx6_pcie->reset_gpio)) {
> -		gpio_set_value_cansleep(imx6_pcie->reset_gpio, 0);
> +		gpio_set_value_cansleep(imx6_pcie->reset_gpio,
> +					imx6_pcie->gpio_active_high);
>  		msleep(100);
> -		gpio_set_value_cansleep(imx6_pcie->reset_gpio, 1);
> +		gpio_set_value_cansleep(imx6_pcie->reset_gpio,
> +					!imx6_pcie->gpio_active_high);
>  	}
>  	return 0;
> =20
> @@ -546,9 +549,14 @@ static int __init imx6_pcie_probe(struct platfor=
m_device *pdev)
> =20
>  	/* Fetch GPIOs */
>  	imx6_pcie->reset_gpio =3D of_get_named_gpio(np, "reset-gpio", 0);
> +	imx6_pcie->gpio_active_high =3D of_property_read_bool(np,
> +						"reset-gpio-active-high");
>  	if (gpio_is_valid(imx6_pcie->reset_gpio)) {
>  		ret =3D devm_gpio_request_one(&pdev->dev, imx6_pcie->reset_gpio,
> -					    GPIOF_OUT_INIT_LOW, "PCIe reset");
> +				imx6_pcie->gpio_active_high ?
> +					GPIOF_OUT_INIT_HIGH :
> +					GPIOF_OUT_INIT_LOW,
> +				"PCIe reset");
>  		if (ret) {
>  			dev_err(&pdev->dev, "unable to get reset gpio\n");
>  			return ret;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
