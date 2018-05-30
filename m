From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH RFC] ARM: dts: add Raspberry Pi Compute Module and IO board
Date: Wed, 30 May 2018 12:38:37 -0700
Message-ID: <87a7shndc2.fsf@anholt.net>
References: <1526589872-13459-1-git-send-email-stefan.wahren@i2se.com>
 <87d0xouapx.fsf@anholt.net> <1670815145.72020.1526930907735@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6836727304426950325=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1670815145.72020.1526930907735@email.1und1.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============6836727304426950325==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

>> Eric Anholt <eric@anholt.net> hat am 21. Mai 2018 um 20:26 geschrieben:
>>=20
>>=20
>> Stefan Wahren <stefan.wahren@i2se.com> writes:
>>=20
>> > The Raspberry Pi Compute Module (CM1) is a SoM which contains a
>> > BCM2835 processor, 512 MB RAM and a 4 GB eMMC. There is also a carrier
>> > board which is called Compute Module IO Board.
>> >
>> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>> > ---
>> >  arch/arm/boot/dts/Makefile                |  1 +
>> >  arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts | 92 ++++++++++++++++++++++=
+++++++++
>> >  arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi    | 34 ++++++++++++
>> >  3 files changed, 127 insertions(+)
>> >  create mode 100644 arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts
>> >  create mode 100644 arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi
>> >
>> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> > index ec2024e..a9883e8 100644
>> > --- a/arch/arm/boot/dts/Makefile
>> > +++ b/arch/arm/boot/dts/Makefile
>> > @@ -73,6 +73,7 @@ dtb-$(CONFIG_ARCH_BCM2835) +=3D \
>> >  	bcm2835-rpi-b-rev2.dtb \
>> >  	bcm2835-rpi-b-plus.dtb \
>> >  	bcm2835-rpi-a-plus.dtb \
>> > +	bcm2835-rpi-cm1-io1.dtb \
>> >  	bcm2836-rpi-2-b.dtb \
>> >  	bcm2837-rpi-3-b.dtb \
>> >  	bcm2837-rpi-3-b-plus.dtb \
>> > diff --git a/arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts b/arch/arm/boot=
/dts/bcm2835-rpi-cm1-io1.dts
>> > new file mode 100644
>> > index 0000000..4d9aa22
>> > --- /dev/null
>> > +++ b/arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts
>> > @@ -0,0 +1,92 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/dts-v1/;
>> > +#include "bcm2835-rpi-cm1.dtsi"
>> > +#include "bcm283x-rpi-usb-host.dtsi"
>> > +
>> > +/ {
>> > +	compatible =3D "raspberrypi,compute-module", "brcm,bcm2835";
>> > +	model =3D "Raspberry Pi Compute Module IO board rev1";
>> > +};
>> > +
>> > +&dsi1 {
>> > +	status =3D "okay";
>> > +};
>> > +
>> > +&gpio {
>> > +	/*
>> > +	 * This is based on the official GPU firmware DT blob.
>> > +	 *
>> > +	 * Legend:
>> > +	 * "NC" =3D not connected (no rail from the SoC)
>> > +	 * "FOO" =3D GPIO line named "FOO" on the schematic
>> > +	 * "FOO_N" =3D GPIO line named "FOO" on schematic, active low
>> > +	 */
>> > +	gpio-line-names =3D "GPIO0",
>> > +			  "GPIO1",
>> > +			  "GPIO2",
>> > +			  "GPIO3",
>> > +			  "GPIO4",
>> > +			  "GPIO5",
>> > +			  "GPIO6",
>> > +			  "GPIO7",
>> > +			  "GPIO8",
>> > +			  "GPIO9",
>> > +			  "GPIO10",
>> > +			  "GPIO11",
>> > +			  "GPIO12",
>> > +			  "GPIO13",
>> > +			  "GPIO14",
>> > +			  "GPIO15",
>> > +			  "GPIO16",
>> > +			  "GPIO17",
>> > +			  "GPIO18",
>> > +			  "GPIO19",
>> > +			  "GPIO20",
>> > +			  "GPIO21",
>> > +			  "GPIO22",
>> > +			  "GPIO23",
>> > +			  "GPIO24",
>> > +			  "GPIO25",
>> > +			  "GPIO26",
>> > +			  "GPIO27",
>> > +			  "GPIO28",
>> > +			  "GPIO29",
>> > +			  "GPIO30",
>> > +			  "GPIO31",
>> > +			  "GPIO32",
>> > +			  "GPIO33",
>> > +			  "GPIO34",
>> > +			  "GPIO35",
>> > +			  "GPIO36",
>> > +			  "GPIO37",
>> > +			  "GPIO38",
>> > +			  "GPIO39",
>> > +			  "GPIO40",
>> > +			  "GPIO41",
>> > +			  "GPIO42",
>> > +			  "GPIO43",
>> > +			  "GPIO44",
>> > +			  "GPIO45",
>> > +			  "HDMI_HPD_N",
>> > +			  /* Also used as ACT LED */
>> > +			  "EMMC_EN_N",
>> > +			  /* Used by eMMC */
>> > +			  "SD_CLK_R",
>> > +			  "SD_CMD_R",
>> > +			  "SD_DATA0_R",
>> > +			  "SD_DATA1_R",
>> > +			  "SD_DATA2_R",
>> > +			  "SD_DATA3_R";
>> > +
>> > +	pinctrl-0 =3D <&gpioout &alt0>;
>> > +};
>> > +
>> > +&hdmi {
>> > +	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_HIGH>;
>> > +};
>>=20
>> I think this should be ACTIVE_LOW, since it's "HDMI_HPD_N_1V8", right?
>
> I just copy & paste from the rpi-4.14/bcm2708-rpi-cm.dts. I thought
> the HDMI interface on my IO board is broken, but maybe this is a
> downstream issue.

Downstream gets HDMI wrong pretty frequently, so it's not surprising.
Watching xrandr -q with X11 running and plugging and unplugging HDMI can
help figure out whether we got the polarity right.  I think you can also
do this with libdrm's modetest, if you don't have X11 up.

>> > +
>> > +&uart0 {
>> > +	pinctrl-names =3D "default";
>> > +	pinctrl-0 =3D <&uart0_gpio14>;
>> > +	status =3D "okay";
>> > +};
>> > diff --git a/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi b/arch/arm/boot/dt=
s/bcm2835-rpi-cm1.dtsi
>> > new file mode 100644
>> > index 0000000..ef22c2d
>> > --- /dev/null
>> > +++ b/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi
>> > @@ -0,0 +1,34 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/dts-v1/;
>> > +#include "bcm2835.dtsi"
>> > +#include "bcm2835-rpi.dtsi"
>> > +
>> > +/ {
>> > +	leds {
>> > +		act {
>> > +			gpios =3D <&gpio 47 GPIO_ACTIVE_LOW>;
>> > +		};
>> > +	};
>> > +
>> > +	reg_3v3: fixed-regulator {
>> > +		compatible =3D "regulator-fixed";
>> > +		regulator-name =3D "3V3";
>> > +		regulator-min-microvolt =3D <3300000>;
>> > +		regulator-max-microvolt =3D <3300000>;
>> > +		regulator-always-on;
>> > +	};
>> > +
>> > +	reg_1v8: fixed-regulator {
>> > +		compatible =3D "regulator-fixed";
>> > +		regulator-name =3D "1V8";
>> > +		regulator-min-microvolt =3D <1800000>;
>> > +		regulator-max-microvolt =3D <1800000>;
>> > +		regulator-always-on;
>> > +	};
>> > +};
>> > +
>> > +&sdhost {
>> > +	non-removable;
>> > +	vmmc-supply =3D <&reg_3v3>;
>> > +	vqmmc-supply =3D <&reg_1v8>;
>> > +};
>>=20
>> Also, looking at some datasheets I have laying around, it says "eMMC I/O
>> Voltage fixed at 1V8" -- is this regulator setup right, in that case?
>
> Usually an eMMC has 2 different voltage sources:
> vqmmc-supply -> supply node for IO line power (usually switchable, but fi=
xed on Compute Module)
> vmmc-supply -> supply node for card's power (usually fixed)
>
> Do you have a specific concern (voltage, naming)?

It was just "I was reviewing, and this stood out."  That explanation
there seems sufficient to me.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsO/b0ACgkQtdYpNtH8
nujupQ//ZevpN9Rgh8tR2ODIf9HXaP2o8tNp+WOYP9ZgLpfEKv5FUsV86SmVxO1Z
T5n1ARR1ZBeSINxcPzkI+4jN8EfZbHsgt1ZeDQLtONtGWqFc5KzEbfp/snwJoZlM
+UEMpEiNAepDF9vPztO4WhlCxxRoVKFG/7v5bUe2XRWb2eVHBUH010cIMTZM51db
SrDJIfi4YbKxXHuZ5ASrjL+sNZQ4pyWuNoikZeK56gDw0Vyc4WtKzjZaEU7JNt8z
2Rlc/iezrEP3hCnTad9cbQuf0DQUNmDSthL0SjvydrVvPn2p0LLrrmkF8VOC1y0I
Bj6rDZRqXGaGMtGxNzQEuegPr/vq8+jDvMjCtPtxERZq7s52+cCascO7fWjUZXcr
jnn/Qu77ry4d9RM4+XjuZuXQ88iO9TiF0+73UTUb3zteb+Xmq2HId96jJThTYRJ8
GxtCu/req2VEH08Ag57h9wCOaglnHoZ2SWw+bwxZ3SZoOxAs9LWmPgUN6sov6XCW
pNRCOEB9N+VbAkqChymLdHtLyJOxBtXR61KigLeHdO9xP0UKOARqn9wi4K5FmK9Q
ZUfHu32lyPyA2MC/Wnv9dqsKolaAaIUHyNOquA4tYX4YGu++1N8abD7H5bl/2QA5
jLTSu1UkyLtDppUigFNUnNopp+3UpSVfHfarM15ISg8LyFuQlsA=
=nax2
-----END PGP SIGNATURE-----
--=-=-=--


--===============6836727304426950325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6836727304426950325==--
