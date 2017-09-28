From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 6/8] ARM: dts: aspeed-ast2500: Add I2C devices
Date: Thu, 28 Sep 2017 17:21:47 +0930
Message-ID: <20170928075149.8154-7-joel@jms.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928075149.8154-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Rick Altherr <raltherr@google.com>, Brendan Higgins <brendanhiggins@google.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Enable the buses that are in use and the devices that are attached.
Currently that includes temperature measurement and EEPROM.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 7c90dac99822..dc7d73b02b76 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -59,3 +59,22 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
 };
+
+&i2c3 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	lm75@4d {
+		compatible = "national,lm75";
+		reg = <0x4d>;
+	};
+};
-- 
2.14.1
