From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v6 5/5] arm64: dts: actions: Set UART clock reference
 from CMU
Date: Tue, 17 Jul 2018 19:47:57 +0530
Message-ID: <20180717141757.GE19076@mani>
References: <20180715203524.11948-1-sravanhome@gmail.com>
 <20180715203524.11948-6-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180715203524.11948-6-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: afaerber@suse.de, sboyd@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

On Sun, Jul 15, 2018 at 10:35:24PM +0200, Saravanan Sekar wrote:
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/actions/s700-cubieboard7.dts | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
> index ef79d7905f44..c08808ca3346 100644
> --- a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
> +++ b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
> @@ -28,12 +28,6 @@
>  		device_type = "memory";
>  		reg = <0x1 0xe0000000 0x0 0x0>;
>  	};
> -
> -	uart3_clk: uart3-clk {
> -		compatible = "fixed-clock";
> -		clock-frequency = <921600>;
> -		#clock-cells = <0>;
> -	};
>  };
>  
>  &timer {
> @@ -42,5 +36,5 @@
>  
>  &uart3 {
>  	status = "okay";
> -	clocks = <&uart3_clk>;
> +	clocks = <&cmu CLK_UART3>;
>  };
> -- 
> 2.18.0
> 
