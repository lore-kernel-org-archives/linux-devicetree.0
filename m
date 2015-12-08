From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH v3 3/3] ARM: dts: dove: add Dove divider clocks
Date: Tue, 08 Dec 2015 10:38:10 +0000
Message-ID: <E1a6Fes-0004dw-A8@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-clk-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the Dove divider clocks to the Dove dtsi file.

Acked-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/boot/dts/dove.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 179121630ad7..ea36a262d056 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -459,6 +459,12 @@
 					#clock-cells = <1>;
 				};
 
+				divider_clk: core-clock@0064 {
+					compatible = "marvell,dove-divider-clock";
+					reg = <0x0064 0x8>;
+					#clock-cells = <1>;
+				};
+
 				pinctrl: pin-ctrl@0200 {
 					compatible = "marvell,dove-pinctrl";
 					reg = <0x0200 0x14>,
-- 
2.1.0

