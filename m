From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v6 5/5] ARM: dts: sun9i: Initial support for the Sunchip
 CX-A99 board
Date: Thu, 16 Feb 2017 19:29:57 +0100
Message-ID: <20170216182957.zypkvmg7xhwu6geq@lukather>
References: <cover.1486592470.git.rask@formelder.dk>
 <d4211c5d57f80b0281d7d332edc7d69e66202d3d.1486592471.git.rask@formelder.dk>
 <20170210085920.7l7gswm6yjuqgdfx@lukather>
 <20170216061753.sd7zjs5jzdingufp@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4465974944870029994=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170216061753.sd7zjs5jzdingufp@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rask Ingemann Lambertsen <rask@formelder.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4465974944870029994==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cwkrefndsy4jd4tp"
Content-Disposition: inline


--cwkrefndsy4jd4tp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 07:17:54AM +0100, Rask Ingemann Lambertsen wrote:
> > > Supported features (+ means tested):
> > > + One Cortex-A7 CPU core (or four with experimental U-Boot PSCI patch=
es)
> > > + AXP808 power management chip
> > > + OZ80120 voltage regulator
> > > + Serial console port (internal)
> > > + eMMC and SD card slot
> > > + USB 2.0 host ports on on-board USB hub
> > > + SATA port on on-board SATA-to-USB bridge *
> > > + IEEE 802.11 a/b/g/n/ac SDIO Wifi
> > > + Real-time clock
> > > + LEDs
> > > - IR receiver for remote control
> > >=20
> > > * Only shows up when a SATA device is connected. Also, if a power sou=
rce
> > >   is connected to the USB 3.0 connector across power cycles (e.g. FEL
> > >   boot), the bridge may not properly reset and not show up on the USB=
 bus.
> > >   The vendor U-Boot performs some unknown magic which resets the brid=
ge.
> >=20
> > Is that magic at the USB level, or specific to the bridge itself?
>=20
> I don't know, but since the other USB port connected to the hub comes up
> fine, I'm assuming it's something to do with the SATA-to-USB bridge.

But where is that magic written to then? the USB controller registers,
or is it an USB packet?

> > > diff --git a/arch/arm/boot/dts/sun9i-a80-cx-a99.dts b/arch/arm/boot/d=
ts/sun9i-a80-cx-a99.dts
> > > new file mode 100644
> > > index 0000000..f5496d2
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/sun9i-a80-cx-a99.dts
> [...]
> > > +	/* USB 3.0 standard-A receptacle. For now, only Vbus is supported. =
*/
> >=20
> > I'm not sure what you mean by "only VBUS is supported"? Is there any
> > other signal?
>=20
> I'm just trying to say that at the moment, all the connector will do is to
> supply power to a connected device (for charging batteries or whatever).

So the USB controller itself is non-functionnal then?

> > > +	reg_usb0_vbus: regulator-usb0-vbus {
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "usb0-vbus";
> > > +		regulator-min-microvolt =3D <5000000>;
> > > +		regulator-max-microvolt =3D <5000000>;
> > > +		gpio =3D <&pio 7 15 GPIO_ACTIVE_HIGH>;	/* PH15 */
> > > +		enable-active-high;
> >=20
> > This is redundant with the GPIO flag
>=20
> No. I have now tested without "enable-active-high" and then Vbus stays of=
f.
> This is also in line with the binding documentation:
>=20
> "- enable-active-high: Polarity of GPIO is Active high
>  If this property is missing, the default assumed is Active low."
>
> It also seems to me that the way this is implemented in Linux, the GPIO
> polarity flag is ignored.

It works just fine if the driver uses the gpiod API. If that driver
doesn't, then that driver needs some fixing :)

> > > +		regulator-always-on;
> >=20
> > And it shouldn't be always on. The USB driver will enable it if needs
> > be.
>=20
> Yes, we just don't have a driver for the A80 USB 3.0 port yet.

Aaah, so that's what you meant. Leave it out of the DT then.

> > > +	 * A GL850G hub with two external USB connectors is connected
> > > +	 * to ehci0. Each has a Vbus regulator controlled by a GPIO:
> > > +	 * PL7 for port 1, closest to the 12 V power connector, and
> > > +	 * PL8 for port 2, next to the SD card slot.
> > > +	 * Because regulator-fixed doesn't support a GPIO list, and
> > > +	 * allwinner,sun9i-a80-usb-phy doesn't support more than one
> > > +	 * supply, we have to use regulator-always-on on usb1-2-vbus.
> > > +	 * Note that the GPIO pins also need cldo1 to be enabled.
> > > +	 */
> >=20
> > What is the source of those regulators connected then? Some PMIC
> > regulator? AC-IN?
>=20
> These two regulators are supplied from a fixed 12 V to 5 V DC-DC converter
> which can't be controlled in any way.

Ok.

> > > +	reg_usb1_1_vbus: regulator-usb1-1-vbus {
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "usb1-1-vbus";
> > > +		regulator-min-microvolt =3D <5000000>;
> > > +		regulator-max-microvolt =3D <5000000>;
> > > +		gpio =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>;	/* PL7 */
> > > +		enable-active-high;
> > > +	};
> > > +
> > > +	reg_usb1_2_vbus: regulator-usb1-2-vbus {
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "usb1-2-vbus";
> > > +		regulator-min-microvolt =3D <5000000>;
> > > +		regulator-max-microvolt =3D <5000000>;
> > > +		gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>;	/* PL8 */
> > > +		enable-active-high;
> > > +		regulator-always-on;
> >=20
> > Same comment about always on. If the driver needs fixing to grab an
> > additional regulator, fix it, but this shouldn't be left that way.
>=20
> I agree, but a lot of work is missing to get to that point. To get the USB
> ports up and running, you need to enable quite a few regulators:
> 1. VDD09-USB for the controller internals.

This one has never been needed in any SoC before. You should
definitely add a regulator property to the USB controller node then,
and add a regulator_get to the driver. Ideally based on the
compatible.

> 2. VCC33-USB for the PHY.

This one will be taken by the PHY driver, through a new, optional
regulator.

> 3. Vbus for each connector belonging to the controller.

These should be taken through the usb*_vbus-supply properties

> 4. Pin group supply for the GPIO pins controlling each of the Vbus
> supplies.

And we haven't had any case of a board where those were tied to
regulators that were not in themselves essential to the system, which
is why no one really bothered to add them. If they have dedicated
regulators on your board, then it's time to add those extra
properties.

> Nobody seems to have thought about the first and the last two supplies wh=
en
> the bindings were written. In this case, 1, 2 and 4 will be connected to
> always-on regulators anyway. Getting support for multiple Vbus supplies
> probably needs something along the lines of what was discussed with your
> coupled regulator patches:
>=20
> https://lists.infradead.org/pipermail/linux-arm-kernel/2016-January/39886=
2.html
> https://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/4054=
01.html
> https://lists.infradead.org/pipermail/linux-arm-kernel/2016-November/4662=
07.html

This is not really the point, always-on is a hack. We can use it if
needed to workaround weird cases like this one, but in trivial cases
like the one you exposed above, this really should be modelled
properly from the very start.

> > > +	/* OZ80120 voltage regulator for the four Cortex-A15 cores. */
> > > +	reg_vdd_cpub: regulator-vdd-cpub {
> > > +		compatible =3D "regulator-gpio";
> > > +
> > > +		regulator-always-on;
> > > +		regulator-min-microvolt =3D < 800000>;
> > > +		regulator-max-microvolt =3D <1100000>;
> > > +		regulator-name =3D "vdd-cpub";
> > > +
> > > +		enable-gpio =3D <&r_pio 0 2 GPIO_ACTIVE_HIGH>;	/* PL2 */
> > > +		enable-active-high;
> > > +		gpios =3D <&r_pio 0 3 GPIO_ACTIVE_HIGH>,		/* PL3 */
> > > +			<&r_pio 0 4 GPIO_ACTIVE_HIGH>,		/* PL4 */
> > > +			<&r_pio 0 5 GPIO_ACTIVE_HIGH>;		/* PL5 */
> > > +
> > > +		gpios-states =3D <1 0 0>;
> > > +		states =3D <	 750000 0x7
> > > +				 800000 0x3
> > > +				 850000 0x5
> > > +				 900000 0x1
> > > +				 950000 0x6
> > > +				1000000 0x2
> > > +				1100000 0x4
> > > +				1200000 0x0>;
> >=20
> > You're listing a minimum state of 750mv, yet your minimum voltage is
> > 800mV.
>=20
> Yes. The regulator is capable of outputting the listed voltages in the
> 750 mV to 1200 mV range, but the permissible range of the consumer is only
> 800 mV to 1100 mV according to the A80 data sheet. Likewise, the AXP806
> regulators support a larger voltage range than that of the connected
> consumers.

Adding a comment stating that would be nice then.

> > > +&mmc1 {
> > > +	bus-width =3D <4>;
> > > +	non-removable;
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&mmc1_pins>;
> > > +	vmmc-supply =3D <&reg_cldo3>;	/* See cldo2,cldo3 note. */
> > > +	vqmmc-supply =3D <&reg_aldo2>;
> >=20
> > So it's able to support 1.2 or 1.8V IO modes? Surely you want to
> > enable those modes here to.
>=20
> Thanks for the hint. I thought the driver would automatically detect that.
> The following modes are supported according to the data sheet:
>=20
> * DS: Default speed up to 25MHz (3.3V signaling).
> * HS: High speed up to 50MHz (3.3V signaling).
> * SDR12: SDR up to 25MHz (1.8V signaling).
> * SDR25: SDR up to 50MHz (1.8V signaling).
> * SDR50: SDR up to 100MHz (1.8V signaling).
> * SDR104: SDR up to 208MHz (1.8V signaling).
> * DDR50: DDR up to 50MHz (1.8V signaling).
>=20
> Unfortunately, when I enable the 1.8 V modes, or even just SDR-12, the
> device fails to initialise with error -110 (-ETIMEDOUT). I will take a lo=
ok
> at that, but no promises.

Ok.

> > > +	pmic@745 {
> > > +		compatible =3D "x-powers,axp808", "x-powers,axp806";
> > > +		reg =3D <0x745>;
> > > +		interrupt-parent =3D <&nmi_intc>;
> > > +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> > > +		interrupt-controller;
> > > +		#interrupt-cells =3D <1>;
> > > +
> > > +		swin-supply =3D <&reg_dcdce>;
> >=20
> > Please use an incude for that PMIC.
>=20
> I don't understand. What would that include file contain? Very few lines
> would be shared between .dts files. You could save < 8 lines total if you
> #include the 5 lines that are common between the Cubieboard4, the Optimus
> and this board.

You also have to take into account that the PMIC is barely supported
at the moment, you'll also need to define the GPIO controllers, the
various power supplies, adc, etc. nodes that are going (hopefully to
be added) in the future.

If the include is shared, once it is enabled, every one benefits from
it. Otherwise, you have to duplicate that change across all DTs. This
is much likely to error, harder to maintain, and you end up in a
situation where none of the boards really support the same feature set
while being based on the same SoC / PMIC combination.

> > > +		/* In comments: Initial setup from vendor sys_config.fex. */
> > > +		regulators {
> > > +			/* 3.0 V (enabled). */
> >=20
> > This might be disabled though.
>=20
> Indeed it is currently disabled by the kernel during startup, as there are
> no consumers listed in the device tree. I don't know what that regulator
> supplies, and it is on my to-do list for probing the next time that I have
> the heat sink off the board.

I don't think those comments are needed actually. some are misleading,
like the one above, and some are likely to change at some point, like
the one below.

> > > +			/* 1.8 V (enabled). */
> > > +			reg_aldo2: aldo2 {
> > > +				regulator-boot-on;
> > > +				regulator-min-microvolt =3D <1800000>;
> > > +				regulator-max-microvolt =3D <3600000>;
> > > +				regulator-name =3D "vcc-pg-pm-wifi+btio-audio";
> >=20
> > Usually, there is simpler names available on the schematics, or at
> > least simpler names we can come up with.
>=20
> I don't have schematics as it's not a developer board. V1.1 of the PCB,
> which I have, doesn't even have the component names silkscreened onto it.

Ok.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cwkrefndsy4jd4tp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpe+hAAoJEBx+YmzsjxAgcdcP/0Vt0O158BjwNC00iz2yz1e8
RVexGl0Qnge1Mv0XJ48Owwc4XRN4tDaimXUt0KYEGP0GAJY7ZkE9x18qz3syeMDg
oMiExN7Lu+lugOPRkC2cHHAC10HG2ne78TobsPSAYnZ++1BqWtTpkpMlg9MVI+zy
ungZ6dIjy3bQDdeA1HI3CSA8x63pwaEJyCP54MtEVR/7igy4vozcq5AN1cHVeX2x
ntqz4neo9cFhDC1CHnAOhxQqz5jAELmEIv5c2jWpTbL2CsLAEMfYyF8hlHnYer0K
iMNBZPAGx6qxRrnIB3th9w5Z6lWonusJbYCUn4TRTNfEea6gIinytWo5CsLDySzb
/9HVT4A1rcOEbWt8DE3GvWi8mblPblnGH5j1NxUETYRAvuX8MdZXj9sTM9sGEtGO
K0L/qPlSM0ZjzTsqjSKGNp+5S/WHh7Cks9XW6mDmgFaHirTF9rzM6xmOj0lbZmla
MmM64I98IS0PZ0GYbHvQhydzqedA5EOkq/BddFc1OvtdTN+vWF5u/9NI0nYAcq9j
zJDcRRKiiECYCaJrJ4VRycgEfUbyPdrPiH6acM8SSieMTbK3WmmRnfERiBR14s6i
jQVDk4iyUWNandsdGHi6+h/cgn7jb3Jum8DWs05U3WeXVUaNtlp+WN8bn3NVy5S5
eU9CywBy3HipWG8ghfx4
=RRTJ
-----END PGP SIGNATURE-----

--cwkrefndsy4jd4tp--


--===============4465974944870029994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4465974944870029994==--
