From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] drivers: gpio: pca953x: add compatibility for pcal6524 and pcal9555a
Date: Wed, 28 Mar 2018 18:50:05 +0200
Message-ID: <EA5887ED-9C02-4FFF-AC29-14F7D4F0B32D@goldelico.com>
References: <49f6922ba342cf69bfd2a787d0c2a93b4df2c429.1520664883.git.hns@goldelico.com> <CACRpkdYfk7P0+Ysy43HboBe0Z66vO3COXRgUGaZ7Y9sSDh+yxA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYfk7P0+Ysy43HboBe0Z66vO3COXRgUGaZ7Y9sSDh+yxA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

Hi Linus,

> Am 27.03.2018 um 15:02 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>=20
> On Sat, Mar 10, 2018 at 12:00 PM, H. Nikolaus Schaller
> <hns@goldelico.com> wrote:
>=20
>> The Pyra-Handheld originally used the tca6424 but recently we have
>> replaced it by the pin and package compatible pcal6524. So let's
>> add this to the bindings and the driver.
>>=20
>> And while we are at it, the pcal9555a does not have a compatible =
entry
>> either but is already supported by the device id table.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> Patch applied with Rob's review tag.

Thanks!

>=20
> If there are any further concerns from the discussion with Andy,
> please follow up with additional patches if need be, thanks!

Yes, there will be something.

But before submitting, I want to try to get interrupt handling tested.

First of all I have found the board which I can use for testing.
It has a ts3a227 as interrupt source connected to input 14 of the
pcal6524 (instead of tca6424) which has the interrupt output
connected to the gpio6_161 of an OMAP5.

To see what happens I have added some printk to

	drivers/gpio/gpio-pca953x.c
	kernel/irq/manage.c
	sound/soc/codecs/ts3a227e.c

The result is a little puzzling. I see both drivers call
request_threaded_irq() with flags =3D IRQF_ONESHOT | IRQF_SHARED
and | IRQF_TRIGGER_LOW for the pcal. It seems as if the flags
from DT are ignored here.

Then strange things happen. The ts3a227e.c handler is called
permanently. Even before interrupts are enabled in the chip,
although I don't see any pca953x interrupt to occur. And
so far I could neither see pca953x_irq_mask() pca953x_irq_unmask()
nor pca953x_irq_bus_sync_unlock() pca953x_irq_bus_sync_lock()
being called.

So I'd suspect that something is wrong with setting up the
chained interrupts and the thread is not sleeping. Maybe a bug
in my DT but I don't know yet.

Here is a shortened version of the relevant DT setup which may
be wrong:

> &omap5_pmx_core {
> 	pinctrl-0 =3D <&pyra_other_pins>;
>=20
> 	pyra_other_pins: pinmux_other_gpio_pins {
> 		pinctrl-single,pins =3D <
> 			OMAP5_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE6)	=
/* 0x12C:[31:16]  gpio6_161 - TCA6424 active low interrupt */
> 			>;
> 	};
> };
>=20
>=20
> &i2c5 {
> 	/* microphone detect */
> 	ts3a227@3b {
> 		compatible =3D "ti,ts3a227e";
> 		reg =3D <0x3b>;
> 		interrupt-parent =3D <&gpio99>;
> 		interrupts =3D <14 IRQ_TYPE_EDGE_RISING>;
> 		ti,micbias =3D <0>;	/* 2.1V */
> 	};
>=20
> 	/* system-led and other controls */
> 	gpio99: tca6424@22 {
> 		compatible =3D "nxp,pcal6524";
> 		interrupt-parent =3D <&gpio6>;
> 		interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;	/* =
gpio6_161 */
> 		vcc-supply =3D <&vdds_1v8_main>;
>=20
> 		reg =3D <0x22>;
> 		gpio-controller;
> 		#gpio-cells =3D <2>;
> 		gpio-line-names =3D
> 			"hdmi-ct-hpd", "hdmi.ls-oe", "p02", "p03", =
"vibra", "fault2", "p06", "p07",
> 			"en-usb", "en-host1", "en-host2", "chg-int", =
"p14", "p15", "mic-int", "en-modem",
> 			"shdn-hs-amp", "chg-status+red", "green", =
"blue", "en-esata", "fault1", "p26", "p27";
> 	};
> };

Any hints how to debug this?

Especially how pca953x_irq_bus_sync_unlock() should be called from the
initialization of the ts3a227e driver?

And what could make the ts3a227e handler being called without interrupt.

BR and thanks,
Nikolaus
