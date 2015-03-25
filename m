From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Wed, 25 Mar 2015 21:53:44 +0100
Message-ID: <20150325205344.GD381@amd>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <20150318055831.21025.33670.stgit@notabene.brown>
 <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com>
 <20150320195451.146a7915@notabene.brown>
 <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
 <20150321103122.23603014@notabene.brown>
 <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
 <20150325014543.GA967@earth>
 <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Sebastian Reichel <sre@kernel.org>, NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi!

> >> AFAIK the chip simply starts to emit NMEA records if powered on.
> >> There is no command going over the serial interface to address it
> >> or control it.
> >=20
> > Right, since GPS basically doesn't need any configuration/control.
> > That=E2=80=99s not true for other UART attached devices, though.
>=20
> Do you have an example? Usually an UART data stream is transparently
> presented to a /dev/tty - and user-space daemon can configure/control=
 the
> attached device. In most cases it can mix payload data and control co=
mmand
> by some AT command and escape sequences.

Bluetooth H4P protocol is one example.

> > well parent > child is not about power control, but about "primary"
> > control.
>=20
> Can you clearly and precisely define what =E2=80=9Cprimary=E2=80=9D c=
ontrol is? I think
> two people will have three opinions about that.

This has not be a problem so far...

> For example I would see the w2sg0004 on/off gpio as the primary =E2=80=
=9Ccontrol=E2=80=9D
> which makes the light (NMES records) turned on.

=2E..and I don't think it is a problem now.

> > Main reason is, that I would need to go
> > through the UART to =E2=80=9Ccommunicate" with the w2sg0004.
>=20
> You can always "communicate=E2=80=9D through the UART. Even without D=
T. As long as
> the connected chip is powered up by any means (could be some fixed-re=
gulator
> or hard wired).

But you don't know "how" to communicate through the uart.

> Let me raise the question:
>=20
> Why do we need to describe in the DT (independently of Linux power co=
ntrol
> structures and drivers!) that the GPS data interface is connected to =
a specific UART?

Because we want the phone to boot knowing "I have a bluetooth" or "I
have a GPS", as it would if it was connected using USB, and not having
user figure out what commands he needs to do to enable reasonable
hardware support (and getting it wrong, because you need to specify
_many_ critical parameters to hciattach).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
