From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] ARM: dts: r8a7794: link DU to VSPD
Date: Tue, 03 Jan 2017 11:24:15 +0200
Message-ID: <1931710.8mMFQrpegP@avalon>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com> <1524349.7vYNCWaVjE@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1524349.7vYNCWaVjE@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thursday 29 Dec 2016 00:35:07 Sergei Shtylyov wrote:
> Add the "vsps" property to the DU device node in order to link this node to
> the (single) VSPD node.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

I'd like to first address the issues I've pointed out on the driver side of 
this change.

> ---
> This patch is against the 'renesas-devel-20161220-v4.9' of Simon Horman's
> 'renesas.git' repo.  It's  only meaningful if the "Enable R8A7794 DU VSPD
> compositor" DU driver patches are applied...
> 
>  arch/arm/boot/dts/r8a7794.dtsi |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
> @@ -908,7 +908,7 @@
>  		power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
>  	};
> 
> -	vsp1@fe930000 {
> +	vspd0: vsp1@fe930000 {
>  		compatible = "renesas,vsp1";
>  		reg = <0 0xfe930000 0 0x8000>;
>  		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> @@ -925,6 +925,7 @@
>  		clocks = <&mstp7_clks R8A7794_CLK_DU0>,
>  			 <&mstp7_clks R8A7794_CLK_DU0>;
>  		clock-names = "du.0", "du.1";
> +		vsps = <&vspd0>;
>  		status = "disabled";
> 
>  		ports {

-- 
Regards,

Laurent Pinchart
