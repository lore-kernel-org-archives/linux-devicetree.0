Return-Path: <SRS0=hqGg=WY=nic.cz=marek.behun@kernel.org>
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v2 mvebu-dt64 1/3] arm64: dts: marvell: armada-37xx: add SPI CS1 pinctrl
Date: Wed, 28 Aug 2019 17:12:41 +0200
Message-Id: <20190828151243.23542-2-marek.behun@nic.cz>
In-Reply-To: <20190828151243.23542-1-marek.behun@nic.cz>
References: <20190828151243.23542-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: arm@kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-ID: <devicetree@vger.kernel.org>

This adds pinctrl node for the GPIO to be used as SPI chip select 1.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index f43c43168b00..10812a556829 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -215,6 +215,11 @@
 					function = "spi";
 				};
 
+				spi_cs1_pins: spi-cs1-pins {
+					groups = "spi_cs1";
+					function = "spi";
+				};
+
 				i2c1_pins: i2c1-pins {
 					groups = "i2c1";
 					function = "i2c";
-- 
2.21.0
