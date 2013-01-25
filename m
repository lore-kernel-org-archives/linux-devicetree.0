From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v2 6/6] ARM: dts: palmas: update dt data for palmas-usb
Date: Fri, 25 Jan 2013 16:41:52 +0530
Message-ID: <1359112312-6918-7-git-send-email-kishon@ti.com>
References: <1359112312-6918-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1359112312-6918-1-git-send-email-kishon@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: kishon@ti.com, balbi@ti.com, b-cousson@ti.com, tony@atomide.com, linux@arm.linux.org.uk, s-guiriec@ti.com, gg@slimlogic.co.uk, linux-omap@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update palmas-usb data node in palmas device tree file

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/palmas.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/palmas.dtsi b/arch/arm/boot/dts/palmas.dtsi
index d20adb4..0cf39da 100644
--- a/arch/arm/boot/dts/palmas.dtsi
+++ b/arch/arm/boot/dts/palmas.dtsi
@@ -318,8 +318,8 @@
 
 	palmas_usb {
 		compatible = "ti,palmas-usb";
-		ti,no_control_vbus = <0>;
-		ti,wakeup = <0>;
+		ti,wakeup;
+		vbus-supply = <&smps10_reg>;
 	};
 };
 
-- 
1.7.9.5

