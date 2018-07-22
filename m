From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 06/15] MIPS: dts: img: pistachio_marduk: Add 6Lowpan node
Date: Sun, 22 Jul 2018 23:20:01 +0200
Message-ID: <20180722212010.3979-7-afaerber@suse.de>
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

The CA8210's clock output is needed for the SPI-UART bridge.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index d723b68084c9..b0b6b534a41f 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -158,6 +158,20 @@
 		   <&gpio1 12 GPIO_ACTIVE_HIGH>,
 		   <&gpio1 13 GPIO_ACTIVE_HIGH>,
 		   <&gpio1 14 GPIO_ACTIVE_HIGH>;
+
+	ca8210: sixlowpan@4 {
+		compatible = "cascoda,ca8210";
+		reg = <4>;
+		spi-max-frequency = <3000000>;
+		spi-cpol;
+		reset-gpio = <&gpio0 12 GPIO_ACTIVE_HIGH>;
+		irq-gpio = <&gpio2 12 GPIO_ACTIVE_HIGH>;
+
+		extclock-enable;
+		extclock-freq = <16000000>;
+		extclock-gpio = <2>; /* spiuart_clk */
+		#clock-cells = <0>;
+	};
 };
 
 &spfi1 {
-- 
2.16.4
