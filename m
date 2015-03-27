From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power on/off UART attached devices.
Date: Fri, 27 Mar 2015 10:22:11 +0100
Message-ID: <06BFF79C-F9FC-441D-BA41-7209219A912E@goldelico.com>
References: <20150318055831.21025.33670.stgit@notabene.brown> <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com> <20150320195451.146a7915@notabene.brown> <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com> <20150321103122.23603014@notabene.brown> <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com> <20150325014543.GA967@earth> <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com> <20150325152110.GA7903@earth> <E4CA3051-6004-4D7B-BF01-CE47CFEDA4EB@goldelico.com> <20150326180805.GA562@earth>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150326180805.GA562@earth>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 26.03.2015 um 19:08 schrieb Sebastian Reichel <sre@kernel.org>:

> Hi,
>=20
> On Wed, Mar 25, 2015 at 05:44:42PM +0100, Dr. H. Nikolaus Schaller wr=
ote:
>> Am 25.03.2015 um 16:21 schrieb Sebastian Reichel <sre@kernel.org>:
>>> On Wed, Mar 25, 2015 at 08:59:14AM +0100, Dr. H. Nikolaus Schaller =
wrote:
>>>> Am 25.03.2015 um 02:45 schrieb Sebastian Reichel <sre@kernel.org>:
>>>>> On Tue, Mar 24, 2015 at 06:58:15PM +0100, Dr. H. Nikolaus Schalle=
r wrote:
>>>>>> So you propose that the parent->child relationship is =93control=
=94? I.e. some
>>>>>> channel which allows to address some bus client (through <reg>) =
and
>>>>>> control that devices.
>>>>>>=20
>>>>>> Makes sense. This is how i2c and spi clients are specified.
>>>>>>=20
>>>>>>> In the case of our GPS, it receives control over the serial con=
nection from
>>>>>>> the UART,
>>>>>>=20
>>>>>> Ahem - does it?
>>>>>>=20
>>>>>> AFAIK the chip simply starts to emit NMEA records if powered on.
>>>>>> There is no command going over the serial interface to address i=
t
>>>>>> or control it.
>>>>>=20
>>>>> Right, since GPS basically doesn't need any configuration/control=
=2E
>>>>> That=92s not true for other UART attached devices, though.
>>>>=20
>>>> Do you have an example? Usually an UART data stream is transparent=
ly
>>>> presented to a /dev/tty - and user-space daemon can configure/cont=
rol the
>>>> attached device. In most cases it can mix payload data and control=
 command
>>>> by some AT command and escape sequences.
>>>=20
>>> Yes, but the configuration is minimal. Anyways as you said there
>>> *is* some kind of control happening over the UART.
>>=20
>> Control is happening on a higher network stack level than UART. It
>> control is done through AT commands.
>=20
> Yes, obviously UART is only the physical layer. The same is true for
> busses and does not really matter.

=46ine that we agree on that. I just mentioned it because we discussed =
about line
disciplines and tty which are higher level.

>=20
>>>>>>> also receives control via a GPIO to the on/off pin, and also ne=
eds
>>>>>>> a regulator to power the antenna.
>>>>>>>=20
>>>>>>> So should the parent be the uart, the on/off GPIO, or the regul=
ator?
>>>>>>>=20
>>>>>>> I would much rather there wasn't a parent, and that each of the=
se were listed
>>>>>>> as ad-hoc attribute assignments.  But device-tree says there mu=
st be a parent
>>>>>>> (where possible), and the parent is the thing that is =93primar=
ily" in control.
>>>>>>=20
>>>>>> Well, IMHO the =93parent=94 could also be the root. Representing=
 the
>>>>>> whole board.
>>>>>>=20
>>>>>> Nevertheless, I doubt your rule that =93ability to control=94 de=
fines
>>>>>> the parent>child relation (see below).
>>>>>>=20
>>>>>>>=20
>>>>>>> I think the GPS is =93primarily" a uart-attached device.
>>>>>>=20
>>>>>> But not in the same way as an I2C device.
>>>>>>=20
>>>>>> Especially the serial interface is not a bus and not used for
>>>>>> signalling and power control. It is payload data (only).
>>>>>=20
>>>>> Actually many I2C devices are also powered on/off via a GPIO and
>>>>> even use additional GPIOs for sending interrupts. Nevertheless th=
ey
>>>>> are normally identified as an I2C device.
>>>>=20
>>>> Because I2C is a bus that can address multiple clients and gpio is=
n=92t
>>>> a bus and a point-to-point connection.
>>>>=20
>>>> But IMHO it is not because they (can) send payload data over i2c.
>>>=20
>>> From my POV it's not because I2C is a bus, but because the primary
>>> function is happening via I2C (e.g. configuring sensor, gettings it=
s
>>> data). The GPIOs are only needed to compensate some I2C shortcoming=
s
>>> (missing irq feature in I2C) or reduce the complexity of the client
>>> (power GPIO). The actual system interaction with the I2C chip is
>>> going via I2C, though.
>>=20
>> Yes, but this is in my new understanding irrelevant for proper DT
>> description.
>=20
> And for my understanding it is. We are arguing in a circle=85

Yes, and that is the reason why I try to go to a higher level of discus=
sion. I.e.
find out the principles behind. If we can agree on those, it becomes ea=
sy
to decide the details.

>=20
>>>>>> If you assume that parent>child relationship is about control (o=
nly). But if it
>>>>>> is about data flow, there is a different concept in DT. For exam=
ple the CSI/DSI
>>>>>> (OMAP DSS) use the =93port=94 concept.
>>>>>=20
>>>>> Yes, this is about data not going to the cpu / system memory.
>>>>=20
>>>> Really? The frame buffer data is in system memory and gets to the =
panel. Or a
>>>> camera image ends up in system memory.
>>>=20
>>> Really? So the panel accesses the system memory? Check again. The
>>> panel is simply connected via DSI/SDI/... and does not access the
>>> system memory at all. The display controller OTH does. So let's hav=
e
>>> a look at the DT structure (simplified):
>>>=20
>>> ocp -> dss -> { port =3D <&panel>; }
>>> ... -> spi -> panel { port =3D <&dss>; }
>>>=20
>>> So the port models a device-to-device connection, which works
>>> independent of the remaining system. No system memory is involved.
>>=20
>> Sorry, but I can=92t exactly follow what you want to show.
>>=20
>> Yes, the port mechanism describes a device to device connection.
>>=20
>> But it does not describe system memory. Although it is the source of
>> the video (i.e. the framebuffer).
>>=20
>> This shows that the DT does not necessarily describe data flow.
>>=20
>> So why do you want to describe data flow from tty to uart to some
>> connected device?
>=20
> It shows, that the tree models system memory flow and adds
> references for stuff not being about the system memory flow.
>=20
> So let's say I want to configure the panel - I can simply walk
> through the parent structure to know how to access it. The same
> is true for the display controller.

Ok, I see. Someone has introduced the word =93system memory=94 in this
discussion about addressing devices.

>=20
>>>>>> This means that indeed parent>child is used for control, e.g. I2=
C
>>>>>> or SPI to tell the panel controller to switch on.
>>>>>=20
>>>>> well parent > child is not about power control, but about "primar=
y"
>>>>> control.
>>>>=20
>>>> Can you clearly and precisely define what =93primary=94 control is=
? I think
>>>> two people will have three opinions about that.
>>>>=20
>>>> For example I would see the w2sg0004 on/off gpio as the primary =93=
control=94
>>>> which makes the light (NMES records) turned on.
>>>>=20
>>>> Therefore we should make it the subnode of some gpio-controller, s=
houldn=92t we?
>>>=20
>>> I never thing of enable gpios to be the main interface, since it ca=
n
>>> simply be connected to some voltage and be enabled constantly. It's
>>> just some kind of helper for the device. It does not really exchang=
e
>>> data between the system and the device, though. (Note: This is
>>> not true, if the GPIOs are used for bitbanging some high-level
>>> protocol, in which case a virtual controller (like i2c-gpio) is
>>> modelled in DT).
>>>=20
>>> So let's have a look at the UART link again. It is transporting
>>> non-trivial data from the UART to the system and it is handling
>>> the data I actually want. It's providing access to the device's
>>> =93registers".
>>=20
>> Well, this view can be followed, but is as strange and bent to fit
>> like my view of the w2sg0004 as a =93regulator=94.
>>=20
>>>=20
>>> For me its clear, that one would expect the GPS under the UART
>>> port, since when speaking with other developers I would describe
>>> the GPS as being a "UART attached GPS chip". From me the
>>> differences between a UART port and a SPI port from a system
>>> software=92s POV can be reduced to missing multi-device support.
>>=20
>> DT does not necessarily have to describe data flow as we have seen
>> in the video pipeline example.
>=20
> sure, it shows how to access the device. This link may not
> necessarily be the same as the one, which takes care of the
> data.

Ok, fine that we agree on this.

>=20
>>> so show me some non-bus connections, which are actually used to
>>> exchange non-trivial data (with on/off being trivial). We currently
>>> do not really have them.
>>=20
>> Are we talking about DT or data flow from user space through the
>> kernel?
>=20
> /me is not sure why you are regularly introducing userspace.

Because I am under the impression that some arguments in this discussio=
n
are driven by a user-space view.

> It's
> completly irrelevant when its assumed, that the kernel should
> abstract devices. DT is about giving the kernel knowledge about
> the *hardware*, so that it can implement this abstraction without
> any user interaction.

Agreed.

>=20
> Coming back at my sentence: I asked about a non-trivial, non-bus
> connected HW, which has a DT binding.

from omap3-beagle-xm.dts:
hsusb2_phy (connected through ULPI)
sound/codec (connected through McBSPs)
gpio-keys (it is not a trivial on/off)
tfp410 (DVI encoder only part of the video pipeline)

and there are components on the board which are not described at
all but work out of the box: audio connectors, usb/ethernet hub

>=20
>>> I have missed virtual-gpio UART DTR discussion and assume, that the
>>> regulator is about the regulator on the GPS chip?
>>=20
>> Well, it was introduced in platform device kernels that it was possi=
ble
>> to define a dtr-gpio for the uart. And there was a driver for the w2=
sg0004
>> that presented itself as a gpio-controller with a single gpio. This =
=93virtual=94
>> gpio was used to power on the chip as soon as DTR was asserted.
>>=20
>> Parts of this had been in mainline but have been removed some months
>> ago.
>=20
> I can't find any w2sg0004 reference in the mainline kernel's commit
> messages.

Well, the DTR-gpio patch was in mainline, but removed before we did sub=
mit
the w2sg0004. Therefore this submission was rejected and you can only f=
ind
in on LKML history.

>=20
>>> I don't think the regulator is not acceptable. I simply think its
>>> not useful. Basically the structure would be
>>>=20
>>> uart {
>>>   /* stuff */
>>>   gps {
>>>       vdd-supply =3D <&gpsreg>;
>>>       /* stuff */
>>>=20
>>>       gpsreg: regulator {
>>>           enable-gpio =3D <GPIO 42>;
>>>           /* stuff */
>>>       }
>>>   }
>>> }
>>=20
>> Except that the gpsreg is a subnode of /
>=20
> I obviously disagree with that ;)
> But even then the regulator is useless.

In the meantime, I have proposed an IMHO even better approach.

It is not to make the gps a regulator or a subnode of some =93primary i=
nterface=94,
but give it a reference to the uart it is connected to.

And make it an independent node on DT root level.

Then we are completely independent on how the gps driver presents
data to any user space on any OS.

>=20
>>>=20
>>> and could simply be
>>>=20
>>> uart {
>>>   /* stuff */
>>>   gps {
>>>       enable-gpio =3D <GPIO 42>;
>>>       /* stuff */
>>>   }
>>> }
>>>=20
>>> Without loosing important information.
>>=20
>> Only if you assume that the gpsreg must be a subnode of the uart.
>=20
> DT means device tree and not device net. I sure can follow your
> argument, but from my POV its trying to create a net from the tree.

What is bad with having a net? Why must we squeeze everything into a tr=
ee structure
just because it is called such? DT language provides the syntax for ref=
erences
and that allows to make nets. And it is heavily used.

>=20
>>> The regulator would only be
>>> interesting if it is also used by other devices. Other devices also
>>> do not expose their internal clocks etc.
>>>=20
>>>>>> The reason is there no well defined protocol to make multiple cl=
ients and
>>>>>> you can=92t specify a <reg>.
>>>>>>=20
>>>>>> So you are either abusing the notion of a bus or the gps chip mu=
st be a separate
>>>>>> DT node (child of something else).
>>>>>>=20
>>>>>> I hope my gut feeling that we are trying to do something fundame=
ntally wrong
>>>>>> with making the gps chip a subode of serial is now argued a litt=
le better.
>>>>>>=20
>>>>>> For making the serial device control some regulator through a re=
ference to
>>>>>> a regulator, I am very fine. It is what you do for the W2CBW blu=
etooth part.
>>>>>=20
>>>>> NAK about referencing the regulator from the UART node. It should=
 be
>>>>> referenced from the Bluetooth / GPS node. The UART port works
>>>>> without the regulator. It's the remote side, that does not work.
>>>>> We also do not add the regulators of I2C clients to the I2C host.
>>>>=20
>>>> I think Pavel made a very good comment:
>>>>=20
>>>> The uart node should be able to power a rs232 converter/level shif=
ter directly
>>>> connected to it (through a regulator or gpio-regulator).
>>>=20
>>> Yes and this may belong to the UART node.
>>>=20
>>>> And there must be a separate mechanism to power the remote rs232 c=
onverter
>>>> and the remote device.
>>>=20
>>> Yes and I think this goes to the remote device's node.
>>>=20
>>>> The standard signalling for this are the RTS/DTR lines of an UART/=
RS232.
>>>> UART is not only RX+TX.
>>>=20
>>> so?
>>=20
>> You said NAK about referencing a regulator from the UART node and
>> now?
>=20
> No. I said NAK about referencing *the* regulator from the BT/GPS
> node. My NAK was about referencing a regulator in the UART node
> (local side), which is actually needed by the GPS/BT module (remote
> side).

Ah, now I understand your argument, and agree to it.

My comment was on a slightly different topic that the DTR line from the
UART (node) can be used to signal the remote regulator to be turned on.

But I learned yesterday that we can even hide this explicit signalling
mechanism (being regulator, gpio or whatever) by:

bt {
	compatible =3D =93vendor,btchip=94;
	regulator =3D <&regulator to power the btchip>;
	uart =3D <&uart1>;
	gpio =3D <&gpio to enable the chip>;
};

uart1 {
	/* no reference to bt */
	regulator =3D <&optional regulator to make the local side work>;
};

You have two nodes. One with all properties for the local uart side.
And one for the remote side. With a link so that the kernel code can
find the uart the device is connected to.

And then kernel A can use one signalling mechanism between the uart
driver and the bt driver and kernel B another. This is the level of abs=
tracion
we should get to.

>=20
>>>>> If you want to talk with an I2C device you enable the I2C device
>>>>> *and* its parent (aka the I2C host controller). I guess the same
>>>>> should be done for the UART.
>>>>>=20
>>>>>>>>>> All the following is very special logic for the w2sg0004 chi=
p which should be
>>>>>>>>>> divided out into a separate driver.
>>>>>>>>>>=20
>>>>>>>>>> Marek and me already had proposed such a chip specific drive=
r (to be located
>>>>>>>>>> in drivers/misc) some months ago. It would encapsulate every=
thing w2sg0004
>>>>>>>>>> specific and present itself as a regulator (because that is =
its main purpose:
>>>>>>>>>> control the LDO regulator inside the w2sg0004 chip).
>>>>>>>>>=20
>>>>>>>>> Presenting itself as a regulator would be wrong because it is=
n=92t a regulator.
>>>>>>>>=20
>>>>>>>> It has a regulator that can be controlled by a gpio=85
>>>>>>>=20
>>>>>>> Does it?  I guess may it does.
>>>>>>> Maybe it also has an ARM core and some memory and assorted othe=
r bits and
>>>>>>> pieces.  But we don=92t really need to describe them to device =
tree.
>>>>>>=20
>>>>>> Well, if I look into the data sheet, it has indeed an LDO from 3=
=2E3V to 1.8V.
>>>>>>=20
>>>>>> Not to make you confused: the w2sg0084 would have a WAKEUP outpu=
t which - if
>>>>>> connected to a GPIO - would tell if the module is really active =
or not. Using this would
>>>>>> make monitoring the RX line through different pinmux states obso=
lete.
>>>>>>=20
>>>>>> But the only Linux board using the w2sg00x4 appears to be the GT=
A04 and it has
>>>>>> not wired the WAKEUP line to a  GPIO.
>>>>>>=20
>>>>>>> The w2sg0004 is primarily a GPS device, so that needs to be sta=
ted in the
>>>>>>> devices tree description.  If there are subcomponents that can =
usefully be
>>>>>>> described as well then there could be a place to describe those=
 subcomponents.
>>>>>>> I notice that there is a "1V8-out" pin, so presumable the chip =
can deliver a
>>>>>>> 1V8 source based on its 3V3 input.  If a board made use of that=
, it could be
>>>>>>> useful to describe the regulator inside the GPS so it could be =
declare that
>>>>>>> some other device which needed 1V8 made use of that regulator=85=
=2E
>>>>>>=20
>>>>>> Yes. Well, even if *we* do not use it in this way yet, we should=
 not make it
>>>>>> difficult for others to do by enforcing the wrong description.
>>>>>=20
>>>>> well this has nothing to do with the parent-child discussion, sin=
ce
>>>>> you can obviously reference a regulator independently of its
>>>>> position in the DT.
>>>>>=20
>>>>>>>> Another example to think about: the twl4030 is also not a regu=
lator.
>>>>>>>> Nevertheless they present some regulator nodes.
>>>>>>>=20
>>>>>>> The TWL4030 is a multifunction device which contains regulators=
 and GPIOs and
>>>>>>> audio codec and  USB PHY etc etc etc.
>>>>>>>=20
>>>>>>> So in device-tree there is a device-node for the TWL4030, and i=
t has
>>>>>>> child-nodes for each sub-device.   They in turn can provide ser=
vices to other
>>>>>>> devices on the board.
>>>>>>=20
>>>>>> Exactly as discussed above. And there, the parent>child relation=
 for the twl4030
>>>>>> and its subdevices is right.
>>>>>>=20
>>>>>>> These sub-devices are much more independent of the whole than t=
he regulator
>>>>>>> inside the w2sg0004 is.
>>>>>>=20
>>>>>> Hm. That is probably argueable as well. At least a vague ciriter=
ion.
>>>>>>>=20
>>>>>>>>=20
>>>>>>>> Or take the OMAP3 pbias_regulator. The OMAP3 isn=92t a regulat=
or as well
>>>>>>>> but has an internal pbias_regulator that needs to be controlle=
d.
>>>>>>>=20
>>>>>>> I don't know much about a "pbias_regulator", but the OMAP3 is a=
 multifunction
>>>>>>> device which contains a CPU and multiple other controllers and =
 communicators
>>>>>>> and stuff.  One of the components in the OMAP3 is this pbias_re=
gulator, and
>>>>>>> it has a device-node which is a child of the 'ocp' node - which=
 is the main
>>>>>>> interconnect in the OMAP3 I think.
>>>>>>>=20
>>>>>>> So I'm not against describing the regulator in the w2sg0004, bu=
t for
>>>>>>> consistency with everything else, it would need to be child-nod=
e of a
>>>>>>> device-node which describes the w2sg0004 as a whole.  I'm not s=
ure that doing
>>>>>>> that would gain anything.
>>>>>>=20
>>>>>> Well, it would gain consistency how chips with multiple componen=
ts inside
>>>>>> are described.
>>>>>=20
>>>>> I don't think so. Many devices do not expose all of their
>>>>> subdevices. e.g. they do not expose their internal clocks.
>>>>> Apart from that there are a few devices in the kernel, which
>>>>> do use enable-gpio(s).
>>>>=20
>>>> After reading http://www.devicetree.org/Device_Tree_Usage#Devices =
I must
>>>> revise my formulation a little.
>>>>=20
>>>> It is not that parent>child is used for describing =93busses or gr=
ouping subdevices".
>>>>=20
>>>> It is only for =93grouping addressable components=94, which implie=
s some bus.
>>>>=20
>>>> This still explains the ocp component of the OMAP3 - which represe=
nts the
>>>> whole internal =93interconnect=94 bus (see comment in omap3.dtsi).
>>>>=20
>>>> Therefore you are right. It is not correct to split up a device in=
to arbitrary
>>>> components and group them again by the parent>child pattern.
>>>>=20
>>>> Although the structure of twl4030.dtsi appears to simply list and =
group
>>>> subcomponents without telling explicitly how to address them.
>>>=20
>>> Yes and this style is not only used for twl4030, but also for other
>>> multi function devices. I do not have a problem with splitting up a
>>> device into components as long as they are referenced by other
>>> components. There is no point in exposing all internal information.
>>> For the system its not relevant, that the GPS chip has a 30MHz
>>> clock if its part of the chip and nobody else is using it.
>>>=20
>>>>>> And would make it easier to see the whole w2sg0004 a child of /.
>>>>>=20
>>>>> Even with the regulator subdevice I would still make the w2sg0004=
 a
>>>>> child of the UART port.
>>>>=20
>>>> This would mean that a tty / uart is able to address multiple clie=
nts. How
>>>> could it do that?
>>>=20
>>> In theory it's possible:
>>>=20
>>> ? -> uart -> multiplexer -> { device1, device2 }
>>>=20
>>> I hope nobody will build such a device, though :)
>>>=20
>>> I don't think addressability is important for a parent > child
>>> connection, though. It is important for a reg node, of course.
>>=20
>> That is the key question I am trying to get founded answers, not
>> opinions :)
>>=20
>>>=20
>>>>> Main reason is, that I would need to go
>>>>> through the UART to =93communicate" with the w2sg0004.
>>>>=20
>>>> You can always "communicate=94 through the UART. Even without DT. =
As
>>>> long as the connected chip is powered up by any means (could be
>>>> some fixed-regulator or hard wired).
>>>>=20
>>>> Power control for open()/close() did even work with the DT based
>>>> DTR->virtual-gpio approach.
>>>>=20
>>>> We just do not described in the DT that there is a data connection
>>>> from uart1 to the RX/TX pins. But you just open /dev/ttyO1.
>>>>=20
>>>> Thus, describing a relation between the uart node and the GPS chip
>>>> in the DT is not even a requirement.
>>>=20
>>> It is when the kernel should be able to handle the GPS. The DT is
>>> supposed to be independent from Linux and other operating systems
>>> may want to hide the tty if a GPS is attached to it and instead
>>> provide something like /dev/gps, which could automatically be picke=
d
>>> up by userspace software.
>>=20
>> Well, it is difficult to cover all future use cases.
>>=20
>> But then you can still add a uart =3D <&uart1> reference to the DT n=
ode
>> of the driver. Because I understand that then the driver is the mast=
er
>> (and needs access to a hidden UART) and not the GPS chip a slave of
>> an exposed UART.
>=20
> Ok. It seems we are still talk past each other. All use cases can be
> implemented using both ways - putting the node to / or putting it
> below the UART node. It simply does not matter, since kernel code
> can interpret it as needed. You just asked at some time why we need
> to know about the remote side.

Agreed. Kernel code can identify the relationship in both cases.

I asked because we have to decide between three options:
a) no relation at all
b) uart is parent node of connected device node
c) connected device node references the uart

a) would have been the least problematic. With the given use case
it is ruled out.

>=20
> From my POV putting it below the UART node is more logical and from
> your POV putting it below / is more logical.

Another aspect just came to my mind:

IMHO / is the better solution because it also allows to override the
uart property in an overlay. For example board variant 1 connects to
uart1 and a hardware changeconnects the bt chip to uart2 in variant 2.

You can easily rearrange this link by including the dts of variant 1 an=
d=20
just overwriting uart =3D <&uart2>.

But you can=92t do that with a child node. I.e. you have to overwrite t=
he whole
uart1 and uart2 nodes to =93remove=94 the relation between uart1 and th=
e bt/gps chip.

This is probably the reason why gpio controllers are referenced and
not the parents of all connected chips.

>=20
>>>> Probably the main problem we have is that we want to describe this
>>>> data connection but the device tree is about describing how to
>>>> address components and data flow is left to internal APIs. Or
>>>> =93ports=94 like in the video pipelines.
>>>=20
>>> As I wrote the tree structure shows how to "reach" a component for
>>> accessing its configuration/data from the system.
>>=20
>> Yes, you wrote and I already pointed out that I disagree. It
>> contradicts what
>>=20
>> http://www.devicetree.org/Device_Tree_Usage#Devices
>>=20
>> appears to tell me. So who is right?
>=20
> From my POV the page is simply focused on standard bindings, which
> have already been established.

Well, new bindings should have very good reasons not to follow these
principles.

> If I understand you right, your POV
> does not allow child nodes (which are not directly under /) without
> reg property / address.

Yes, I read it like that.

Slides 22 and 27 of

http://events.linuxfoundation.org/sites/events/files/slides/petazzoni-d=
evice-tree-dummies.pdf

also appear to suggest to put busses and devices on root level.

Well, he says =93typically=94, because he just describes the status quo=
 and is
not wanting to set a standard.

> Just have a look at the DT binding
> documentation directory in the kernel - we already have them.

Maybe, todays Linux bidings and DTs are not general enough in such case=
s
and should be revisited? But that goes far beyond our discussion and pr=
oblem.

>=20
>>>> Let me raise the question:
>>>>=20
>>>> Why do we need to describe in the DT (independently of Linux power
>>>> control structures and drivers!) that the GPS data interface is
>>>> connected to a specific UART?
>>>> Who needs this information and for which purpose?
>>>=20
>>> Because an operating system can provide drivers, which completly
>>> hide away the UART connection. Example:
>>>=20
>>> Let's assume we have an UART attached Bluetooth chip connected to
>>> the second UART.
>>>=20
>>> In Linux, userspace currently must know, that the BT module is
>>> connected to this port and correctly setup the port for BT usage.
>>> Once this has been done the port is completly handled in the kernel
>>> and userspace can ignore the UART.
>>=20
>> Ok, this is a reasonable example. But I still don=92 see that it
>> requires that the bt chip must be a subnode of the uart.
>=20
> It doesn't. I just answered your question, which was independent
> of the actual node position.
>=20
>>> So why must the user configure the port? Because the kernel does no=
t
>>> know, that a BT chip is connected to the port.
>>=20
>> Then, I would suggest to write it like you have done:
>>=20
>> =93the BT chip is connected to the port uart1=94
>>=20
>> This can be easily translated into DT language:
>>=20
>> / {
>> 	bt {
>> 		compatible =3D =93vendor,chip=94;
>> 		uart =3D <&uart1>;	/* this chip is connected to uart1 */
>> 		enable-gpio =3D <&gpio3 17 0>;
>> 	};
>> };
>>=20
>> This also resembles the =93port=94 mechanism (just simplified becaus=
e it is not
>> a backwards forward linkage).
>>=20
>> Or exactly follows the pattern that a driver that wants to use
>> some gpio simply links to the gpio controller. Or a driver wants
>> to control a gpio.
>>=20
>> What I don=92t understand is what is here so special to not use this
>> DT pattern.
>>=20
>> But It could also open a different solution for the tty open() ->
>> w2sg power on problem.
>>=20
>> / {
>> 	gps {
>> 		compatible =3D =93wi2wi,w2sg0004=94;
>> 		uart =3D <&uart1>;	/* this chip is connected to uart1 */
>> 		enable-gpio =3D <&gpio3 17 0>;
>> 	};
>> };
>>=20
>> Here, the w2sg0004 probe function could register with uart1 to get n=
otified
>> about open/close events and then do what it has to do.
>>=20
>> In that case the w2sg0004 driver would not even need to present itse=
lf
>> as a virtual gpio (for DTR) or a regulator because it has a kernel i=
nternal
>> API to apply to tell the uart what it wants to do.
>=20
> Again the same can be done if its a child-node of the UART. It is
> simply a question of reading the "uart" property vs loading the
> driver from the UART and access the parent device.

Ok.

>=20
>>> If the kernel gets
>>> this information from DT it can do all the UART handling itself and
>>> provide a bluetooth device without any user interaction.
>>=20
>> I think we should get a better understanding of the DT design patter=
ns.
>>=20
>> IMHO (or IMPoV):
>>=20
>> * parent>child is not for describing =93control=94 or =93primary int=
erface=94 but addressability
>=20
> We obviously disagree here :)

Exactly. This is why I am trying to find a concise definition how it sh=
ould be.

And to be honest I am quite worried that it does not appear to exist bu=
t DT
should be stable and well defined and even OS agnostic. How can that
work?

>=20
>> * if a driver needs access to another component, a reference propert=
y is used
>=20
> Here we also disagree. The kernel also makes use of parent > child
> connections (e.g. the driver for an i2c client node will request
> data via its parent)

That is in my view strictly following because i2c is a bus and therefor=
e
there is a parent>child relation and it is ok to use it to request the =
parent.

But in my words the bus is not =93another component=94. Another compone=
nt
in my example means the =93other" between BT chip and SoC with UART.

> and sometimes even sibling relationships (in
> MFD devices).

I am not at all against using the information that is present in the DT=
 :)
I just want to have the DT the information encoded in the right way.

>=20
> So let me summarize:
>=20
> * Option A: Do not encode remote side information
>   Rationale: UART port can be opened in userspace without that info
>   Counterargument: This information is needed if the OS should be
>   able to hide away the tty and provide support for the connected
>   remote device (e.g. provide a bluetooth device instead of a tty)

Agreed. I think we can drop this option since there are good use cases.

A second one for the records: if we want to provide data from an UART
connected GPS chip through an iio interface.

>=20
> * Option B: Put UART remote side node to / and add a reference to the=
 UART port
>   Rationale: DT wiki page indicates, that child nodes must be address=
able
and UART is not per se a =93bus=94.

>=20
> * Option C: Put UART remote side node below the UART node
>   Rationale: Remote device is accessed through the UART
and treat serial connections as single-client busses

>=20
> Since this is about a subsystem binding DT maintainers ACK is
> definitely needed, so maybe we should just wait for their decision.

Good summary!=20

So let=92s wait for questions / clarifications / comments / decisions b=
y DT maintainers.

Thanks,
NIkolaus
