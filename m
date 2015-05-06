From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 6 May 2015 15:28:58 +0200
Message-ID: <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506123632.GA1764@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am 06.05.2015 um 14:36 schrieb Mark Rutland <mark.rutland@arm.com>:

> On Wed, May 06, 2015 at 01:27:03PM +0100, Dr. H. Nikolaus Schaller wr=
ote:
>> Hi Peter,
>>=20
>> Am 06.05.2015 um 14:05 schrieb Peter Hurley <peter@hurleysoftware.co=
m>:
>>=20
>>> On 05/06/2015 07:50 AM, Dr. H. Nikolaus Schaller wrote:
>>>> No, I am not playing devil=92s advocate (which would imply that I =
am doing this
>>>> for fun to tease the dog), but I feel I have to be the advocate of=
 future board
>>>> designers who want to easily import an existing board DT and overw=
rite device
>>>> tree nodes to describe design changes, i.e. what slave device is c=
onnected to
>>>> which uart.
>>>=20
>>> I dont' see a big distinction at the DTS source level, so your conc=
ern is wrt
>>> binary dtbs?
>>=20
>> No. My concern is wrt including existing board files and making smal=
l modifications
>> on source level (or overlays).
>>=20
>> We discuss:
>>=20
>> board1.dts:
>>=20
>> uart3 {	// subnode of some SoC
>> 	slave {	// slave connected to uart3
>> 		compatible =3D =84=85=93;
>> 		gpio =3D <&gpio5 12 0>
>> 	};
>> };
>>=20
>> vs.
>>=20
>> board1.dts:
>>=20
>> / {
>> 	slave {
>> 		compatible =3D =84=85=93;
>> 		gpio =3D <&gpio5 12 0>
>> 		uart =3D &uart3;	// slave connected to uart3
>> 	};
>> };
>>=20
>> uart3 {	// subnode of some SoC
>> };
>>=20
>> now let=92s have a spin of the board design which just rewires the
>> slave to uart4 (somtimes hardware engineers do such things).
>>=20
>> board2.dts:
>>=20
>> #include <board-variant1.dts>
>>=20
>> // reconnect device to uart4
>>=20
>> uart4 {	// subnode of some SoC
>> 	slave {	// slave connected to uart4
>> 		compatible =3D =84=85=93;
>> 		gpio =3D <&gpio5 12 0>
>> 	};
>> };
>>=20
>> uart3 {	// subnode of some SoC
>> 	slave {	// slave connected to uart3
>> 		compatible =3D =84none=93		// we can=92t delete imported subnodes
>> 	};
>> };
>>=20
>> /// add another device to uart5?
>>=20
>> uart5 {	// subnode of some SoC
>> 	slave2 {	// slave connected to uart5
>> 		compatible =3D =84=85=93;
>> 		gpio =3D <&gpio5 13 0>
>> 	};
>> };
>=20
> If this happens, you can move the slave device into a fragment that y=
ou
> can include under the correct node. That's trivial.

But less readable. And that is important as well.

>=20
> If you have a large amount of variation within a given platform, that=
 is
> a problem with your platform.

Agreed.

>=20
>> So the main difference is if the slave device tells to which uart it=
 is connected
>> or the uart which slave device it is connected to.
>>=20
>> And I think the second approach is easier and more straightforward (=
on DT level).
>=20
> We already place child nodes under their respective busses

I still wonder why UART is considered as a bus?

=46or me it is a point-to-point interface, and not a bus.
I assume that a majority of engineers outside of our discussion tend to=
 agree.

[random pick: http://www.avrfreaks.net/comment/473738#comment-473738
"So basically, UART is not a bus. If you really want to connect N devic=
es together,
use I2C maybe, it too has two wires and anyone can be master.=93]

Even some ISO standards define a =84bus=93 as something with addressabl=
e clients
(and UART has no addresses since it has no protocol by itself).

> for other
> interfaces like SPI and I2C. I do not see a compelling reason to do
> otherwise for devices

why the plural? Is there a practical example where multiple devices are
connected to a single UART and how is addressing solved?

> hanging off of UARTs -- doing so would make things
> less straightforward because you have a fundamentally different idiom=
=2E

Yes, my proposal is fundamentally different from I2C and SPI practice, =
but
it is the same that is heavily used for e.g. GPIOs and Regulators.

So it is not at all a =84different=93 idiom. Just one that IMHO better =
fits for
point-to-point connections (like power distribution or GPIOs). Therefor=
e
I have a reason to use a different idiom for a technically different
task.

>=20
> Having the slave live under the UART node also gives you sane probe
> ordering -- you must probe the parent before the slave as the parent
> driver (perhaps via common code) will trigger the scan of children.

This is a good and interesting argument in favour of the subnodes appro=
ach.

I know there was (is?) a problem with GPIO controllers not probed befor=
e
they are referenced. That made some problems for OMAP around release
3.14. But AFAIK it is solved now (don=92t know the details how it is so=
lved).

Anyways, I wonder why probing and probe order should be implicitly refl=
ected
by the DT? If DT is really a hardware description (and not a tool for k=
ernel code
optimisation), then it should not matter and other aspects should have =
a higher
priority. E.g. which information is to be provided by the slave node an=
d which
by the uart node.

The key point appears to be how we want to see the serial connection. I=
s the
device connected to the uart or the uart to a device?

In OO terminology: =84device connects to uart=93 vs. =84uart has device=
 connected=93.
"d -> u=93 vs. "u <- d=93.

=46or a bus like I2C or SPI it is =84controller has device connected=93=
 but for a good
reason (somehow the address must be specified - and addressing belongs =
to
the master side).

=46rom my DT designer PoV I would say the UART exists in some SoC
(independently of a device being connected) and then, a device is conne=
cted
to the UART. Hence the proposal of adding this connection link to the d=
evice=92s
node and not making the device a subnode. And having the device driver =
do
power management and only ask the uart/tty driver to be notified about =
open()
and close() events. How power is managed in detail is then not any part=
 of the
tty/serial drivers.

BR,
Nikolaus
