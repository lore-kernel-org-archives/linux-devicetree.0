From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 2/3] MIPS: ath79: ar9331: add Ethernet nodes
Date: Wed, 17 Apr 2019 08:22:00 +0200
Message-ID: <20190417062201.15745-3-o.rempel@pengutronix.de>
References: <20190417062201.15745-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417062201.15745-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add ethernet nodes supported by ag71xx driver.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/mips/boot/dts/qca/ar9331.dtsi           | 25 ++++++++++++++++++++
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts |  8 +++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
index 2bae201aa365..7d59c7c66dda 100644
--- a/arch/mips/boot/dts/qca/ar9331.dtsi
+++ b/arch/mips/boot/dts/qca/ar9331.dtsi
@@ -116,6 +116,31 @@
 			};
 		};
 
+		eth0: eth@19000000 {
+			status = "disabled";
+
+			compatible = "qca,ar9330-eth";
+			reg = <0x19000000 0x200>;
+			interrupts = <4>;
+
+			resets = <&rst 9>;
+			reset-names = "mac";
+		};
+
+		eth1: eth@1a000000 {
+			status = "disabled";
+
+			compatible = "qca,ar9330-eth";
+			reg = <0x1a000000 0x200>;
+			interrupts = <5>;
+
+			resets = <&rst 13>, <&rst 23>;
+			reset-names = "mac", "mdio";
+
+			clocks = <&pll ATH79_CLK_MDIO>;
+			clock-names = "mdio";
+		};
+
 		usb: usb@1b000100 {
 			compatible = "chipidea,usb2";
 			reg = <0x1b000000 0x200>;
diff --git a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
index e7af2cf5f4c1..77bab823eb3b 100644
--- a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
+++ b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
@@ -76,3 +76,11 @@
 		reg = <0>;
 	};
 };
+
+&eth0 {
+	status = "okay";
+};
+
+&eth1 {
+	status = "okay";
+};
-- 
2.20.1
