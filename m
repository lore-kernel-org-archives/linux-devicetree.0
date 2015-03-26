From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Thu, 26 Mar 2015 19:08:05 +0100
Message-ID: <20150326180805.GA562@earth>
References: <20150318055831.21025.33670.stgit@notabene.brown>
 <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com>
 <20150320195451.146a7915@notabene.brown>
 <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
 <20150321103122.23603014@notabene.brown>
 <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
 <20150325014543.GA967@earth>
 <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
 <20150325152110.GA7903@earth>
 <E4CA3051-6004-4D7B-BF01-CE47CFEDA4EB@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E4CA3051-6004-4D7B-BF01-CE47CFEDA4EB@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 25, 2015 at 05:44:42PM +0100, Dr. H. Nikolaus Schaller wrote:
> Am 25.03.2015 um 16:21 schrieb Sebastian Reichel <sre@kernel.org>:
> > On Wed, Mar 25, 2015 at 08:59:14AM +0100, Dr. H. Nikolaus Schaller wrot=
e:
> >> Am 25.03.2015 um 02:45 schrieb Sebastian Reichel <sre@kernel.org>:
> >>> On Tue, Mar 24, 2015 at 06:58:15PM +0100, Dr. H. Nikolaus Schaller wr=
ote:
> >>>> So you propose that the parent->child relationship is =E2=80=9Ccontr=
ol=E2=80=9D? I.e. some
> >>>> channel which allows to address some bus client (through <reg>) and
> >>>> control that devices.
> >>>>=20
> >>>> Makes sense. This is how i2c and spi clients are specified.
> >>>>=20
> >>>>> In the case of our GPS, it receives control over the serial connect=
ion from
> >>>>> the UART,
> >>>>=20
> >>>> Ahem - does it?
> >>>>=20
> >>>> AFAIK the chip simply starts to emit NMEA records if powered on.
> >>>> There is no command going over the serial interface to address it
> >>>> or control it.
> >>>=20
> >>> Right, since GPS basically doesn't need any configuration/control.
> >>> That=E2=80=99s not true for other UART attached devices, though.
> >>=20
> >> Do you have an example? Usually an UART data stream is transparently
> >> presented to a /dev/tty - and user-space daemon can configure/control =
the
> >> attached device. In most cases it can mix payload data and control com=
mand
> >> by some AT command and escape sequences.
> >=20
> > Yes, but the configuration is minimal. Anyways as you said there
> > *is* some kind of control happening over the UART.
>=20
> Control is happening on a higher network stack level than UART. It
> control is done through AT commands.

Yes, obviously UART is only the physical layer. The same is true for
busses and does not really matter.

> >>>>> also receives control via a GPIO to the on/off pin, and also needs
> >>>>> a regulator to power the antenna.
> >>>>>=20
> >>>>> So should the parent be the uart, the on/off GPIO, or the regulator?
> >>>>>=20
> >>>>> I would much rather there wasn't a parent, and that each of these w=
ere listed
> >>>>> as ad-hoc attribute assignments.  But device-tree says there must b=
e a parent
> >>>>> (where possible), and the parent is the thing that is =E2=80=9Cprim=
arily" in control.
> >>>>=20
> >>>> Well, IMHO the =E2=80=9Cparent=E2=80=9D could also be the root. Repr=
esenting the
> >>>> whole board.
> >>>>=20
> >>>> Nevertheless, I doubt your rule that =E2=80=9Cability to control=E2=
=80=9D defines
> >>>> the parent>child relation (see below).
> >>>>=20
> >>>>>=20
> >>>>> I think the GPS is =E2=80=9Cprimarily" a uart-attached device.
> >>>>=20
> >>>> But not in the same way as an I2C device.
> >>>>=20
> >>>> Especially the serial interface is not a bus and not used for
> >>>> signalling and power control. It is payload data (only).
> >>>=20
> >>> Actually many I2C devices are also powered on/off via a GPIO and
> >>> even use additional GPIOs for sending interrupts. Nevertheless they
> >>> are normally identified as an I2C device.
> >>=20
> >> Because I2C is a bus that can address multiple clients and gpio isn=E2=
=80=99t
> >> a bus and a point-to-point connection.
> >>=20
> >> But IMHO it is not because they (can) send payload data over i2c.
> >=20
> > From my POV it's not because I2C is a bus, but because the primary
> > function is happening via I2C (e.g. configuring sensor, gettings its
> > data). The GPIOs are only needed to compensate some I2C shortcomings
> > (missing irq feature in I2C) or reduce the complexity of the client
> > (power GPIO). The actual system interaction with the I2C chip is
> > going via I2C, though.
>=20
> Yes, but this is in my new understanding irrelevant for proper DT
> description.

And for my understanding it is. We are arguing in a circle...

> >>>> If you assume that parent>child relationship is about control (only)=
=2E But if it
> >>>> is about data flow, there is a different concept in DT. For example =
the CSI/DSI
> >>>> (OMAP DSS) use the =E2=80=9Cport=E2=80=9D concept.
> >>>=20
> >>> Yes, this is about data not going to the cpu / system memory.
> >>=20
> >> Really? The frame buffer data is in system memory and gets to the pane=
l. Or a
> >> camera image ends up in system memory.
> >=20
> > Really? So the panel accesses the system memory? Check again. The
> > panel is simply connected via DSI/SDI/... and does not access the
> > system memory at all. The display controller OTH does. So let's have
> > a look at the DT structure (simplified):
> >=20
> > ocp -> dss -> { port =3D <&panel>; }
> > ... -> spi -> panel { port =3D <&dss>; }
> >=20
> > So the port models a device-to-device connection, which works
> > independent of the remaining system. No system memory is involved.
>=20
> Sorry, but I can=E2=80=99t exactly follow what you want to show.
>=20
> Yes, the port mechanism describes a device to device connection.
>=20
> But it does not describe system memory. Although it is the source of
> the video (i.e. the framebuffer).
>=20
> This shows that the DT does not necessarily describe data flow.
>=20
> So why do you want to describe data flow from tty to uart to some
> connected device?

It shows, that the tree models system memory flow and adds
references for stuff not being about the system memory flow.

So let's say I want to configure the panel - I can simply walk
through the parent structure to know how to access it. The same
is true for the display controller.

> >>>> This means that indeed parent>child is used for control, e.g. I2C
> >>>> or SPI to tell the panel controller to switch on.
> >>>=20
> >>> well parent > child is not about power control, but about "primary"
> >>> control.
> >>=20
> >> Can you clearly and precisely define what =E2=80=9Cprimary=E2=80=9D co=
ntrol is? I think
> >> two people will have three opinions about that.
> >>=20
> >> For example I would see the w2sg0004 on/off gpio as the primary =E2=80=
=9Ccontrol=E2=80=9D
> >> which makes the light (NMES records) turned on.
> >>=20
> >> Therefore we should make it the subnode of some gpio-controller, shoul=
dn=E2=80=99t we?
> >=20
> > I never thing of enable gpios to be the main interface, since it can
> > simply be connected to some voltage and be enabled constantly. It's
> > just some kind of helper for the device. It does not really exchange
> > data between the system and the device, though. (Note: This is
> > not true, if the GPIOs are used for bitbanging some high-level
> > protocol, in which case a virtual controller (like i2c-gpio) is
> > modelled in DT).
> >=20
> > So let's have a look at the UART link again. It is transporting
> > non-trivial data from the UART to the system and it is handling
> > the data I actually want. It's providing access to the device's
> > =E2=80=9Cregisters".
>=20
> Well, this view can be followed, but is as strange and bent to fit
> like my view of the w2sg0004 as a =E2=80=9Cregulator=E2=80=9D.
>=20
> >=20
> > For me its clear, that one would expect the GPS under the UART
> > port, since when speaking with other developers I would describe
> > the GPS as being a "UART attached GPS chip". From me the
> > differences between a UART port and a SPI port from a system
> > software=E2=80=99s POV can be reduced to missing multi-device support.
>=20
> DT does not necessarily have to describe data flow as we have seen
> in the video pipeline example.

sure, it shows how to access the device. This link may not
necessarily be the same as the one, which takes care of the
data.

> > so show me some non-bus connections, which are actually used to
> > exchange non-trivial data (with on/off being trivial). We currently
> > do not really have them.
>=20
> Are we talking about DT or data flow from user space through the
> kernel?

/me is not sure why you are regularly introducing userspace. It's
completly irrelevant when its assumed, that the kernel should
abstract devices. DT is about giving the kernel knowledge about
the *hardware*, so that it can implement this abstraction without
any user interaction.

Coming back at my sentence: I asked about a non-trivial, non-bus
connected HW, which has a DT binding.

> > I have missed virtual-gpio UART DTR discussion and assume, that the
> > regulator is about the regulator on the GPS chip?
>=20
> Well, it was introduced in platform device kernels that it was possible
> to define a dtr-gpio for the uart. And there was a driver for the w2sg0004
> that presented itself as a gpio-controller with a single gpio. This =E2=
=80=9Cvirtual=E2=80=9D
> gpio was used to power on the chip as soon as DTR was asserted.
>=20
> Parts of this had been in mainline but have been removed some months
> ago.

I can't find any w2sg0004 reference in the mainline kernel's commit
messages.

> > I don't think the regulator is not acceptable. I simply think its
> > not useful. Basically the structure would be
> >=20
> > uart {
> >    /* stuff */
> >    gps {
> >        vdd-supply =3D <&gpsreg>;
> >        /* stuff */
> >=20
> >        gpsreg: regulator {
> >            enable-gpio =3D <GPIO 42>;
> >            /* stuff */
> >        }
> >    }
> > }
>=20
> Except that the gpsreg is a subnode of /

I obviously disagree with that ;)
But even then the regulator is useless.

> >=20
> > and could simply be
> >=20
> > uart {
> >    /* stuff */
> >    gps {
> >        enable-gpio =3D <GPIO 42>;
> >        /* stuff */
> >    }
> > }
> >=20
> > Without loosing important information.
>=20
> Only if you assume that the gpsreg must be a subnode of the uart.

DT means device tree and not device net. I sure can follow your
argument, but from my POV its trying to create a net from the tree.

> > The regulator would only be
> > interesting if it is also used by other devices. Other devices also
> > do not expose their internal clocks etc.
> >=20
> >>>> The reason is there no well defined protocol to make multiple client=
s and
> >>>> you can=E2=80=99t specify a <reg>.
> >>>>=20
> >>>> So you are either abusing the notion of a bus or the gps chip must b=
e a separate
> >>>> DT node (child of something else).
> >>>>=20
> >>>> I hope my gut feeling that we are trying to do something fundamental=
ly wrong
> >>>> with making the gps chip a subode of serial is now argued a little b=
etter.
> >>>>=20
> >>>> For making the serial device control some regulator through a refere=
nce to
> >>>> a regulator, I am very fine. It is what you do for the W2CBW bluetoo=
th part.
> >>>=20
> >>> NAK about referencing the regulator from the UART node. It should be
> >>> referenced from the Bluetooth / GPS node. The UART port works
> >>> without the regulator. It's the remote side, that does not work.
> >>> We also do not add the regulators of I2C clients to the I2C host.
> >>=20
> >> I think Pavel made a very good comment:
> >>=20
> >> The uart node should be able to power a rs232 converter/level shifter =
directly
> >> connected to it (through a regulator or gpio-regulator).
> >=20
> > Yes and this may belong to the UART node.
> >=20
> >> And there must be a separate mechanism to power the remote rs232 conve=
rter
> >> and the remote device.
> >=20
> > Yes and I think this goes to the remote device's node.
> >=20
> >> The standard signalling for this are the RTS/DTR lines of an UART/RS23=
2.
> >> UART is not only RX+TX.
> >=20
> > so?
>=20
> You said NAK about referencing a regulator from the UART node and
> now?

No. I said NAK about referencing *the* regulator from the BT/GPS
node. My NAK was about referencing a regulator in the UART node
(local side), which is actually needed by the GPS/BT module (remote
side).

> >>> If you want to talk with an I2C device you enable the I2C device
> >>> *and* its parent (aka the I2C host controller). I guess the same
> >>> should be done for the UART.
> >>>=20
> >>>>>>>> All the following is very special logic for the w2sg0004 chip wh=
ich should be
> >>>>>>>> divided out into a separate driver.
> >>>>>>>>=20
> >>>>>>>> Marek and me already had proposed such a chip specific driver (t=
o be located
> >>>>>>>> in drivers/misc) some months ago. It would encapsulate everythin=
g w2sg0004
> >>>>>>>> specific and present itself as a regulator (because that is its =
main purpose:
> >>>>>>>> control the LDO regulator inside the w2sg0004 chip).
> >>>>>>>=20
> >>>>>>> Presenting itself as a regulator would be wrong because it isn=E2=
=80=99t a regulator.
> >>>>>>=20
> >>>>>> It has a regulator that can be controlled by a gpio=E2=80=A6
> >>>>>=20
> >>>>> Does it?  I guess may it does.
> >>>>> Maybe it also has an ARM core and some memory and assorted other bi=
ts and
> >>>>> pieces.  But we don=E2=80=99t really need to describe them to devic=
e tree.
> >>>>=20
> >>>> Well, if I look into the data sheet, it has indeed an LDO from 3.3V =
to 1.8V.
> >>>>=20
> >>>> Not to make you confused: the w2sg0084 would have a WAKEUP output wh=
ich - if
> >>>> connected to a GPIO - would tell if the module is really active or n=
ot. Using this would
> >>>> make monitoring the RX line through different pinmux states obsolete.
> >>>>=20
> >>>> But the only Linux board using the w2sg00x4 appears to be the GTA04 =
and it has
> >>>> not wired the WAKEUP line to a  GPIO.
> >>>>=20
> >>>>> The w2sg0004 is primarily a GPS device, so that needs to be stated =
in the
> >>>>> devices tree description.  If there are subcomponents that can usef=
ully be
> >>>>> described as well then there could be a place to describe those sub=
components.
> >>>>> I notice that there is a "1V8-out" pin, so presumable the chip can =
deliver a
> >>>>> 1V8 source based on its 3V3 input.  If a board made use of that, it=
 could be
> >>>>> useful to describe the regulator inside the GPS so it could be decl=
are that
> >>>>> some other device which needed 1V8 made use of that regulator=E2=80=
=A6.
> >>>>=20
> >>>> Yes. Well, even if *we* do not use it in this way yet, we should not=
 make it
> >>>> difficult for others to do by enforcing the wrong description.
> >>>=20
> >>> well this has nothing to do with the parent-child discussion, since
> >>> you can obviously reference a regulator independently of its
> >>> position in the DT.
> >>>=20
> >>>>>> Another example to think about: the twl4030 is also not a regulato=
r.
> >>>>>> Nevertheless they present some regulator nodes.
> >>>>>=20
> >>>>> The TWL4030 is a multifunction device which contains regulators and=
 GPIOs and
> >>>>> audio codec and  USB PHY etc etc etc.
> >>>>>=20
> >>>>> So in device-tree there is a device-node for the TWL4030, and it has
> >>>>> child-nodes for each sub-device.   They in turn can provide service=
s to other
> >>>>> devices on the board.
> >>>>=20
> >>>> Exactly as discussed above. And there, the parent>child relation for=
 the twl4030
> >>>> and its subdevices is right.
> >>>>=20
> >>>>> These sub-devices are much more independent of the whole than the r=
egulator
> >>>>> inside the w2sg0004 is.
> >>>>=20
> >>>> Hm. That is probably argueable as well. At least a vague ciriterion.
> >>>>>=20
> >>>>>>=20
> >>>>>> Or take the OMAP3 pbias_regulator. The OMAP3 isn=E2=80=99t a regul=
ator as well
> >>>>>> but has an internal pbias_regulator that needs to be controlled.
> >>>>>=20
> >>>>> I don't know much about a "pbias_regulator", but the OMAP3 is a mul=
tifunction
> >>>>> device which contains a CPU and multiple other controllers and  com=
municators
> >>>>> and stuff.  One of the components in the OMAP3 is this pbias_regula=
tor, and
> >>>>> it has a device-node which is a child of the 'ocp' node - which is =
the main
> >>>>> interconnect in the OMAP3 I think.
> >>>>>=20
> >>>>> So I'm not against describing the regulator in the w2sg0004, but for
> >>>>> consistency with everything else, it would need to be child-node of=
 a
> >>>>> device-node which describes the w2sg0004 as a whole.  I'm not sure =
that doing
> >>>>> that would gain anything.
> >>>>=20
> >>>> Well, it would gain consistency how chips with multiple components i=
nside
> >>>> are described.
> >>>=20
> >>> I don't think so. Many devices do not expose all of their
> >>> subdevices. e.g. they do not expose their internal clocks.
> >>> Apart from that there are a few devices in the kernel, which
> >>> do use enable-gpio(s).
> >>=20
> >> After reading http://www.devicetree.org/Device_Tree_Usage#Devices I mu=
st
> >> revise my formulation a little.
> >>=20
> >> It is not that parent>child is used for describing =E2=80=9Cbusses or =
grouping subdevices".
> >>=20
> >> It is only for =E2=80=9Cgrouping addressable components=E2=80=9D, whic=
h implies some bus.
> >>=20
> >> This still explains the ocp component of the OMAP3 - which represents =
the
> >> whole internal =E2=80=9Cinterconnect=E2=80=9D bus (see comment in omap=
3.dtsi).
> >>=20
> >> Therefore you are right. It is not correct to split up a device into a=
rbitrary
> >> components and group them again by the parent>child pattern.
> >>=20
> >> Although the structure of twl4030.dtsi appears to simply list and group
> >> subcomponents without telling explicitly how to address them.
> >=20
> > Yes and this style is not only used for twl4030, but also for other
> > multi function devices. I do not have a problem with splitting up a
> > device into components as long as they are referenced by other
> > components. There is no point in exposing all internal information.
> > For the system its not relevant, that the GPS chip has a 30MHz
> > clock if its part of the chip and nobody else is using it.
> >=20
> >>>> And would make it easier to see the whole w2sg0004 a child of /.
> >>>=20
> >>> Even with the regulator subdevice I would still make the w2sg0004 a
> >>> child of the UART port.
> >>=20
> >> This would mean that a tty / uart is able to address multiple clients.=
 How
> >> could it do that?
> >=20
> > In theory it's possible:
> >=20
> > ? -> uart -> multiplexer -> { device1, device2 }
> >=20
> > I hope nobody will build such a device, though :)
> >=20
> > I don't think addressability is important for a parent > child
> > connection, though. It is important for a reg node, of course.
>=20
> That is the key question I am trying to get founded answers, not
> opinions :)
>=20
> >=20
> >>> Main reason is, that I would need to go
> >>> through the UART to =E2=80=9Ccommunicate" with the w2sg0004.
> >>=20
> >> You can always "communicate=E2=80=9D through the UART. Even without DT=
=2E As
> >> long as the connected chip is powered up by any means (could be
> >> some fixed-regulator or hard wired).
> >>=20
> >> Power control for open()/close() did even work with the DT based
> >> DTR->virtual-gpio approach.
> >>=20
> >> We just do not described in the DT that there is a data connection
> >> from uart1 to the RX/TX pins. But you just open /dev/ttyO1.
> >>=20
> >> Thus, describing a relation between the uart node and the GPS chip
> >> in the DT is not even a requirement.
> >=20
> > It is when the kernel should be able to handle the GPS. The DT is
> > supposed to be independent from Linux and other operating systems
> > may want to hide the tty if a GPS is attached to it and instead
> > provide something like /dev/gps, which could automatically be picked
> > up by userspace software.
>=20
> Well, it is difficult to cover all future use cases.
>=20
> But then you can still add a uart =3D <&uart1> reference to the DT node
> of the driver. Because I understand that then the driver is the master
> (and needs access to a hidden UART) and not the GPS chip a slave of
> an exposed UART.

Ok. It seems we are still talk past each other. All use cases can be
implemented using both ways - putting the node to / or putting it
below the UART node. It simply does not matter, since kernel code
can interpret it as needed. You just asked at some time why we need
to know about the remote side.

=46rom my POV putting it below the UART node is more logical and from
your POV putting it below / is more logical.

> >> Probably the main problem we have is that we want to describe this
> >> data connection but the device tree is about describing how to
> >> address components and data flow is left to internal APIs. Or
> >> =E2=80=9Cports=E2=80=9D like in the video pipelines.
> >=20
> > As I wrote the tree structure shows how to "reach" a component for
> > accessing its configuration/data from the system.
>=20
> Yes, you wrote and I already pointed out that I disagree. It
> contradicts what
>=20
> http://www.devicetree.org/Device_Tree_Usage#Devices
>=20
> appears to tell me. So who is right?

=46rom my POV the page is simply focused on standard bindings, which
have already been established. If I understand you right, your POV
does not allow child nodes (which are not directly under /) without
reg property / address. Just have a look at the DT binding
documentation directory in the kernel - we already have them.

> >> Let me raise the question:
> >>=20
> >> Why do we need to describe in the DT (independently of Linux power
> >> control structures and drivers!) that the GPS data interface is
> >> connected to a specific UART?
> >> Who needs this information and for which purpose?
> >=20
> > Because an operating system can provide drivers, which completly
> > hide away the UART connection. Example:
> >=20
> > Let's assume we have an UART attached Bluetooth chip connected to
> > the second UART.
> >=20
> > In Linux, userspace currently must know, that the BT module is
> > connected to this port and correctly setup the port for BT usage.
> > Once this has been done the port is completly handled in the kernel
> > and userspace can ignore the UART.
>=20
> Ok, this is a reasonable example. But I still don=E2=80=99 see that it
> requires that the bt chip must be a subnode of the uart.

It doesn't. I just answered your question, which was independent
of the actual node position.

> > So why must the user configure the port? Because the kernel does not
> > know, that a BT chip is connected to the port.
>=20
> Then, I would suggest to write it like you have done:
>=20
> =E2=80=9Cthe BT chip is connected to the port uart1=E2=80=9D
>=20
> This can be easily translated into DT language:
>=20
> / {
> 	bt {
> 		compatible =3D =E2=80=9Cvendor,chip=E2=80=9D;
> 		uart =3D <&uart1>;	/* this chip is connected to uart1 */
> 		enable-gpio =3D <&gpio3 17 0>;
> 	};
> };
>=20
> This also resembles the =E2=80=9Cport=E2=80=9D mechanism (just simplified=
 because it is not
> a backwards forward linkage).
>=20
> Or exactly follows the pattern that a driver that wants to use
> some gpio simply links to the gpio controller. Or a driver wants
> to control a gpio.
>=20
> What I don=E2=80=99t understand is what is here so special to not use this
> DT pattern.
>=20
> But It could also open a different solution for the tty open() ->
> w2sg power on problem.
>=20
> / {
> 	gps {
> 		compatible =3D =E2=80=9Cwi2wi,w2sg0004=E2=80=9D;
> 		uart =3D <&uart1>;	/* this chip is connected to uart1 */
> 		enable-gpio =3D <&gpio3 17 0>;
> 	};
> };
>=20
> Here, the w2sg0004 probe function could register with uart1 to get notifi=
ed
> about open/close events and then do what it has to do.
>=20
> In that case the w2sg0004 driver would not even need to present itself
> as a virtual gpio (for DTR) or a regulator because it has a kernel intern=
al
> API to apply to tell the uart what it wants to do.

Again the same can be done if its a child-node of the UART. It is
simply a question of reading the "uart" property vs loading the
driver from the UART and access the parent device.

> > If the kernel gets
> > this information from DT it can do all the UART handling itself and
> > provide a bluetooth device without any user interaction.
>=20
> I think we should get a better understanding of the DT design patterns.
>=20
> IMHO (or IMPoV):
>=20
> * parent>child is not for describing =E2=80=9Ccontrol=E2=80=9D or =E2=80=
=9Cprimary interface=E2=80=9D but addressability

We obviously disagree here :)

> * if a driver needs access to another component, a reference property is =
used

Here we also disagree. The kernel also makes use of parent > child
connections (e.g. the driver for an i2c client node will request
data via its parent) and sometimes even sibling relationships (in
MFD devices).

So let me summarize:

 * Option A: Do not encode remote side information
   Rationale: UART port can be opened in userspace without that info
   Counterargument: This information is needed if the OS should be
   able to hide away the tty and provide support for the connected
   remote device (e.g. provide a bluetooth device instead of a tty)

 * Option B: Put UART remote side node to / and add a reference to the UART=
 port
   Rationale: DT wiki page indicates, that child nodes must be addressable

 * Option C: Put UART remote side node below the UART node
   Rationale: Remote device is accessed through the UART

Since this is about a subsystem binding DT maintainers ACK is
definitely needed, so maybe we should just wait for their decision.

-- Sebastian

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVFEsCAAoJENju1/PIO/qaSewQAI3+Lpmf3QJ4Nemd5WYJ3CMt
i2/2d0N0AE23zceR7cWZit7gPKCIAAKJi9wdxGdVxoyQ22536eEA8tm/EOSub0HG
pjHIncHHFGZ+9BE9uvYVi0SDd84IrpBKmCH+A7MG3oRpRcnTe8XGvWfry1Xwxaqf
AEFzvLxA+hewkMvL2BHE5Q1i9Y13YiyBpqo3v2RHNQaK5elE1ntObg+ivu2TLwj4
bBKl2Bnm2D6DoAh/kVQ54ZqGFTdHRC2xSOpWIiyArUCAFxhEPeWKi7uHbRdvrHUL
s5mVsm8qhTqA30eLnRVx5O5Eu+uyI0FRjKcEVSOPByyl0Kx+u8Uv/CNWI1OUesLC
93BjFFijIwvXWjcFinFX/PbH0Gk8+hRN+7ESo4OFhmpyJVWiEVLkfviDV7xLT6II
5hPTUtSl9Ag7FK2E7Dzhi/B/54HvC2t4DUemWhsZ5j0S4NxF/LdqZNgagV2hYou4
IrJ3XU3PkDNvc7lcj710KF4lVqW9idwoUJEJjfMeY212JhpLgvkNWU7PlDVY+VvW
25C9gEqI1OBRKpQeqghrXkpE/G3JP24lDRKGssMwM+Oc0cSZEwgaTaIFnOws+N/u
DrSyWlsqa++5LKMdOOY7dQecrJdYVvfcYxhaUapylhSoUOoDTAYQLSf/YRjBshvD
ShP2Kg/1zuNKk9Yev6JY
=I3TI
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
