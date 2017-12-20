From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7795: add usb3_phy node
Date: Wed, 20 Dec 2017 12:42:53 +0100
Message-ID: <20171220114245.mwgw7t5cz6jasi42@verge.net.au>
References: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1512640542-10380-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512640542-10380-2-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 07, 2017 at 06:55:39PM +0900, Yoshihiro Shimoda wrote:
> This patch adds USB3.0 PHY node for r8a7795.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 6db4f10..9710814 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -184,6 +184,19 @@
>  		clock-frequency = <0>;
>  	};
>  
> +	/* External USB clocks - can be overridden by the board */
> +	usb3s0_clk: usb3s0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +	};
> +
> +	usb_extal_clk: usb_extal {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&gic>;
> @@ -1643,6 +1656,19 @@
>  			iommus = <&ipmmu_hc 2>;
>  		};
>  
> +		usb3_phy0: usb-phy@e65ee000 {
> +			compatible = "renesas,r8a7795-usb3-phy",
> +				     "renesas,rcar-gen3-usb3-phy";
> +			reg = <0 0xe65ee000 0 0x90>;
> +			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>,
> +				 <&usb_extal_clk>;
> +			clock-names = "usb3-if", "usb3s_clk", "usb_extal";
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			resets = <&cpg 328>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		xhci0: usb@ee000000 {
>  			compatible = "renesas,xhci-r8a7795", "renesas,rcar-gen3-xhci";
>  			reg = <0 0xee000000 0 0xc00>;


Hi Shimoda-san,

I have applied this patch with some minor updates.

1. There was some fuzz when applying the patch which I resolved.
2. I shifted the _clk nodes to the bottom of the file to
   preserve alphabetical order of the sub-nodes of the root node.
   This ordering is new and probably was not the case when you submitted
   the patch (it probably also explains the fuzz).

What I have applied is as follows:

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] arm64: dts: renesas: r8a7795: add usb3_phy node

This patch adds USB3.0 PHY node for r8a7795.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 62dfc7781cc1..d12df6f2ff09 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1631,6 +1631,19 @@
 			iommus = <&ipmmu_hc 2>;
 		};
 
+		usb3_phy0: usb-phy@e65ee000 {
+			compatible = "renesas,r8a7795-usb3-phy",
+				     "renesas,rcar-gen3-usb3-phy";
+			reg = <0 0xe65ee000 0 0x90>;
+			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>,
+				 <&usb_extal_clk>;
+			clock-names = "usb3-if", "usb3s_clk", "usb_extal";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		xhci0: usb@ee000000 {
 			compatible = "renesas,xhci-r8a7795", "renesas,rcar-gen3-xhci";
 			reg = <0 0xee000000 0 0xc00>;
@@ -2380,4 +2393,17 @@
 			};
 		};
 	};
+
+	/* External USB clocks - can be overridden by the board */
+	usb3s0_clk: usb3s0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	usb_extal_clk: usb_extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
 };
-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
