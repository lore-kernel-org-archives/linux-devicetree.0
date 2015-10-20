From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Tue, 20 Oct 2015 12:31:28 +0100
Message-ID: <20151020113128.GN31804@x1>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-2-git-send-email-afd@ti.com>
 <20151019091311.GH31804@x1>
 <5625095F.5080204@ti.com>
 <20151019152100.GK31804@x1>
 <56250AF9.3030907@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56250AF9.3030907@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Oct 2015, Andrew F. Davis wrote:

> On 10/19/2015 10:21 AM, Lee Jones wrote:
> >On Mon, 19 Oct 2015, Andrew F. Davis wrote:
> >
> >>On 10/19/2015 04:13 AM, Lee Jones wrote:
> >>>On Fri, 16 Oct 2015, Andrew F. Davis wrote:
> >>>
> >>>>The TPS65086 PMIC contains several regulators and a GPO controlle=
r.
> >>>>Add bindings for the TPS65086 PMIC.
> >>>>
> >>>>Signed-off-by: Andrew F. Davis <afd@ti.com>
> >>>>---
> >>>>  .../devicetree/bindings/gpio/gpio-tps65086.txt     | 17 +++++++=
+
> >>>>  Documentation/devicetree/bindings/mfd/tps65086.txt | 46 +++++++=
+++++++++++++++
> >>>>  .../bindings/regulator/tps65086-regulator.txt      | 36 +++++++=
++++++++++
> >>>
> >>>Please split these up into separate patches.
> >>>
> >>>There is no functional reason to bundle them up.
> >>>
> >>
> >>ACK
> >>
> >>>>  3 files changed, 99 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-=
tps65086.txt
> >>>>  create mode 100644 Documentation/devicetree/bindings/mfd/tps650=
86.txt
> >>>>  create mode 100644 Documentation/devicetree/bindings/regulator/=
tps65086-regulator.txt
> >>>
> >>>[...]
> >>>
> >>>>diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b=
/Documentation/devicetree/bindings/mfd/tps65086.txt
> >>>>new file mode 100644
> >>>>index 0000000..4b6aeb4
> >>>>--- /dev/null
> >>>>+++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
> >>>>@@ -0,0 +1,46 @@
> >>>>+* TPS65086 Power Management Integrated Circuit bindings
> >>>>+
> >>>>+Required properties:
> >>>>+ - compatible		: Should be "ti,tps65086".
> >>>
> >>>Any indication that it's a PMIC?
> >>>
> >>
> >>In the compatible string?
> >
> >Ya.
> >
>=20
> Not sure what you mean then?, no one else seems to be doing that,
> "xx,xxxxxxx-pmic" is usually used for matching the regulator node,
> not the device itself.

Either the driver is MFD is the PMIC or it's not.

If it is, the compatible should reflect that, if isn't not then the
description in the header comment and the one above is not correct.

IMO, 'pmic' should not be used in the regulator compatible strings, as
it's a general description of the overall device.  The regulators are
just a component of that device.

> >>>>+ - reg			: Slave address.
> >>>
> >>>I2C/SPI?
> >>>
> >>
> >>ACK
> >>
> >>>>+ - interrupt-parent	: The parent interrupt controller.
> >>>
> >>>Phandled to ...
> >>>
> >>
> >>ACK
> >>
> >>>>+ - interrupts		: The interrupt line the device is connected to.
> >>>>+ - interrupt-controller	: Marks the device node as an interrupt =
controller.
> >>>>+ - #interrupt-cells	: The number of cells to describe an IRQ, th=
is
> >>>>+			  should be 2. The first cell is the IRQ number.
> >>>>+			  The second cell is the flags, encoded as the trigger
> >>>>+			  masks from ../interrupt-controller/interrupts.txt.
> >>>
> >>>Masks?  What masks?
> >>>
> >>>Best to make a link to the header where the flags are defined here=
=2E
> >>>
> >>
> >>ACK
> >>
> >>>>+Additional nodes defined in:
> >>>>+ - Regulators	: ../regulator/tps65086-regulator.txt.
> >>>>+ - GPIO		: ../gpio/gpio-tps65086.txt.
> >>>
> >>>I'd suggest removing the full stops from all of the lines above.
> >>>
> >>>Just treat them as bullet points like we normally do.
> >>>
> >>
> >>ACK
> >>
> >>>>+Example:
> >>>>+
> >>>>+	pmic: tps65086@5e {
> >>>>+		compatible =3D "ti,tps65086";
> >>>>+		reg =3D <0x5e>;
> >>>>+		interrupt-parent =3D <&gpio1>;
> >>>>+		interrupts =3D <28 IRQ_TYPE_LEVEL_LOW>;
> >>>>+		interrupt-controller;
> >>>>+		#interrupt-cells =3D <2>;
> >>>>+
> >>>>+		regulators {
> >>>>+			compatible =3D "ti,tps65086-regulator";
> >>>>+
> >>>>+			buck1 {
> >>>>+				regulator-name =3D "vcc1";
> >>>>+				regulator-min-microvolt =3D <1600000>;
> >>>>+				regulator-max-microvolt =3D <1600000>;
> >>>>+				regulator-boot-on;
> >>>>+				ti,regulator-decay;
> >>>>+				ti,regulator-step-size-25mv;
> >>>>+			};
> >>>>+		};
> >>>>+
> >>>>+		gpio4: tps65086_gpio {
> >>>>+			compatible =3D "ti,tps65086-gpio";
> >>>>+			gpio-controller;
> >>>>+			#gpio-cells =3D <2>;
> >>>>+		};
> >>>>+	};
> >>>
> >>>[...]
> >>>
> >>
> >
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
