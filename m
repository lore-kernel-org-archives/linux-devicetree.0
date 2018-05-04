From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] ARM: dts: da850-lcdk: increase the size of the u-boot nand partition
Date: Fri,  4 May 2018 10:08:35 +0200
Message-ID: <20180504080835.28632-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Current mainline u-boot builds images that are bigger than the 0x80000
bytes u-boot partition allocated from the NAND memory. Using the free
space partition results in an unbootable system. Increase the partition
size to 0xa0000 bytes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/boot/dts/da850-lcdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index 7de302f890d7..fc8667445892 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -336,11 +336,11 @@
 				partition@20000 {
 					/* The LCDK defaults to booting from this partition */
 					label = "u-boot";
-					reg = <0x020000 0x080000>;
+					reg = <0x020000 0x0a0000>;
 				};
 				partition@a0000 {
 					label = "free space";
-					reg = <0x0a0000 0>;
+					reg = <0x0c0000 0>;
 				};
 			};
 		};
-- 
2.17.0
