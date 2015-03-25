From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Wed, 25 Mar 2015 02:45:43 +0100
Message-ID: <20150325014543.GA967@earth>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <20150318055831.21025.33670.stgit@notabene.brown>
 <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com>
 <20150320195451.146a7915@notabene.brown>
 <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com>
 <20150321103122.23603014@notabene.brown>
 <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 24, 2015 at 06:58:15PM +0100, Dr. H. Nikolaus Schaller wrote:
> So you propose that the parent->child relationship is =E2=80=9Ccontrol=E2=
=80=9D? I.e. some
> channel which allows to address some bus client (through <reg>) and
> control that devices.
>=20
> Makes sense. This is how i2c and spi clients are specified.
>=20
> >=20
> > In the case of our GPS, it receives control over the serial connection =
=66rom
> > the UART,
>=20
> Ahem - does it?
>=20
> AFAIK the chip simply starts to emit NMEA records if powered on.
> There is no command going over the serial interface to address it
> or control it.

Right, since GPS basically doesn't need any configuration/control.
That's not true for other UART attached devices, though.

> > also receives control via a GPIO to the on/off pin, and also needs
> > a regulator to power the antenna.
> >=20
> > So should the parent be the uart, the on/off GPIO, or the regulator?
> >=20
> > I would much rather there wasn't a parent, and that each of these were =
listed
> > as ad-hoc attribute assignments.  But device-tree says there must be a =
parent
> > (where possible), and the parent is the thing that is =E2=80=9Cprimaril=
y" in control.
>=20
> Well, IMHO the =E2=80=9Cparent=E2=80=9D could also be the root. Represent=
ing the
> whole board.
>=20
> Nevertheless, I doubt your rule that =E2=80=9Cability to control=E2=80=9D=
 defines
> the parent>child relation (see below).
>=20
> >=20
> > I think the GPS is =E2=80=9Cprimarily" a uart-attached device.
>=20
> But not in the same way as an I2C device.
>=20
> Especially the serial interface is not a bus and not used for
> signalling and power control. It is payload data (only).

Actually many I2C devices are also powered on/off via a GPIO and
even use additional GPIOs for sending interrupts. Nevertheless they
are normally identified as an I2C device.

Also for non-GPS device the serial connection is used for
controlling and configuring the device.

> > So I propose a device-node which describes the GPS, which is a child of=
 the
> > UART, and explicitly identifies the GPIO it uses to power on/off, the
> > regulator it uses to power the antenna, and how it receives "on or off"
> > status indications from the GPS.
>=20
> The more I think about that, you have given good arguments *not*
> to use the parent->child relationship for the UART interface of
> the GPS.
>=20
> Let me give another example. The 3G Modem has 3 (or 4) interfaces:
> 1. an USB-Interface for AT signalling and payload
> 2. some GPIOs for power control.
> 3. a PCM interface for digital voice.=20
> 4. it might also have a serial interface as alternate AT command and (GPRS
>     low speed) payload.
>=20
> So which one is the most prominent or most important to make it a child o=
f?
>=20
> If you use =E2=80=9Ccontrol=E2=80=9D you must make it a child of the USB =
phy and the serial interface
> which requires multiple inheritance=E2=80=A6
>=20
> So I am not sure at all. None is IMHO prominent and unique enough to make=
 it
> a parent>child relation.
>
> Threrefore, I would be happy to see it as multiple children of /. For exa=
mple a
> MFD with subnodes.

This scenario has already been seen before and can happen for
non-UART based devices (e.g. SPI + I2C). So far the decision was to
postpone the discussion about this kind of devices until one of them
appears.

> > It is arguable that the "antenna" should be treated as a separate devic=
e - a
> > child of the GPS - which controls the regulator and also provides a 'ex=
tcon'
> > which reports whether an external GPS antenna is attached, or whether t=
he
> > internal on is in use.  I haven't made the time to properly explore that
> > issue yet.
>=20
> If you assume that parent>child relationship is about control (only). But=
 if it
> is about data flow, there is a different concept in DT. For example the C=
SI/DSI
> (OMAP DSS) use the =E2=80=9Cport=E2=80=9D concept.

Yes, this is about data not going to the cpu / system memory.

> This means that indeed parent>child is used for control, e.g. I2C
> or SPI to tell the panel controller to switch on.

well parent > child is not about power control, but about "primary"
control. Some I2C/SPI devices have additional gpios for power
control.

> For example we have the GTA04 panel as a subnode of SPI (because SPI is a
> bus and the panel is controlled through SPI). Other panels need no control
> interface and are simply a child of /.

Yes, some devices do not have an interface worth of being called
"primary control" :)

> The video stream and its connections are arranged through such ports.
> For the video out management we have added our OPA362 video amplifier into
> that video pipeline which starts at the VENC (Video encode) in the SoC,
> goes through the OPA362 and ends in the connector (which has its own
> node). All this is connected by references. The opa362 node itself is a c=
hild
> of /:=20
>=20
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch=
/arm/boot/dts/omap3-gta04.dtsi?id=3Drefs/tags/v4.0-rc5#n98
>=20
> So to summarize I now see exactly two cases where parent>child is used:
> a) for components of an aggregate device (OMAP3 > I2C controllers)
> b) for components connected to a bus controller (I2C > TWL4030)
>=20
> Since the twl regulators are components of the twl chip it completely exp=
lains
> why we see
>=20
> omap3 > i2c > twl4030 > vaux4
>=20
> Everything else is done by references. Therefore we see references for
> * gpios within a controller (independently of it=E2=80=99s relation on a =
bus)
> * regulators
> * clocks
> * any function that is not connected by a bus
>
> There is no need (and practice) to squeeze everything into a parent > chi=
ld
> relationship. And I can=E2=80=99t see your =E2=80=9Ccontrol=E2=80=9D or a=
 =E2=80=9Cmain interface=E2=80=9D rule.

And I can't see your bus rule for me the motiviation behind the
parent > child relationship is about the system's primary way for
accessing a device.

It's coincidence, that this is currently (always?) a bus connection,
since most devices are actually connected using some kind of bus.

> At least this is my (a little limited) view from using and programming DT=
 for
> multiple boards.
>=20
> Maybe this is what the DT list should comment or show a clear definition =
when
> parent>child relations are wanted and when not.
>
> Now back to the GPS chip connected to an UART.
>=20
> Is it
> a) a component of an aggregate device? no
> b) is it connected to a bus (i2c, spi, address bus)? no

> This comes back to the question if UART is a bus.
>=20
> I still think that it is NOT a bus and therefore it should not be modeled=
 in DT
> like busses are (enforcing clients to become subnodes).

If I use a SPI device with hardwired chip select its *very* similar
to UART.

> The reason is there no well defined protocol to make multiple clients and
> you can=E2=80=99t specify a <reg>.
>=20
> So you are either abusing the notion of a bus or the gps chip must be a s=
eparate
> DT node (child of something else).
>
> I hope my gut feeling that we are trying to do something fundamentally wr=
ong
> with making the gps chip a subode of serial is now argued a little better.
>=20
> For making the serial device control some regulator through a reference to
> a regulator, I am very fine. It is what you do for the W2CBW bluetooth pa=
rt.

NAK about referencing the regulator from the UART node. It should be
referenced from the Bluetooth / GPS node. The UART port works
without the regulator. It's the remote side, that does not work.
We also do not add the regulators of I2C clients to the I2C host.

If you want to talk with an I2C device you enable the I2C device
*and* its parent (aka the I2C host controller). I guess the same
should be done for the UART.

> >>>> All the following is very special logic for the w2sg0004 chip which =
should be
> >>>> divided out into a separate driver.
> >>>>=20
> >>>> Marek and me already had proposed such a chip specific driver (to be=
 located
> >>>> in drivers/misc) some months ago. It would encapsulate everything w2=
sg0004
> >>>> specific and present itself as a regulator (because that is its main=
 purpose:
> >>>> control the LDO regulator inside the w2sg0004 chip).
> >>>=20
> >>> Presenting itself as a regulator would be wrong because it isn=E2=80=
=99t a regulator.
> >>=20
> >> It has a regulator that can be controlled by a gpio=E2=80=A6
> >=20
> > Does it?  I guess may it does.
> > Maybe it also has an ARM core and some memory and assorted other bits a=
nd
> > pieces.  But we don=E2=80=99t really need to describe them to device tr=
ee.
>=20
> Well, if I look into the data sheet, it has indeed an LDO from 3.3V to 1.=
8V.
>=20
> Not to make you confused: the w2sg0084 would have a WAKEUP output which -=
 if
> connected to a GPIO - would tell if the module is really active or not. U=
sing this would
> make monitoring the RX line through different pinmux states obsolete.
>=20
> But the only Linux board using the w2sg00x4 appears to be the GTA04 and i=
t has
> not wired the WAKEUP line to a  GPIO.
>
> > The w2sg0004 is primarily a GPS device, so that needs to be stated in t=
he
> > devices tree description.  If there are subcomponents that can usefully=
 be
> > described as well then there could be a place to describe those subcomp=
onents.
> > I notice that there is a "1V8-out" pin, so presumable the chip can deli=
ver a
> > 1V8 source based on its 3V3 input.  If a board made use of that, it cou=
ld be
> > useful to describe the regulator inside the GPS so it could be declare =
that
> > some other device which needed 1V8 made use of that regulator=E2=80=A6.
>=20
> Yes. Well, even if *we* do not use it in this way yet, we should not make=
 it
> difficult for others to do by enforcing the wrong description.

well this has nothing to do with the parent-child discussion, since
you can obviously reference a regulator independently of its
position in the DT.

> >> Another example to think about: the twl4030 is also not a regulator.
> >> Nevertheless they present some regulator nodes.
> >=20
> > The TWL4030 is a multifunction device which contains regulators and GPI=
Os and
> > audio codec and  USB PHY etc etc etc.
> >=20
> > So in device-tree there is a device-node for the TWL4030, and it has
> > child-nodes for each sub-device.   They in turn can provide services to=
 other
> > devices on the board.
>=20
> Exactly as discussed above. And there, the parent>child relation for the =
twl4030
> and its subdevices is right.
>=20
> > These sub-devices are much more independent of the whole than the regul=
ator
> > inside the w2sg0004 is.
>=20
> Hm. That is probably argueable as well. At least a vague ciriterion.
> >=20
> >>=20
> >> Or take the OMAP3 pbias_regulator. The OMAP3 isn=E2=80=99t a regulator=
 as well
> >> but has an internal pbias_regulator that needs to be controlled.
> >=20
> > I don't know much about a "pbias_regulator", but the OMAP3 is a multifu=
nction
> > device which contains a CPU and multiple other controllers and  communi=
cators
> > and stuff.  One of the components in the OMAP3 is this pbias_regulator,=
 and
> > it has a device-node which is a child of the 'ocp' node - which is the =
main
> > interconnect in the OMAP3 I think.
> >=20
> > So I'm not against describing the regulator in the w2sg0004, but for
> > consistency with everything else, it would need to be child-node of a
> > device-node which describes the w2sg0004 as a whole.  I'm not sure that=
 doing
> > that would gain anything.
>=20
> Well, it would gain consistency how chips with multiple components inside
> are described.

I don't think so. Many devices do not expose all of their
subdevices. e.g. they do not expose their internal clocks.
Apart from that there are a few devices in the kernel, which
do use enable-gpio(s).

> And would make it easier to see the whole w2sg0004 a child of /.

Even with the regulator subdevice I would still make the w2sg0004 a
child of the UART port. Main reason is, that I would need to go
through the UART to "communicate" with the w2sg0004.

> But then we need some reference from your tty/serial driver to
> that w2sg node.

-- Sebastian

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVEhNEAAoJENju1/PIO/qaiYIP/RMl8QeSNx+oC+3ZQxhst3yJ
wyCnhVUF4qGgHF7de8P5lj59Naqvwk/88kCahe/pmE5IYnknQWc60dkqqBhG/Dxs
VWL2TxSpzHwcrrCunOVug4O8PODbbiPE2DvSl7W6kPTT8tNE13lUOH6vKmYfAv6+
o4rVFEwoWyLmjYyf+g5lwx+wFLeV8cBqXRIDFGflPnCVqUuZ9OAXCIavn1hLxYFN
iYHfgQPQtQ7NfGCPhIVfm2oD3PrkCP2gaI1zQolVQoGT5gaEigiKz0n1eTAbzF6x
eDKSlXGpLEQ9LdI35bJQRDw6T1g40Pcvcq9s1cNdQrXLb5jPqSr2bjeaWEG9Znpd
tFqtbt1ypFWB8zGgSFQ4fTlfkPCo0/InYv6y+kmFieui5sSHB1Pn2jiHAvZmLjJ4
IQHvSGY6mUkQHAiqFUP0FhlVyk+qPF9ZKG6kHGiyl+c+prvch7V6GYoH5/j6C/d4
Qo5imKC+lC7Y5gGkp2EpK+QkgRCXgPc1827ETp4caDL7JvHZLmi9INeh3fT3FYvj
LmORJTNAXk9Za+RFQHg7v5saahPqKlFymrOTOcwQ2X+5qdj9ymufYpmReIm0HjS4
WCRBj8cjEgkpaKjSY54Fswlb4iCNax0fbFoMLgUohgS6H8WOuBUdZyaBvireBres
N1+Gy963517Om3He05WJ
=5LOd
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
