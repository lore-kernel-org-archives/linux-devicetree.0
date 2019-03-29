From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2] dt-bindings: pinctrl: imx7d: Fix PAD_CTL_DSE_X*
Date: Fri, 29 Mar 2019 09:28:01 +0000
Message-ID: <AM0PR04MB4211EBAB9D3DB1772FB51673805A0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190313142040.26694-1-cquast@hanoverdisplays.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313142040.26694-1-cquast@hanoverdisplays.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christina Quast <cquast@hanoverdisplays.com>
Cc: "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> From: Christina Quast [mailto:cquast@hanoverdisplays.com]
> Sent: Wednesday, March 13, 2019 10:21 PM
>=20
> In the iMX7d datasheet, the PAD_CTL_DSE_X* values are different from the
> documentation.
>=20
> Changes since v2:
> * Changed patch title to 'dt-bindings: pinctrl: imx7d:'
>=20
> Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>

Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

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
