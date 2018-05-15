From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx51-zii-rdu1: limit usbh1 to full-speed
Date: Tue, 15 May 2018 10:52:36 +0200
Message-ID: <1526374356.3494.14.camel@pengutronix.de>
References: <20180515084502.17148-1-nikita.yoush@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180515084502.17148-1-nikita.yoush@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Healy <cphealy@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Marco Franchi <marcofrk@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 15.05.2018, 11:45 +0300 schrieb Nikita Yushchenko:
> On RDU1, imx51 usbh1 interface is either not used, or used via
> external
> block that breaks USB2 signalling.
> 
> To keep things working if high-speed device gets connected to that
> block, use ChipIdea feature to limit port to full speed.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  arch/arm/boot/dts/imx51-zii-rdu1.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts
> b/arch/arm/boot/dts/imx51-zii-rdu1.dts
> index 36a63ae52e48..c26f053f29b0 100644
> --- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
> +++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
> @@ -603,6 +603,7 @@
>  	phy_type = "ulpi";
>  	fsl,usbphy = <&usbh1phy>;
>  	disable-over-current;
> +	maximum-speed = "full-speed";
>  	vbus-supply = <&reg_5p0v_main>;
>  	status = "okay";
>  };
