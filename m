From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v3 2/3] pinctrl: imx: allow to configure SION with generic
 pinconf
Date: Wed, 20 Jun 2018 10:47:51 +0000
Message-ID: <20180620104750.unr2xryqszbv33mo@fsr-ub1664-175>
References: <1529479463-26961-1-git-send-email-abel.vesa@nxp.com>
 <1529479463-26961-3-git-send-email-abel.vesa@nxp.com>
 <1529482602.7211.32.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529482602.7211.32.camel@pengutronix.de>
Content-Language: en-US
Content-ID: <86A17210CB1B1146910492DE4AFB7A27@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 20, 2018 at 10:16:42AM +0200, Lucas Stach wrote:
> Hi Abel,
>=20
> as this series switches back to using the raw padcfg values in DT
> instead of generic pinconf (which I think is the right move), we can
> drop this patch from the series.
>=20

Cool, will drop it in the next version.

Thanks,
Abel

> Regards,
> Lucas
>=20
> Am Mittwoch, den 20.06.2018, 10:24 +0300 schrieb Abel Vesa:
> > > From: Lucas Stach <l.stach@pengutronix.de>
> >=20
> > The SION bit force enables the input buffer, overriding the configurati=
on
> > driven by the muxed module. It is not located in the pad config registe=
r,
> > but in the mux register and thus needs special handling.
> >=20
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> > =A0drivers/pinctrl/freescale/pinctrl-imx.c | 19 +++++++------------
> > =A0drivers/pinctrl/freescale/pinctrl-imx.h |=A0=A04 ++++
> > =A02 files changed, 11 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/=
freescale/pinctrl-imx.c
> > index 1c6bb15..335edc9 100644
> > --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> > +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> > @@ -26,10 +26,6 @@
> > =A0#include "../pinmux.h"
> > =A0#include "pinctrl-imx.h"
> > =A0
> > -/* The bits in CONFIG cell defined in binding doc*/
> > > > -#define IMX_NO_PAD_CTL	0x80000000	/* no pin config need */
> > > -#define IMX_PAD_SION 0x40000000		/* set SION */
> > -
> > =A0static inline const struct group_desc *imx_pinctrl_find_group_by_nam=
e(
> > > =A0				struct pinctrl_dev *pctldev,
> > > =A0				const char *name)
> > @@ -514,18 +510,17 @@ static int imx_pinctrl_parse_groups(struct device=
_node *np,
> > > =A0		pin->mux_mode =3D be32_to_cpu(*list++);
> > > =A0		pin->input_val =3D be32_to_cpu(*list++);
> > =A0
> > > -		if (info->generic_pinconf) {
> > > +		if (info->generic_pinconf)
> > > =A0			/* generic pin config decoded */
> > > =A0			pin->config =3D config;
> > > -		} else {
> > > +		else
> > > =A0			/* legacy pin config read from devicetree */
> > > -			config =3D be32_to_cpu(*list++);
> > > +			pin->config =3D be32_to_cpu(*list++);
> > =A0
> > > -			/* SION bit is in mux register */
> > > -			if (config & IMX_PAD_SION)
> > > -				pin->mux_mode |=3D IOMUXC_CONFIG_SION;
> > > -			pin->config =3D config & ~IMX_PAD_SION;
> > > -		}
> > > +		/* SION bit is in mux register */
> > > +		if (pin->config & IMX_PAD_SION)
> > > +			pin->mux_mode |=3D IOMUXC_CONFIG_SION;
> > > +		pin->config =3D pin->config & ~IMX_PAD_SION;
> > =A0
> > > =A0		dev_dbg(ipctl->dev, "%s: 0x%x 0x%08lx", info->pins[pin_id].name,
> > > =A0				pin->mux_mode, pin->config);
> > diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/=
freescale/pinctrl-imx.h
> > index 4b8225c..44567a6 100644
> > --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> > +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> > @@ -14,6 +14,10 @@
> > =A0#include <linux/pinctrl/pinconf-generic.h>
> > =A0#include <linux/pinctrl/pinmux.h>
> > =A0
> > +/* The bits in CONFIG cell defined in binding doc*/
> > > > +#define IMX_NO_PAD_CTL	0x80000000	/* no pin config need */
> > > +#define IMX_PAD_SION 0x40000000		/* set SION */
> > +
> > =A0struct platform_device;
> > =A0
> > =A0extern struct pinmux_ops imx_pmx_ops;

-- =
