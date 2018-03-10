From: Vivek Unune <npcomplete13@gmail.com>
Subject: [PATCH] ARM: BCM5301X: Fix NAND ECC parameters for Linksys Panamera
Date: Sat, 10 Mar 2018 12:12:44 -0500
Message-ID: <20180310171244.70299-1-npcomplete13@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: florian.fainelli@broadcom.com, hauke@hauke-m.de, zajec5@gmail.com, jonmason@broadcom.com, bcm-kernel-feedback-list@broadcom.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Unune <npcomplete13@gmail.com>
List-Id: devicetree@vger.kernel.org

Using BCH8 gives ecc errors and makes the router unsuable.
Switching to BCH1 fixes these errors.

Signed-off-by: Vivek Unune <npcomplete13@gmail.com>
---
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/bcm47094-linksys-panamera.dts
index b6750f70dffb..ea1b3f5eff29 100644
--- a/arch/arm/boot/dts/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/bcm47094-linksys-panamera.dts
@@ -7,7 +7,7 @@
 /dts-v1/;
 
 #include "bcm47094.dtsi"
-#include "bcm5301x-nand-cs0-bch8.dtsi"
+#include "bcm5301x-nand-cs0-bch1.dtsi"
 
 / {
 	compatible = "linksys,panamera", "brcm,bcm47094", "brcm,bcm4708";
-- 
2.11.0
