From: Andrew <andrew@ncrmnt.org>
Subject: Re: [PATCH v4 1/1] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Wed, 20 May 2015 13:20:47 +0300
Message-ID: <699cee8678f6e671bd1457aa06180ccf@mail.ncrmnt.org>
References: <1432069858-10958-1-git-send-email-andrew@ncrmnt.org>
 <1432069858-10958-2-git-send-email-andrew@ncrmnt.org>
 <555C4E48.6020707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555C4E48.6020707@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sebastian Hesselbarth =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 20.05.2015 12:05:
> On 19.05.2015 23:10, Andrew Andrianov wrote:
>> DNS-327L is a 2-bay NAS with the following specs:
> [...]
>> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
>> ---
>>   arch/arm/boot/dts/Makefile                     |   1 +
>>   arch/arm/boot/dts/armada-370-dlink-dns327l.dts | 356=20
>> +++++++++++++++++++++++++
>>   2 files changed, 357 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/armada-370-dlink-dns327l.dts
> [...]
>> diff --git a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts=20
>> b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>> new file mode 100644
>> index 0000000..0f4555c4
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>> @@ -0,0 +1,356 @@
> [...]
>> +	regulators {
>> +		compatible =3D "simple-bus";
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +		pinctrl-0 =3D <&xhci_pwr_pin
>> +			&sata_l_pwr_pin
>> +			&sata_r_pwr_pin>;
>> +
>> +		pinctrl-names =3D "default";
>=20
> Andrew,
>=20
> I doubt pinctrl will not work as you expected. For regulators, unlike
> gpio-keys/leds above, this node just describes the "bus" of regulator=
s.

Are you sure about this moment? FYI: I've taken=20
armada-370-synology-ds213j.dts
as the reference which happens to list regulator pinctrl (As of 4.1-rc1=
)
just the same way:

	compatible =3D "simple-bus";
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		pinctrl-0 =3D <&sata1_pwr_pin &sata2_pwr_pin>;
		pinctrl-names =3D "default";
                 ...

If that's erroneous we should fix armada-370-synology-ds213j.dts as=20
well.

>=20
>> +
>> +		usb_power: regulator@1 {
>> +			compatible =3D "regulator-fixed";
>> +			reg =3D <1>;
>> +			regulator-name =3D "USB3.0 Port Power";
>> +			regulator-min-microvolt =3D <5000000>;
>> +			regulator-max-microvolt =3D <5000000>;
>> +			enable-active-high;
>> +			regulator-boot-on;
>> +			regulator-always-on;
>> +			gpio =3D <&gpio0 13 GPIO_ACTIVE_HIGH>;
>=20
> Instead you'll have to put the corresponding pinctrl-0/names properti=
es
> in each of the regulator nodes, i.e.
>=20
> 		pinctrl-0 =3D <&xhci_pwr_pin>
> 		pinctrl-names =3D "default";
>=20
> here and similar for the other regulator nodes.
>=20
>> +		};
>> +
>> +		sata_r_power: regulator@2 {
>> +			compatible =3D "regulator-fixed";
>> +			reg =3D <2>;
>> +			regulator-name =3D "SATA-R Power";
>> +			regulator-min-microvolt =3D <5000000>;
>> +			regulator-max-microvolt =3D <5000000>;
>> +			startup-delay-us =3D <2000000>;
>> +			enable-active-high;
>> +			regulator-always-on;
>> +			regulator-boot-on;
>> +			gpio =3D <&gpio1 22 GPIO_ACTIVE_HIGH>;
>> +		};
>> +
>> +		sata_l_power: regulator@3 {
>> +			compatible =3D "regulator-fixed";
>> +			reg =3D <3>;
>> +			regulator-name =3D "SATA-L Power";
>> +			regulator-min-microvolt =3D <5000000>;
>> +			regulator-max-microvolt =3D <5000000>;
>> +			startup-delay-us =3D <4000000>;
>> +			enable-active-high;
>> +			regulator-always-on;
>> +			regulator-boot-on;
>> +			gpio =3D <&gpio1 24 GPIO_ACTIVE_HIGH>;
>> +		};
>> +	};
>> +};
>> +
>> +&pinctrl {
>> +	sata_l_white_pin: sata-l-white-pin {
>> +		marvell,pins =3D "mpp57";
>> +		marvell,function =3D "sata0";
>> +	};
>> +
>> +	sata_r_white_pin: sata-r-white-pin {
>> +		marvell,pins =3D "mpp55";
>> +		marvell,function =3D "sata1";
>> +	};
>> +
>> +	sata_r_amber_pin: sata-r-amber-pin {
>> +		marvell,pins =3D "mpp52";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>=20
> Remove extra empty line.
>=20
>> +
>> +	sata_l_amber_pin: sata-l-amber-pin {
>> +		marvell,pins =3D "mpp53";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	backup_led_pin: backup-led-pin {
>> +		marvell,pins =3D "mpp61";
>> +		marvell,function =3D "gpo";
>> +	};
>> +
>> +	xhci_pwr_pin: xhci-pwr-pin {
>> +		marvell,pins =3D "mpp13";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	sata_r_pwr_pin: sata-r-pwr-pin {
>> +		marvell,pins =3D "mpp54";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	sata_l_pwr_pin: sata-l-pwr-pin {
>> +		marvell,pins =3D "mpp56";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	uart1_pins: uart1-pins {
>> +		marvell,pins =3D "mpp60", "mpp61";
>> +		marvell,function =3D "uart1";
>> +	};
>> +
>> +	power_button_pin: power-button-pin {
>> +		marvell,pins =3D "mpp65";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	backup_button_pin: backup-button-pin {
>> +		marvell,pins =3D "mpp63";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	reset_button_pin: reset-button-pin {
>> +		marvell,pins =3D "mpp64";
>> +		marvell,function =3D "gpio";
>> +	};
>> +};
>> +
>> +/* Serial console */
>> +&uart0 {
>> +	status =3D "okay";
>> +};
>> +
>> +/* Connected to Weltrend MCU */
>> +&uart1 {
>> +	pinctrl-0 =3D <&uart1_pins>;
>=20
> missing pinctrl-names =3D "default";
>=20
>> +	status =3D "okay";
>> +};
>> +
>> +&mdio {
>> +	phy0: ethernet-phy@0 { /* Marvell 88E1318 */
>> +		reg =3D <0>;
>> +		marvell,reg-init =3D <0x0 0x16 0x0 0x2>,
>> +		                   <0x0 0x19 0x0 0x77>,
>> +		                   <0x0 0x18 0x0 0x5747>;
>=20
> nit: if you are at it, you could prepend the mdio reg data with 0, i.=
e.
> <0x0 0x16 0x0 0x0002>.
>=20
> If you address the comments and stick with this version, i.e. do not=20
> add
> any new stuff now - you can add my
>=20
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>=20
> Thanks!
>=20
>> +	};
>> +};
>> +
>> +&eth1 {
>> +	phy =3D <&phy0>;
>> +	phy-mode =3D "rgmii-id";
>> +	status =3D "okay";
>> +};
>> +
>> +&i2c0 {
>> +	compatible =3D "marvell,mv64xxx-i2c";
>> +	clock-frequency =3D <100000>;
>> +	status =3D "okay";
>> +};
>>=20

--=20
Regards,
Andrew
