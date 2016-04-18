From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource
 Chip bindings
Date: Mon, 18 Apr 2016 08:43:35 +0100
Message-ID: <20160418074335.GA3346@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
 <20160330113532.GI3323@x1>
 <57111E8B.1040503@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57111E8B.1040503@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Apr 2016, Thor Thayer wrote:
> On 03/30/2016 06:35 AM, Lee Jones wrote:
> >On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
> >
> >>From: Thor Thayer <tthayer@opensource.altera.com>
> >>
> >>The Altera Arria10 Devkit System Resource chip is a Multi-Function
> >>Device, it has two subdevices:
> >>      - GPIO
> >>      - HWMON
> >>
> >>This patch adds documentation for the Altera A10-SR DT bindings.
> >>
> >>Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> >>---
> >>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 +++++++=
+++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a=
10sr.txt
> >>
> >>diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt=
 b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> >>new file mode 100644
> >>index 0000000..564c761
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> >>@@ -0,0 +1,35 @@
> >>+* Altera Arria10 Development Kit System Resource Chip
> >>+
> >>+Required parent device properties:
> >>+- compatible : "altr,altr_a10sr"
> >>+- spi-max-frequency : Maximum SPI frequency.
> >>+- reg : the SPI Chip Select address for the Arria10 System Resourc=
e chip
> >
> >DT bindings are much easier to read in the following format:
> >
> >- compatible		: "altr,altr_a10sr"
> >- spi-max-frequency	: Maximum SPI frequency.
> >- reg			: the SPI Chip Select address for the Arria10 System Resourc=
e chip
> >
> >... also, sentences start with an uppercase char.
> >
> >>+The A10SR consists of this varied group of sub-devices:
> >>+
> >>+Device                   Description
> >>+------                   ----------
> >>+altr_a10sr_gpio          GPIO Controller
> >>+altr_a10sr_hwmon         Hardware Monitor
> >>+
> >>+The LEDs are implemented entirely in the device tree using
> >>+the gpio-led framework.
> >
> >This is a Linuxisum and should not live in DT bindings.
> >
> >>+Example:
> >>+
> >>+        a10-sr: a10-sr@0 {
> >
> >Nodes should be named after their device 'type'.
> >
> >Does this device really start a address 0?
> >
>=20
> I see in the documentation on device trees there are a number of
> categories I can use. GPIO is easy because it is one of the
> categories but I'm not sure about the new device I'm adding since
> the a10sr is a new device.

It's always difficult with MFDs as they are by their very nature, more
than one device.  But how about 'resource-manager'?

> I believe I should only call out the name and address on the SPI bus =
like:
>=20
> a10sr@0 {

Correct.

> >>+		compatible =3D "altr,altr-a10sr";
> >>+		reg =3D <0>;
> >>+		spi-max-frequency =3D <100000>;
> >>+
> >>+		a10sr_gpio: a10sr_gpio {
> >
> >Device type only please.
> >
>=20
> and this would be a10sr_gpio: gpio-controller {
>=20
> Does that seem correct?

Also correct.  No address though?

> >>+			compatible =3D "altr,a10sr-gpio";
> >>+			gpio-controller;
> >>+			#gpio-cells =3D <2>;
> >>+			ngpios =3D <16>;
> >>+		};
> >>+
> >>+		a10sr_hwmon: a10sr_hwmon {
> >
> >Device type only please.
> >
> I need to revisit where this will live (hwmon does not seem to be
> the correct place) so it will change but I can follow the format
> above if it is correct.
>=20
> Thanks for reviewing.
>=20
> >>+			compatible =3D "altr,a10sr-hwmon";
> >>+		};
> >>+	};
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
