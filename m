From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 6 May 2015 13:36:33 +0100
Message-ID: <20150506123632.GA1764@leverpostej>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <55492001.30806@hurleysoftware.com>
 <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com>
 <20150506092738.GB4508@amd>
 <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com>
 <554A03A7.2000504@hurleysoftware.com>
 <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 06, 2015 at 01:27:03PM +0100, Dr. H. Nikolaus Schaller wrot=
e:
> Hi Peter,
>=20
> Am 06.05.2015 um 14:05 schrieb Peter Hurley <peter@hurleysoftware.com=
>:
>=20
> > On 05/06/2015 07:50 AM, Dr. H. Nikolaus Schaller wrote:
> >> No, I am not playing devil=E2=80=99s advocate (which would imply t=
hat I am doing this
> >> for fun to tease the dog), but I feel I have to be the advocate of=
 future board
> >> designers who want to easily import an existing board DT and overw=
rite device
> >> tree nodes to describe design changes, i.e. what slave device is c=
onnected to
> >> which uart.
> >=20
> > I dont' see a big distinction at the DTS source level, so your conc=
ern is wrt
> > binary dtbs?
>=20
> No. My concern is wrt including existing board files and making small=
 modifications
> on source level (or overlays).
>=20
> We discuss:
>=20
> board1.dts:
>=20
> uart3 {	// subnode of some SoC
> 	slave {	// slave connected to uart3
> 		compatible =3D =E2=80=9E=E2=80=A6=E2=80=9C;
> 		gpio =3D <&gpio5 12 0>
> 	};
> };
>=20
> vs.
>=20
> board1.dts:
>=20
> / {
> 	slave {
> 		compatible =3D =E2=80=9E=E2=80=A6=E2=80=9C;
> 		gpio =3D <&gpio5 12 0>
> 		uart =3D &uart3;	// slave connected to uart3
> 	};
> };
>=20
> uart3 {	// subnode of some SoC
> };
>=20
> now let=E2=80=99s have a spin of the board design which just rewires =
the
> slave to uart4 (somtimes hardware engineers do such things).
>=20
> board2.dts:
>=20
> #include <board-variant1.dts>
>=20
> // reconnect device to uart4
>=20
> uart4 {	// subnode of some SoC
> 	slave {	// slave connected to uart4
> 		compatible =3D =E2=80=9E=E2=80=A6=E2=80=9C;
> 		gpio =3D <&gpio5 12 0>
> 	};
> };
>=20
> uart3 {	// subnode of some SoC
> 	slave {	// slave connected to uart3
> 		compatible =3D =E2=80=9Enone=E2=80=9C		// we can=E2=80=99t delete i=
mported subnodes
> 	};
> };
>=20
> /// add another device to uart5?
>=20
> uart5 {	// subnode of some SoC
> 	slave2 {	// slave connected to uart5
> 		compatible =3D =E2=80=9E=E2=80=A6=E2=80=9C;
> 		gpio =3D <&gpio5 13 0>
> 	};
> };

If this happens, you can move the slave device into a fragment that you
can include under the correct node. That's trivial.

If you have a large amount of variation within a given platform, that i=
s
a problem with your platform.

> So the main difference is if the slave device tells to which uart it =
is connected
> or the uart which slave device it is connected to.
>=20
> And I think the second approach is easier and more straightforward (o=
n DT level).

We already place child nodes under their respective busses for other
interfaces like SPI and I2C. I do not see a compelling reason to do
otherwise for devices hanging off of UARTs -- doing so would make thing=
s
less straightforward because you have a fundamentally different idiom.

Having the slave live under the UART node also gives you sane probe
ordering -- you must probe the parent before the slave as the parent
driver (perhaps via common code) will trigger the scan of children.

Mark.
