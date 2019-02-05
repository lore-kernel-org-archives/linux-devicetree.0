From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am65: Add MSMC RAM node
Date: Tue, 5 Feb 2019 14:25:26 +0200
Message-ID: <5C5980B6.4010502@ti.com>
References: <1547199855-16374-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547199855-16374-1-git-send-email-rogerq@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: t-kristo@ti.com
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, "Andrew F . Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

Tero,

On 11/01/19 11:44, Roger Quadros wrote:
> The AM65 SoC has 2MB MSMC RAM. Add this as a mmio-sram
> node so drivers can use it via genpool API.
> 
> Following areas are marked reserved:
> - Lower 128KB for ATF
> - 64KB@0xf0000 for SYSFW
> - Upper 1MB for cache
> 
> The reserved locations are subject to change at runtime by
> the bootloader.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Lokesh Vutla <lokeshvutla@ti.com>
> Cc: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>

Is this patch good to pick for -next?

cheers,
-roger

> ---
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 272cf8f..5a18150 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -6,6 +6,26 @@
>   */
>  
>  &cbass_main {
> +	msmc_ram: sram@70000000 {
> +		compatible = "mmio-sram";
> +		reg = <0x0 0x70000000 0x0 0x200000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x70000000 0x200000>;
> +
> +		atf-sram@0 {
> +			reg = <0x0 0x20000>;
> +		};
> +
> +		sysfw-sram@f0000 {
> +			reg = <0xf0000 0x10000>;
> +		};
> +
> +		l3cache-sram@100000 {
> +			reg = <0x100000 0x100000>;
> +		};
> +	};
> +
>  	gic500: interrupt-controller@1800000 {
>  		compatible = "arm,gic-v3";
>  		#address-cells = <2>;
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
