From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] ARM: dts: fix naming of pinctrl node
Date: Sat,  8 Oct 2016 13:34:26 -0700
Message-ID: <1475958866-15942-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

Remove 0x from pinctrl node to match device tree naming convention.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index fabc9f3..539c58f 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -108,7 +108,7 @@
 			};
 		};
 
-		pinctrl: pinctrl@0x0301d0c8 {
+		pinctrl: pinctrl@0301d0c8 {
 			compatible = "brcm,cygnus-pinmux";
 			reg = <0x0301d0c8 0x30>,
 			      <0x0301d24c 0x2c>;
-- 
2.5.0
