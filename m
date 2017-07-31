From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: update dynamic-power-coefficient for rk3399
Date: Tue, 01 Aug 2017 01:02:04 +0200
Message-ID: <1954724.bYQfYcfQLC@phil>
References: <1500974575-2244-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500974575-2244-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, William wu <wulf@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Roger Chen <roger.chen@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 25. Juli 2017, 17:22:55 CEST schrieb Caesar Wang:
> This patch updates the dynamic-power-coefficient for big cluster on
> rk3399 SoCs.
> 
> The dynamic power consumption of the CPU is proportional to the square of
> the Voltage (V) and the clock frequency (f). The coefficient is used to
> calculate the dynamic power as below -
> Pdyn = dynamic-power-coefficient * V^2 * f
> Where Voltage is in uV, frequency is in MHz.
> 
> As the following is the tested data on rk3399's big cluster.
> frequency(MHz)  Voltage(V)  Current(mA) Dynamic-power-coefficient
> 24              0.8         15
> 48              0.8         23          ~417
> 96              0.8         40          ~443
> 216             0.8         82          ~438
> 312             0.8         115         ~430
> 408             0.8         150         ~455
> So the dynamic-power-coefficient average value is about 436.
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>

applied for 4.14 and thanks for that very nice and informative commit
message explaining the testing methodology.


Heiko

> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 9d02006..5d54a06 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -150,7 +150,7 @@
>  			enable-method = "psci";
>  			#cooling-cells = <2>; /* min followed by max */
>  			clocks = <&cru ARMCLKB>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <436>;
>  		};
>  
>  		cpu_b1: cpu@101 {
> @@ -159,7 +159,7 @@
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
>  			clocks = <&cru ARMCLKB>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <436>;
>  		};
>  	};
>  
> 
