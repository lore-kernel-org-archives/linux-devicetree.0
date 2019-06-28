From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mq-librem5: Enable MIPI D-PHY
Date: Fri, 28 Jun 2019 08:43:31 -0600
Message-ID: <b533e051f4f9b89fed8917954d328c7c@www.akkea.ca>
References: <cover.1561451144.git.agx@sigxcpu.org>
 <d9a2076bd4231398bd131483db8b05a7e5d56d8b.1561451144.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9a2076bd4231398bd131483db8b05a7e5d56d8b.1561451144.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pavel Machek <pavel@ucw.cz>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-06-25 02:27, Guido Günther wrote:
> This enables the Mixel MIPI D-PHY on the Librem 5 devkit
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Acked-by: Angus Ainslie (Purism) <angus@akkea.ca>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> index 93b3830e5406..83c965773a29 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> @@ -174,6 +174,10 @@
>  	assigned-clock-rates = <786432000>, <722534400>;
>  };
> 
> +&dphy {
> +	status = "okay";
> +};
> +
>  &fec1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_fec1>;
