From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: imx-ocotp: Add i.MX8MQ compatible
Date: Tue, 26 Feb 2019 09:04:51 +0000
Message-ID: <20190226090451.sxolgb6wiityfygk@fsr-ub1664-175>
References: <20190211165011.5114-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211165011.5114-1-l.stach@pengutronix.de>
Content-Language: en-US
Content-ID: <4E4DD844524054459B74D0F53592B2D7@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 19-02-11 17:50:09, Lucas Stach wrote:
> Add compatible for i.MX8MQ and add both i.MX7D/S and i.M8MQ
> to the description.

Hi Lucas,

This patchset does not apply on linux-next anymore due to the new additions
in the compatible lists (imx6ull/imx6ulz) in imx-ocotp.

Can you please resend ?

Thanks,
Abel

>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Docu=
mentation/devicetree/bindings/nvmem/imx-ocotp.txt
> index 792bc5fafeb9..bb8fb8fc6217 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> @@ -1,7 +1,8 @@
>  Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
> =20
>  This binding represents the on-chip eFuse OTP controller found on
> -i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX, i.MX6UL and i.MX6SLL SoCs.
> +i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX, i.MX6UL, i.MX6SLL, i.MX7D/S
> +and i.MX8MQ SoCs.
> =20
>  Required properties:
>  - compatible: should be one of
> @@ -11,6 +12,7 @@ Required properties:
>  	"fsl,imx6ul-ocotp" (i.MX6UL),
>  	"fsl,imx7d-ocotp" (i.MX7D/S),
>  	"fsl,imx6sll-ocotp" (i.MX6SLL),
> +	"fsl,imx8mq-ocotp" (i.MX8MQ),
>  	followed by "syscon".
>  - #address-cells : Should be 1
>  - #size-cells : Should be 1
> --=20
> 2.20.1
>=20
