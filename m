From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Fri, 20 Mar 2015 14:57:12 +0100
Message-ID: <72268D51-F993-497A-B4F9-707C8DB7155C@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <80D7E742-4633-4CCD-B754-221387D82922@goldelico.com> <20150320194307.51cb4225@notabene.brown> <5A83DCE5-2CB4-48FF-80E7-6E6377045188@goldelico.com> <20150320130838.GC7734@earth>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150320130838.GC7734@earth>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: NeilBrown <neilb@suse.de>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Belisko Marek <marek.belisko@gmail.com>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>
List-Id: devicetree@vger.kernel.org

Hi,

Am 20.03.2015 um 14:08 schrieb Sebastian Reichel <sre@kernel.org>:

> Hi,
>=20
> On Fri, Mar 20, 2015 at 09:54:21AM +0100, Dr. H. Nikolaus Schaller wr=
ote:
>> [...]
>> And we do not write a driver for the w2sg0004 but the regulator insi=
de that
>> chip.
>=20
> DT describes the hardware structure and not the Linux driver
> structure.

I am not advocating for describing the Linux driver structure in DT.
Rather I suggest that the DT should describe hardware and there
is a regulator inside that chip=85 Linux drivers can follow that or mix
everything into a single driver if that is better.

>=20
>> You also won=92t expect that the omap3 driver hides everything. You
>> expect that the twl4030 provides some regulators that can be enabled
>> by subsystems inside the omap3. And if I remember correctly there ar=
e
>> regulators inside the omap3 which have explicit regulator nodes in t=
he DT.
>=20
> so let's have a look at twl regulators. They can be found below
> the twl node, so they will look similar to
>=20
> / -> omap3 -> i2c -> twl -> regulator
>=20
> So properly mapped to the w2sg0004 device this would put your
> regulator to
>=20
> / -> omap3 -> serial -> w2sg0004 -> regulator

Yes. Indeed.

Currently it is

omap3 -> serial -> serial-power-manager (trying to cover a multitude
of different chips).

>=20
> This will gain you nothing as far as I can tell.

And because of that I think Neil=92s argument isn=92t for or against
anything.

>=20
> Please note that subdevices under the serial node are pretty useful,
> since then the kernel can e.g. automatically setup correct line
> disciplines for serial attached bluetooth chips and make bluetooth
> work out of the box.

I don=92t doubt that such subnodes are useful. I just object mixing
different chips and controls into a single subnode driver.

And as soon as you want to control line disciplines from such
a subnode, you indeed need a driver for each variant.

So a GPS chip needing some line discipline could be

> / -> omap3 -> serial -> w2sg0004 -> line-discipline
> / -> omap3 -> serial -> w2sg0004 -> regulator

And if omap3 -> serial can directly control a regulator, it can
easily be the w2sg0004 -> regulator

>=20
> I am aware, that the Linux kernel has no such thing for serial
> attached GPS devices, but that's Linux specific and irrelevant
> for the DT description.
>=20
>> The w2sg0004-regulator approach just follows this principle.
>> Anyone willing to control the power of the w2sg0004 can use this
>> regulator interface.
>=20
> From a HW perspective your regulator "hides" the information, that
> there is a device attached to the serial port and instead claims,
> that a regulator is needed to make the serial port work.

Yes, without this regulator the serial port does not work. It is IMHO
more important than stating the obvious that a serial device is
connected to a serial port.

And if there is nothing to hide (the obvious serial interface wiring), =
why
describe it at all?

Anyways, in my proposal there will be a subnode of the uart, the
one where it is specified that it should control the regulator of the
w2sg.

Basically, Neil=92s proposal already covers this case. His bluetooth
subnode just controls &vaux4 which turns on power for the w2cbw003
chip.

So for my view it is not really understandable why one uart subnode
can control a regulator, and the other can=92t or shouldn=92t and why
this regulator function can=92t be divided from the serial management
into a regulator driver.

>=20
> Apart from that this interface is limited in its features. I'm
> currently working on N900's bluetooth chip. This one needs to set a
> gpio before data is sent data to the chip, has a reset gpio and
> a gpio to wakeup the OMAP SoC from idle states to avoid data loss
> on the UART.

Yes, that looks equally complicated to solve if not even more than
the w2sg chip.

But what would you prefer:

* extend the drivers/tty/slave/serial-power-manager.c to also cover you=
r
  special case

* instantiate a drivers/misc/n900-bluetooth-regulator.c and hook it up
  exactly like the vaux4 of the gta04 bluetooth chip? Just referencing
  a different regulator node?

And as said I don=92t mind if the regulator is a subnode of the omap3 s=
erial.

BR,
Nikolaus
