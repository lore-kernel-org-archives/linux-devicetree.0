From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource
 Chip bindings
Date: Tue, 19 Apr 2016 08:23:58 +0100
Message-ID: <20160419072358.GB3222@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
 <20160330113532.GI3323@x1>
 <57111E8B.1040503@opensource.altera.com>
 <20160418074540.GB3346@x1>
 <5714F942.5040309@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5714F942.5040309@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 18 Apr 2016, Thor Thayer wrote:

> Hi Lee,
>=20
> On 04/18/2016 02:45 AM, Lee Jones wrote:
> >On Fri, 15 Apr 2016, Thor Thayer wrote:
> >>On 03/30/2016 06:35 AM, Lee Jones wrote:
> >>>On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
> >>>
> >>>>From: Thor Thayer <tthayer@opensource.altera.com>
> >>>>
> >>>>The Altera Arria10 Devkit System Resource chip is a Multi-Functio=
n
> >>>>Device, it has two subdevices:
> >>>>      - GPIO
> >>>>      - HWMON
> >>>>
> >>>>This patch adds documentation for the Altera A10-SR DT bindings.
> >>>>
> >>>>Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> >>>>---
> >>>>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 +++++=
+++++++++++++++
> >>>>  1 file changed, 35 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/mfd/altera=
-a10sr.txt
> >>>>
> >>>>diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.t=
xt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> >>>>new file mode 100644
> >>>>index 0000000..564c761
> >>>>--- /dev/null
> >>>>+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> >>>>@@ -0,0 +1,35 @@
> >>>>+* Altera Arria10 Development Kit System Resource Chip
> >>>>+
> >>>>+Required parent device properties:
> >>>>+- compatible : "altr,altr_a10sr"
> >>>>+- spi-max-frequency : Maximum SPI frequency.
> >>>>+- reg : the SPI Chip Select address for the Arria10 System Resou=
rce chip
> >
> >[...]
> >
> >>>>+		a10sr_hwmon: a10sr_hwmon {
> >>>
> >>>Device type only please.
> >>>
> >>I need to revisit where this will live (hwmon does not seem to be
> >>the correct place) so it will change but I can follow the format
> >>above if it is correct.
> >
> >BTW, "hwmon" is a subsystem in Linux, therefore is a Linuxism and is
> >not allowed in DT.  What does the device *actually* do?
> >
>=20
> OK. I'll be careful not to introduce the Linux subsystem name.
>=20
> This module indicates whether the power supplies are at the correct
> voltage. It uses a boolean instead of giving an actual voltage value
> as required by HWMON. In other words it is a comparator instead of
> an Analog-to-Digital Converter.
>=20
> I could call it a power supply supervisor or voltage status monitor
> but it only acts in a passive role. There is no output to trigger an
> error - only polling, so supervisor doesn't seem like a good name.
>=20
> Maybe something like this?
>=20
> 	power_supply_status {
> 		compatible =3D "altr,a10sr-hwmon";
> 	}
>=20
> Thanks for reviewing and helping me figure out the device tree naming=
=2E

Does it have its own address space?  How complex is the device?  Not
very, by the sounds of it.  In which case, does it really need its own
driver?

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
