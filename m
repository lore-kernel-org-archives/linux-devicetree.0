From: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Subject: [PATCH v2 02/03] arm: dts: actions: Enable clock controller for
 Actions Semi S500 SoC
Date: Tue, 4 Sep 2018 12:38:24 -0300
Message-ID: <CADHB5bAYs4QjhYVj--Vd5vVP0h5o8161St_=Yj2HfhFAR4U3eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux@armlinux.org.uk, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Guilherme_G=2E_Sim=C3=B5es?= <guilherme.simoes@lsitec.org.br>, Jon maddog Hall <jon.maddog.hall@gmail.com>, mkzuffo@lsi.usp.br, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, sboyd@kernel.org, mark.rutland@arm.com, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, Michael Turquette <mturquette@baylibre.com>, will.deacon@arm.com, thomas liau <thomas.liau@actions-semi.com>, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, mp-cs@actions-semi.com, Laisa Costa - LSI-TEC <laisa.costa@lsitec.org.br>
List-Id: devicetree@vger.kernel.org

Enable clock controller for Actions Semi S500 SoC on owl-s500 device tree.
Set UART clock reference from CMU for Actions Semi S500 SoC.
Tested on a Lemaker Guitar board.

Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>


diff --git a/arch/arm/boot/dts/owl-s500-cubieboard6.dts
b/arch/arm/boot/dts/owl-s500-cubieboard6.dts
index 7c96c59b610d..4a91a29d2f29 100644
--- a/arch/arm/boot/dts/owl-s500-cubieboard6.dts
+++ b/arch/arm/boot/dts/owl-s500-cubieboard6.dts
@@ -3,6 +3,7 @@
  * Cubietech CubieBoard6
  *
  * Copyright (c) 2017 Andreas F=C3=A4rber
+ * Copyright (c) 2018 Edgar Bernardi Righi
  */

 /dts-v1/;
@@ -25,12 +26,6 @@
         device_type =3D "memory";
         reg =3D <0x0 0x80000000>;
     };
-
-    uart3_clk: uart3-clk {
-        compatible =3D "fixed-clock";
-        clock-frequency =3D <921600>;
-        #clock-cells =3D <0>;
-    };
 };

 &timer {
@@ -39,5 +34,4 @@

 &uart3 {
     status =3D "okay";
-    clocks =3D <&uart3_clk>;
 };
diff --git a/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
b/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
index e610d49395d2..1a980ca6a426 100644
--- a/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
+++ b/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (c) 2016-2017 Andreas F=C3=A4rber
+ * Copyright (c) 2018-2018 Edgar Bernardi Righi
  */

 /dts-v1/;
@@ -18,15 +19,8 @@
     chosen {
         stdout-path =3D "serial3:115200n8";
     };
-
-    uart3_clk: uart3-clk {
-        compatible =3D "fixed-clock";
-        clock-frequency =3D <921600>;
-        #clock-cells =3D <0>;
-    };
 };

 &uart3 {
     status =3D "okay";
-    clocks =3D <&uart3_clk>;
 };
diff --git a/arch/arm/boot/dts/owl-s500-sparky.dts
b/arch/arm/boot/dts/owl-s500-sparky.dts
index c665ce8b88b4..65555afee584 100644
--- a/arch/arm/boot/dts/owl-s500-sparky.dts
+++ b/arch/arm/boot/dts/owl-s500-sparky.dts
@@ -3,6 +3,7 @@
  * Allo.com Sparky
  *
  * Copyright (c) 2017 Andreas F=C3=A4rber
+ * Copyright (c) 2018-2018 Edgar Bernardi Righi
  */

 /dts-v1/;
@@ -25,12 +26,6 @@
         device_type =3D "memory";
         reg =3D <0x0 0x40000000>; /* 1 or 2 GiB */
     };
-
-    uart3_clk: uart3-clk {
-        compatible =3D "fixed-clock";
-        clock-frequency =3D <921600>;
-        #clock-cells =3D <0>;
-    };
 };

 &timer {
@@ -39,5 +34,4 @@

 &uart3 {
     status =3D "okay";
-    clocks =3D <&uart3_clk>;
 };
diff --git a/arch/arm/boot/dts/owl-s500.dtsi b/arch/arm/boot/dts/owl-s500.d=
tsi
index 5ceb6cc4451d..bf506038e22b 100644
--- a/arch/arm/boot/dts/owl-s500.dtsi
+++ b/arch/arm/boot/dts/owl-s500.dtsi
@@ -3,10 +3,12 @@
  * Actions Semi S500 SoC
  *
  * Copyright (c) 2016-2017 Andreas F=C3=A4rber
+ * Copyright (c) 2018-2018 Edgar Bernardi Righi
  */

 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/owl-s500-powergate.h>
+#include <dt-bindings/clock/actions,s500-cmu.h>

 / {
     compatible =3D "actions,s500";
@@ -69,6 +71,12 @@
         clock-frequency =3D <24000000>;
         #clock-cells =3D <0>;
     };
+
+    losc: losc {
+        compatible =3D "fixed-clock";
+        clock-frequency =3D <32678>;
+        #clock-cells =3D <0>;
+    };

     soc {
         compatible =3D "simple-bus";
@@ -124,6 +132,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0120000 0x2000>;
             interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART0>;
             status =3D "disabled";
         };

@@ -131,6 +140,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0122000 0x2000>;
             interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART1>;
             status =3D "disabled";
         };

@@ -138,6 +148,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0124000 0x2000>;
             interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART2>;
             status =3D "disabled";
         };

@@ -145,6 +156,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0126000 0x2000>;
             interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART3>;
             status =3D "disabled";
         };

@@ -152,6 +164,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0128000 0x2000>;
             interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART4>;
             status =3D "disabled";
         };

@@ -159,6 +172,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb012a000 0x2000>;
             interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART5>;
             status =3D "disabled";
         };

@@ -166,8 +180,18 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb012c000 0x2000>;
             interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART6>;
             status =3D "disabled";
         };
+
+        cmu: clock-controller@b0160000 {
+            compatible =3D "actions,s500-cmu";
+            reg =3D <0xb0160000 0x8000>;
+            clocks =3D <&hosc>, <&losc>;
+            clock-indices =3D <CLK_UART0>, <CLK_UART1>, <CLK_UART2>,
+                            <CLK_UART3>, <CLK_UART4>, <CLK_UART5>, <CLK_UA=
RT6>;
+            #clock-cells =3D <1>;
+        };

         timer: timer@b0168000 {
             compatible =3D "actions,s500-timer";
