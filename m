From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH resend] arm: dts: ls1021a: add reboot node to .dtsi
Date: Tue, 5 Dec 2017 09:12:47 +0100
Message-ID: <1512461568-12102-1-git-send-email-rasmus.villemoes@prevas.dk>
References: <1510566980-26602-1-git-send-email-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510566980-26602-1-git-send-email-rasmus.villemoes@prevas.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The LS1021A can be reset via the dcfg regmap in the same way as the
arm64 layerscape SoCs, so add the corresponding DT node.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 arch/arm/boot/dts/ls1021a.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 9319e1f0f1d8..3ff2b8a9f01a 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -108,6 +108,13 @@
 			     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	reboot {
+		compatible = "syscon-reboot";
+		regmap = <&dcfg>;
+		offset = <0xb0>;
+		mask = <0x02>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.7.4
