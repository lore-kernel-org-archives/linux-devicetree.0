From: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Subject: [PATCH v1 03/04] arm: dts: actions: Enable clock controller for
 Actions Semi S500 SoC
Date: Wed, 18 Jul 2018 12:54:44 -0300
Message-ID: <CADHB5bDhdXonoSUahgxqV8_rcUwYxvh3t9WDNN4YO8g7KSt07Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux@armlinux.org.uk, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Guilherme_G=2E_Sim=C3=B5es?= <guilherme.simoes@lsitec.org.br>, Jon maddog Hall <jon.maddog.hall@gmail.com>, mkzuffo@lsi.usp.br, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, sboyd@kernel.org, mark.rutland@arm.com, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, Michael Turquette <mturquette@baylibre.com>, will.deacon@arm.com, thomas liau <thomas.liau@actions-semi.com>, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, mp-cs@actions-semi.com, Laisa Costa - LSI-TEC <laisa.costa@lsitec.org.br>
List-Id: devicetree@vger.kernel.org

Enable clock controller for Actions Semi S500 SoC on owl-s500 device tree.
Tested on a Lemaker Guitar board.

File(s) updated: "/arch/arm/boot/dts/owl-s500.dtsi"

Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>

diff -uprN -X vanilla/Documentation/dontdiff
vanilla/arch/arm/boot/dts/owl-s500.dtsi
linux/arch/arm/boot/dts/owl-s500.dtsi
--- vanilla/arch/arm/boot/dts/owl-s500.dtsi    2018-07-17
13:07:15.675710000 -0300
+++ linux/arch/arm/boot/dts/owl-s500.dtsi    2018-07-18 12:51:07.875364441 =
-0300
@@ -2,12 +2,14 @@
  * Actions Semi S500 SoC
  *
  * Copyright (c) 2016-2017 Andreas F=C3=A4rber
+ * Copyright (c) 2018-2018 Edgar Bernardi Righi
  *
  * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */

 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/owl-s500-powergate.h>
+#include <dt-bindings/clock/actions,s500-cmu.h>

 / {
     compatible =3D "actions,s500";
@@ -71,6 +73,12 @@
         #clock-cells =3D <0>;
     };

+    losc: losc {
+        compatible =3D "fixed-clock";
+        clock-frequency =3D <32678>;
+        #clock-cells =3D <0>;
+    };
+
     soc {
         compatible =3D "simple-bus";
         #address-cells =3D <1>;
@@ -170,6 +178,13 @@
             status =3D "disabled";
         };

+        cmu: clock-controller@b0160000 {
+            compatible =3D "actions,s500-cmu";
+            reg =3D <0xb0160000 0x8000>;
+            clocks =3D <&hosc>, <&losc>;
+            #clock-cells =3D <1>;
+        };
+
         timer: timer@b0168000 {
             compatible =3D "actions,s500-timer";
             reg =3D <0xb0168000 0x8000>;
