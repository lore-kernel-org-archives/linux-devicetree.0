From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] ARM: dts: r8a7791: link DU to VSPDs
Date: Thu, 26 Jan 2017 00:42:17 +0300
Message-ID: <2492577.tBEnW0tCHD@wasted.cogentembedded.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the "vsps" property to the DU device node in order to link this node to
the VSPD nodes.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- rebased the patch.

This patch is against the 'renesas-devel-20170125-v4.10-rc5' of Simon Horman's
'renesas.git' repo.  It's  only meaningful if the DRM driver patches I've just
posted are applied.

 arch/arm/boot/dts/r8a7791.dtsi |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7791.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791.dtsi
+++ renesas/arch/arm/boot/dts/r8a7791.dtsi
@@ -992,7 +992,7 @@
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 	};
 
-	vsp1@fe930000 {
+	vspd0: vsp1@fe930000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe930000 0 0x8000>;
 		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
@@ -1000,7 +1000,7 @@
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 	};
 
-	vsp1@fe938000 {
+	vspd1: vsp1@fe938000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe938000 0 0x8000>;
 		interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
@@ -1019,6 +1019,7 @@
 			 <&mstp7_clks R8A7791_CLK_DU1>,
 			 <&mstp7_clks R8A7791_CLK_LVDS0>;
 		clock-names = "du.0", "du.1", "lvds.0";
+		vsps = <&vspd0 &vspd1>;
 		status = "disabled";
 
 		ports {
