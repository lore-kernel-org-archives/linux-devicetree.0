From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v9 2/5] mfd: AXP20x: Add bindings documentation
Date: Mon, 2 Feb 2015 08:53:51 +0000
Message-ID: <20150202085351.GB12723@x1>
References: <1421941147-9682-1-git-send-email-wens@csie.org>
 <1421941147-9682-3-git-send-email-wens@csie.org>
 <20150122160252.GE9129@x1>
 <CAGb2v67-znKNUVJQPVJqMXhiHEyfkjBGZFPc5hW+w0ODQ+HMmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67-znKNUVJQPVJqMXhiHEyfkjBGZFPc5hW+w0ODQ+HMmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Carlo Caione <carlo@caione.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, 31 Jan 2015, Chen-Yu Tsai wrote:

> Hi Lee,
>=20
> On Thu, Jan 22, 2015 at 5:02 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > On Thu, 22 Jan 2015, Chen-Yu Tsai wrote:
> >
> >> From: Carlo Caione <carlo@caione.org>
> >>
> >> Bindings documentation for the AXP20x driver. In this file also
> >> sub-nodes are documented.
> >>
> >> Signed-off-by: Carlo Caione <carlo@caione.org>
> >> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> [wens@csie.org: clarify interrupt source for the axp PMIC]
> >> [wens@csie.org: explain dcdc-workmode in detail and trim lines to =
80 chars]
> >> [wens@csie.org: make regulator supplies optional if using unregula=
ted input]
> >> [wens@csie.org: use cubieboard2 regulator nodes as example]
> >> [wens@csie.org: change dcdc-workmode to dcdc-workmode-pwm boolean =
property]
> >> [wens@csie.org: use clock-frequency for dcdc regulator work freque=
ncy]
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  Documentation/devicetree/bindings/mfd/axp20x.txt | 102 ++++++++++=
+++++++++++++
> >>  1 file changed, 102 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/axp20x.t=
xt
> >
> > This looks okay to me now.
> >
> > If Mark is happy with the remainder, I'll merge this.
>=20
> So Mark is not happy with this actually, for a few reasons:
>=20
> 1. The driver was already merged a couple versions back, and
>    we have been using the dcdc-freq binding.
>=20
> 2. Furthermore, the dcdc-freq binding has nothing to do with
>    the common clock framework. Using the clock-frequencies
>    binding implies it does.
>=20
> 3. The change from a integer value to a boolean flag for
>    dcdc-mode makes it less capable, i.e. the kernel can't
>    just accept the current state of the hardware, which
>    should be a valid option for regulators to not screw
>    up the system accidentally.
>=20
> Any chance you could merge the previous version (v8)?

You'll have to re-send it as v10 and obtain Acks in the normal way.

> > For my own reference:
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> >
> >> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Do=
cumentation/devicetree/bindings/mfd/axp20x.txt
> >> new file mode 100644
> >> index 000000000000..c3c80db242c7
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> >> @@ -0,0 +1,102 @@
> >> +AXP202/AXP209 device tree bindings
> >> +
> >> +The axp20x family current members :
> >> +axp202 (X-Powers)
> >> +axp209 (X-Powers)
> >> +
> >> +Required properties:
> >> +- compatible: "x-powers,axp202" or "x-powers,axp209"
> >> +- reg: The I2C slave address for the AXP chip
> >> +- interrupt-parent: The parent interrupt controller
> >> +- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IR=
Q pin
> >> +- interrupt-controller: axp20x has its own internal IRQs
> >> +- #interrupt-cells: Should be set to 1
> >> +- regulators: A node that houses a sub-node for each regulator. T=
he regulators
> >> +           are bound using their name as listed here: dcdc2, dcdc=
3, ldo1,
> >> +           ldo2, ldo3, ldo4, ldo5.  The bindings details of indiv=
idual
> >> +           regulator device can be found in:
> >> +           Documentation/devicetree/bindings/regulator/regulator.=
txt with
> >> +           the exception of x-powers,dcdc-freq. Regulators not us=
ed should
> >> +           still be listed for completeness and that the regulato=
r subsystem
> >> +           properly registers them.
> >> +
> >> +Optional properties:
> >> +- regulator supplies - may be omitted if inputs are unregulated, =
such as using
> >> +                    the IPSOUT output from the PMIC
> >> +  - acin-supply: The input supply for LDO1
> >> +  - vin2-supply: The input supply for DCDC2
> >> +  - vin3-supply: The input supply for DCDC3
> >> +  - ldo24in-supply: The input supply for LDO2, LDO4
> >> +  - ldo3in-supply: The input supply for LDO3
> >> +  - ldo5in-supply: The input supply for LDO5
> >> +
> >> +Optional properties for regulators node:
> >> +- clock-frequency: defines the work frequency of DC-DC regulators
> >> +                (range: 750kHz - 1875kHz). Default: 1.5MHz
> >> +
> >> +Optional properties for DCDC regulators:
> >> +- x-powers,dcdc-workmode-pwm: Force the DCDC regulators to run in=
 PWM mode
> >> +                           The DCDC regulators rormally work in a=
 mixed
> >> +                           PWM/PFM mode, using PFM under light lo=
ads and
> >> +                           switching to PWM for heavier loads. Fo=
rcing
> >> +                           PWM mode trades efficiency under light=
 loads
> >> +                           for lower output noise. This probably =
makes
> >> +                           sense for HiFi audio related applicati=
ons that
> >> +                           aren't battery constrained.
> >> +
> >> +Example:
> >> +
> >> +axp209: pmic@34 {
> >> +     compatible =3D "x-powers,axp209";
> >> +     reg =3D <0x34>;
> >> +     interrupt-parent =3D <&nmi_intc>;
> >> +     interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> >> +     interrupt-controller;
> >> +     #interrupt-cells =3D <1>;
> >> +
> >> +     regulators {
> >> +             clock-frequency =3D <1500000>;
> >> +
> >> +             vdd_cpu: dcdc2 {
> >> +                     regulator-always-on;
> >> +                     regulator-min-microvolt =3D <1000000>;
> >> +                     regulator-max-microvolt =3D <1450000>;
> >> +                     regulator-name =3D "vdd-cpu";
> >> +             };
> >> +
> >> +             vdd_int_dll: dcdc3 {
> >> +                     regulator-always-on;
> >> +                     regulator-min-microvolt =3D <1000000>;
> >> +                     regulator-max-microvolt =3D <1400000>;
> >> +                     regulator-name =3D "vdd-int-dll";
> >> +             };
> >> +
> >> +             vdd_rtc: ldo1 {
> >> +                     regulator-always-on;
> >> +                     regulator-min-microvolt =3D <1200000>;
> >> +                     regulator-max-microvolt =3D <1400000>;
> >> +                     regulator-name =3D "vdd-rtc";
> >> +             };
> >> +
> >> +             avcc: ldo2 {
> >> +                     regulator-always-on;
> >> +                     regulator-min-microvolt =3D <2700000>;
> >> +                     regulator-max-microvolt =3D <3300000>;
> >> +                     regulator-name =3D "avcc";
> >> +             };
> >> +
> >> +             ldo3 {
> >> +                     /* unused */
> >> +             };
> >> +
> >> +             csi1_io_2v8: ldo4 {
> >> +                     /* output on extension headers */
> >> +                     regulator-name =3D "csi1-io-2v8";
> >> +             };
> >> +
> >> +             ldo5 {
> >> +                     /* unused */
> >> +             };
> >> +     };
> >> +};
> >> +
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
