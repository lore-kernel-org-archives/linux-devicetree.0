From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power on/off UART attached devices.
Date: Thu, 26 Mar 2015 07:44:13 +0100
Message-ID: <365B2C25-1782-4ADE-B620-190A4CC5E8E3@goldelico.com>
References: <20150318055831.21025.33670.stgit@notabene.brown> <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com> <20150320195451.146a7915@notabene.brown> <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com> <20150321103122.23603014@notabene.brown> <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com> <20150325014543.GA967@earth> <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com> <20150325205344.GD381@amd> <1F3B5E32-1330-457C-AE25-791319293C38@goldelico.com> <20150326055639.GA20912@amd>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150326055639.GA20912@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>, NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 26.03.2015 um 06:56 schrieb Pavel Machek <pavel@ucw.cz>:

> Hi!
>=20
>>>>> Main reason is, that I would need to go
>>>>> through the UART to =93communicate" with the w2sg0004.
>>>>=20
>>>> You can always "communicate=94 through the UART. Even without DT. =
As long as
>>>> the connected chip is powered up by any means (could be some fixed=
-regulator
>>>> or hard wired).
>>>=20
>>> But you don't know "how" to communicate through the uart.
>>=20
>> Maybe we are talking using different assumptions. As long as you hav=
e a user space
>> gpsd daemon that talks to the gps chip the kernel simply has to tran=
sparently (except
>> line disciplines) pass the data to the uart.
>=20
> Forget userspace, some other operating system (or future linux) may
> want to put gps handling into the kernel. (To hide differences betwee=
n
> different GPSes).
>=20
>>> Because we want the phone to boot knowing "I have a bluetooth" or "=
I
>>> have a GPS", as it would if it was connected using USB, and not hav=
ing
>>> user figure out what commands he needs to do to enable reasonable
>>> hardware support (and getting it wrong, because you need to specify
>>> _many_ critical parameters to hciattach).
>>=20
>> Yes, this is indeed something I also would like to see for the GTA04=
 (and other)
>> devices.
>>=20
>> So the reason is that some kernel driver wants to use the tty/uart t=
o communicate
>> directly with the chip. This is very similar to a gpio that some dri=
ver wants to use.
>>=20
>> Thus please consider the
>>=20
>> / {
>> 	bt {
>> 		compatible =3D "vendor,product=93;
>> 		uart =3D <&uart1>;
>> 		enable =3D <&gpio17 34 0>;
>> 	};
>> };
>=20
> Would work, too, but I and everyone knows that subnode is better,
> easier solution.

=93Everyone=94 could be wrong and ignorant.

And I thought we are not looking for the easiest solution but the right=
 one.
Especially if we define something that is for other operating systems a=
s well.

About easier: the one given above allows to modify the driver to presen=
t e.g. an iio
interface to user space (and no /dev/tty) *without changing the DT*. Be=
cause the
driver code decides which interface it presents. And not where it is a =
subnode in DT.

This is the level of abstraction DT nodes should have.


It may be that you did not read my previous argumentation completely.

In short, please see:

	http://www.devicetree.org/Device_Tree_Usage#Devices

And check of there is anything that mandates useage of a subnode in thi=
s case.
I simply don=92t find it.

Rather, although it is also not explicitly excluded, I read hints that =
it should *not* be
done the subnode way.

The reason is that it appears to me that the DT hierarchy is intended t=
o describe
how kernel drivers can *address* different components. Nothing less and=
 nothing more.

Especially there is no hint that layering in DT has anything to do with=
 data flow
hierarchies or a =93primary=94 interface as Sebastian calls it.

>=20
>> approach.
>>=20
>> And if you want to hide uart1 from the user-space, that should be a =
property
>> of the uart1 node (whereever it is defined).
>=20
> Sorry? That would be one heck of layering violation.

Which layering?

I think you still mix the software/kernel driver/data flow layers with =
DT layers.

DT can and must be independent on that.

BR,
Nikolaus
