From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 5/8] pinctrl: freescale: imx: add shared input select reg
 support
Date: Wed, 19 Aug 2015 08:26:30 +0200
Message-ID: <20150819062630.GJ11161@pengutronix.de>
References: <1439912939-17535-1-git-send-email-aalonso@freescale.com>
 <1439912939-17535-5-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YQEH9CATo+4lan7A"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439912939-17535-5-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org


--YQEH9CATo+4lan7A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2015 at 10:48:56AM -0500, Adrian Alonso wrote:
> - Add shared input select register support
> - imx7d has two iomux controllers iomuxc and iomuxc-lpsr
>   which share select_input register for daisy chain settings
>=20
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 28 +++++++++++++++++++++++++++-
>  drivers/pinctrl/freescale/pinctrl-imx.h |  1 +
>  2 files changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c
> index 0440b0b..1009b52 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_address.h>
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinctrl.h>
> @@ -39,6 +40,7 @@ struct imx_pinctrl {
>  	struct device *dev;
>  	struct pinctrl_dev *pctl;
>  	void __iomem *base;
> +	void __iomem *input_sel_base;
>  	const struct imx_pinctrl_soc_info *info;
>  };
> =20
> @@ -254,7 +256,12 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, =
unsigned selector,
>  			 * Regular select input register can never be at offset
>  			 * 0, and we only print register value for regular case.
>  			 */
> -			writel(pin->input_val, ipctl->base + pin->input_reg);
> +			if (info->flags & SHARE_INPUT_SELECT_REG)
> +				writel(pin->input_val, ipctl->input_sel_base +
> +						pin->input_reg);
> +			else
> +				writel(pin->input_val, ipctl->base +
> +						pin->input_reg);
>  			dev_dbg(ipctl->dev,
>  				"=3D=3D>select_input: offset 0x%x val 0x%x\n",
>  				pin->input_reg, pin->input_val);
> @@ -691,6 +698,8 @@ static int imx_pinctrl_probe_dt(struct platform_devic=
e *pdev,
>  int imx_pinctrl_probe(struct platform_device *pdev,
>  		      struct imx_pinctrl_soc_info *info)
>  {
> +	struct device_node *dev_np =3D pdev->dev.of_node;
> +	struct device_node *np;
>  	struct imx_pinctrl *ipctl;
>  	struct resource *res;
>  	int ret;
> @@ -716,6 +725,23 @@ int imx_pinctrl_probe(struct platform_device *pdev,
>  	if (IS_ERR(ipctl->base))
>  		return PTR_ERR(ipctl->base);
> =20
> +	if (info->flags & SHARE_INPUT_SELECT_REG) {
> +		np =3D of_get_child_by_name(dev_np->parent, "iomuxc");

Isn't there a better way to get this node than searching through the
childs of the parent which may magically have the right 'iomuxc' node
there and using the register range of that node?

Does the other iomuxc node uses its register space as well?

Regards,

Markus

> +		if (np) {
> +			ipctl->input_sel_base =3D of_iomap(np, 0);
> +			if (IS_ERR(ipctl->input_sel_base)) {
> +				of_node_put(np);
> +				dev_err(&pdev->dev,
> +				       "iomuxc base address not found\n");
> +				return PTR_ERR(ipctl->input_sel_base);
> +			}
> +		} else {
> +			dev_err(&pdev->dev, "iomuxc device node not foud\n");
> +			return -EINVAL;
> +		}
> +		of_node_put(np);
> +	}
> +
>  	imx_pinctrl_desc.name =3D dev_name(&pdev->dev);
>  	imx_pinctrl_desc.pins =3D info->pins;
>  	imx_pinctrl_desc.npins =3D info->npins;
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/fr=
eescale/pinctrl-imx.h
> index d22b8f6..85c701b 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> @@ -85,6 +85,7 @@ struct imx_pinctrl_soc_info {
> =20
>  #define SHARE_MUX_CONF_REG	0x1
>  #define ZERO_OFFSET_VALID	0x2
> +#define SHARE_INPUT_SELECT_REG	0x4
> =20
>  #define NO_MUX		0x0
>  #define NO_PAD		0x0
> --=20
> 2.1.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--YQEH9CATo+4lan7A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1CGWAAoJEEpcgKtcEGQQcEsP/2caME7NakoMMk3MTMGMxuGl
BfoKn4h9VDqjxeFyzgApXY89B3cMHGeJGIZqHOYYxPL/9Eg0ErAMRPfjWYGa+jMu
7EHC0XpKkgCjlKXJgXYDWOpohCha9vi45HMQ6QeueNIj2DsJD9rw7D8xoMCwKq+8
pcbkaRT5REspHd7GcwRvQW+LzAHNGaaaCh3dotqgiwFY24rA+vjDFAMw6jljiALX
AqjpvLHuWUENjjCOePR3SSWaKKP+JD3a18L4iKWrXdpxmH+KSuSeDKhmHZruNbEf
vZOtSwh9y/OQGqVGJS/cZH00iOaS7OHSDUMuRlCqAPqwHoiSHwurigjy6gR8GWrz
e1z4BNMWjlm0qnIPgq/8SPoxsULW7EZ3QTgAph/OwZOdfL+td/vVMbexYi7fzEP5
8AneCxgdyPe5UDWASNEArOHHJ9U4oMxN73DFuLUl5N2IAADGxFPNXxqHrmhn//G4
pLPEataskYlEU0peu4CHTMi8ng70Xm36IrMZDlpqje4RHs4IZOY9IbiSRukamNu0
HRi5An0hfmZWWFi0uu5hYigfoN6bSAABDUPvYwH8nvswi25RfHcpIfEgjjxIFWOK
YPDcMHZSmjaIPRghn1QhYiGKPHmTT0aXVsCEzrnjdUkfKilYfWBGkJN/oqt46TEw
V4zqEFCMH7ydJQ4PB6/9
=UIWo
-----END PGP SIGNATURE-----

--YQEH9CATo+4lan7A--
