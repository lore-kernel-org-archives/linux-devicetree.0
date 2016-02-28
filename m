From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: TS-4800: Add gpio driver
Date: Sun, 28 Feb 2016 16:12:59 +0800
Message-ID: <20160228081259.GK22051@tiger>
References: <1455915542-14467-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455915542-14467-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kernel@savoirfairelinux.com, kernel@pengutronix.de, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 19, 2016 at 03:59:02PM -0500, Julien Grossholtz wrote:
> Add dts nodes for TS-4800 FPGA gpio chips.
> 
> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
> ---
>  arch/arm/boot/dts/imx51-ts4800.dts | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx51-ts4800.dts b/arch/arm/boot/dts/imx51-ts4800.dts
> index 0ff76a1..c72c944 100644
> --- a/arch/arm/boot/dts/imx51-ts4800.dts
> +++ b/arch/arm/boot/dts/imx51-ts4800.dts
> @@ -165,6 +165,35 @@
>  			reg = <0x12000 0x1000>;
>  			syscon = <&syscon 0x10 6>;
>  		};
> +
> +		fpga_gpio0: fpga_gpio0@b0010020 {
> +			compatible = "technologic,ts4800-gpio";

I do not understand how this works, considering this compatible is not
supported by kernel.

Shawn

> +			reg = <0x10020 0x6>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		fpga_gpio1: fpga_gpio1@b0010028 {
> +			compatible = "technologic,ts4800-gpio";
> +			reg = <0x10028 0x6>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		fpga_gpio2: fpga_gpio2@b0010030 {
> +			compatible = "technologic,ts4800-gpio";
> +			reg = <0x10030 0x6>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		fpga_gpio3: fpga_gpio3@b0010038 {
> +			compatible = "technologic,ts4800-gpio";
> +			reg = <0x10038 0x6>;
> +			gpio-controller;
> +			ngpios = <8>;
> +			#gpio-cells = <2>;
> +		};
>  	};
>  };
>  
> -- 
> 2.5.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
