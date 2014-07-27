From: Benoit Masson <benoitm@perenite.com>
Subject: Re: [PATCH 2/2] V3 ARM: mvebu: Added dts defintion for Lenovo Iomega ix4-300d NAS
Date: Mon, 28 Jul 2014 01:35:35 +0200
Message-ID: <C2BE2F4B-1045-484F-9E12-A757EE3CD1F6@perenite.com>
References: <1406418490-61502-1-git-send-email-yahoo@perenite.com> <20140727223258.36b050b9@free-electrons.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140727223258.36b050b9@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Benoit Masson <yahoo@perenite.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gregory.clement@free-electrons.com, andrew@lunn.ch, sebastian.hesselbarth@googlemail.com, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org

=20
Le 27 juil. 2014 =E0 22:32, Thomas Petazzoni <thomas.petazzoni@free-ele=
ctrons.com> a =E9crit :

> Dear Benoit Masson,
>=20

Dear Thomas,

> On Sat, 26 Jul 2014 16:48:10 -0700, Benoit Masson wrote:
>=20
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		pinctrl-0 =3D <&power_button_pin &reset_button_pin
>> +			&select_button_pin &scroll_button_pin>;
>> +		pinctrl-names =3D "default";
>> +
>> +		power-button {
>> +			label =3D "Power Button";
>> +			linux,code =3D <KEY_POWER>;
>> +			gpios =3D <&gpio1 12 GPIO_ACTIVE_HIGH>;
>> +		};
>> +
>> +		reset-button {
>> +			label =3D "Reset Button";
>> +			linux,code =3D <KEY_RESTART>;
>> +			gpios =3D <&gpio1 13 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		select-button {
>> +			label =3D "Select Button";
>> +			linux,code =3D <BTN_SELECT>;
>> +			gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		scroll-button {
>> +			label =3D "Scroll Button";
>> +			linux,code =3D <KEY_SCROLLDOWN>;
>> +			gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
>=20
> So you're using the GPIO_ACTIVE_<foo> defines here.
>=20
>> +		};
>> +	};
>> +
>> +	spi3 {
>> +		compatible =3D "spi-gpio";
>> +		status =3D "okay";
>> +		gpio-sck =3D <&gpio0 25 0>;
>> +		gpio-mosi =3D <&gpio1 15 0>; /*gpio 47*/
>> +		cs-gpios =3D <&gpio0 27 0 >;
>=20
> But not here. Any reason?

Indeed I think Jason made this comment already and I seem to have misse=
d -> Corrected in V4

>=20
> Also, nitpick: unneeded space in <&gpio0 27 0 > (i.e the space right
> before the closing >).
>=20

-> Corrected in V4

>> +		num-chipselects =3D <1>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		gpio2: gpio2@0 {
>> +			compatible =3D "fairchild,74hc595";
>> +			gpio-controller;
>> +			#gpio-cells =3D <2>;
>> +			reg =3D <0>;
>> +			registers-number =3D <2>;
>> +			spi-max-frequency =3D <100000>;
>> +		};
>=20
> I'm not sure "gpio2" is a good name, as we might think of it as being
> the third GPIO controller internal to the SoC.
>=20

Renamed to gpio_spi, tested ok  -> Corrected in V4

> Thanks,
>=20

You're welcome, patch issued as V4 just now.

> Thomas
> --=20
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
