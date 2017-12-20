From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a7796: add usb3_phy node
Date: Wed, 20 Dec 2017 12:44:29 +0100
Message-ID: <20171220114429.vgb3hbnlgwue2432@verge.net.au>
References: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1512640542-10380-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1512640542-10380-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 07, 2017 at 06:55:40PM +0900, Yoshihiro Shimoda wrote:
> This patch adds USB3.0 PHY node for r8a7796.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index cc0cca7c..cee50e8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -166,6 +166,19 @@
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
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&gic>;
> @@ -1419,6 +1432,19 @@
>  			status = "disabled";
>  		};
>  
> +		usb3_phy0: usb-phy@e65ee000 {
> +			compatible = "renesas,r8a7796-usb3-phy",
> +				     "renesas,rcar-gen3-usb3-phy";
> +			reg = <0 0xe65ee000 0 0x90>;
> +			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>,
> +				 <&usb_extal_clk>;
> +			clock-names = "usb3-if", "usb3s_clk", "usb_extal";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 328>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		xhci0: usb@ee000000 {
>  			compatible = "renesas,xhci-r8a7796",
>  				     "renesas,rcar-gen3-xhci";

Hi Shimoda-san,

I have applied this patch with a minor update.

* I shifted the _clk nodes to the bottom of the file to
  preserve alphabetical order of the sub-nodes of the root node.
  This ordering is new and probably was not the case when you submitted
  the patch.

What I have applied is as follows:


From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a7796: add usb3_phy node

This patch adds USB3.0 PHY node for r8a7796.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index a339047acdc7..c5192d513d7d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1403,6 +1403,19 @@
 			status = "disabled";
 		};
 
+		usb3_phy0: usb-phy@e65ee000 {
+			compatible = "renesas,r8a7796-usb3-phy",
+				     "renesas,rcar-gen3-usb3-phy";
+			reg = <0 0xe65ee000 0 0x90>;
+			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>,
+				 <&usb_extal_clk>;
+			clock-names = "usb3-if", "usb3s_clk", "usb_extal";
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		xhci0: usb@ee000000 {
 			compatible = "renesas,xhci-r8a7796",
 				     "renesas,rcar-gen3-xhci";
@@ -2021,4 +2034,17 @@
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
