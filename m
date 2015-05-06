From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 6 May 2015 18:18:02 +0100
Message-ID: <20150506171802.GE2974@leverpostej>
References: <55492001.30806@hurleysoftware.com>
 <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com>
 <20150506092738.GB4508@amd>
 <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com>
 <554A03A7.2000504@hurleysoftware.com>
 <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com>
 <20150506123632.GA1764@leverpostej>
 <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com>
 <20150506141547.GB1764@leverpostej>
 <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 06, 2015 at 05:09:20PM +0100, Dr. H. Nikolaus Schaller wrot=
e:
> Hi Mark,
>=20
> Am 06.05.2015 um 16:15 schrieb Mark Rutland <mark.rutland@arm.com>:
>=20
> >>>>>> No, I am not playing devil=E2=80=99s advocate (which would imp=
ly that I am doing this
> >>>>>> for fun to tease the dog), but I feel I have to be the advocat=
e of future board
> >>>>>> designers who want to easily import an existing board DT and o=
verwrite device
> >>>>>> tree nodes to describe design changes, i.e. what slave device =
is connected to
> >>>>>> which uart.
> >=20
> > [...]
> >=20
> >>> If this happens, you can move the slave device into a fragment th=
at you
> >>> can include under the correct node. That's trivial.
> >>=20
> >> But less readable. And that is important as well.
> >=20
> > I disagree. The manipulation you have to perform to override proper=
ties
> > is at least as bad as including a file.
>=20
> What about:
>=20
> #include "omap3-beagle-xm.dts"
>=20
> / {
> 	/* HS USB Port 2 Power enable was inverted with the xM C */
> 	hsusb2_power: hsusb2_power_reg {
> 		enable-active-high;
> 	};
> };
>=20
> compared to=20
>=20
> #include =E2=80=9Cboard1.dts=E2=80=9D
>=20
> / {
> 	/* slave was reconnected to uart4 */
> 	slave {
> 		uart =3D <&uart4>;
> 	};
> };

As I mentioned, you can easily carve up your DTS to make that work with
includes if you really must:

/* UART0 board variant */
#include "board.dtsi"
&uart0 {
	#include "some-uart-slave.dtsi"
};

/* UART1 board variant */
#include "board.dtsi"
&uart1 {
	#include "some-uart-slave.dtsi"
};

If you happen to find includes ugly then you can say it's ugly, but it'=
s
functionally equivalent, and also means you can avoid having
disabled/partial nodes all over the place.

If you really wanted you could macro the label instead and have the
slaved node in full.

[...]

> > As Neil mentioned earlier, ignore "bus". Here we're caring about a =
1-1
> > connection between master (UART) and slave (device), and it happens=
 that
> > in most other cases the master is actually a bus, so that's how thi=
ngs
> > happen to be named.
>=20
> So you also mean that all master-slave connections must be represente=
d
> by DT subnodes and everything else is not acceptable?
>=20
> What about:
>=20
> 	sound {
> 		compatible =3D "ti,omap-twl4030";
> 		ti,model =3D "omap3beagle";
>=20
> 		ti,mcbsp =3D <&mcbsp2>;
> 	};
>=20
> Isn=E2=80=99t McBSP a =E2=80=9Cbus=E2=80=9D with your definition as w=
ell? Like a =E2=80=9Cmaster=E2=80=9D. And the =E2=80=9Ctwl4030=E2=80=9D
> is the slave (codec)?

I'm nowhere near familiar enough with the audio hardware nor their
bindings to comment on that, I'm afraid. My rough understanding was tha=
t
the twl4030 node here was referring to the logical subsystem as a whole=
,
with the mcbsp being a physical component, but that's almost certainly
somewhat wrong.

> &usb_otg_hs {
> 	interface-type =3D <0>;
> 	usb-phy =3D <&usb2_phy>;
> 	phys =3D <&usb2_phy>;
> 	phy-names =3D "usb2-phy";
> 	mode =3D <3>;
> 	power =3D <50>;
> };
>=20
> Isn=E2=80=99t a PHY interface (e.g. ULPI-PHY) a =E2=80=9Cslave=E2=80=9D=
 connected to a 12 wire ULPI =E2=80=9Cbus=E2=80=9D as well?

Not necessarily. If you took a look at the bindings you'd notice that
many PHYs have MMIO interfaces for configuration which we have to poke.
Those MMIO interfaces live on an MMIO bus so we describe those and link
to the phy by phandle reference.

A given device could operate as a PHY to multiple controllers, hence
phy-cells, and hence in general a PHY cannot be considered a slave
device.

> At least in this two areas everything done so far appears to contradi=
ct your argument.

Not really. You've found bindings with a different idiom, but those see=
m
to be organised as they are for reasons which don't appear to apply to
UART slave devices as you describe them.

> This is for me the blueprint how it should be done for UART slaves li=
ke any point-to-point
> multi-wire interfaces (question not even discussed: does UART-to-UART=
 have clear master
> and slave roles? Isn=E2=80=99t the connected device the =E2=80=9Cmast=
er=E2=80=9D? but I don=E2=80=99t want to broaden the
> discussion again).
>=20
> This is basically why I keep this discussion open, because it is not =
that obvious
> that Neil=E2=80=99s proposal is right and mine is wrong.
>=20
> >=20
> >>> for other
> >>> interfaces like SPI and I2C. I do not see a compelling reason to =
do
> >>> otherwise for devices

[...]

> >>> hanging off of UARTs -- doing so would make things
> >>> less straightforward because you have a fundamentally different i=
diom.
> >>=20
> >> Yes, my proposal is fundamentally different from I2C and SPI pract=
ice, but
> >> it is the same that is heavily used for e.g. GPIOs and Regulators.
> >=20
> > Well, those cases are somewhat distinct, and I'd say that UART slav=
es
> > are much closer to SPI/I2C devices than GPIOs or regulators.
>=20
> As shown above they are IMHO closer to McBSP and ULPI-PHY (and some
> other interfaces).

As above, I disagree.

> > Let's say I have a GPIO described via a phandle. That GPIO is actua=
lly
> > owned by some GPIO controller whose control interface is sat on an =
MMIO
> > bus. What we're describing with the phandle is use of the GPIO, but=
 not
> > the main interface for interactive with the GPIO, which is the MMIO
> > interface of the controller.
>=20
> Right. For the UART we do the same: the UART controller is connected
> to the MMIO and (in my proposal) the phandle describes the use of the=
 UART
> (to connect to some slave device). Exactly the same situation.

Except that your fundamental interface to the device is via the UART,
which is not typically the case for things like regulators and/or GPIOs=
=2E
If I want a regulator to do something, I ask it to do so via the
controller's MMIO interface. If you want the device to do something, yo=
u
ask it to do so via the UART.=20

> > In the case of UART slave devices the control interface is attached=
 to
> > the UART, and effectively the slave sits on the UART's "bus". We co=
uld
> > refer to it from elsewhere by phandle, but its canonical parent sho=
uld
> > be the UART, as that=E2=80=99s what its main interface is attached =
to.
>=20
> What is the =E2=80=9Cmain interface=E2=80=9D of some device? Why shou=
ld it have a special
> role in DT? I have doubts that it is useful to declare some interface=
 as =E2=80=9Cmain=E2=80=9D,
> unless it is a MMIO bus connection.
>=20
> There are e.g. chips with multi-interfaces like a twl4030. They have =
2 I2C busses, 2 PCM
> =E2=80=9Cbusses=E2=80=9D, an ULIP-PHY and some GPIOs.

I think that would already be covered as an I2C device with two I2C IDs=
,
much like we would cater for an MMIO-interfaced PHY with two MMIO
control register regions

> Or some 3G/4G modems which have
> USB, UART (both useable for AT commands in parallel!), PCM and some G=
PIOs.

Of these I would expect that the USB or UART inerfaces would be the mai=
n
ones, though I would expect that we'd require two separate nodes which
we would have to link up.

> Which interface is =E2=80=9Cmain=E2=80=9D? For the twl4030 it happens=
 that one of the I2C interfaces
> is chosen (because it allows to access the registers inside the chip)=
=2E

Because it happens to be the "main" interface ;)

> Now you might say: yes, the registers of some uart connected device c=
an
> be accessed through the uart as well. But usually there is a higher l=
evel
> protocol (AT commands) that give some sort of =E2=80=9Cregister addre=
ssing=E2=80=9D. But
> that is a different level than using I2C to access e.g. the gpio cont=
roller in the twl4030.
>=20
> I just want to say that requiring and focussing on a =E2=80=9Cmain=E2=
=80=9D interface of a peripheral
> chip may lead to troubles.

I don't disagree that it falls apart in some cases. However, that's not
the general case, and it applies to other interface types too, so I
don't think it should matter in the context of this discussions.

> >> From my DT designer PoV I would say the UART exists in some SoC
> >> (independently of a device being connected) and then, a device is =
connected
> >> to the UART. Hence the proposal of adding this connection link to =
the device=E2=80=99s
> >> node and not making the device a subnode. And having the device dr=
iver do
> >> power management and only ask the uart/tty driver to be notified a=
bout open()
> >> and close() events. How power is managed in detail is then not any=
 part of the
> >> tty/serial drivers.
> >=20
> > The way that the power management interfaces are organised within L=
inux
> > is orthogonal to the way we describe things in the DT.
>=20
> Agreed. And therefore power management registration, notifications et=
c.
> are to be hidden by the drivers and should not be an argument to say =
=E2=80=9Cwith
> subnodes it is easier to implement and probing is done in the right o=
rder=E2=80=9D.

While generally we shouldn't treat OS internals as an argument for DT
organisation, laying things out in a sensible manner for
discoverabilitiy is somewhat different from stating that the run-time
use of a device is fundamentally tied to its description in the DT.

We _could_ list all nodes in a flat list with cross references instead
of having a tree. But it would be horrible for _any_ OS to deal with, s=
o
we don't do that.

Thanks,
Mark.
