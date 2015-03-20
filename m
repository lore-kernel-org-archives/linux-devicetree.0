From: NeilBrown <neilb@suse.de>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Sat, 21 Mar 2015 10:31:22 +1100
Message-ID: <20150321103122.23603014@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<20150318055831.21025.33670.stgit@notabene.brown>
	<C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com>
	<20150320195451.146a7915@notabene.brown>
	<14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/JbXrH+nn8kVnM/jKrB4hL+0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--Sig_/JbXrH+nn8kVnM/jKrB4hL+0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Mar 2015 10:34:18 +0100 "Dr. H. Nikolaus Schaller"
<hns@goldelico.com> wrote:

>=20
> Am 20.03.2015 um 09:54 schrieb NeilBrown <neilb@suse.de>:

> > There needs to be one device-node for each device, and that device-node=
 needs
> > to be a child of the device-node for the device which is the primary
> > connection to the child device.
>=20
> Then please explain to me nodes like
>=20
> / {
> 	compatible =3D "ti,omap3-gta04", "ti,omap36xx", "ti,omap3";
>=20
> 	cpus {
> 		cpu@0 {
> 			cpu0-supply =3D <&vcc>;
> 		};
> 	};
>=20
> According to the rule you apply here it should be something like
>=20
> 	cpu@0 {
> 		regulator {
> 			=E2=80=A6
> 		}
>=20
>=20

This exactly highlight one of the big problems with device tree as I see it.

Each device can potentially have relationships with a number of other
devices, for the supply of power, reset signalling, interrupt handled, data
transfer, command transfer etc etc etc.

devicetree provides two ways to indicated a relationship between devices.
One way is a parent/child arrangement.  The other way is ad-hoc
   attribute =3D <&devicename>
assignments.

Each device can only have one parent, but can have multiple arbitrary
assignments.

I would much rather that the parent/child relationship didn't exist at all.
Each device should stand alone, and list all relationships explicitly.  But
that is not the way devicetree works, and we need to live with that.

So we need a clear understanding of what the 'parent' of a given device
should be.
I don't know what the specifications say, if anything, but what I see is th=
at
the parent is in practive a device which can 'address' the child.  i.e.
control signalling is the key parent->child relationship.
This is consistent with the fact that many device nodes have a=20
		reg=3D<xxx>
attribute which gives the address of the node as seen by it's parent.

Given that understanding, a regulator must be a child of the device which c=
an
control it - which can turn it on or off.  Not a child of the device which
receives power from it.

In the case of our GPS, it receives control over the serial connection from
the UART, also receives control via a GPIO to the on/off pin, and also needs
a regulator to power the antenna.

So should the parent be the uart, the on/off GPIO, or the regulator?

I would much rather there wasn't a parent, and that each of these were list=
ed
as ad-hoc attribute assignments.  But device-tree says there must be a pare=
nt
(where possible), and the parent is the thing that is "primarily" in contro=
l.

I think the GPS is "primarily" a uart-attached device.
So I propose a device-node which describes the GPS, which is a child of the
UART, and explicitly identifies the GPIO it uses to power on/off, the
regulator it uses to power the antenna, and how it receives "on or off"
status indications from the GPS.

It is arguable that the "antenna" should be treated as a separate device - a
child of the GPS - which controls the regulator and also provides a 'extcon'
which reports whether an external GPS antenna is attached, or whether the
internal on is in use.  I haven't made the time to properly explore that
issue yet.

> >>=20
> >> All the following is very special logic for the w2sg0004 chip which sh=
ould be
> >> divided out into a separate driver.
> >>=20
> >> Marek and me already had proposed such a chip specific driver (to be l=
ocated
> >> in drivers/misc) some months ago. It would encapsulate everything w2sg=
0004
> >> specific and present itself as a regulator (because that is its main p=
urpose:
> >> control the LDO regulator inside the w2sg0004 chip).
> >=20
> > Presenting itself as a regulator would be wrong because it isn=E2=80=99=
t a regulator.
>=20
> It has a regulator that can be controlled by a gpio=E2=80=A6

Does it?  I guess may it does.
Maybe it also has an ARM core and some memory and assorted other bits and
pieces.  But we don't really need to describe them to device tree.

The w2sg0004 is primarily a GPS device, so that needs to be stated in the
devices tree description.  If there are subcomponents that can usefully be
described as well then there could be a place to describe those subcomponen=
ts.
I notice that there is a "1V8-out" pin, so presumable the chip can deliver a
1V8 source based on its 3V3 input.  If a board made use of that, it could be
useful to describe the regulator inside the GPS so it could be declare that
some other device which needed 1V8 made use of that regulator....

>=20
> Another example to think about: the twl4030 is also not a regulator.
> Nevertheless they present some regulator nodes.

The TWL4030 is a multifunction device which contains regulators and GPIOs a=
nd
audio codec and  USB PHY etc etc etc.

So in device-tree there is a device-node for the TWL4030, and it has
child-nodes for each sub-device.   They in turn can provide services to oth=
er
devices on the board.
These sub-devices are much more independent of the whole than the regulator
inside the w2sg0004 is.

>=20
> Or take the OMAP3 pbias_regulator. The OMAP3 isn=E2=80=99t a regulator as=
 well
> but has an internal pbias_regulator that needs to be controlled.

I don't know much about a "pbias_regulator", but the OMAP3 is a multifuncti=
on
device which contains a CPU and multiple other controllers and  communicato=
rs
and stuff.  One of the components in the OMAP3 is this pbias_regulator, and
it has a device-node which is a child of the 'ocp' node - which is the main
interconnect in the OMAP3 I think.

So I'm not against describing the regulator in the w2sg0004, but for
consistency with everything else, it would need to be child-node of a
device-node which describes the w2sg0004 as a whole.  I'm not sure that doi=
ng
that would gain anything.


Thanks,
NeilBrown

--Sig_/JbXrH+nn8kVnM/jKrB4hL+0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVQytyjnsnt1WYoG5AQIi7g/+PZtbYkEXtwk1j3/NgFyCeyQHyxQc2vwN
zgt6WTBCBxAz/jc1ctB7BhpuwO6NuOOglF4XEs6W1MUfVpTw7g8mjJNU6M77hnt/
6Tanhrgwr1fAhy7Wg9OJUsTJb5d2VbFfQe/nfcTFag2jptghQEE9kWuqqKwR2oS2
aOzdrlOp5F/2XN+joWtKo6XfXb6n4WfjTL78gsJ+YuQGTY4i0R1H24cAGpotoPPw
Xc9wyzH8qaPMJVGA+1KLoLZf9K0ijYJ6ZM2pRwWfzUVHkTa17D5gkYiFjfizTECw
PiSW7m+xh49YS1if2kDLXm7f3XDoufH/YiR1Xh+HNl+GyutlVMPbhYKdwzPWT3dL
9fJTqJu6PAHlC58+0BKrlU661iqZOLebIJpICJ3CfmFnHSruOOrcJqDac9xE5BZg
U1TstDI8Lc/Fo6IQNQzZbe7fVdeHTwnGECBqCzE7uhWPeQOKtgKmT6AbNQTBZgnQ
66r18Bk71sMmqFErDqNSuDCS7kIwRAK3W7goobymxTkRCBp6OFSf1YxiPdJMwTib
bCo4tzywON/F/QxILY1TNZf4Qye5P2BXUSUIgVobHebdEAeK3CApJx1+izmTwIpC
BozG8BRTneBJ/X8VNIvB/gFWaVRSkN72SRKFOZyGXKZaZWkPW6eeoOtqbL/ZMj+C
PI5TodwNOaA=
=7jEh
-----END PGP SIGNATURE-----

--Sig_/JbXrH+nn8kVnM/jKrB4hL+0--
