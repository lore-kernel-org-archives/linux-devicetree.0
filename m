From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Wed, 25 Mar 2015 21:42:02 +0100
Message-ID: <20150325204202.GC381@amd>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <20150318055831.21025.33670.stgit@notabene.brown>
 <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com>
 <20150320195451.146a7915@notabene.brown>
 <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
 <20150321103122.23603014@notabene.brown>
 <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi!

> > In the case of our GPS, it receives control over the serial connect=
ion from
> > the UART,
>=20
> Ahem - does it?
>=20
> AFAIK the chip simply starts to emit NMEA records if powered on. Ther=
e is no
> command going over the serial interface to address it or control it.

Well _most_ GPSes enable you to control them over the serial
line. (Things like sampling rate, AGPS data upload, ...)

> > I think the GPS is =E2=80=9Cprimarily" a uart-attached device.
>=20
> But not in the same way as an I2C device.
>=20
> Especially the serial interface is not a bus and not used for signall=
ing and
> power control. It is payload data (only).

Serial interface looks a lot like a (point-to-point) bus to
me. Similar to SATA, for example.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
