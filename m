From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 6 May 2015 15:15:48 +0100
Message-ID: <20150506141547.GB1764@leverpostej>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <55492001.30806@hurleysoftware.com>
 <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com>
 <20150506092738.GB4508@amd>
 <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com>
 <554A03A7.2000504@hurleysoftware.com>
 <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com>
 <20150506123632.GA1764@leverpostej>
 <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Pavel Machek <pavel@ucw.cz>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> >>>> No, I am not playing devil=E2=80=99s advocate (which would imply=
 that I am doing this
> >>>> for fun to tease the dog), but I feel I have to be the advocate =
of future board
> >>>> designers who want to easily import an existing board DT and ove=
rwrite device
> >>>> tree nodes to describe design changes, i.e. what slave device is=
 connected to
> >>>> which uart.

[...]

> > If this happens, you can move the slave device into a fragment that=
 you
> > can include under the correct node. That's trivial.
>=20
> But less readable. And that is important as well.

I disagree. The manipulation you have to perform to override properties
is at least as bad as including a file.

> >> So the main difference is if the slave device tells to which uart =
it is connected
> >> or the uart which slave device it is connected to.
> >>=20
> >> And I think the second approach is easier and more straightforward=
 (on DT level).
> >=20
> > We already place child nodes under their respective busses
>=20
> I still wonder why UART is considered as a bus?

As Neil mentioned earlier, ignore "bus". Here we're caring about a 1-1
connection between master (UART) and slave (device), and it happens tha=
t
in most other cases the master is actually a bus, so that's how things
happen to be named.

> > for other
> > interfaces like SPI and I2C. I do not see a compelling reason to do
> > otherwise for devices
>=20
> why the plural? Is there a practical example where multiple devices a=
re
> connected to a single UART and how is addressing solved?

I'm talking about UART slaves in abstract rather than multiple slaves
attached to the same UART.

> > hanging off of UARTs -- doing so would make things
> > less straightforward because you have a fundamentally different idi=
om.
>=20
> Yes, my proposal is fundamentally different from I2C and SPI practice=
, but
> it is the same that is heavily used for e.g. GPIOs and Regulators.

Well, those cases are somewhat distinct, and I'd say that UART slaves
are much closer to SPI/I2C devices than GPIOs or regulators.

Let's say I have a GPIO described via a phandle. That GPIO is actually
owned by some GPIO controller whose control interface is sat on an MMIO
bus. What we're describing with the phandle is use of the GPIO, but not
the main interface for interactive with the GPIO, which is the MMIO
interface of the controller.

In the case of UART slave devices the control interface is attached to
the UART, and effectively the slave sits on the UART's "bus". We could
refer to it from elsewhere by phandle, but its canonical parent should
be the UART, as that's what its main interface is attached to.

> From my DT designer PoV I would say the UART exists in some SoC
> (independently of a device being connected) and then, a device is con=
nected
> to the UART. Hence the proposal of adding this connection link to the=
 device=E2=80=99s
> node and not making the device a subnode. And having the device drive=
r do
> power management and only ask the uart/tty driver to be notified abou=
t open()
> and close() events. How power is managed in detail is then not any pa=
rt of the
> tty/serial drivers.

The way that the power management interfaces are organised within Linux
is orthogonal to the way we describe things in the DT.

Thanks,
Mark.
