From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 5/5] ARM: dts: mb86s71-f-cue: Add fake UART0 clock
Date: Sun, 25 Jun 2017 19:00:20 +0200
Message-ID: <20170625170020.11791-6-afaerber@suse.de>
References: <20170625170020.11791-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170625170020.11791-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Satoru OKAMOTO <okamoto.satoru@socionext.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As long as the clk driver is not building, use a fixed-clock for the UART.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm/boot/dts/mb86s71-f-cue.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mb86s71-f-cue.dts b/arch/arm/boot/dts/mb86s71-f-cue.dts
index 148d1aee11a6..726bf189e8e7 100644
--- a/arch/arm/boot/dts/mb86s71-f-cue.dts
+++ b/arch/arm/boot/dts/mb86s71-f-cue.dts
@@ -27,6 +27,12 @@
 		device_type = "memory";
 		reg = <0x80000000 0x80000000>;
 	};
+
+	uart0_clk: uart0-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <7813000>;
+		#clock-cells = <0>;
+	};
 };
 
 &arch_timer {
@@ -35,4 +41,6 @@
 
 &uart0 {
 	status = "okay";
+	clocks = <&uart0_clk>;
+	clock-names = "apb_pclk";
 };
-- 
2.12.3
