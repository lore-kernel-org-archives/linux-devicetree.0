From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 07/15] MIPS: dts: img: pistachio_marduk: Add SPI UART node
Date: Sun, 22 Jul 2018 23:20:02 +0200
Message-ID: <20180722212010.3979-8-afaerber@suse.de>
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

The mikroBUS and Raspberry Pi B+ connector UARTs are behind an SC16IS752
SPI-UART bridge. Add it in order to be able to use these connectors.

Note: For UART flow control two pairs of jumpers need to be configured.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index b0b6b534a41f..f682d0a5a3d9 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -159,6 +159,18 @@
 		   <&gpio1 13 GPIO_ACTIVE_HIGH>,
 		   <&gpio1 14 GPIO_ACTIVE_HIGH>;
 
+	sc16is752: uart@0 {
+		compatible = "nxp,sc16is752";
+		reg = <0>;
+		spi-max-frequency = <4000000>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&ca8210>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	ca8210: sixlowpan@4 {
 		compatible = "cascoda,ca8210";
 		reg = <4>;
-- 
2.16.4
