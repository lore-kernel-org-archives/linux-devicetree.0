From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power on/off UART attached devices.
Date: Wed, 25 Mar 2015 22:25:31 +0100
Message-ID: <1F3B5E32-1330-457C-AE25-791319293C38@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <20150318055831.21025.33670.stgit@notabene.brown> <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com> <20150320195451.146a7915@notabene.brown> <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com> <20150321103122.23603014@notabene.brown> <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com> <20150325014543.GA967@earth> <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com> <20150325205344.GD381@amd>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150325205344.GD381@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>, NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Am 25.03.2015 um 21:53 schrieb Pavel Machek <pavel@ucw.cz>:

> Hi!
>=20
>>>> AFAIK the chip simply starts to emit NMEA records if powered on.
>>>> There is no command going over the serial interface to address it
>>>> or control it.
>>>=20
>>> Right, since GPS basically doesn't need any configuration/control.
>>> That=92s not true for other UART attached devices, though.
>>=20
>> Do you have an example? Usually an UART data stream is transparently
>> presented to a /dev/tty - and user-space daemon can configure/contro=
l the
>> attached device. In most cases it can mix payload data and control c=
ommand
>> by some AT command and escape sequences.
>=20
> Bluetooth H4P protocol is one example.
>=20
>>> well parent > child is not about power control, but about "primary"
>>> control.
>>=20
>> Can you clearly and precisely define what =93primary=94 control is? =
I think
>> two people will have three opinions about that.
>=20
> This has not be a problem so far...
>=20
>> For example I would see the w2sg0004 on/off gpio as the primary =93c=
ontrol=94
>> which makes the light (NMES records) turned on.
>=20
> ...and I don't think it is a problem now.
>=20
>>> Main reason is, that I would need to go
>>> through the UART to =93communicate" with the w2sg0004.
>>=20
>> You can always "communicate=94 through the UART. Even without DT. As=
 long as
>> the connected chip is powered up by any means (could be some fixed-r=
egulator
>> or hard wired).
>=20
> But you don't know "how" to communicate through the uart.

Maybe we are talking using different assumptions. As long as you have a=
 user space
gpsd daemon that talks to the gps chip the kernel simply has to transpa=
rently (except
line disciplines) pass the data to the uart.

=46or that there is no need to describe anything in DT.

>=20
>> Let me raise the question:
>>=20
>> Why do we need to describe in the DT (independently of Linux power c=
ontrol
>> structures and drivers!) that the GPS data interface is connected to=
 a specific UART?
>=20
> Because we want the phone to boot knowing "I have a bluetooth" or "I
> have a GPS", as it would if it was connected using USB, and not havin=
g
> user figure out what commands he needs to do to enable reasonable
> hardware support (and getting it wrong, because you need to specify
> _many_ critical parameters to hciattach).

Yes, this is indeed something I also would like to see for the GTA04 (a=
nd other)
devices.

So the reason is that some kernel driver wants to use the tty/uart to c=
ommunicate
directly with the chip. This is very similar to a gpio that some driver=
 wants to use.

Thus please consider the

/ {
	bt {
		compatible =3D "vendor,product=93;
		uart =3D <&uart1>;
		enable =3D <&gpio17 34 0>;
	};
};

approach.

And if you want to hide uart1 from the user-space, that should be a pro=
perty
of the uart1 node (whereever it is defined).

BR,
Nikolaus--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/
