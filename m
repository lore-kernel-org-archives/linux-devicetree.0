From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/16] arm: dts: rda8810pl: Add interrupt controller support
Date: Mon, 19 Nov 2018 22:39:31 +0530
Message-ID: <20181119170939.19153-9-manivannan.sadhasivam@linaro.org>
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

Add interrupt controller support for RDA Micro RDA8810PL SoC.

Signed-off-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/rda8810pl.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rda8810pl.dtsi b/arch/arm/boot/dts/rda8810pl.dtsi
index 7f1ff2021eff..093d6980bfbd 100644
--- a/arch/arm/boot/dts/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/rda8810pl.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	compatible = "rda,8810pl";
+	interrupt-parent = <&intc>;
 	#address-cells = <1>;
 	#size-cells = <1>;
 
@@ -49,6 +50,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x20800000 0x100000>;
+
+			intc: interrupt-controller {
+				compatible = "rda,8810pl-intc";
+				reg = <0x0 0x1000>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		apb@20900000 {
-- 
2.17.1
