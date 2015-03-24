From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power on/off UART attached devices.
Date: Tue, 24 Mar 2015 18:58:15 +0100
Message-ID: <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <20150318055831.21025.33670.stgit@notabene.brown> <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com> <20150320195451.146a7915@notabene.brown> <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com> <20150321103122.23603014@notabene.brown>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150321103122.23603014@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 21.03.2015 um 00:31 schrieb NeilBrown <neilb@suse.de>:

> On Fri, 20 Mar 2015 10:34:18 +0100 "Dr. H. Nikolaus Schaller"
> <hns@goldelico.com> wrote:
>=20
>>=20
>> Am 20.03.2015 um 09:54 schrieb NeilBrown <neilb@suse.de>:
>=20
>>> There needs to be one device-node for each device, and that device-=
node needs
>>> to be a child of the device-node for the device which is the primar=
y
>>> connection to the child device.
>>=20
>> Then please explain to me nodes like
>>=20
>> / {
>> 	compatible =3D "ti,omap3-gta04", "ti,omap36xx", "ti,omap3";
>>=20
>> 	cpus {
>> 		cpu@0 {
>> 			cpu0-supply =3D <&vcc>;
>> 		};
>> 	};
>>=20
>> According to the rule you apply here it should be something like
>>=20
>> 	cpu@0 {
>> 		regulator {
>> 			=85
>> 		}
>>=20
>>=20
>=20
> This exactly highlight one of the big problems with device tree as I =
see it.
>=20
> Each device can potentially have relationships with a number of other
> devices, for the supply of power, reset signalling, interrupt handled=
, data
> transfer, command transfer etc etc etc.

Yes. The network is a mesh.

>=20
> devicetree provides two ways to indicated a relationship between devi=
ces.
> One way is a parent/child arrangement.  The other way is ad-hoc
>   attribute =3D <&devicename>
> assignments.

Yes.

>=20
> Each device can only have one parent, but can have multiple arbitrary
> assignments.
>=20
> I would much rather that the parent/child relationship didn't exist a=
t all.
> Each device should stand alone, and list all relationships explicitly=
=2E  But
> that is not the way devicetree works, and we need to live with that.

Is it not how the device tree works or how we use it? Or how you think =
it
should better be?

What stops us from using it in arbitrary assignments like clocks and
regulators?

GPIOs are also a nice example: you just specify the gpio controller
and the gpio number to use it. There is no parent/child connection.

Why for tty / serial and serial consumers but not for GPIOs?

I have tried to find out the rules when parent>child is used (see below=
).

>=20
> So we need a clear understanding of what the 'parent' of a given devi=
ce
> should be.
> I don't know what the specifications say, if anything, but what I see=
 is that
> the parent is in practive a device which can =91address' the child. =20

I think this holds only for =93bus=94 devices - where it is really a go=
od and
standard way of structuring the bus and it=92s masters/slaves. One chil=
d
node per client.

> i.e.
> control signalling is the key parent->child relationship.
> This is consistent with the fact that many device nodes have a=20
> 		reg=3D<xxx>
> attribute which gives the address of the node as seen by it's parent.
>=20
> Given that understanding, a regulator must be a child of the device w=
hich can
> control it - which can turn it on or off.  Not a child of the device =
which
> receives power from it.

So you propose that the parent->child relationship is =93control=94? I.=
e. some
channel which allows to address some bus client (through <reg>) and
control that devices.

Makes sense. This is how i2c and spi clients are specified.

>=20
> In the case of our GPS, it receives control over the serial connectio=
n from
> the UART,

Ahem - does it?

AFAIK the chip simply starts to emit NMEA records if powered on. There =
is no
command going over the serial interface to address it or control it.

> also receives control via a GPIO to the on/off pin, and also needs
> a regulator to power the antenna.
>=20
> So should the parent be the uart, the on/off GPIO, or the regulator?
>=20
> I would much rather there wasn't a parent, and that each of these wer=
e listed
> as ad-hoc attribute assignments.  But device-tree says there must be =
a parent
> (where possible), and the parent is the thing that is =93primarily" i=
n control.

Well, IMHO the =93parent=94 could also be the root. Representing the wh=
ole board.

Nevertheless, I doubt your rule that =93ability to control=94 defines t=
he parent>child
relation (see below).

>=20
> I think the GPS is =93primarily" a uart-attached device.

But not in the same way as an I2C device.

Especially the serial interface is not a bus and not used for signallin=
g and
power control. It is payload data (only).

> So I propose a device-node which describes the GPS, which is a child =
of the
> UART, and explicitly identifies the GPIO it uses to power on/off, the
> regulator it uses to power the antenna, and how it receives "on or of=
f"
> status indications from the GPS.

The more I think about that, you have given good arguments *not* to use=
 the
parent->child relationship for the UART interface of the GPS.

Let me give another example. The 3G Modem has 3 (or 4) interfaces:
1. an USB-Interface for AT signalling and payload
2. some GPIOs for power control.
3. a PCM interface for digital voice.=20
4. it might also have a serial interface as alternate AT command and (G=
PRS
    low speed) payload.

So which one is the most prominent or most important to make it a child=
 of?

If you use =93control=94 you must make it a child of the USB phy and th=
e serial interface
which requires multiple inheritance=85

So I am not sure at all. None is IMHO prominent and unique enough to ma=
ke it
a parent>child relation.

Threrefore, I would be happy to see it as multiple children of /. For e=
xample a
MFD with subnodes.

>=20
> It is arguable that the "antenna" should be treated as a separate dev=
ice - a
> child of the GPS - which controls the regulator and also provides a '=
extcon'
> which reports whether an external GPS antenna is attached, or whether=
 the
> internal on is in use.  I haven't made the time to properly explore t=
hat
> issue yet.

If you assume that parent>child relationship is about control (only). B=
ut if it
is about data flow, there is a different concept in DT. For example the=
 CSI/DSI
(OMAP DSS) use the =93port=94 concept. This means that indeed parent>ch=
ild is
used for control, e.g. I2C or SPI to tell the panel controller to switc=
h on.

=46or example we have the GTA04 panel as a subnode of SPI (because SPI =
is a
bus and the panel is controlled through SPI). Other panels need no cont=
rol
interface and are simply a child of /.

The video stream and its connections are arranged through such ports.
=46or the video out management we have added our OPA362 video amplifier=
 into
that video pipeline which starts at the VENC (Video encode) in the SoC,
goes through the OPA362 and ends in the connector (which has its own
node). All this is connected by references. The opa362 node itself is a=
 child
of /:=20

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/ar=
ch/arm/boot/dts/omap3-gta04.dtsi?id=3Drefs/tags/v4.0-rc5#n98

So to summarize I now see exactly two cases where parent>child is used:
a) for components of an aggregate device (OMAP3 > I2C controllers)
b) for components connected to a bus controller (I2C > TWL4030)

Since the twl regulators are components of the twl chip it completely e=
xplains
why we see

omap3 > i2c > twl4030 > vaux4

Everything else is done by references. Therefore we see references for
* gpios within a controller (independently of it=92s relation on a bus)
* regulators
* clocks
* any function that is not connected by a bus

There is no need (and practice) to squeeze everything into a parent > c=
hild
relationship. And I can=92t see your =93control=94 or a =93main interfa=
ce=94 rule.

At least this is my (a little limited) view from using and programming =
DT for
multiple boards.

Maybe this is what the DT list should comment or show a clear definitio=
n when
parent>child relations are wanted and when not.


Now back to the GPS chip connected to an UART.

Is it
a) a component of an aggregate device? no
b) is it connected to a bus (i2c, spi, address bus)? no

This comes back to the question if UART is a bus.

I still think that it is NOT a bus and therefore it should not be model=
ed in DT
like busses are (enforcing clients to become subnodes).

The reason is there no well defined protocol to make multiple clients a=
nd
you can=92t specify a <reg>.

So you are either abusing the notion of a bus or the gps chip must be a=
 separate
DT node (child of something else).

I hope my gut feeling that we are trying to do something fundamentally =
wrong
with making the gps chip a subode of serial is now argued a little bett=
er.

=46or making the serial device control some regulator through a referen=
ce to
a regulator, I am very fine. It is what you do for the W2CBW bluetooth =
part.

>=20
>>>>=20
>>>> All the following is very special logic for the w2sg0004 chip whic=
h should be
>>>> divided out into a separate driver.
>>>>=20
>>>> Marek and me already had proposed such a chip specific driver (to =
be located
>>>> in drivers/misc) some months ago. It would encapsulate everything =
w2sg0004
>>>> specific and present itself as a regulator (because that is its ma=
in purpose:
>>>> control the LDO regulator inside the w2sg0004 chip).
>>>=20
>>> Presenting itself as a regulator would be wrong because it isn=92t =
a regulator.
>>=20
>> It has a regulator that can be controlled by a gpio=85
>=20
> Does it?  I guess may it does.
> Maybe it also has an ARM core and some memory and assorted other bits=
 and
> pieces.  But we don=92t really need to describe them to device tree.

Well, if I look into the data sheet, it has indeed an LDO from 3.3V to =
1.8V.

Not to make you confused: the w2sg0084 would have a WAKEUP output which=
 - if
connected to a GPIO - would tell if the module is really active or not.=
 Using this would
make monitoring the RX line through different pinmux states obsolete.

But the only Linux board using the w2sg00x4 appears to be the GTA04 and=
 it has
not wired the WAKEUP line to a  GPIO.

>=20
> The w2sg0004 is primarily a GPS device, so that needs to be stated in=
 the
> devices tree description.  If there are subcomponents that can useful=
ly be
> described as well then there could be a place to describe those subco=
mponents.
> I notice that there is a "1V8-out" pin, so presumable the chip can de=
liver a
> 1V8 source based on its 3V3 input.  If a board made use of that, it c=
ould be
> useful to describe the regulator inside the GPS so it could be declar=
e that
> some other device which needed 1V8 made use of that regulator=85.

Yes. Well, even if *we* do not use it in this way yet, we should not ma=
ke it
difficult for others to do by enforcing the wrong description.

>=20
>>=20
>> Another example to think about: the twl4030 is also not a regulator.
>> Nevertheless they present some regulator nodes.
>=20
> The TWL4030 is a multifunction device which contains regulators and G=
PIOs and
> audio codec and  USB PHY etc etc etc.
>=20
> So in device-tree there is a device-node for the TWL4030, and it has
> child-nodes for each sub-device.   They in turn can provide services =
to other
> devices on the board.

Exactly as discussed above. And there, the parent>child relation for th=
e twl4030
and its subdevices is right.

> These sub-devices are much more independent of the whole than the reg=
ulator
> inside the w2sg0004 is.

Hm. That is probably argueable as well. At least a vague ciriterion.

>=20
>>=20
>> Or take the OMAP3 pbias_regulator. The OMAP3 isn=92t a regulator as =
well
>> but has an internal pbias_regulator that needs to be controlled.
>=20
> I don't know much about a "pbias_regulator", but the OMAP3 is a multi=
function
> device which contains a CPU and multiple other controllers and  commu=
nicators
> and stuff.  One of the components in the OMAP3 is this pbias_regulato=
r, and
> it has a device-node which is a child of the 'ocp' node - which is th=
e main
> interconnect in the OMAP3 I think.
>=20
> So I'm not against describing the regulator in the w2sg0004, but for
> consistency with everything else, it would need to be child-node of a
> device-node which describes the w2sg0004 as a whole.  I'm not sure th=
at doing
> that would gain anything.

Well, it would gain consistency how chips with multiple components insi=
de
are described.

And would make it easier to see the whole w2sg0004 a child of /.

But then we need some reference from your tty/serial driver to that w2s=
g node.

>=20
>=20
> Thanks,
> NeilBrown

Thanks as well,
Nikolaus
