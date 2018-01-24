From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] arc: dts: use 'atmel' as manufacturer for at24 in axs10x_mb
Date: Wed, 24 Jan 2018 22:39:55 +0100
Message-ID: <20180124213955.4975-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: devicetree@vger.kernel.org

Using compatible strings without the <manufacturer> part for at24 is
now deprecated. Use a correct 'atmel,<model>' value.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 74d070cd3c13..47b74fbc403c 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -214,13 +214,13 @@
 			};
 
 			eeprom@0x54{
-				compatible = "24c01";
+				compatible = "atmel,24c01";
 				reg = <0x54>;
 				pagesize = <0x8>;
 			};
 
 			eeprom@0x57{
-				compatible = "24c04";
+				compatible = "atmel,24c04";
 				reg = <0x57>;
 				pagesize = <0x8>;
 			};
-- 
2.16.1
