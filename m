From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power on/off UART attached devices.
Date: Wed, 25 Mar 2015 08:59:14 +0100
Message-ID: <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <20150318055831.21025.33670.stgit@notabene.brown> <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com> <20150320195451.146a7915@notabene.brown> <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com> <20150321103122.23603014@notabene.brown> <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com> <20150325014543.GA967@earth>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150325014543.GA967@earth>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 25.03.2015 um 02:45 schrieb Sebastian Reichel <sre@kernel.org>:

> Hi,
>=20
> On Tue, Mar 24, 2015 at 06:58:15PM +0100, Dr. H. Nikolaus Schaller wr=
ote:
>> So you propose that the parent->child relationship is =93control=94?=
 I.e. some
>> channel which allows to address some bus client (through <reg>) and
>> control that devices.
>>=20
>> Makes sense. This is how i2c and spi clients are specified.
>>=20
>>>=20
>>> In the case of our GPS, it receives control over the serial connect=
ion from
>>> the UART,
>>=20
>> Ahem - does it?
>>=20
>> AFAIK the chip simply starts to emit NMEA records if powered on.
>> There is no command going over the serial interface to address it
>> or control it.
>=20
> Right, since GPS basically doesn't need any configuration/control.
> That=92s not true for other UART attached devices, though.

Do you have an example? Usually an UART data stream is transparently
presented to a /dev/tty - and user-space daemon can configure/control t=
he
attached device. In most cases it can mix payload data and control comm=
and
by some AT command and escape sequences.

>=20
>>> also receives control via a GPIO to the on/off pin, and also needs
>>> a regulator to power the antenna.
>>>=20
>>> So should the parent be the uart, the on/off GPIO, or the regulator=
?
>>>=20
>>> I would much rather there wasn't a parent, and that each of these w=
ere listed
>>> as ad-hoc attribute assignments.  But device-tree says there must b=
e a parent
>>> (where possible), and the parent is the thing that is =93primarily"=
 in control.
>>=20
>> Well, IMHO the =93parent=94 could also be the root. Representing the
>> whole board.
>>=20
>> Nevertheless, I doubt your rule that =93ability to control=94 define=
s
>> the parent>child relation (see below).
>>=20
>>>=20
>>> I think the GPS is =93primarily" a uart-attached device.
>>=20
>> But not in the same way as an I2C device.
>>=20
>> Especially the serial interface is not a bus and not used for
>> signalling and power control. It is payload data (only).
>=20
> Actually many I2C devices are also powered on/off via a GPIO and
> even use additional GPIOs for sending interrupts. Nevertheless they
> are normally identified as an I2C device.

Because I2C is a bus that can address multiple clients and gpio isn=92t
a bus and a point-to-point connection.

But IMHO it is not because they (can) send payload data over i2c.

>=20
> Also for non-GPS device the serial connection is used for
> controlling and configuring the device.

This assumes that =93controls a device=94 is the criterion for making a=
 device
a subnode. I doubt that.

>=20
>>> So I propose a device-node which describes the GPS, which is a chil=
d of the
>>> UART, and explicitly identifies the GPIO it uses to power on/off, t=
he
>>> regulator it uses to power the antenna, and how it receives "on or =
off"
>>> status indications from the GPS.
>>=20
>> The more I think about that, you have given good arguments *not*
>> to use the parent->child relationship for the UART interface of
>> the GPS.
>>=20
>> Let me give another example. The 3G Modem has 3 (or 4) interfaces:
>> 1. an USB-Interface for AT signalling and payload
>> 2. some GPIOs for power control.
>> 3. a PCM interface for digital voice.=20
>> 4. it might also have a serial interface as alternate AT command and=
 (GPRS
>>    low speed) payload.
>>=20
>> So which one is the most prominent or most important to make it a ch=
ild of?
>>=20
>> If you use =93control=94 you must make it a child of the USB phy and=
 the serial interface
>> which requires multiple inheritance=85
>>=20
>> So I am not sure at all. None is IMHO prominent and unique enough to=
 make it
>> a parent>child relation.
>>=20
>> Threrefore, I would be happy to see it as multiple children of /. Fo=
r example a
>> MFD with subnodes.
>=20
> This scenario has already been seen before and can happen for
> non-UART based devices (e.g. SPI + I2C). So far the decision was to
> postpone the discussion about this kind of devices until one of them
> appears.
>=20
>>> It is arguable that the "antenna" should be treated as a separate d=
evice - a
>>> child of the GPS - which controls the regulator and also provides a=
 'extcon'
>>> which reports whether an external GPS antenna is attached, or wheth=
er the
>>> internal on is in use.  I haven't made the time to properly explore=
 that
>>> issue yet.
>>=20
>> If you assume that parent>child relationship is about control (only)=
=2E But if it
>> is about data flow, there is a different concept in DT. For example =
the CSI/DSI
>> (OMAP DSS) use the =93port=94 concept.
>=20
> Yes, this is about data not going to the cpu / system memory.

Really? The frame buffer data is in system memory and gets to the panel=
=2E Or a
camera image ends up in system memory.

>=20
>> This means that indeed parent>child is used for control, e.g. I2C
>> or SPI to tell the panel controller to switch on.
>=20
> well parent > child is not about power control, but about "primary"
> control.

Can you clearly and precisely define what =93primary=94 control is? I t=
hink
two people will have three opinions about that.

=46or example I would see the w2sg0004 on/off gpio as the primary =93co=
ntrol=94
which makes the light (NMES records) turned on.

Therefore we should make it the subnode of some gpio-controller, should=
n=92t we?

> Some I2C/SPI devices have additional gpios for power
> control.
>=20
>> For example we have the GTA04 panel as a subnode of SPI (because SPI=
 is a
>> bus and the panel is controlled through SPI). Other panels need no c=
ontrol
>> interface and are simply a child of /.
>=20
> Yes, some devices do not have an interface worth of being called
> =93primary control" :)

This is why I criticise this criterion to define when we need a parent/=
child relation.
It is not strict and does not follow a principle but opinions.

But before we stick to opinions, I have studied again:

	http://www.devicetree.org/Device_Tree_Usage#Devices

In their examples (which unfortunately don=92t cover our special cases)
they make clear that subnodes are needed for =93addressable=94 subnodes
like CPUs, Memory banks, i2c clients, ethernet clients etc.

(well, the first sentence in =93Interrupts=94 can be read to confirm th=
is interpretation:
=93Unlike address range translation which follows the natural structure=
 of the tree=94)

In general I read from this (although it is not explicitly stated) that
parent>child hierarchy is about addressing bus clients and mapping
devices into memory address space.

Everything else is to be done through references.

>=20
>> The video stream and its connections are arranged through such ports=
=2E
>> For the video out management we have added our OPA362 video amplifie=
r into
>> that video pipeline which starts at the VENC (Video encode) in the S=
oC,
>> goes through the OPA362 and ends in the connector (which has its own
>> node). All this is connected by references. The opa362 node itself i=
s a child
>> of /:=20
>>=20
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/omap3-gta04.dtsi?id=3Drefs/tags/v4.0-rc5#n98
>>=20
>> So to summarize I now see exactly two cases where parent>child is us=
ed:
>> a) for components of an aggregate device (OMAP3 > I2C controllers)
>> b) for components connected to a bus controller (I2C > TWL4030)
>>=20
>> Since the twl regulators are components of the twl chip it completel=
y explains
>> why we see
>>=20
>> omap3 > i2c > twl4030 > vaux4
>>=20
>> Everything else is done by references. Therefore we see references f=
or
>> * gpios within a controller (independently of it=92s relation on a b=
us)
>> * regulators
>> * clocks
>> * any function that is not connected by a bus
>>=20
>> There is no need (and practice) to squeeze everything into a parent =
> child
>> relationship. And I can=92t see your =93control=94 or a =93main inte=
rface=94 rule.
>=20
> And I can't see your bus rule for me the motiviation behind the
> parent > child relationship is about the system's primary way for
> accessing a device.

It appears not to be =93my bus rule=94. I just formulated in that way f=
rom the
examples I have seen=85

>=20
> It's coincidence, that this is currently (always?) a bus connection,
> since most devices are actually connected using some kind of bus.

I think the view must be reversed and then it is not a coincidence but =
a
consequence.

>=20
>> At least this is my (a little limited) view from using and programmi=
ng DT for
>> multiple boards.
>>=20
>> Maybe this is what the DT list should comment or show a clear defini=
tion when
>> parent>child relations are wanted and when not.
>>=20
>> Now back to the GPS chip connected to an UART.
>>=20
>> Is it
>> a) a component of an aggregate device? no
>> b) is it connected to a bus (i2c, spi, address bus)? no
>=20
>> This comes back to the question if UART is a bus.
>>=20
>> I still think that it is NOT a bus and therefore it should not be mo=
deled in DT
>> like busses are (enforcing clients to become subnodes).
>=20
> If I use a SPI device with hardwired chip select its *very* similar
> to UART.

Yes, because you can just connect a single client to SPI and then quest=
ion if
it is a bus. But that is a useage pattern but not a principle.

And IMHO, DT definitions should follow principles and not current need.

Otherwise I don=92t understand why the virtual-gpio connected to UART D=
TR
or the regulator is *not* acceptable.

>=20
>> The reason is there no well defined protocol to make multiple client=
s and
>> you can=92t specify a <reg>.
>>=20
>> So you are either abusing the notion of a bus or the gps chip must b=
e a separate
>> DT node (child of something else).
>>=20
>> I hope my gut feeling that we are trying to do something fundamental=
ly wrong
>> with making the gps chip a subode of serial is now argued a little b=
etter.
>>=20
>> For making the serial device control some regulator through a refere=
nce to
>> a regulator, I am very fine. It is what you do for the W2CBW bluetoo=
th part.
>=20
> NAK about referencing the regulator from the UART node. It should be
> referenced from the Bluetooth / GPS node. The UART port works
> without the regulator. It's the remote side, that does not work.
> We also do not add the regulators of I2C clients to the I2C host.

I think Pavel made a very good comment:

The uart node should be able to power a rs232 converter/level shifter d=
irectly
connected to it (through a regulator or gpio-regulator).

And there must be a separate mechanism to power the remote rs232 conver=
ter
and the remote device.

The standard signalling for this are the RTS/DTR lines of an UART/RS232=
=2E

UART is not only RX+TX.

>=20
> If you want to talk with an I2C device you enable the I2C device
> *and* its parent (aka the I2C host controller). I guess the same
> should be done for the UART.
>=20
>>>>>> All the following is very special logic for the w2sg0004 chip wh=
ich should be
>>>>>> divided out into a separate driver.
>>>>>>=20
>>>>>> Marek and me already had proposed such a chip specific driver (t=
o be located
>>>>>> in drivers/misc) some months ago. It would encapsulate everythin=
g w2sg0004
>>>>>> specific and present itself as a regulator (because that is its =
main purpose:
>>>>>> control the LDO regulator inside the w2sg0004 chip).
>>>>>=20
>>>>> Presenting itself as a regulator would be wrong because it isn=92=
t a regulator.
>>>>=20
>>>> It has a regulator that can be controlled by a gpio=85
>>>=20
>>> Does it?  I guess may it does.
>>> Maybe it also has an ARM core and some memory and assorted other bi=
ts and
>>> pieces.  But we don=92t really need to describe them to device tree=
=2E
>>=20
>> Well, if I look into the data sheet, it has indeed an LDO from 3.3V =
to 1.8V.
>>=20
>> Not to make you confused: the w2sg0084 would have a WAKEUP output wh=
ich - if
>> connected to a GPIO - would tell if the module is really active or n=
ot. Using this would
>> make monitoring the RX line through different pinmux states obsolete=
=2E
>>=20
>> But the only Linux board using the w2sg00x4 appears to be the GTA04 =
and it has
>> not wired the WAKEUP line to a  GPIO.
>>=20
>>> The w2sg0004 is primarily a GPS device, so that needs to be stated =
in the
>>> devices tree description.  If there are subcomponents that can usef=
ully be
>>> described as well then there could be a place to describe those sub=
components.
>>> I notice that there is a "1V8-out" pin, so presumable the chip can =
deliver a
>>> 1V8 source based on its 3V3 input.  If a board made use of that, it=
 could be
>>> useful to describe the regulator inside the GPS so it could be decl=
are that
>>> some other device which needed 1V8 made use of that regulator=85.
>>=20
>> Yes. Well, even if *we* do not use it in this way yet, we should not=
 make it
>> difficult for others to do by enforcing the wrong description.
>=20
> well this has nothing to do with the parent-child discussion, since
> you can obviously reference a regulator independently of its
> position in the DT.
>=20
>>>> Another example to think about: the twl4030 is also not a regulato=
r.
>>>> Nevertheless they present some regulator nodes.
>>>=20
>>> The TWL4030 is a multifunction device which contains regulators and=
 GPIOs and
>>> audio codec and  USB PHY etc etc etc.
>>>=20
>>> So in device-tree there is a device-node for the TWL4030, and it ha=
s
>>> child-nodes for each sub-device.   They in turn can provide service=
s to other
>>> devices on the board.
>>=20
>> Exactly as discussed above. And there, the parent>child relation for=
 the twl4030
>> and its subdevices is right.
>>=20
>>> These sub-devices are much more independent of the whole than the r=
egulator
>>> inside the w2sg0004 is.
>>=20
>> Hm. That is probably argueable as well. At least a vague ciriterion.
>>>=20
>>>>=20
>>>> Or take the OMAP3 pbias_regulator. The OMAP3 isn=92t a regulator a=
s well
>>>> but has an internal pbias_regulator that needs to be controlled.
>>>=20
>>> I don't know much about a "pbias_regulator", but the OMAP3 is a mul=
tifunction
>>> device which contains a CPU and multiple other controllers and  com=
municators
>>> and stuff.  One of the components in the OMAP3 is this pbias_regula=
tor, and
>>> it has a device-node which is a child of the 'ocp' node - which is =
the main
>>> interconnect in the OMAP3 I think.
>>>=20
>>> So I'm not against describing the regulator in the w2sg0004, but fo=
r
>>> consistency with everything else, it would need to be child-node of=
 a
>>> device-node which describes the w2sg0004 as a whole.  I'm not sure =
that doing
>>> that would gain anything.
>>=20
>> Well, it would gain consistency how chips with multiple components i=
nside
>> are described.
>=20
> I don't think so. Many devices do not expose all of their
> subdevices. e.g. they do not expose their internal clocks.
> Apart from that there are a few devices in the kernel, which
> do use enable-gpio(s).

After reading http://www.devicetree.org/Device_Tree_Usage#Devices I mus=
t
revise my formulation a little.

It is not that parent>child is used for describing =93busses or groupin=
g subdevices".

It is only for =93grouping addressable components=94, which implies som=
e bus.

This still explains the ocp component of the OMAP3 - which represents t=
he
whole internal =93interconnect=94 bus (see comment in omap3.dtsi).

Therefore you are right. It is not correct to split up a device into ar=
bitrary
components and group them again by the parent>child pattern.

Although the structure of twl4030.dtsi appears to simply list and group
subcomponents without telling explicitly how to address them.

>=20
>> And would make it easier to see the whole w2sg0004 a child of /.
>=20
> Even with the regulator subdevice I would still make the w2sg0004 a
> child of the UART port.

This would mean that a tty / uart is able to address multiple clients. =
How
could it do that?

> Main reason is, that I would need to go
> through the UART to =93communicate" with the w2sg0004.

You can always "communicate=94 through the UART. Even without DT. As lo=
ng as
the connected chip is powered up by any means (could be some fixed-regu=
lator
or hard wired).

Power control for open()/close() did even work with the DT based DTR->v=
irtual-gpio
approach.

We just do not described in the DT that there is a data connection from=
 uart1 to
the RX/TX pins. But you just open /dev/ttyO1.

Thus, describing a relation between the uart node and the GPS chip in t=
he DT is
not even a requirement.

Probably the main problem we have is that we want to describe this data=
 connection
but the device tree is about describing how to address components and d=
ata
flow is left to internal APIs. Or =93ports=94 like in the video pipelin=
es.

Let me raise the question:

Why do we need to describe in the DT (independently of Linux power cont=
rol
structures and drivers!) that the GPS data interface is connected to a =
specific UART?

Who needs this information and for which purpose?

BR,
Nikolaus
