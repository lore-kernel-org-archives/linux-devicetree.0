From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 6 May 2015 14:27:03 +0200
Message-ID: <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554A03A7.2000504@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

Am 06.05.2015 um 14:05 schrieb Peter Hurley <peter@hurleysoftware.com>:

> On 05/06/2015 07:50 AM, Dr. H. Nikolaus Schaller wrote:
>> No, I am not playing devil=92s advocate (which would imply that I am=
 doing this
>> for fun to tease the dog), but I feel I have to be the advocate of f=
uture board
>> designers who want to easily import an existing board DT and overwri=
te device
>> tree nodes to describe design changes, i.e. what slave device is con=
nected to
>> which uart.
>=20
> I dont' see a big distinction at the DTS source level, so your concer=
n is wrt
> binary dtbs?

No. My concern is wrt including existing board files and making small m=
odifications
on source level (or overlays).

We discuss:

board1.dts:

uart3 {	// subnode of some SoC
	slave {	// slave connected to uart3
		compatible =3D =84=85=93;
		gpio =3D <&gpio5 12 0>
	};
};

vs.

board1.dts:

/ {
	slave {
		compatible =3D =84=85=93;
		gpio =3D <&gpio5 12 0>
		uart =3D &uart3;	// slave connected to uart3
	};
};

uart3 {	// subnode of some SoC
};

now let=92s have a spin of the board design which just rewires the
slave to uart4 (somtimes hardware engineers do such things).

board2.dts:

#include <board-variant1.dts>

// reconnect device to uart4

uart4 {	// subnode of some SoC
	slave {	// slave connected to uart4
		compatible =3D =84=85=93;
		gpio =3D <&gpio5 12 0>
	};
};

uart3 {	// subnode of some SoC
	slave {	// slave connected to uart3
		compatible =3D =84none=93		// we can=92t delete imported subnodes
	};
};

/// add another device to uart5?

uart5 {	// subnode of some SoC
	slave2 {	// slave connected to uart5
		compatible =3D =84=85=93;
		gpio =3D <&gpio5 13 0>
	};
};


vs.=20

board2.dts:

#include <board-variant1.dts>

// reconnect device to uart4

	&slave {
		uart =3D &uart3;
	};

// add another device to uart5?

	slave2 {
		compatible =3D =84=85=93;
		gpio =3D <&gpio5 13 0>
		uart =3D &uart5;
	};

So the main difference is if the slave device tells to which uart it is=
 connected
or the uart which slave device it is connected to.

And I think the second approach is easier and more straightforward (on =
DT level).

>=20
>> At least in this regard, the alternatives are really differently eas=
y to handle.
>>=20
>> And, the alternatives have some influence how a tty driver and a sla=
ve device
>> driver is designed. So that is for me the root question, before disc=
ussing (some)
>> implementation details.
>=20
> I would expect _no_ impact on the tty driver; have I overlooked somet=
hing?

The way a tty driver finds the slave or the slave finds the tty driver =
instance.

In my proposal, the slave device has to look up the uart instance it is=
 connected
to and must register itself as a power management client to get notific=
ations. It
can also receive other notifications or change the line discipline to i=
ts needs.

In Neil=92s original proposal the tty driver simply imposes some specia=
l power
management methods (control gpio or a regulator) over the slave driver =
which
does not encapsulate it=92s power management methods.

BR,
Nikolaus--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/
