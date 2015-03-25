From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Wed, 25 Mar 2015 16:21:11 +0100
Message-ID: <20150325152110.GA7903@earth>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <20150318055831.21025.33670.stgit@notabene.brown>
 <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com>
 <20150320195451.146a7915@notabene.brown>
 <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
 <20150321103122.23603014@notabene.brown>
 <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
 <20150325014543.GA967@earth>
 <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 25, 2015 at 08:59:14AM +0100, Dr. H. Nikolaus Schaller wrote:
> Am 25.03.2015 um 02:45 schrieb Sebastian Reichel <sre@kernel.org>:
> > On Tue, Mar 24, 2015 at 06:58:15PM +0100, Dr. H. Nikolaus Schaller wrot=
e:
> >> So you propose that the parent->child relationship is =E2=80=9Ccontrol=
=E2=80=9D? I.e. some
> >> channel which allows to address some bus client (through <reg>) and
> >> control that devices.
> >>=20
> >> Makes sense. This is how i2c and spi clients are specified.
> >>=20
> >>>=20
> >>> In the case of our GPS, it receives control over the serial connectio=
n from
> >>> the UART,
> >>=20
> >> Ahem - does it?
> >>=20
> >> AFAIK the chip simply starts to emit NMEA records if powered on.
> >> There is no command going over the serial interface to address it
> >> or control it.
> >=20
> > Right, since GPS basically doesn't need any configuration/control.
> > That=E2=80=99s not true for other UART attached devices, though.
>=20
> Do you have an example? Usually an UART data stream is transparently
> presented to a /dev/tty - and user-space daemon can configure/control the
> attached device. In most cases it can mix payload data and control command
> by some AT command and escape sequences.

Yes, but the configuration is minimal. Anyways as you said there
*is* some kind of control happening over the UART.

> >>> also receives control via a GPIO to the on/off pin, and also needs
> >>> a regulator to power the antenna.
> >>>=20
> >>> So should the parent be the uart, the on/off GPIO, or the regulator?
> >>>=20
> >>> I would much rather there wasn't a parent, and that each of these wer=
e listed
> >>> as ad-hoc attribute assignments.  But device-tree says there must be =
a parent
> >>> (where possible), and the parent is the thing that is =E2=80=9Cprimar=
ily" in control.
> >>=20
> >> Well, IMHO the =E2=80=9Cparent=E2=80=9D could also be the root. Repres=
enting the
> >> whole board.
> >>=20
> >> Nevertheless, I doubt your rule that =E2=80=9Cability to control=E2=80=
=9D defines
> >> the parent>child relation (see below).
> >>=20
> >>>=20
> >>> I think the GPS is =E2=80=9Cprimarily" a uart-attached device.
> >>=20
> >> But not in the same way as an I2C device.
> >>=20
> >> Especially the serial interface is not a bus and not used for
> >> signalling and power control. It is payload data (only).
> >=20
> > Actually many I2C devices are also powered on/off via a GPIO and
> > even use additional GPIOs for sending interrupts. Nevertheless they
> > are normally identified as an I2C device.
>=20
> Because I2C is a bus that can address multiple clients and gpio isn=E2=80=
=99t
> a bus and a point-to-point connection.
>=20
> But IMHO it is not because they (can) send payload data over i2c.

=46rom my POV it's not because I2C is a bus, but because the primary
function is happening via I2C (e.g. configuring sensor, gettings its
data). The GPIOs are only needed to compensate some I2C shortcomings
(missing irq feature in I2C) or reduce the complexity of the client
(power GPIO). The actual system interaction with the I2C chip is
going via I2C, though.

> > Also for non-GPS device the serial connection is used for
> > controlling and configuring the device.
>=20
> This assumes that =E2=80=9Ccontrols a device=E2=80=9D is the criterion fo=
r making a device
> a subnode. I doubt that.

For me the criterion always was "accessing the device's
registers/configuration/data" from the system's point of view (so
your video port does not count, since it models a connection between
two components without system interaction).

> >>> So I propose a device-node which describes the GPS, which is a child =
of the
> >>> UART, and explicitly identifies the GPIO it uses to power on/off, the
> >>> regulator it uses to power the antenna, and how it receives "on or of=
f"
> >>> status indications from the GPS.
> >>=20
> >> The more I think about that, you have given good arguments *not*
> >> to use the parent->child relationship for the UART interface of
> >> the GPS.
> >>=20
> >> Let me give another example. The 3G Modem has 3 (or 4) interfaces:
> >> 1. an USB-Interface for AT signalling and payload
> >> 2. some GPIOs for power control.
> >> 3. a PCM interface for digital voice.=20
> >> 4. it might also have a serial interface as alternate AT command and (=
GPRS
> >>    low speed) payload.
> >>=20
> >> So which one is the most prominent or most important to make it a chil=
d of?
> >>=20
> >> If you use =E2=80=9Ccontrol=E2=80=9D you must make it a child of the U=
SB phy and the serial interface
> >> which requires multiple inheritance=E2=80=A6
> >>=20
> >> So I am not sure at all. None is IMHO prominent and unique enough to m=
ake it
> >> a parent>child relation.
> >>=20
> >> Threrefore, I would be happy to see it as multiple children of /. For =
example a
> >> MFD with subnodes.
> >=20
> > This scenario has already been seen before and can happen for
> > non-UART based devices (e.g. SPI + I2C). So far the decision was to
> > postpone the discussion about this kind of devices until one of them
> > appears.
> >=20
> >>> It is arguable that the "antenna" should be treated as a separate dev=
ice - a
> >>> child of the GPS - which controls the regulator and also provides a '=
extcon'
> >>> which reports whether an external GPS antenna is attached, or whether=
 the
> >>> internal on is in use.  I haven't made the time to properly explore t=
hat
> >>> issue yet.
> >>=20
> >> If you assume that parent>child relationship is about control (only). =
But if it
> >> is about data flow, there is a different concept in DT. For example th=
e CSI/DSI
> >> (OMAP DSS) use the =E2=80=9Cport=E2=80=9D concept.
> >=20
> > Yes, this is about data not going to the cpu / system memory.
>=20
> Really? The frame buffer data is in system memory and gets to the panel. =
Or a
> camera image ends up in system memory.

Really? So the panel accesses the system memory? Check again. The
panel is simply connected via DSI/SDI/... and does not access the
system memory at all. The display controller OTH does. So let's have
a look at the DT structure (simplified):

ocp -> dss -> { port =3D <&panel>; }
=2E.. -> spi -> panel { port =3D <&dss>; }

So the port models a device-to-device connection, which works
independent of the remaining system. No system memory is involved.

> >> This means that indeed parent>child is used for control, e.g. I2C
> >> or SPI to tell the panel controller to switch on.
> >=20
> > well parent > child is not about power control, but about "primary"
> > control.
>=20
> Can you clearly and precisely define what =E2=80=9Cprimary=E2=80=9D contr=
ol is? I think
> two people will have three opinions about that.
>=20
> For example I would see the w2sg0004 on/off gpio as the primary =E2=80=9C=
control=E2=80=9D
> which makes the light (NMES records) turned on.
>=20
> Therefore we should make it the subnode of some gpio-controller, shouldn=
=E2=80=99t we?

I never thing of enable gpios to be the main interface, since it can
simply be connected to some voltage and be enabled constantly. It's
just some kind of helper for the device. It does not really exchange
data between the system and the device, though. (Note: This is
not true, if the GPIOs are used for bitbanging some high-level
protocol, in which case a virtual controller (like i2c-gpio) is
modelled in DT).

So let's have a look at the UART link again. It is transporting
non-trivial data from the UART to the system and it is handling
the data I actually want. It's providing access to the device's
"registers".

For me its clear, that one would expect the GPS under the UART
port, since when speaking with other developers I would describe
the GPS as being a "UART attached GPS chip". From me the
differences between a UART port and a SPI port from a system
software's POV can be reduced to missing multi-device support.

> > Some I2C/SPI devices have additional gpios for power
> > control.
> >=20
> >> For example we have the GTA04 panel as a subnode of SPI (because SPI i=
s a
> >> bus and the panel is controlled through SPI). Other panels need no con=
trol
> >> interface and are simply a child of /.
> >=20
> > Yes, some devices do not have an interface worth of being called
> > =E2=80=9Cprimary control" :)
>=20
> This is why I criticise this criterion to define when we need a
> parent/child relation.  It is not strict and does not follow a
> principle but opinions.
>=20
> But before we stick to opinions, I have studied again:
>=20
> 	http://www.devicetree.org/Device_Tree_Usage#Devices
>=20
> In their examples (which unfortunately don=E2=80=99t cover our special ca=
ses)
> they make clear that subnodes are needed for =E2=80=9Caddressable=E2=80=
=9D subnodes
> like CPUs, Memory banks, i2c clients, ethernet clients etc.
>=20
> (well, the first sentence in =E2=80=9CInterrupts=E2=80=9D can be read to =
confirm
> this interpretation: =E2=80=9CUnlike address range translation which
> follows the natural structure of the tree=E2=80=9D)
>=20
> In general I read from this (although it is not explicitly stated)
> that parent>child hierarchy is about addressing bus clients and
> mapping devices into memory address space.
>=20
> Everything else is to be done through references.

Actually I think so far we had only one similar case, so its not
obviously a corner case, which is underdocumented. The one similar
case is the HSI subystem, which I maintain (so obviously I'm biased
;)). It's also describing a 1:1 dependency (also serial, but with
multiple logical channels) and uses a child node.

Actually the nokia-modem binding is quite similar to your UART
attached GPS device. It has some GPIOs for power control and even
an additional GPIO for interrupting. The primary interface is still
the HSI one, which exchanges all of the configuration and data.

> >> The video stream and its connections are arranged through such ports.
> >> For the video out management we have added our OPA362 video amplifier =
into
> >> that video pipeline which starts at the VENC (Video encode) in the SoC,
> >> goes through the OPA362 and ends in the connector (which has its own
> >> node). All this is connected by references. The opa362 node itself is =
a child
> >> of /:=20
> >>=20
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm/boot/dts/omap3-gta04.dtsi?id=3Drefs/tags/v4.0-rc5#n98
> >>=20
> >> So to summarize I now see exactly two cases where parent>child is used:
> >> a) for components of an aggregate device (OMAP3 > I2C controllers)
> >> b) for components connected to a bus controller (I2C > TWL4030)
> >>=20
> >> Since the twl regulators are components of the twl chip it completely =
explains
> >> why we see
> >>=20
> >> omap3 > i2c > twl4030 > vaux4
> >>=20
> >> Everything else is done by references. Therefore we see references for
> >> * gpios within a controller (independently of it=E2=80=99s relation on=
 a bus)
> >> * regulators
> >> * clocks
> >> * any function that is not connected by a bus
> >>=20
> >> There is no need (and practice) to squeeze everything into a parent > =
child
> >> relationship. And I can=E2=80=99t see your =E2=80=9Ccontrol=E2=80=9D o=
r a =E2=80=9Cmain interface=E2=80=9D rule.
> >=20
> > And I can't see your bus rule for me the motiviation behind the
> > parent > child relationship is about the system's primary way for
> > accessing a device.
>=20
> It appears not to be =E2=80=9Cmy bus rule=E2=80=9D. I just formulated in =
that way from the
> examples I have seen=E2=80=A6

yes, me too ;)

> > It's coincidence, that this is currently (always?) a bus connection,
> > since most devices are actually connected using some kind of bus.
>=20
> I think the view must be reversed and then it is not a coincidence but a
> consequence.

so show me some non-bus connections, which are actually used to
exchange non-trivial data (with on/off being trivial). We currently
do not really have them.

> >> At least this is my (a little limited) view from using and programming=
 DT for
> >> multiple boards.
> >>=20
> >> Maybe this is what the DT list should comment or show a clear definiti=
on when
> >> parent>child relations are wanted and when not.
> >>=20
> >> Now back to the GPS chip connected to an UART.
> >>=20
> >> Is it
> >> a) a component of an aggregate device? no
> >> b) is it connected to a bus (i2c, spi, address bus)? no
> >=20
> >> This comes back to the question if UART is a bus.
> >>=20
> >> I still think that it is NOT a bus and therefore it should not be mode=
led in DT
> >> like busses are (enforcing clients to become subnodes).
> >=20
> > If I use a SPI device with hardwired chip select its *very* similar
> > to UART.
>=20
> Yes, because you can just connect a single client to SPI and then
> question if it is a bus. But that is a useage pattern but not a
> principle.
>=20
> And IMHO, DT definitions should follow principles and not current
> need.
>=20
> Otherwise I don=E2=80=99t understand why the virtual-gpio connected to
> UART DTR or the regulator is *not* acceptable.

I have missed virtual-gpio UART DTR discussion and assume, that the
regulator is about the regulator on the GPS chip?

I don't think the regulator is not acceptable. I simply think its
not useful. Basically the structure would be

uart {
    /* stuff */
    gps {
        vdd-supply =3D <&gpsreg>;
        /* stuff */

        gpsreg: regulator {
            enable-gpio =3D <GPIO 42>;
            /* stuff */
        }
    }
}

and could simply be

uart {
    /* stuff */
    gps {
        enable-gpio =3D <GPIO 42>;
        /* stuff */
    }
}

Without loosing important information. The regulator would only be
interesting if it is also used by other devices. Other devices also
do not expose their internal clocks etc.

> >> The reason is there no well defined protocol to make multiple clients =
and
> >> you can=E2=80=99t specify a <reg>.
> >>=20
> >> So you are either abusing the notion of a bus or the gps chip must be =
a separate
> >> DT node (child of something else).
> >>=20
> >> I hope my gut feeling that we are trying to do something fundamentally=
 wrong
> >> with making the gps chip a subode of serial is now argued a little bet=
ter.
> >>=20
> >> For making the serial device control some regulator through a referenc=
e to
> >> a regulator, I am very fine. It is what you do for the W2CBW bluetooth=
 part.
> >=20
> > NAK about referencing the regulator from the UART node. It should be
> > referenced from the Bluetooth / GPS node. The UART port works
> > without the regulator. It's the remote side, that does not work.
> > We also do not add the regulators of I2C clients to the I2C host.
>=20
> I think Pavel made a very good comment:
>=20
> The uart node should be able to power a rs232 converter/level shifter dir=
ectly
> connected to it (through a regulator or gpio-regulator).

Yes and this may belong to the UART node.

> And there must be a separate mechanism to power the remote rs232 converter
> and the remote device.

Yes and I think this goes to the remote device's node.

> The standard signalling for this are the RTS/DTR lines of an UART/RS232.
> UART is not only RX+TX.

so?

> > If you want to talk with an I2C device you enable the I2C device
> > *and* its parent (aka the I2C host controller). I guess the same
> > should be done for the UART.
> >=20
> >>>>>> All the following is very special logic for the w2sg0004 chip whic=
h should be
> >>>>>> divided out into a separate driver.
> >>>>>>=20
> >>>>>> Marek and me already had proposed such a chip specific driver (to =
be located
> >>>>>> in drivers/misc) some months ago. It would encapsulate everything =
w2sg0004
> >>>>>> specific and present itself as a regulator (because that is its ma=
in purpose:
> >>>>>> control the LDO regulator inside the w2sg0004 chip).
> >>>>>=20
> >>>>> Presenting itself as a regulator would be wrong because it isn=E2=
=80=99t a regulator.
> >>>>=20
> >>>> It has a regulator that can be controlled by a gpio=E2=80=A6
> >>>=20
> >>> Does it?  I guess may it does.
> >>> Maybe it also has an ARM core and some memory and assorted other bits=
 and
> >>> pieces.  But we don=E2=80=99t really need to describe them to device =
tree.
> >>=20
> >> Well, if I look into the data sheet, it has indeed an LDO from 3.3V to=
 1.8V.
> >>=20
> >> Not to make you confused: the w2sg0084 would have a WAKEUP output whic=
h - if
> >> connected to a GPIO - would tell if the module is really active or not=
=2E Using this would
> >> make monitoring the RX line through different pinmux states obsolete.
> >>=20
> >> But the only Linux board using the w2sg00x4 appears to be the GTA04 an=
d it has
> >> not wired the WAKEUP line to a  GPIO.
> >>=20
> >>> The w2sg0004 is primarily a GPS device, so that needs to be stated in=
 the
> >>> devices tree description.  If there are subcomponents that can useful=
ly be
> >>> described as well then there could be a place to describe those subco=
mponents.
> >>> I notice that there is a "1V8-out" pin, so presumable the chip can de=
liver a
> >>> 1V8 source based on its 3V3 input.  If a board made use of that, it c=
ould be
> >>> useful to describe the regulator inside the GPS so it could be declar=
e that
> >>> some other device which needed 1V8 made use of that regulator=E2=80=
=A6.
> >>=20
> >> Yes. Well, even if *we* do not use it in this way yet, we should not m=
ake it
> >> difficult for others to do by enforcing the wrong description.
> >=20
> > well this has nothing to do with the parent-child discussion, since
> > you can obviously reference a regulator independently of its
> > position in the DT.
> >=20
> >>>> Another example to think about: the twl4030 is also not a regulator.
> >>>> Nevertheless they present some regulator nodes.
> >>>=20
> >>> The TWL4030 is a multifunction device which contains regulators and G=
PIOs and
> >>> audio codec and  USB PHY etc etc etc.
> >>>=20
> >>> So in device-tree there is a device-node for the TWL4030, and it has
> >>> child-nodes for each sub-device.   They in turn can provide services =
to other
> >>> devices on the board.
> >>=20
> >> Exactly as discussed above. And there, the parent>child relation for t=
he twl4030
> >> and its subdevices is right.
> >>=20
> >>> These sub-devices are much more independent of the whole than the reg=
ulator
> >>> inside the w2sg0004 is.
> >>=20
> >> Hm. That is probably argueable as well. At least a vague ciriterion.
> >>>=20
> >>>>=20
> >>>> Or take the OMAP3 pbias_regulator. The OMAP3 isn=E2=80=99t a regulat=
or as well
> >>>> but has an internal pbias_regulator that needs to be controlled.
> >>>=20
> >>> I don't know much about a "pbias_regulator", but the OMAP3 is a multi=
function
> >>> device which contains a CPU and multiple other controllers and  commu=
nicators
> >>> and stuff.  One of the components in the OMAP3 is this pbias_regulato=
r, and
> >>> it has a device-node which is a child of the 'ocp' node - which is th=
e main
> >>> interconnect in the OMAP3 I think.
> >>>=20
> >>> So I'm not against describing the regulator in the w2sg0004, but for
> >>> consistency with everything else, it would need to be child-node of a
> >>> device-node which describes the w2sg0004 as a whole.  I'm not sure th=
at doing
> >>> that would gain anything.
> >>=20
> >> Well, it would gain consistency how chips with multiple components ins=
ide
> >> are described.
> >=20
> > I don't think so. Many devices do not expose all of their
> > subdevices. e.g. they do not expose their internal clocks.
> > Apart from that there are a few devices in the kernel, which
> > do use enable-gpio(s).
>=20
> After reading http://www.devicetree.org/Device_Tree_Usage#Devices I must
> revise my formulation a little.
>=20
> It is not that parent>child is used for describing =E2=80=9Cbusses or gro=
uping subdevices".
>=20
> It is only for =E2=80=9Cgrouping addressable components=E2=80=9D, which i=
mplies some bus.
>=20
> This still explains the ocp component of the OMAP3 - which represents the
> whole internal =E2=80=9Cinterconnect=E2=80=9D bus (see comment in omap3.d=
tsi).
>=20
> Therefore you are right. It is not correct to split up a device into arbi=
trary
> components and group them again by the parent>child pattern.
>=20
> Although the structure of twl4030.dtsi appears to simply list and group
> subcomponents without telling explicitly how to address them.

Yes and this style is not only used for twl4030, but also for other
multi function devices. I do not have a problem with splitting up a
device into components as long as they are referenced by other
components. There is no point in exposing all internal information.
For the system its not relevant, that the GPS chip has a 30MHz
clock if its part of the chip and nobody else is using it.

> >> And would make it easier to see the whole w2sg0004 a child of /.
> >=20
> > Even with the regulator subdevice I would still make the w2sg0004 a
> > child of the UART port.
>=20
> This would mean that a tty / uart is able to address multiple clients. How
> could it do that?

In theory it's possible:

? -> uart -> multiplexer -> { device1, device2 }

I hope nobody will build such a device, though :)

I don't think addressability is important for a parent > child
connection, though. It is important for a reg node, of course.

> > Main reason is, that I would need to go
> > through the UART to =E2=80=9Ccommunicate" with the w2sg0004.
>=20
> You can always "communicate=E2=80=9D through the UART. Even without DT. As
> long as the connected chip is powered up by any means (could be
> some fixed-regulator or hard wired).
>=20
> Power control for open()/close() did even work with the DT based
> DTR->virtual-gpio approach.
>=20
> We just do not described in the DT that there is a data connection
> from uart1 to the RX/TX pins. But you just open /dev/ttyO1.
>=20
> Thus, describing a relation between the uart node and the GPS chip
> in the DT is not even a requirement.

It is when the kernel should be able to handle the GPS. The DT is
supposed to be independent from Linux and other operating systems
may want to hide the tty if a GPS is attached to it and instead
provide something like /dev/gps, which could automatically be picked
up by userspace software.

> Probably the main problem we have is that we want to describe this
> data connection but the device tree is about describing how to
> address components and data flow is left to internal APIs. Or
> =E2=80=9Cports=E2=80=9D like in the video pipelines.

As I wrote the tree structure shows how to "reach" a component for
accessing its configuration/data from the system.

> Let me raise the question:
>=20
> Why do we need to describe in the DT (independently of Linux power
> control structures and drivers!) that the GPS data interface is
> connected to a specific UART?
> Who needs this information and for which purpose?

Because an operating system can provide drivers, which completly
hide away the UART connection. Example:

Let's assume we have an UART attached Bluetooth chip connected to
the second UART.

In Linux, userspace currently must know, that the BT module is
connected to this port and correctly setup the port for BT usage.
Once this has been done the port is completly handled in the kernel
and userspace can ignore the UART.

So why must the user configure the port? Because the kernel does not
know, that a BT chip is connected to the port. If the kernel gets
this information from DT it can do all the UART handling itself and
provide a bluetooth device without any user interaction.

-- Sebastian

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVEtJkAAoJENju1/PIO/qaKgoP/113CwxJ5froUQRx3scBksRg
Nd3DKyh3E9dIn8QZQw9Qjr8szzR3ckJWxHp6sWLERNtRsD4D2/jXsUQbwj+cK1uz
CfkW2MMXq0PbB2xVNiXWIMFsHrUsLvNTGTLcY31K5f/jdjW9UGPjdCKb7thcwjeU
Ba5lrVruqXoSVkmk5WLhlmMGEP2sxv5VWlVBCVXJmLYkj/uSs462arMpUSp85bXQ
RbHKv9qsRHBbBABRoTfoN3guIVcilIC63wELyXE8KJPxRP4FVNMGz2YE6vhmJ1wc
pq2FnRLMktP0fxmgMI2/Z43Y7Pe8jy7xYhWfvdaG0u7m/bCISiqQ5xABN4cqfU1b
bD9A9NgxHZfBL/jvUY8baapOe87JI5Jkki7wAqj8SDv3jVKn0ihm94kZNhd68FrG
8qgezXi4WOglKCdlm/DwzJEK6i+jQ3YTT83/lVGQquTyJjrdrqJp9eji2Z88kmrH
DK3FJ9NKEuAn02tLxXoPx1yvoNhHeaRrb6/zK87/xo620uz1RLMjeAmgJGmqi8ZV
GQIN6rzVaxuVNllGUhQMXmy3LYkN1pkErfDjPnrM40fNRzM7r18M74WOlJ+zDUrG
6jBqeB+CLpxMy81l3fjjeYS2iyA6iqIlRmey+vx7TKTJKksHR5+Lny6q9qcMf+gA
EQvSsR24GwbPSQnqTxOO
=EuE2
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
