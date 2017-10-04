From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/2] ARM: dts: aspeed: Enable watchdog two
Date: Wed,  4 Oct 2017 19:46:35 +1030
Message-ID: <20171004091635.12499-3-joel@jms.id.au>
References: <20171004091635.12499-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171004091635.12499-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

The second watchdog is left running by u-boot in the common
configurations of the firmware shipped on ASPEED boards. Ensure a driver
is loaded so the system can succcessfully boot.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 -
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 5be2e6a39917..9bf84d2ba038 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -212,7 +212,6 @@
 			wdt2: watchdog@1e785020 {
 				compatible = "aspeed,ast2400-wdt";
 				reg = <0x1e785020 0x1c>;
-				status = "disabled";
 			};
 
 			vuart: serial@1e787000 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 71e1264b81aa..ca023e9ab0b8 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -256,7 +256,6 @@
 			wdt2: watchdog@1e785020 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785020 0x20>;
-				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785040 {
-- 
2.14.1
