From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] arm: dts: socfpga: fix GIC PPI warning
Date: Fri, 23 Mar 2018 08:56:17 -0500
Message-ID: <3b6eabf8-1d6b-7a58-03b1-3bff14c4127e@kernel.org>
References: <20180323092215.1307-1-pp@emlix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323092215.1307-1-pp@emlix.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Puschmann <pp@emlix.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 03/23/2018 04:22 AM, Philipp Puschmann wrote:
> Fixes the warning "GIC: PPI13 is secure or misconfigured" by
> changing the interrupt type from level_low to edge_raising
> 
> Signed-off-by: Philipp Puschmann <pp@emlix.com>
> ---
>  arch/arm/boot/dts/socfpga.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 595eb4f1a761..e9417551d7ea 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -815,7 +815,7 @@
>  		timer@fffec600 {
>  			compatible = "arm,cortex-a9-twd-timer";
>  			reg = <0xfffec600 0x100>;
> -			interrupts = <1 13 0xf04>;
> +			interrupts = <1 13 0xf01>;
>  			clocks = <&mpu_periph_clk>;
>  		};

Applied, thanks!

Dinh
