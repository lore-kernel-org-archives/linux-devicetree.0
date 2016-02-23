From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/5] arm64: dts: r8a7795: add usb2_phy device nodes
Date: Tue, 23 Feb 2016 21:28:32 +0900
Message-ID: <1456230516-5112-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1456230516-5112-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1456230516-5112-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c2bffd1..be64bb2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1023,5 +1023,33 @@
 			cap-mmc-highspeed;
 			status = "disabled";
 		};
+
+		usb2_phy0: usb-phy@ee080200 {
+			compatible = "renesas,usb2-phy-r8a7795";
+			reg = <0 0xee080200 0 0x700>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			power-domains = <&cpg>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@ee0a0200 {
+			compatible = "renesas,usb2-phy-r8a7795";
+			reg = <0 0xee0a0200 0 0x700>;
+			clocks = <&cpg CPG_MOD 702>;
+			power-domains = <&cpg>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb2_phy2: usb-phy@ee0c0200 {
+			compatible = "renesas,usb2-phy-r8a7795";
+			reg = <0 0xee0c0200 0 0x700>;
+			clocks = <&cpg CPG_MOD 701>;
+			power-domains = <&cpg>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 };
-- 
1.9.1
