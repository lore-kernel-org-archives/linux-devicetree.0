From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 6 May 2015 18:09:20 +0200
Message-ID: <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506141547.GB1764@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am 06.05.2015 um 16:15 schrieb Mark Rutland <mark.rutland@arm.com>:

>>>>>> No, I am not playing devil=92s advocate (which would imply that =
I am doing this
>>>>>> for fun to tease the dog), but I feel I have to be the advocate =
of future board
>>>>>> designers who want to easily import an existing board DT and ove=
rwrite device
>>>>>> tree nodes to describe design changes, i.e. what slave device is=
 connected to
>>>>>> which uart.
>=20
> [...]
>=20
>>> If this happens, you can move the slave device into a fragment that=
 you
>>> can include under the correct node. That's trivial.
>>=20
>> But less readable. And that is important as well.
>=20
> I disagree. The manipulation you have to perform to override properti=
es
> is at least as bad as including a file.

What about:

#include "omap3-beagle-xm.dts"

/ {
	/* HS USB Port 2 Power enable was inverted with the xM C */
	hsusb2_power: hsusb2_power_reg {
		enable-active-high;
	};
};

compared to=20

#include =93board1.dts=94

/ {
	/* slave was reconnected to uart4 */
	slave {
		uart =3D <&uart4>;
	};
};

>=20
>>>> So the main difference is if the slave device tells to which uart =
it is connected
>>>> or the uart which slave device it is connected to.
>>>>=20
>>>> And I think the second approach is easier and more straightforward=
 (on DT level).
>>>=20
>>> We already place child nodes under their respective busses
>>=20
>> I still wonder why UART is considered as a bus?
>=20
> As Neil mentioned earlier, ignore "bus". Here we're caring about a 1-=
1
> connection between master (UART) and slave (device), and it happens t=
hat
> in most other cases the master is actually a bus, so that's how thing=
s
> happen to be named.

So you also mean that all master-slave connections must be represented
by DT subnodes and everything else is not acceptable?

What about:

	sound {
		compatible =3D "ti,omap-twl4030";
		ti,model =3D "omap3beagle";

		ti,mcbsp =3D <&mcbsp2>;
	};

Isn=92t McBSP a =93bus=94 with your definition as well? Like a =93maste=
r=94. And the =93twl4030=94
is the slave (codec)?

&usb_otg_hs {
	interface-type =3D <0>;
	usb-phy =3D <&usb2_phy>;
	phys =3D <&usb2_phy>;
	phy-names =3D "usb2-phy";
	mode =3D <3>;
	power =3D <50>;
};

Isn=92t a PHY interface (e.g. ULPI-PHY) a =93slave=94 connected to a 12=
 wire ULPI =93bus=94 as well?

At least in this two areas everything done so far appears to contradict=
 your argument.

This is for me the blueprint how it should be done for UART slaves like=
 any point-to-point
multi-wire interfaces (question not even discussed: does UART-to-UART h=
ave clear master
and slave roles? Isn=92t the connected device the =93master=94? but I d=
on=92t want to broaden the
discussion again).

This is basically why I keep this discussion open, because it is not th=
at obvious
that Neil=92s proposal is right and mine is wrong.

>=20
>>> for other
>>> interfaces like SPI and I2C. I do not see a compelling reason to do
>>> otherwise for devices
>>=20
>> why the plural? Is there a practical example where multiple devices =
are
>> connected to a single UART and how is addressing solved?
>=20
> I'm talking about UART slaves in abstract rather than multiple slaves
> attached to the same UART.

Ok, I did misunderstand. Thanks.

>=20
>>> hanging off of UARTs -- doing so would make things
>>> less straightforward because you have a fundamentally different idi=
om.
>>=20
>> Yes, my proposal is fundamentally different from I2C and SPI practic=
e, but
>> it is the same that is heavily used for e.g. GPIOs and Regulators.
>=20
> Well, those cases are somewhat distinct, and I'd say that UART slaves
> are much closer to SPI/I2C devices than GPIOs or regulators.

As shown above they are IMHO closer to McBSP and ULPI-PHY (and some
other interfaces).

>=20
> Let's say I have a GPIO described via a phandle. That GPIO is actuall=
y
> owned by some GPIO controller whose control interface is sat on an MM=
IO
> bus. What we're describing with the phandle is use of the GPIO, but n=
ot
> the main interface for interactive with the GPIO, which is the MMIO
> interface of the controller.

Right. For the UART we do the same: the UART controller is connected
to the MMIO and (in my proposal) the phandle describes the use of the U=
ART
(to connect to some slave device). Exactly the same situation.

>=20
> In the case of UART slave devices the control interface is attached t=
o
> the UART, and effectively the slave sits on the UART's "bus". We coul=
d
> refer to it from elsewhere by phandle, but its canonical parent shoul=
d
> be the UART, as that=92s what its main interface is attached to.

What is the =93main interface=94 of some device? Why should it have a s=
pecial
role in DT? I have doubts that it is useful to declare some interface a=
s =93main=94,
unless it is a MMIO bus connection.

There are e.g. chips with multi-interfaces like a twl4030. They have 2 =
I2C busses, 2 PCM
=93busses=94, an ULIP-PHY and some GPIOs. Or some 3G/4G modems which ha=
ve
USB, UART (both useable for AT commands in parallel!), PCM and some GPI=
Os.
Which interface is =93main=94? For the twl4030 it happens that one of t=
he I2C interfaces
is chosen (because it allows to access the registers inside the chip).

Now you might say: yes, the registers of some uart connected device can
be accessed through the uart as well. But usually there is a higher lev=
el
protocol (AT commands) that give some sort of =93register addressing=94=
=2E But
that is a different level than using I2C to access e.g. the gpio contro=
ller in the twl4030.

I just want to say that requiring and focussing on a =93main=94 interfa=
ce of a peripheral
chip may lead to troubles.

>=20
>> From my DT designer PoV I would say the UART exists in some SoC
>> (independently of a device being connected) and then, a device is co=
nnected
>> to the UART. Hence the proposal of adding this connection link to th=
e device=92s
>> node and not making the device a subnode. And having the device driv=
er do
>> power management and only ask the uart/tty driver to be notified abo=
ut open()
>> and close() events. How power is managed in detail is then not any p=
art of the
>> tty/serial drivers.
>=20
> The way that the power management interfaces are organised within Lin=
ux
> is orthogonal to the way we describe things in the DT.

Agreed. And therefore power management registration, notifications etc.
are to be hidden by the drivers and should not be an argument to say =93=
with
subnodes it is easier to implement and probing is done in the right ord=
er=94.


I think I have laid down all arguments why I think my proposal is super=
ior.

So unless there are still questions for understanding details of my PoV=
, it is
IMHO up for a decision.

May it be wise and future-proof.

BR and thanks,
Nikolaus
