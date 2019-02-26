From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] Document: dt: binding: imx: Fix PAD_CTL_DSE_X*
Date: Tue, 26 Feb 2019 12:21:49 +0000
Message-ID: <VI1PR04MB42227AA158BA1FCBF314AA27807B0@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <20190222170038.9669-1-cquast@hanoverdisplays.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222170038.9669-1-cquast@hanoverdisplays.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christina Quast <cquast@hanoverdisplays.com>
Cc: "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> From: Christina Quast [mailto:cquast@hanoverdisplays.com]
> Sent: Saturday, February 23, 2019 1:01 AM
>=20
> In the iMX7d datasheet, the PAD_CTL_DSE_X* values are different from the
> documentation.
>=20

It's a doc problem.
Latest RM seems got updated.

As here it's a reference definition in binding doc and device tree actually=
 does not
use it (IMX Pinctrl use raw data to set pad configuration). So it won't cau=
se any
compatibility issue to me.

Please update the patch title to:
dt-bindings: pinctrl: imx7d: xxxxx

Otherwise:
Ack-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

> Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
> ---
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.=
txt
> b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> index 6666277c3acb..8ac1d0851a0f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> @@ -48,9 +48,9 @@ PAD_CTL_HYS                     (1 << 3)
>  PAD_CTL_SRE_SLOW                (1 << 2)
>  PAD_CTL_SRE_FAST                (0 << 2)
>  PAD_CTL_DSE_X1                  (0 << 0)
> -PAD_CTL_DSE_X2                  (1 << 0)
> -PAD_CTL_DSE_X3                  (2 << 0)
> -PAD_CTL_DSE_X4                  (3 << 0)
> +PAD_CTL_DSE_X4                  (1 << 0)
> +PAD_CTL_DSE_X2                  (2 << 0)
> +PAD_CTL_DSE_X6                  (3 << 0)
>=20


>  Examples:
>  While iomuxc-lpsr is intended to be used by dedicated peripherals to tak=
e
> --
> 2.20.1
>=20
>=20
>=20
>=20
>=20
> Please consider the environment before printing this email
>=20
>=20
>=20
>=20
>=20
> The information transmitted is intended only for the person or entity to =
which
> it is addressed and may contain confidential and/or privileged material. =
Any
> review, retransmission, dissemination or other use of, or taking of any a=
ction in
> reliance upon, this information by persons or entities other than the int=
ended
> recipient is prohibited.
> If you received this in error, please contact the sender or postmaster
> (postmaster@hanoverdisplays.com) and delete the material from any
> computer.
> Although we routinely screen for viruses, addressees should check this e-=
mail
> and any attachment for viruses. We make no warranty as to absence of viru=
ses
> in this e-mail or any attachments.
> Our Company's email policy is to permit incidental personal use. If this =
email is
> of a personal nature, it must not be relied upon as expressing the views =
or
> opinions of the company.
