From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 3/3] ARM: BCM5301X: Specify USB 3.0 PHY in DT
Date: Wed, 21 Sep 2016 22:58:34 +0200
Message-ID: <20160921205838.15627-3-zajec5@gmail.com>
References: <20160921205838.15627-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160921205838.15627-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, "maintainer:BROADCOM BCM5301X ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:BROADCOM BCM5301X ARM
        ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Driver for Northstar USB 3.0 PHY has been recently added under the name
phy-bcm-ns-usb3. Add binding for it into the DT files.
The only slightly tricky part is BCM47094 which uses different PHY
version and requires different compatible value.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/bcm47094.dtsi | 6 ++++++
 arch/arm/boot/dts/bcm5301x.dtsi | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/bcm47094.dtsi b/arch/arm/boot/dts/bcm47094.dtsi
index f039765..4f09aa0 100644
--- a/arch/arm/boot/dts/bcm47094.dtsi
+++ b/arch/arm/boot/dts/bcm47094.dtsi
@@ -6,6 +6,12 @@
 
 #include "bcm4708.dtsi"
 
+/ {
+	usb3_phy: usb3-phy {
+		compatible = "brcm,ns-bx-usb3-phy";
+	};
+};
+
 &uart0 {
 	clock-frequency = <125000000>;
 };
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index ae4b388..f09a2bb 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -149,6 +149,13 @@
 		clock-names = "phy-ref-clk";
 	};
 
+	usb3_phy: usb3-phy {
+		compatible = "brcm,ns-ax-usb3-phy";
+		reg = <0x18105000 0x1000>, <0x18003000 0x1000>;
+		reg-names = "dmp", "ccb-mii";
+		#phy-cells = <0>;
+	};
+
 	axi@18000000 {
 		compatible = "brcm,bus-axi";
 		reg = <0x18000000 0x1000>;
-- 
2.9.3
