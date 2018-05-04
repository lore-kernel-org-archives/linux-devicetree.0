From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Fri, 4 May 2018 14:04:15 +0200
Message-ID: <FC3D0AF4-66EB-48A9-8E81-EC78DE43E105@goldelico.com>
References: <20180424163458.11947-1-johan@kernel.org> <20180424163458.11947-5-johan@kernel.org> <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com> <20180426091018.GU4615@localhost> <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com> <20180502081637.GE2285@localhost> <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com> <20180503205037.7be552c1@aktux> <44A0BC7C-67C7-4116-849F-90FF7CF2B1F0@goldelico.com> <20180504114213.3xlzqxe74n55tk5s@earth.universe>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504114213.3xlzqxe74n55tk5s@earth.universe>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

> Am 04.05.2018 um 13:42 schrieb Sebastian Reichel <sre@kernel.org>:
>=20
> [+cc Tony]
>=20
> Hi,
>=20
>> I think it does not need much more (if at all) than a gpio controller =
on
>> the OMAP3 chip (I think the clocks are active anyways for use by the =
other
>> UARTs).
>>=20
>> We had proposed years ago to reprogram the UART RX pin by =
pinmux-states
>> into an interrupt gpio but that was rejected because it was not =
general
>> enough and ugly in the device tree (an rx-gpios record where the =
rx-line
>> is already connected to the UART-rx).
>>=20
>> Then we did experiment with tapping the UART driver and finally the
>> serdev API was developed to solve this problem. Hence we use it now =
this
>> way.
>=20
> Having any UART active on OMAP results in the SoC not entering
> idle/off wasting energy. For normal (i.e. not connected to a =
peripheral)
> TTYs you can enable runtime autosuspend and configure the RX pin as
> wakeup interrupt. This will wakeup the TTY on incoming traffic, but =
you
> will lose the first few characters (since the serial device needs some
> time to wakeup). This is for example supported by the N900 uart3
> (debug uart):
>=20
> $ grep -A4 "&uart3 {" arch/arm/boot/dts/omap3-n900.dts=20
> &uart3 {
> 	interrupts-extended =3D <&intc 74 &omap3_pmx_core =
OMAP3_UART3_RX>;
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&uart3_pins>;
> };
>=20
> To get it working, you also need to enable autosuspend for the tty
> in userspace (echo 3000 =
/sys/class/tty/ttyS2/device/power/autosuspend_delay_ms).
> This is not enabled by default due to the character loss =
characteristic
> during wakeup.
>=20
> Having said all of this, serdev does not yet support runtime PM (at
> all). Tony is currently looking into it. Fortunately serdev allows
> us to enable runtime PM by default (once implemented), since we know
> the remote side and can (hopefully) avoid losing characters (i.e.
> with sideband wakeup gpios).

thanks for explaining this! We originally had similar thoughts when
proposing a w2sg0004 driver for the first time (years ago), but we can
not accept loosing characters...

Now, I could imagine a potential solution. The key situation why we keep
the serdev open and listening is if the driver did try to turn the =
module
off, but in fact did turn it on (because it was not in sync).

It should be possible to cover this by a timer that is started
in this case. If there is serdev data received after assuming the module
is turned off, the driver has detected the wrong case - and can safely
close the serdev until we want to have it powered on again.

If there is no response after turing off, the module power state is =
already
in sync and we can close the serdev as well - after the timeout (let's =
say
30 seconds). Then, the serdev UART can idle. We should open the serdev
and start this timer also in the probe function to catch an initially =
wrong
state.

But I think we should focus on the basics of this driver first. Then it =
can
be optimized later on.

BR and thanks,
Nikolaus
