From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 5/5] ARM: BCM53573: Specify USB ports of on-SoC controllers
Date: Tue,  6 Dec 2016 18:17:14 +0100
Message-ID: <20161206171714.22738-5-zajec5@gmail.com>
References: <20161206171714.22738-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161206171714.22738-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Broadcom OHCI and EHCI controllers always have 2 ports each on the root
hub. Describe them in DT to allow specifying extra info or referencing
port nodes.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/bcm53573.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/bcm53573.dtsi b/arch/arm/boot/dts/bcm53573.dtsi
index e2c496a..2da04d0 100644
--- a/arch/arm/boot/dts/bcm53573.dtsi
+++ b/arch/arm/boot/dts/bcm53573.dtsi
@@ -124,6 +124,17 @@
 				reg = <0x4000 0x1000>;
 				interrupt-parent = <&gic>;
 				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ehci_port1: port@1 {
+					reg = <1>;
+				};
+
+				ehci_port2: port@2 {
+					reg = <2>;
+				};
 			};
 
 			ohci: ohci@d000 {
@@ -133,6 +144,17 @@
 				reg = <0xd000 0x1000>;
 				interrupt-parent = <&gic>;
 				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ohci_port1: port@1 {
+					reg = <1>;
+				};
+
+				ohci_port2: port@2 {
+					reg = <2>;
+				};
 			};
 		};
 
-- 
2.10.1
