From: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Subject: [PATCH v1 04/04] arm: dts: actions: Set UART clock reference from CMU
 for Actions Semi S500 SoC
Date: Wed, 18 Jul 2018 13:22:05 -0300
Message-ID: <CADHB5bBARxb2ob4pg1sKxJsUf4eRhJThB=OuBkmHq-fSoD7f4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux@armlinux.org.uk, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Guilherme_G=2E_Sim=C3=B5es?= <guilherme.simoes@lsitec.org.br>, Jon maddog Hall <jon.maddog.hall@gmail.com>, mkzuffo@lsi.usp.br, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, sboyd@kernel.org, mark.rutland@arm.com, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, Michael Turquette <mturquette@baylibre.com>, will.deacon@arm.com, thomas liau <thomas.liau@actions-semi.com>, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, mp-cs@actions-semi.com, Laisa Costa - LSI-TEC <laisa.costa@lsitec.org.br>
List-Id: devicetree@vger.kernel.org

Set UART clock reference from CMU for Actions Semi S500 SoC.
Tested on a Lemaker Guitar board.

File(s) updated: "/arch/arm/boot/dts/owl-s500.dtsi",
"/arch/arm/boot/dts/owl-s500-cubieboard6.dts",
"/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts",
"/arch/arm/boot/dts/owl-s500-sparky.dts"

Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>

diff -uprN -X vanilla/Documentation/dontdiff
vanilla/arch/arm/boot/dts/owl-s500-cubieboard6.dts
linux/arch/arm/boot/dts/owl-s500-cubieboard6.dts
--- vanilla/arch/arm/boot/dts/owl-s500-cubieboard6.dts    2018-07-17
13:07:15.675710511 -0300
+++ linux/arch/arm/boot/dts/owl-s500-cubieboard6.dts    2018-07-17
16:42:53.202336000 -0300
@@ -26,12 +26,6 @@
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
@@ -40,5 +34,5 @@

 &uart3 {
     status =3D "okay";
-    clocks =3D <&uart3_clk>;
 };
+
diff -uprN -X vanilla/Documentation/dontdiff
vanilla/arch/arm/boot/dts/owl-s500.dtsi
linux/arch/arm/boot/dts/owl-s500.dtsi
--- vanilla/arch/arm/boot/dts/owl-s500.dtsi    2018-07-18
12:51:07.875364441 -0300
+++ linux/arch/arm/boot/dts/owl-s500.dtsi    2018-07-17 16:43:47.786063000 =
-0300
@@ -133,6 +133,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0120000 0x2000>;
             interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART0>;
             status =3D "disabled";
         };

@@ -140,6 +141,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0122000 0x2000>;
             interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART1>;
             status =3D "disabled";
         };

@@ -147,6 +149,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0124000 0x2000>;
             interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART2>;
             status =3D "disabled";
         };

@@ -154,6 +157,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0126000 0x2000>;
             interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART3>;
             status =3D "disabled";
         };

@@ -161,6 +165,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb0128000 0x2000>;
             interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART4>;
             status =3D "disabled";
         };

@@ -168,6 +173,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb012a000 0x2000>;
             interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART5>;
             status =3D "disabled";
         };

@@ -175,6 +181,7 @@
             compatible =3D "actions,s500-uart", "actions,owl-uart";
             reg =3D <0xb012c000 0x2000>;
             interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+            clocks =3D <&cmu CLK_UART6>;
             status =3D "disabled";
         };

@@ -182,6 +189,8 @@
             compatible =3D "actions,s500-cmu";
             reg =3D <0xb0160000 0x8000>;
             clocks =3D <&hosc>, <&losc>;
+            clock-indices =3D <CLK_UART0>, <CLK_UART1>, <CLK_UART2>,
+                            <CLK_UART3>, <CLK_UART4>, <CLK_UART5>, <CLK_UA=
RT6>;
             #clock-cells =3D <1>;
         };

diff -uprN -X vanilla/Documentation/dontdiff
vanilla/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
linux/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
--- vanilla/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
2018-07-17 13:07:15.675710511 -0300
+++ linux/arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts    2018-07-18
13:15:24.956371706 -0300
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2016-2017 Andreas F=C3=A4rber
+ * Copyright (c) 2018-2018 Edgar Bernardi Righi
  *
  * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
@@ -19,15 +20,9 @@
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
+
diff -uprN -X vanilla/Documentation/dontdiff
vanilla/arch/arm/boot/dts/owl-s500-sparky.dts
linux/arch/arm/boot/dts/owl-s500-sparky.dts
--- vanilla/arch/arm/boot/dts/owl-s500-sparky.dts    2018-07-17
13:07:15.675710511 -0300
+++ linux/arch/arm/boot/dts/owl-s500-sparky.dts    2018-07-16
11:53:58.799410000 -0300
@@ -25,12 +25,6 @@
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
@@ -39,5 +33,4 @@

 &uart3 {
     status =3D "okay";
-    clocks =3D <&uart3_clk>;
 };
