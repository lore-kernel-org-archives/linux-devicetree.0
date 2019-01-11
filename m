From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx7ulp: add sim node
Date: Fri, 11 Jan 2019 10:53:15 +0800
Message-ID: <20190111025314.GH25218@dragon>
References: <1544775260-25458-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544775260-25458-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 08:20:22AM +0000, Anson Huang wrote:
> i.MX7ULP SoC revision info is inside the SIM mode's JTAG_ID
> register, add sim node to support SoC revision check.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm/boot/dts/imx7ulp.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
> index b86daf7..fca6e50 100644
> --- a/arch/arm/boot/dts/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> @@ -347,4 +347,17 @@
>  			gpio-ranges = <&iomuxc1 0 96 32>;
>  		};
>  	};
> +
> +	m4aips1: bus@41080000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x41080000 0x80000>;
> +		ranges;
> +
> +		sim: sim@410a3000 {
> +			compatible = "fsl,imx7ulp-sim", "syscon";

The compatible needs to be documented. Also we generally compose a series
in order below.

 - Bindings patch
 - Kernel patch
 - DTS patch

Shawn

> +			reg = <0x410a3000 0x1000>;
> +		};
> +	};
>  };
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
