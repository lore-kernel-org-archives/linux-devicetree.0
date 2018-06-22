From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v4 1/2] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Fri, 22 Jun 2018 11:11:46 +0000
Message-ID: <AM0PR04MB4211C586B7824172B9B2232280750@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1529497429-8576-1-git-send-email-abel.vesa@nxp.com>
 <1529497429-8576-2-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529497429-8576-2-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Abel Vesa
> Sent: Wednesday, June 20, 2018 8:24 PM
> To: Lucas Stach <l.stach@pengutronix.de>; A.s. Dong
> <aisheng.dong@nxp.com>
> Cc: linux-gpio@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Shawn
> Guo <shawnguo@kernel.org>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Abel Vesa
> <abelvesa@linux.com>; Abel Vesa <abel.vesa@nxp.com>
> Subject: [PATCH v4 1/2] dt-bindings: add binding for i.MX8MQ IOMUXC
>=20
> This adds the binding for the i.MX8MQ pin controller, in the same fashion=
 as
> earlier i.MX SoCs.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 29
> ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl=
.txt
> b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> new file mode 100644
> index 0000000..f11a3f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> @@ -0,0 +1,29 @@
> +* Freescale IMX8MQ IOMUX Controller
> +
> +Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this
> +directory for common binding part and usage.
> +
> +Required properties:
> +- compatible: "fsl,imx8mq-iomuxc"
> +- fsl,pins: each entry consists of 6 integers and represents the mux
> +and config
> +  setting for one pin.  The first 5 integers <mux_reg conf_reg
> +input_reg mux_val
> +  input_val> are specified using a PIN_FUNC_ID macro, which can be
> +found in
> +  imx8mq-pinfunc.h under device tree source folder.  The last integer
> +CONFIG is
> +  the pad setting value like pull-up on this pin.  Please refer to
> +i.MX8M Quad
> +  Reference Manual for detailed CONFIG settings.
> +
> +Examples:
> +
> +&uart1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_uart1>;
> +};
> +
> +&iomuxc {
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins =3D <
> +			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX
> 0x49
> +			MX8MQ_IOMUXC_UART1_TXD_UART1_DCE_TX
> 0x49
> +		>;
> +	};
> +};

How about giving more detailed information in the example as it only shows
show the pinctrl group part.

e.g.
iomuxc: iomuxc@30330000 {
        compatible =3D "fsl,imx8mq-iomuxc";
        reg =3D <0x0 0x30330000 0x0 0x10000>;

        pinctrl_uart1: uart1grp {
                fsl,pins =3D <
                        MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX             0x4=
9
                        MX8MQ_IOMUXC_UART1_TXD_UART1_DCE_TX             0x4=
9
                >;
        };
};

Other than that:
Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>

Regards
Dong Aisheng

> --
> 2.7.4
