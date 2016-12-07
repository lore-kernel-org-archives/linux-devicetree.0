From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 1/5] ARM: BCM5301X: Fix LAN LED labels for Luxul XWR-3100
Date: Wed,  7 Dec 2016 08:56:51 +0100
Message-ID: <20161207075655.7396-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

They were named incorrectly most likely due to copy & paste mistake.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
index 2f4a651..93cc91d 100644
--- a/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
@@ -31,13 +31,13 @@
 		};
 
 		lan3	{
-			label = "bcm53xx:green:lan1";
+			label = "bcm53xx:green:lan3";
 			gpios = <&chipcommon 1 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "default-off";
 		};
 
 		lan4	{
-			label = "bcm53xx:green:lan0";
+			label = "bcm53xx:green:lan4";
 			gpios = <&chipcommon 2 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "default-off";
 		};
@@ -49,7 +49,7 @@
 		};
 
 		lan1	{
-			label = "bcm53xx:green:lan3";
+			label = "bcm53xx:green:lan1";
 			gpios = <&chipcommon 4 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "default-off";
 		};
-- 
2.10.1
