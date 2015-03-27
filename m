From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Fri, 27 Mar 2015 17:31:08 +0100
Message-ID: <20150327163108.GA5089@earth>
References: <20150320195451.146a7915@notabene.brown>
 <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
 <20150321103122.23603014@notabene.brown>
 <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
 <20150325014543.GA967@earth>
 <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
 <20150325152110.GA7903@earth>
 <E4CA3051-6004-4D7B-BF01-CE47CFEDA4EB@goldelico.com>
 <20150326180805.GA562@earth>
 <06BFF79C-F9FC-441D-BA41-7209219A912E@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <06BFF79C-F9FC-441D-BA41-7209219A912E@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 27, 2015 at 10:22:11AM +0100, Dr. H. Nikolaus Schaller wrote:
> > Coming back at my sentence: I asked about a non-trivial, non-bus
> > connected HW, which has a DT binding.
>=20
> from omap3-beagle-xm.dts:
> hsusb2_phy (connected through ULPI)
> gpio-keys (it is not a trivial on/off)
> tfp410 (DVI encoder only part of the video pipeline)

These just need a couple of gpios. For me that's trivial compared to
an interface as complex as UART. Since they do not have any complex
interface they could be a child of, they must land in /.

> sound/codec (connected through McBSPs)

The audio codec is a child device of the TWL. The node you are
talking about is a ***virtual*** device. See also

http://devicetree.org/SoC_Audio

Note that the audio binding of many devices is not that "clean",
since quite some relationships are hidden away behind kernel quirks
and very specific compatible strings.

> and there are components on the board which are not described at
> all but work out of the box: audio connectors, usb/ethernet hub

Sure. Everything that can be identified automatically (USB/Ethernet
stuff) is not encoded into DT. DT has been created to provide a
description for devices, which can *not* be identified automatically.

And passive components like audio connectors are normally not
encoded into DT, since no configuration is needed and no information
is gained. Before you argument with video connectors: Yes they are
different, but IMHO for good reasons:

1. The user can see "DVI" label for DVI output and "HDMI" label
   for HDMI output. This is not known by the display controller.
2. The display data channel is i2c and the connector may use a
   system i2c controller together with the data wires provided by
   the display controller. The display subsystem must know which
   i2c controller takes care of the port.

> In the meantime, I have proposed an IMHO even better approach.
>=20
> It is not to make the gps a regulator or a subnode of some =E2=80=9Cprima=
ry interface=E2=80=9D,
> but give it a reference to the uart it is connected to.
>=20
> And make it an independent node on DT root level.
>=20
> Then we are completely independent on how the gps driver presents
> data to any user space on any OS.

IMHO that approach is not better per se. The child variant is more
generic it contains information without the kernel even knowing
about uart specific stuff.

Note, that we could always use references in DT. The tree structure
is not needed at all, since references make it possible to describe
a graph. Obviously that would defeat the purpose of the tree
structure. In my opinion making something a node in / is always the
last resort and in my perspective it has been handled in such a way
so far.

> What is bad with having a net? Why must we squeeze everything into
> a tree structure just because it is called such? DT language
> provides the syntax for references and that allows to make nets.
> And it is heavily used.

I think so far references were mainly used when tree structure was
too limited to describe something.

> >> You said NAK about referencing a regulator from the UART node and
> >> now?
> >=20
> > No. I said NAK about referencing *the* regulator from the BT/GPS
> > node. My NAK was about referencing a regulator in the UART node
> > (local side), which is actually needed by the GPS/BT module (remote
> > side).
>=20
> Ah, now I understand your argument, and agree to it.
>=20
> My comment was on a slightly different topic that the DTR line from the
> UART (node) can be used to signal the remote regulator to be turned on.
>=20
> But I learned yesterday that we can even hide this explicit signalling
> mechanism (being regulator, gpio or whatever) by:
>=20
> bt {
> 	compatible =3D =E2=80=9Cvendor,btchip=E2=80=9D;
> 	regulator =3D <&regulator to power the btchip>;
> 	uart =3D <&uart1>;
> 	gpio =3D <&gpio to enable the chip>;
> };
>=20
> uart1 {
> 	/* no reference to bt */
> 	regulator =3D <&optional regulator to make the local side work>;
> };
>=20
> You have two nodes. One with all properties for the local uart side.
> And one for the remote side. With a link so that the kernel code can
> find the uart the device is connected to.
>=20
> And then kernel A can use one signalling mechanism between the uart
> driver and the bt driver and kernel B another. This is the level of abstr=
acion
> we should get to.

Since this part of the argumentation is about the regulator VS
enable gpio let's leave out the child VS uart-reference here.

So first note about the regulators: they are normally referenced
using something like "vcc-supply =3D <&regulator>;". This makes it
possible to request more than one regulator. It also shows, what
they are normally used for (you have a module, which has a vcc-pin
and you need some regulator (which can be a fixed-regulator) to
drive it.

So now if the module has an enable-gpio one has two options:

1) add "enable-gpio" to the module's node

2) break up the module into subcomponents, which expose its
   internal structure

Normally in DT option 1) is used, if 2) is not needed. If
some *other* component also makes use of the regulator enabled
by the enable-gpio you would choose option 2), otherwise you
would choose option 1) to keep everything simpler.

> > From my POV putting it below the UART node is more logical and from
> > your POV putting it below / is more logical.
>=20
> Another aspect just came to my mind:
>=20
> IMHO / is the better solution because it also allows to override the
> uart property in an overlay. For example board variant 1 connects to
> uart1 and a hardware changeconnects the bt chip to uart2 in variant 2.
>=20
> You can easily rearrange this link by including the dts of variant 1 and=
=20
> just overwriting uart =3D <&uart2>.
>=20
> But you can=E2=80=99t do that with a child node. I.e. you have to overwri=
te the whole
> uart1 and uart2 nodes to =E2=80=9Cremove=E2=80=9D the relation between ua=
rt1 and the bt/gps chip.
>=20
> This is probably the reason why gpio controllers are referenced and
> not the parents of all connected chips.

The main problem with making gpio controllers parents is, that you
can have only one parent. Since most chips already have a parent
gpios are referenced. Then in opposite to high-level interfaces
many devices need multiple GPIOs. So it will be hard to find a
single parent.

So let's assume there is 20% of devices, which need only one GPIO
and have no other "more important" interface. Surely you could add
them as a child of a gpio-controller, but adding another binding
method for the system subsystem is obviously not a good idea.

> > From my POV the page is simply focused on standard bindings, which
> > have already been established.
>=20
> Well, new bindings should have very good reasons not to follow these
> principles.

Sure, but the standard bindings are very focused on bus connected
devices (esp. since the page is from 2010). So obviously the page is
heavily influenced. As I already mentioned I don't think we have
something comparable to a UART attached device with DT binding so far.

(except of mentioned HSI)

> > If I understand you right, your POV does not allow child nodes
> > (which are not directly under /) without reg property / address.
>=20
> Yes, I read it like that.
>=20
> Slides 22 and 27 of
>=20
> http://events.linuxfoundation.org/sites/events/files/slides/petazzoni-dev=
ice-tree-dummies.pdf
>=20
> also appear to suggest to put busses and devices on root level.
>=20
> Well, he says =E2=80=9Ctypically=E2=80=9D, because he just describes the =
status quo and is
> not wanting to set a standard.

The text merely tells you, that these kind of nodes can be found
below the / node. It does not tell you, that all of them are there.
Simple Counterexample:

/ -> ocp -> i2c@xxxx -> i2c-dev

The i2c bus is not at /, so not all busses are at /.

> > Just have a look at the DT binding
> > documentation directory in the kernel - we already have them.
>=20
> Maybe, todays Linux bidings and DTs are not general enough in such cases
> and should be revisited? But that goes far beyond our discussion and prob=
lem.

Well, I'm against moving all MFD submodules to / and that is what
you suggest by disallowing child nodes without an address. It will
just clutter the / node with lots of stuff.

> > We obviously disagree here :)
>=20
> Exactly. This is why I am trying to find a concise definition how
> it should be.
>=20
> And to be honest I am quite worried that it does not appear to
> exist but DT should be stable and well defined and even OS
> agnostic. How can that work?

By having people, who review new subsystem bindings. I guess
once the UART binding has been done we have a reference case
anyway.

> >> * if a driver needs access to another component, a reference property =
is used
> >=20
> > Here we also disagree. The kernel also makes use of parent > child
> > connections (e.g. the driver for an i2c client node will request
> > data via its parent)
>=20
> That is in my view strictly following because i2c is a bus and therefore
> there is a parent>child relation and it is ok to use it to request the pa=
rent.
>=20
> But in my words the bus is not =E2=80=9Canother component=E2=80=9D. Anoth=
er component
> in my example means the =E2=80=9Cother" between BT chip and SoC with UART.

The same argumentation can be used with BT node below UART node.

> > and sometimes even sibling relationships (in
> > MFD devices).
>=20
> I am not at all against using the information that is present in
> the DT :) I just want to have the DT the information encoded in
> the right way.

Needless to point out, that's why we are having this discussion.

> > So let me summarize:
> >=20
> > * Option A: Do not encode remote side information
> >   Rationale: UART port can be opened in userspace without that info
> >   Counterargument: This information is needed if the OS should be
> >   able to hide away the tty and provide support for the connected
> >   remote device (e.g. provide a bluetooth device instead of a tty)
>=20
> Agreed. I think we can drop this option since there are good use cases.
>=20
> A second one for the records: if we want to provide data from an UART
> connected GPS chip through an iio interface.

All examples can be summarized as "device abstraction".

The UART interface is no different from an SPI bus in this regard.
We could just provide the SPI bus node and let the user cope with
the rest. Instead most users do not even need to know, that their
fancy wifi module is connected via SPI. The same is true for UART
attached devices.

Note, that in my opinion UART is mostly the same as an SPI bus with
only one device (yes, I'm aware, that there is an addtional clock
line etc.). The only difference from DT perspective is the
addressability, which is not important from my POV.

> > * Option B: Put UART remote side node to / and add a reference to the U=
ART port
> >   Rationale: DT wiki page indicates, that child nodes must be addressab=
le
> and UART is not per se a =E2=80=9Cbus=E2=80=9D.
>=20
> >=20
> > * Option C: Put UART remote side node below the UART node
> >   Rationale: Remote device is accessed through the UART
> and treat serial connections as single-client busses

Note, that for me child device does not imply a bus, since other
devices certainly do not use it that way - e.g. most (all?) MFD
devices use child nodes. One can argue of course, that there are
two rules for child devices:

 1. addressable bus clients
 2. device subfunctionalities

> > Since this is about a subsystem binding DT maintainers ACK is
> > definitely needed, so maybe we should just wait for their decision.
>=20
> Good summary!=20
>=20
> So let=E2=80=99s wait for questions / clarifications / comments /
> decisions by DT maintainers.

Since DT maintainers are typically heavily overloaded with work it's
probably a good idea to write up a summarized text in a separate
thread with a obvious hint, that DT binding maintainer feedback is
requested.

-- Sebastian

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVFYXJAAoJENju1/PIO/qah9cP/2q/WYKic6D1W7ZRFNLfkJD+
aTG6gyrP+zqLa8iitUFP9VPvTtL2Gd+eH8woVYUauwdMBY4UVDOSCoF0y6UFwyBl
XOquH9vQfTAYVRDrTUlEDcrrfm8+x55sjuQtno1OTV00l/gfNuArk4P/9hgUKKB+
Yg4HlVihy/6+zDpRWUBnoBK22AvghhpROiMO2pJvxnihXpx3FioIpzI5Qx9HCGby
/FyQ18F++N18vYvXUsi//FlFzhw4CAovyBG9811B9cupuj4KdWisvsoDjpxNtjVh
aHPfjcsoEg0TnN/JJd9OvxIw/7PnnNdIadAMBZqP61nzQm7iAekokCQo6ILlUMkx
lzjgRQy/TaLDbapX9tCLDrlESyg9wRsyiIV1nGE3tYtK0dTCXSBMyj6INvW+tLFW
iQB0qlQjqYO8oZLHfEJ8fKa4G2ORtUwTzvKTlIVxkHQPWACFiEpXuWA/MefNdS0W
P8h2VXm3c/pHlLxfRhiKlx8qeykb9nZ4kC7CkhXhlsULs/typKzFRq6DZg2JoCXB
hE/DmgGYV/5zxEVftNkerxL08uSfaZhvW4IOaZKwJOyDE0aZkADakNY2sqmzKuL7
1ZfSj20GhiIDhmF6sAU9rztcsH3BzEby9/YlFLVq/KohgvbnQpG13yUMLdQIduHd
6IKI22xn5R8TGjXDfehY
=4D5I
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
