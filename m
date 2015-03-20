From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Fri, 20 Mar 2015 09:54:21 +0100
Message-ID: <5A83DCE5-2CB4-48FF-80E7-6E6377045188@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <80D7E742-4633-4CCD-B754-221387D82922@goldelico.com> <20150320194307.51cb4225@notabene.brown>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150320194307.51cb4225@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Belisko Marek <marek.belisko@gmail.com>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>
List-Id: devicetree@vger.kernel.org

Hi,

Am 20.03.2015 um 09:43 schrieb NeilBrown <neilb@suse.de>:

> On Fri, 20 Mar 2015 08:54:35 +0100 "Dr. H. Nikolaus Schaller"
> <hns@goldelico.com> wrote:
>=20
>> Hi Neil,
>>=20
>> Am 18.03.2015 um 06:58 schrieb NeilBrown <neil@brown.name>:
>>=20
>>> Hi again,
>>> here is version 3 of support for tty-slaves.
>>>=20
>>> This version introduces a new bus-type for tty-slaves,
>>=20
>> Hm. I am still not convinced that a tty is a =84bus=93 and=20
>> that this is a solution for a wide-spread problem.
>=20
> Don=92t read too much into the word "bus". =20

Then we should find a different word.

> It is really just a mechanism for
> grouping drivers together - with maybe a hint of a suggestions that i=
t helps
> communicate with the devices which the drivers drive.
>=20
> And I'm not particularly interested in solving wide-spread problems, =
just in
> solving my problem in a suitably idiomatic way.
>=20
>=20
>>=20
>>> and causes
>>> a tty-slave device to appear in /sys/devices between the uart and t=
he
>>> tty.
>>> It effectively intercepts and calls from the tty to the uart (i.e. =
any
>>> tty_operations) and applies extra functionality at that point.
>>=20
>>>=20
>>> Currently the only driver intercepts open and close.
>>> It powers on the device on open, and powers off at last-close.
>>=20
>> That is what the missing piece in Linux is to make the w2sg0004
>> chip work.
>>=20
>>>=20
>>> Power can be controlled by a regulator or by toggling a GPIO.
>>=20
>> I think such a GPIO logic has nothing to do with serial and
>> should be left over to the regulator logic, i.e. we need a special
>> regulator-w2sg0004 driver.
>>=20
>> So I suggest to remove the GPIO logic from your=20
>>=20
>> drivers/tty/slave/serial-power-manager.c
>>=20
>> And then you can even get rid of adding a chip specific =84compatibl=
e=93
>> entry for the subnodes.
>=20
> But (nearly) every node has a "compatible" entry.
> Each node describes a device, and the "compatible" string tells us wh=
at sort
> of device.

Yes, it should - if necessary.

> Surely you agree that there is a particular device that needs to be
> controlled?

No, my opinion is that a specific regulator should be controlled.

>  In that case there needs to be a node representing it and a
> "compatible" string describing it.  That is how =93devicetree" works.

=46or this there is the vdd-regulator =3D <&regulator> idiom and that i=
s
how =93devicetree=94 works as well.

>=20
>=20
>>=20
>>>=20
>>> I think I've incorporated most of the feed back I received from
>>> previous versions, but if I missed something - I apologize.  If
>>> this approach is structurally acceptable then I can fix up all the
>>> smaller issues.
>>=20
>> As said I would prefer that the w2sg0004 driver is just a separate
>> =84regulator=93 driver as we had proposed before.
>=20
> You can prefer that if you wish.  But given that the w2sg0004 is not =
in fact
> a regulator,

therefore our proposal is to make it a drivers/misc and not a drivers/r=
egulator.
But it has a regulator inside that can obviously be turned on or off. S=
o I want to
keep close to the logical energy flow.

> but is in fact a GPS device, I doubt you will find a lot of
> support for your approach (as indeed I didn=92t when I tried it...)

We got a lot of support. The main opposition was about using a =93virtu=
al=94
gpio controller instead of a regulator API to turn the chip on and off =
as
directed by the tty driver.

And we do not write a driver for the w2sg0004 but the regulator inside =
that
chip. You also won=92t expect that the omap3 driver hides everything. Y=
ou
expect that the twl4030 provides some regulators that can be enabled
by subsystems inside the omap3. And if I remember correctly there are
regulators inside the omap3 which have explicit regulator nodes in the =
DT.

The w2sg0004-regulator approach just follows this principle. Anyone wil=
ling
to control the power of the w2sg0004 can use this regulator interface.

BR,
Nikolaus
