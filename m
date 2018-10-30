From: Daniel Santos <daniel.santos@pobox.com>
Subject: How to implement "#interrupt-cells = <2>" for a gpiochip?
Date: Mon, 29 Oct 2018 21:46:37 -0500
Message-ID: <00e9b968-814e-d7e8-9d8e-1983090df4b0@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>
Cc: John Crispin <blogic@openwrt.org>
List-Id: devicetree@vger.kernel.org

Hello,

I'm trying to use a GPIO as an interrupt on an mt7620 (using OpenWRT
drivers) and I can't seem to figure out how to glue my two-celled
interrupt description (including the trigger) to the device tree code.=C2=
=A0
This is the gpio driver I'm using:=C2=A0
https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/patche=
s-4.14/0027-GPIO-MIPS-ralink-add-gpio-driver-for-ralink-SoC.patch

And this is the gpio chip in the device tree:

		gpio0: gpio@600 {
			compatible =3D "ralink,mt7620a-gpio", "ralink,rt2880-gpio";
			reg =3D <0x600 0x34>;

			resets =3D <&rstctrl 13>;
			reset-names =3D "pio";

			interrupt-parent =3D <&intc>;
			interrupts =3D <6>;

			interrupt-controller;
			#interrupt-cells =3D <2>;

			gpio-controller;
			#gpio-cells =3D <2>;

			ralink,gpio-base =3D <0>;
			ralink,num-gpios =3D <24>;
			ralink,register-map =3D [ 00 04 08 0c
						20 24 28 2c
						30 34 ];
		};


I've added the "interrupt-controller;" and "#interrupt-cells" myself.=C2=A0
This is my i2c device:

&i2c {
	status =3D "okay";

	imu: lsm6ds3@6b {
		compatible =3D "st,lsm6ds3";
		reg =3D <0x6b>;
		interrupt-parent =3D <&gpio0>;
		interrupts =3D <14 IRQ_TYPE_EDGE_FALLING>;
	};
};


The problem is that when the driver probes and asks what the trigger for
the irq is, it returns zero instead of 2 (IRQ_TYPE_EDGE_FALLING).=C2=A0 I
presume this is because the two-celled interrupts aren't implemented by
the gpio driver?=C2=A0
Documentation/devicetree/bindings/interrupt-controller/interrupts.txt say=
s:

A device is marked as an interrupt controller with the
"interrupt-controller"
property. This is a empty, boolean property. An additional
"#interrupt-cells"
property defines the number of cells needed to specify a single interrupt=
.

It is the responsibility of the interrupt controller's binding to define =
the
length and format of the interrupt specifier. The following two variants =
are
commonly used:
...

However, I'm having great trouble finding documentation on how to write
these bindings. Can anybody give me a pointer please?

Thanks,
Daniel
