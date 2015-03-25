From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power on/off UART attached devices.
Date: Wed, 25 Mar 2015 22:22:30 +0100
Message-ID: <9D2722FD-1A17-44CF-AC96-A4EC7DC3FD6A@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <20150318055831.21025.33670.stgit@notabene.brown> <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com> <20150320195451.146a7915@notabene.brown> <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com> <20150321103122.23603014@notabene.brown> <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com> <20150325204202.GC381@amd>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150325204202.GC381@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 25.03.2015 um 21:42 schrieb Pavel Machek <pavel@ucw.cz>:

> Hi!
>=20
>>> In the case of our GPS, it receives control over the serial connect=
ion from
>>> the UART,
>>=20
>> Ahem - does it?
>>=20
>> AFAIK the chip simply starts to emit NMEA records if powered on. The=
re is no
>> command going over the serial interface to address it or control it.
>=20
> Well _most_ GPSes enable you to control them over the serial
> line. (Things like sampling rate, AGPS data upload, =85)

Yes, I know.

But is this something the kernel is/must be aware? And
must it be represented by the DT? Or does it have to influence
the way the DT is structured?

Well, if GPS data is presented through iio, these commands must
be handled by some driver.

>=20
>>> I think the GPS is =93primarily" a uart-attached device.
>>=20
>> But not in the same way as an I2C device.
>>=20
>> Especially the serial interface is not a bus and not used for signal=
ling and
>> power control. It is payload data (only).
>=20
> Serial interface looks a lot like a (point-to-point) bus to
> me. Similar to SATA, for example.

In that sense a gpio looks also a lot like a 1-bit bus...

Anyways, there are no subnodes (clients) of a gpio but the
<&gpiocontroller> pattern is used.

In other words: a driver that wants to control a gpio asks for a
reference of the gpio controller and uses the gpiolib to control it.

In the same way, a driver that wants to use an uart could ask
for a reference to the tty/uart driver and use some functions to
control it (and send commands). So a hypothetical gps-iio
driver could set sampling rate etc.

And it can also ask the tty/uart: =84please register me and notify if
some syscall wants you to open() or close() so that I (the driver of
the GPS chip) can turn on power of the GPS chip (and only I know
how to do that - nobody else has to care)=93.

I am just playing the Devil's advocate to find out what the really
common principle is and how the DT for clients of a serial interface
should really be represented in a DT in a way that is agnostic to
a specific driver structure, driver functions and user space.

And to find out if we need tty/slaves (as proposed in the title of this
patch series) at all. Or if there is a better way to describe the relat=
ion
of the gps chip driver and the tty/uart.

BR,
Nikolaus--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/
