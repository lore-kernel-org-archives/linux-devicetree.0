From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [RFC v3 1/3] gpio: dt-bindings: add basic-mmio-gpio bindings
Date: Wed, 27 Apr 2016 12:15:46 +0200
Message-ID: <1838530.usypLq5u4X@debian64>
References: <cover.1461710784.git.chunkeey@googlemail.com> <7e8845e6b6384c6b5673532ebef79c8730ed7748.1461710784.git.chunkeey@googlemail.com> <CAL_Jsq+OrkudQwxqfSvuqW=HWm6B74pE9bec0QBh5xNbF+s2Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+OrkudQwxqfSvuqW=HWm6B74pE9bec0QBh5xNbF+s2Hw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, April 26, 2016 09:06:14 PM Rob Herring wrote:
> On Tue, Apr 26, 2016 at 5:51 PM, Christian Lamparter
> <chunkeey@googlemail.com> wrote:
> > From: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> >
> > This patch adds the device tree bindings for the basic-mmio-gpio.
> > The basic-mmio-gpio is already part of a the GPIO generic library
> > and shares its compatible with the platform device.
>=20
> These things always start out "simple", "basic" or "generic". Then
> people extend them a property or 2 at a time until they are no longer
> basic. Make a bunch of GPIO drivers use a generic driver then maybe
> I'll be convinced this is a good idea.
Well, I mentioned brcm63xx (MIPS) and MyBook Live (PPC). But OK, if you
want me to look at the existing code in the kernel. I found the followi=
ng
candidates.

1. MOXA ART: "moxa,moxart-gpio"=20
http://lxr.free-electrons.com/source/drivers/gpio/gpio-moxart.c
This driver is used by the:
arch/arm/boot/dts/moxart.dtsi

---
diff --git a/arch/arm/boot/dts/moxart.dtsi b/arch/arm/boot/dts/moxart.d=
tsi
index 1fd27ed..26707d0 100644
--- a/arch/arm/boot/dts/moxart.dtsi
+++ b/arch/arm/boot/dts/moxart.dtsi
@@ -66,8 +66,11 @@
 		gpio: gpio@98700000 {
 			gpio-controller;
 			#gpio-cells =3D <2>;
-			compatible =3D "moxa,moxart-gpio";
-			reg =3D <0x98700000 0xC>;
+			compatible =3D "basic-mmio-gpio";
+			reg =3D <0x98700000 0x4
+			       0x98700004 0x4
+			       0x98700008 0x4>;
+			reg-names =3D "set dat dirout";
 		};
=20
 		rtc: rtc {
---

2. GE FPGA based GPIO: "ge,imp3a-gpio", "gef,sbc310-gpio", "gef,sbc610-=
gpio"
http://lxr.free-electrons.com/source/drivers/gpio/gpio-ge.c

This driver is used by the:
arch/powerpc/boot/dts/fsl/ge_imp3a.dts
arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
arch/powerpc/boot/dts/fsl/gef_sbc610.dts
arch/powerpc/boot/dts/fsl/gef_sbc310.dts

---
diff --git a/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts b/arch/powerpc/boo=
t/dts/fsl/gef_ppc9a.dts
index 0424fc2..20dd084 100644
--- a/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
@@ -112,9 +112,14 @@
 		};
 		gef_gpio: gpio@7,14000 {
 			#gpio-cells =3D <2>;
-			compatible =3D "gef,ppc9a-gpio", "gef,sbc610-gpio";
-			reg =3D <0x7 0x14000 0x24>;
+			compatible =3D "basic-mmio-gpio";
+			reg =3D <0x7 0x14000 0x4
+			       0x7 0x14004 0x4
+			       0x7 0x14008 0x4>;
+			reg-names =3D "dirout dat set";
+			ngpio =3D <19>;
 			gpio-controller;
+			big-endian;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/fsl/ge_imp3a.dts b/arch/powerpc/boot=
/dts/fsl/ge_imp3a.dts
index a2bb47f..ac5855a 100644
--- a/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
+++ b/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
@@ -93,9 +93,13 @@
=20
 		gef_gpio: gpio@4,400 {
 			#gpio-cells =3D <2>;
-			compatible =3D "ge,imp3a-gpio";
-			reg =3D <0x4 0x400 0x24>;
+			compatible =3D "basic-mmio-gpio";
+			reg =3D <0x4 0x400 0x02
+			       0x4 0x404 0x02
+			       0x4 0x408 0x02>;
+			reg-names =3D "dirin dat set";
 			gpio-controller;
+			big-endian;
 		};
=20
 		wdt@4,800 {
diff --git a/arch/powerpc/boot/dts/fsl/gef_sbc310.dts b/arch/powerpc/bo=
ot/dts/fsl/gef_sbc310.dts
index 84b3d38..f09528f 100644
--- a/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
@@ -113,9 +113,14 @@
 		};
 		gef_gpio: gpio@4,8000 {
 			#gpio-cells =3D <2>;
-			compatible =3D "gef,sbc310-gpio";
-			reg =3D <0x4 0x8000 0x24>;
+			compatible =3D "basic-mmio-gpio";
+			reg =3D <0x4 0x8000 0x4
+			       0x4 0x8004 0x4
+			       0x4 0x8008 0x4>;
+			reg-names =3D "dirout dat set";
+			ngpio =3D <6>;
 			gpio-controller;
+			big-endian;
 		};
 	};
=20
diff --git a/arch/powerpc/boot/dts/fsl/gef_sbc610.dts b/arch/powerpc/bo=
ot/dts/fsl/gef_sbc610.dts
index 974446a..a9d740a 100644
--- a/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
@@ -110,9 +110,14 @@
 		};
 		gef_gpio: gpio@7,14000 {
 			#gpio-cells =3D <2>;
-			compatible =3D "gef,sbc610-gpio";
-			reg =3D <0x7 0x14000 0x24>;
+			compatible =3D "basic-mmio-gpio";
+			reg =3D <0x7 0x14000 0x4
+			       0x7 0x14004 0x4
+			       0x7 0x14008 0x4>;
+			reg-names =3D "dirout dat set";
+			ngpio =3D <19>;
 			gpio-controller;
+			big-endian;
 		};
 	};
---

3. CLPS711X GPIO driver: "cirrus,clps711x-gpio"
http://lxr.free-electrons.com/source/drivers/gpio/gpio-clps711x.c
(But there is no DTS which uses the in the kernel)

4. GPIO driver for the TS-4800 board: "technologic,ts4800-gpio"
(Again no DTS in kernel)

What do you think. There's a total of six devices that can make use
of the "basic-mmio-gpio". If this gives me your go-ahead, I'll include
them in the series as proper patches.

Regards,
Christian
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
