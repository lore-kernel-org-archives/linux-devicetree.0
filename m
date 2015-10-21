From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Wed, 21 Oct 2015 09:46:33 +0100
Message-ID: <20151021084633.GB3270@x1>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-2-git-send-email-afd@ti.com>
 <20151019091311.GH31804@x1>
 <5625095F.5080204@ti.com>
 <20151019152100.GK31804@x1>
 <56250AF9.3030907@ti.com>
 <20151020113128.GN31804@x1>
 <56264990.8050501@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56264990.8050501@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 20 Oct 2015, Andrew F. Davis wrote:

> On 10/20/2015 06:31 AM, Lee Jones wrote:
> >On Mon, 19 Oct 2015, Andrew F. Davis wrote:
> >
> >>On 10/19/2015 10:21 AM, Lee Jones wrote:
> >>>On Mon, 19 Oct 2015, Andrew F. Davis wrote:
> >>>
> >>>>On 10/19/2015 04:13 AM, Lee Jones wrote:
> >>>>>On Fri, 16 Oct 2015, Andrew F. Davis wrote:
> >>>>>
> >>>>>>The TPS65086 PMIC contains several regulators and a GPO control=
ler.
> >>>>>>Add bindings for the TPS65086 PMIC.
> >>>>>>
> >>>>>>Signed-off-by: Andrew F. Davis <afd@ti.com>
> >>>>>>---
> >>>>>>  .../devicetree/bindings/gpio/gpio-tps65086.txt     | 17 +++++=
+++
> >>>>>>  Documentation/devicetree/bindings/mfd/tps65086.txt | 46 +++++=
+++++++++++++++++
> >>>>>>  .../bindings/regulator/tps65086-regulator.txt      | 36 +++++=
++++++++++++
> >>>>>
> >>>>>Please split these up into separate patches.
> >>>>>
> >>>>>There is no functional reason to bundle them up.
> >>>>>
> >>>>
> >>>>ACK
> >>>>
> >>>>>>  3 files changed, 99 insertions(+)
> >>>>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpi=
o-tps65086.txt
> >>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/tps6=
5086.txt
> >>>>>>  create mode 100644 Documentation/devicetree/bindings/regulato=
r/tps65086-regulator.txt
> >>>>>
> >>>>>[...]
> >>>>>
> >>>>>>diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt=
 b/Documentation/devicetree/bindings/mfd/tps65086.txt
> >>>>>>new file mode 100644
> >>>>>>index 0000000..4b6aeb4
> >>>>>>--- /dev/null
> >>>>>>+++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
> >>>>>>@@ -0,0 +1,46 @@
> >>>>>>+* TPS65086 Power Management Integrated Circuit bindings
> >>>>>>+
> >>>>>>+Required properties:
> >>>>>>+ - compatible		: Should be "ti,tps65086".
> >>>>>
> >>>>>Any indication that it's a PMIC?
> >>>>>
> >>>>
> >>>>In the compatible string?
> >>>
> >>>Ya.
> >>>
> >>
> >>Not sure what you mean then?, no one else seems to be doing that,
> >>"xx,xxxxxxx-pmic" is usually used for matching the regulator node,
> >>not the device itself.
> >
> >Either the driver is MFD is the PMIC or it's not.
> >
> >If it is, the compatible should reflect that, if isn't not then the
> >description in the header comment and the one above is not correct.
> >
> >IMO, 'pmic' should not be used in the regulator compatible strings, =
as
> >it's a general description of the overall device.  The regulators ar=
e
> >just a component of that device.
> >
>=20
> I agree about not using compatible in regulator nodes (Mark Brown and=
 I had
> a discussion on this topic), what I mean with "xxxxxxx-pmic" is for t=
he MFD
> core to match sub-drivers (mfd_cells). For example drivers/mfd/tps800=
31.c,
> matches the regulator with "tps80031-pmic", the clock with "tps80031-=
clock",
> the charger with "tps80031-charger", etc..
>=20
> The core device itself is just matched with "ti,tps65086" through the=
 I2C bus
> matching.
>=20
> I could change the core to be "tps65086-pmic", then call the regulato=
r
> driver "tps65086-regulator" if this works for you, this seems to be t=
he
> way new drivers name the regulator driver (max77843.c).

Yes, this is what I was thinking of.

ti,tps65086 is uninformative/undescriptive and tells me nothing.

[...]

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
