From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 14/16] arm: dts: rda8810pl: Add interrupt support for UART
Date: Mon, 19 Nov 2018 22:39:37 +0530
Message-ID: <20181119170939.19153-15-manivannan.sadhasivam@linaro.org>
References: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: olof@lixom.net, arnd@arndb.de, robh+dt@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, daniel.lezcano@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, amit.kucheria@linaro.org, linus.walleij@linaro.org, zhao_steven@263.net, service@rdamicro.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

Add interrupt support for UART in RDA Micro RDA8810PL SoC.

Signed-off-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/rda8810pl.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/rda8810pl.dtsi b/arch/arm/boot/dts/rda8810pl.dtsi
index 470a18585deb..07110c5784c9 100644
--- a/arch/arm/boot/dts/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/rda8810pl.dtsi
@@ -87,18 +87,21 @@
 			uart0: serial@0 {
 				compatible = "rda,8810pl-uart";
 				reg = <0x0 0x1000>;
+				interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			uart1: serial@10000 {
 				compatible = "rda,8810pl-uart";
 				reg = <0x10000 0x1000>;
+				interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			uart2: serial@90000 {
 				compatible = "rda,8810pl-uart";
 				reg = <0x90000 0x1000>;
+				interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 		};
-- 
2.17.1
