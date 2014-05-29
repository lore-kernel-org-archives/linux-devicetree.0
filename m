From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] arm: shmobile: r8a7790: add USB3.0 node to r8a7790.dtsi
Date: Thu, 29 May 2014 20:00:08 +0900
Message-ID: <53871338.8050606@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, SH-Linux <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm/boot/dts/r8a7790.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index e06c486..e6b04f2 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -902,4 +902,14 @@
 		#size-cells = <0>;
 		status = "disabled";
 	};
+
+	xhci: xhci@ee000000 {
+		compatible = "renesas,xhci-r8a7790";
+		reg = <0 0xee000000 0 0xc00>;
+		interrupts = <0 101 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7790_CLK_SSUSB>;
+		phys = <&usbphy 1 1>;
+		phy-names = "usb";
+		status = "disabled";
+	};
 };
-- 
1.7.9.5

