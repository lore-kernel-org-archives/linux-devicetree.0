From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 08/20] ARM: dts: aspeed: Add clock phandle to GPIO
Date: Wed, 20 Dec 2017 13:53:16 +1030
Message-ID: <20171220032328.30584-9-joel@jms.id.au>
References: <20171220032328.30584-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171220032328.30584-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This enables a feature where the driver can debounce inputs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 36cb66d8cc10..d2a82850b05b 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -144,6 +144,7 @@
 				reg = <0x1e780000 0x1000>;
 				interrupts = <20>;
 				gpio-ranges = <&pinctrl 0 0 220>;
+				clocks = <&syscon ASPEED_CLK_APB>;
 				interrupt-controller;
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 156b345ff20d..3a25fa48d4f6 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -187,6 +187,7 @@
 				reg = <0x1e780000 0x1000>;
 				interrupts = <20>;
 				gpio-ranges = <&pinctrl 0 0 220>;
+				clocks = <&syscon ASPEED_CLK_APB>;
 				interrupt-controller;
 			};
 
-- 
2.15.1
