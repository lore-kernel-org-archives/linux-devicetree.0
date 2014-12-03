From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 01/12] ARM: dts: vf610: add routable-irqs property for gic node
Date: Wed,  3 Dec 2014 01:12:00 +0100
Message-ID: <1417565531-4507-2-git-send-email-stefan@agner.ch>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417565531-4507-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan.agner@toradex.com>, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

From: Stefan Agner <stefan.agner@toradex.com>

To enable proper routable interrupt controller support for
the GIC driver, the routable-irqs need to be specified.
Hence add the routable-irqs property with the amount of
IRQs supported by the GIC controller on the Vybrid SoC.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf500.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/vf500.dtsi b/arch/arm/boot/dts/vf500.dtsi
index de67005..2b0d84d 100644
--- a/arch/arm/boot/dts/vf500.dtsi
+++ b/arch/arm/boot/dts/vf500.dtsi
@@ -30,6 +30,7 @@
 
 			intc: interrupt-controller@40002000 {
 				compatible = "arm,cortex-a9-gic";
+				arm,routable-irqs = <144>;
 				#interrupt-cells = <3>;
 				interrupt-controller;
 				reg = <0x40003000 0x1000>,
-- 
2.1.3
