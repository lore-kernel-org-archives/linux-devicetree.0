From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH resend v3 2/2] ARM: shmobile: bockw reference dts: Add SPI FLASH
Date: Fri, 14 Mar 2014 11:06:41 +0100
Message-ID: <1394791601-25317-2-git-send-email-geert@linux-m68k.org>
References: <1394791601-25317-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1394791601-25317-1-git-send-email-geert@linux-m68k.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>

Add Spansion s25fl008k SPI FLASH and MTD partition, based on bockw legacy
board code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v3:
  - No changes

 arch/arm/boot/dts/r8a7778-bockw-reference.dts |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7778-bockw-reference.dts b/arch/arm/boot/dts/r8a7778-bockw-reference.dts
index 06cda19dac6a..f76f6ec01e19 100644
--- a/arch/arm/boot/dts/r8a7778-bockw-reference.dts
+++ b/arch/arm/boot/dts/r8a7778-bockw-reference.dts
@@ -109,4 +109,18 @@
 	pinctrl-0 = <&hspi0_pins>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	flash: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl008k";
+		reg = <0>;
+		spi-max-frequency = <104000000>;
+		m25p,fast-read;
+
+		partition@0 {
+			label = "data(spi)";
+			reg = <0x00000000 0x00100000>;
+		};
+	};
 };
-- 
1.7.9.5

