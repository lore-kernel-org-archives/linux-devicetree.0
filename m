From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 08/15] MIPS: dts: img: pistachio_marduk: Add user LEDs
Date: Sun, 22 Jul 2018 23:20:03 +0200
Message-ID: <20180722212010.3979-9-afaerber@suse.de>
References: <20180722212010.3979-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722212010.3979-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rahul Bedarkar <rahulbedarkar89@gmail.com>, James Hartley <james.hartley@sondrel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the LEDs that are connected to the SPI UART bridge.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index f682d0a5a3d9..6984933b3cdc 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -60,6 +60,52 @@
 		};
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			label = "marduk:red:user0";
+			gpios = <&sc16is752 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led1 {
+			label = "marduk:red:user1";
+			gpios = <&sc16is752 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led2 {
+			label = "marduk:red:user2";
+			gpios = <&sc16is752 2 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led3 {
+			label = "marduk:red:user3";
+			gpios = <&sc16is752 3 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led4 {
+			label = "marduk:red:user4";
+			gpios = <&sc16is752 4 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led5 {
+			label = "marduk:red:user5";
+			gpios = <&sc16is752 5 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led6 {
+			label = "marduk:red:user6";
+			gpios = <&sc16is752 6 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
 	keys {
 		compatible = "gpio-keys";
 
-- 
2.16.4
