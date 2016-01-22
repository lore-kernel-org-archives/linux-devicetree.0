From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] arm64: dts: r8a7795: Add USB3.0 host device nodes
Date: Fri, 22 Jan 2016 19:03:22 +0900
Message-ID: <1453457003-7720-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1453457003-7720-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1453457003-7720-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 221a8f5..119549e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -862,5 +862,23 @@
 			clocks = <&cpg CPG_MOD 815>;
 			status = "disabled";
 		};
+
+		xhci0: usb@ee000000 {
+			compatible = "renesas,xhci-r8a7795";
+			reg = <0 0xee000000 0 0xc00>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 328>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		xhci1: usb@ee0400000 {
+			compatible = "renesas,xhci-r8a7795";
+			reg = <0 0xee040000 0 0xc00>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 327>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 };
-- 
1.9.1
