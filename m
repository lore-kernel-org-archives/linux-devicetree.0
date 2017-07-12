From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: update the thermal zones for
 RK3399 SoCs
Date: Wed, 12 Jul 2017 10:32:09 -0700
Message-ID: <20170712173208.GA92073@google.com>
References: <1499840971-20392-1-git-send-email-wxt@rock-chips.com>
 <1499840971-20392-5-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499840971-20392-5-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, rocky.hao@rock-chips.com, Douglas Anderson <dianders@chromium.org>, William wu <wulf@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Roger Chen <roger.chen@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Caesar,

On Wed, Jul 12, 2017 at 02:29:30PM +0800, Caesar Wang wrote:
> As RK3399 had used the Power allocator thermal governor by default,
> enabled this to manage thermals by dynamically allocating and limiting
> power to devices.
> 
> Also, this patch supported the dynamic-power-coefficient/sustainable_power
> and GPU's power model for needed parameters with thermal IPA.
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> 
> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 62 +++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 8c6438b..139f58c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -147,7 +147,7 @@
>  			enable-method = "psci";
>  			#cooling-cells = <2>; /* min followed by max */
>  			clocks = <&cru ARMCLKB>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <436>;
>  		};
>  
>  		cpu_b1: cpu@101 {
> @@ -156,7 +156,7 @@
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
>  			clocks = <&cru ARMCLKB>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <436>;

There are 6 of these properties (1 for each core now; not just 1 for
each cluster), and you're only changing 2 of them.

BTW, are these values determined from measurement this time? And heavily
tested? The previous values were suspiciously round, but they'd been
heavily tested so I didn't mind :)

>  		};
>  	};
>  

...

Brian
