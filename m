From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power on/off UART attached devices.
Date: Wed, 25 Mar 2015 17:44:42 +0100
Message-ID: <E4CA3051-6004-4D7B-BF01-CE47CFEDA4EB@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <20150318055831.21025.33670.stgit@notabene.brown> <C53A3E5D-5AEA-4F0F-88A9-F9BC8CB0D0D6@goldelico.com> <20150320195451.146a7915@notabene.brown> <14FB51CF-9568-4BF4-B917-2C019D992FDB@goldelico.com> <20150321103122.23603014@notabene.brown> <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com> <20150325014543.GA967@earth> <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com> <20150325152110.GA7903@earth>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150325152110.GA7903@earth>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 25.03.2015 um 16:21 schrieb Sebastian Reichel <sre@kernel.org>:

> Hi,
>=20
> On Wed, Mar 25, 2015 at 08:59:14AM +0100, Dr. H. Nikolaus Schaller wr=
ote:
>> Am 25.03.2015 um 02:45 schrieb Sebastian Reichel <sre@kernel.org>:
>>> On Tue, Mar 24, 2015 at 06:58:15PM +0100, Dr. H. Nikolaus Schaller =
wrote:
>>>> So you propose that the parent->child relationship is =93control=94=
? I.e. some
>>>> channel which allows to address some bus client (through <reg>) an=
d
>>>> control that devices.
>>>>=20
>>>> Makes sense. This is how i2c and spi clients are specified.
>>>>=20
>>>>>=20
>>>>> In the case of our GPS, it receives control over the serial conne=
ction from
>>>>> the UART,
>>>>=20
>>>> Ahem - does it?
>>>>=20
>>>> AFAIK the chip simply starts to emit NMEA records if powered on.
>>>> There is no command going over the serial interface to address it
>>>> or control it.
>>>=20
>>> Right, since GPS basically doesn't need any configuration/control.
>>> That=92s not true for other UART attached devices, though.
>>=20
>> Do you have an example? Usually an UART data stream is transparently
>> presented to a /dev/tty - and user-space daemon can configure/contro=
l the
>> attached device. In most cases it can mix payload data and control c=
ommand
>> by some AT command and escape sequences.
>=20
> Yes, but the configuration is minimal. Anyways as you said there
> *is* some kind of control happening over the UART.

Control is happening on a higher network stack level than UART. It
control is done through AT commands.

>=20
>>>>> also receives control via a GPIO to the on/off pin, and also need=
s
>>>>> a regulator to power the antenna.
>>>>>=20
>>>>> So should the parent be the uart, the on/off GPIO, or the regulat=
or?
>>>>>=20
>>>>> I would much rather there wasn't a parent, and that each of these=
 were listed
>>>>> as ad-hoc attribute assignments.  But device-tree says there must=
 be a parent
>>>>> (where possible), and the parent is the thing that is =93primaril=
y" in control.
>>>>=20
>>>> Well, IMHO the =93parent=94 could also be the root. Representing t=
he
>>>> whole board.
>>>>=20
>>>> Nevertheless, I doubt your rule that =93ability to control=94 defi=
nes
>>>> the parent>child relation (see below).
>>>>=20
>>>>>=20
>>>>> I think the GPS is =93primarily" a uart-attached device.
>>>>=20
>>>> But not in the same way as an I2C device.
>>>>=20
>>>> Especially the serial interface is not a bus and not used for
>>>> signalling and power control. It is payload data (only).
>>>=20
>>> Actually many I2C devices are also powered on/off via a GPIO and
>>> even use additional GPIOs for sending interrupts. Nevertheless they
>>> are normally identified as an I2C device.
>>=20
>> Because I2C is a bus that can address multiple clients and gpio isn=92=
t
>> a bus and a point-to-point connection.
>>=20
>> But IMHO it is not because they (can) send payload data over i2c.
>=20
> From my POV it's not because I2C is a bus, but because the primary
> function is happening via I2C (e.g. configuring sensor, gettings its
> data). The GPIOs are only needed to compensate some I2C shortcomings
> (missing irq feature in I2C) or reduce the complexity of the client
> (power GPIO). The actual system interaction with the I2C chip is
> going via I2C, though.

Yes, but this is in my new understanding irrelevant for proper DT descr=
iption.

>=20
>>> Also for non-GPS device the serial connection is used for
>>> controlling and configuring the device.
>>=20
>> This assumes that =93controls a device=94 is the criterion for makin=
g a device
>> a subnode. I doubt that.
>=20
> For me the criterion always was "accessing the device's
> registers/configuration/data" from the system's point of view (so
> your video port does not count, since it models a connection between
> two components without system interaction).

>=20
>>>>> So I propose a device-node which describes the GPS, which is a ch=
ild of the
>>>>> UART, and explicitly identifies the GPIO it uses to power on/off,=
 the
>>>>> regulator it uses to power the antenna, and how it receives "on o=
r off"
>>>>> status indications from the GPS.
>>>>=20
>>>> The more I think about that, you have given good arguments *not*
>>>> to use the parent->child relationship for the UART interface of
>>>> the GPS.
>>>>=20
>>>> Let me give another example. The 3G Modem has 3 (or 4) interfaces:
>>>> 1. an USB-Interface for AT signalling and payload
>>>> 2. some GPIOs for power control.
>>>> 3. a PCM interface for digital voice.=20
>>>> 4. it might also have a serial interface as alternate AT command a=
nd (GPRS
>>>>   low speed) payload.
>>>>=20
>>>> So which one is the most prominent or most important to make it a =
child of?
>>>>=20
>>>> If you use =93control=94 you must make it a child of the USB phy a=
nd the serial interface
>>>> which requires multiple inheritance=85
>>>>=20
>>>> So I am not sure at all. None is IMHO prominent and unique enough =
to make it
>>>> a parent>child relation.
>>>>=20
>>>> Threrefore, I would be happy to see it as multiple children of /. =
=46or example a
>>>> MFD with subnodes.
>>>=20
>>> This scenario has already been seen before and can happen for
>>> non-UART based devices (e.g. SPI + I2C). So far the decision was to
>>> postpone the discussion about this kind of devices until one of the=
m
>>> appears.
>>>=20
>>>>> It is arguable that the "antenna" should be treated as a separate=
 device - a
>>>>> child of the GPS - which controls the regulator and also provides=
 a 'extcon'
>>>>> which reports whether an external GPS antenna is attached, or whe=
ther the
>>>>> internal on is in use.  I haven't made the time to properly explo=
re that
>>>>> issue yet.
>>>>=20
>>>> If you assume that parent>child relationship is about control (onl=
y). But if it
>>>> is about data flow, there is a different concept in DT. For exampl=
e the CSI/DSI
>>>> (OMAP DSS) use the =93port=94 concept.
>>>=20
>>> Yes, this is about data not going to the cpu / system memory.
>>=20
>> Really? The frame buffer data is in system memory and gets to the pa=
nel. Or a
>> camera image ends up in system memory.
>=20
> Really? So the panel accesses the system memory? Check again. The
> panel is simply connected via DSI/SDI/... and does not access the
> system memory at all. The display controller OTH does. So let's have
> a look at the DT structure (simplified):
>=20
> ocp -> dss -> { port =3D <&panel>; }
> ... -> spi -> panel { port =3D <&dss>; }
>=20
> So the port models a device-to-device connection, which works
> independent of the remaining system. No system memory is involved.

Sorry, but I can=92t exactly follow what you want to show.

Yes, the port mechanism describes a device to device connection.

But it does not describe system memory. Although it is the source of
the video (i.e. the framebuffer).

This shows that the DT does not necessarily describe data flow.

So why do you want to describe data flow from tty to uart to some conne=
cted
device?

>=20
>>>> This means that indeed parent>child is used for control, e.g. I2C
>>>> or SPI to tell the panel controller to switch on.
>>>=20
>>> well parent > child is not about power control, but about "primary"
>>> control.
>>=20
>> Can you clearly and precisely define what =93primary=94 control is? =
I think
>> two people will have three opinions about that.
>>=20
>> For example I would see the w2sg0004 on/off gpio as the primary =93c=
ontrol=94
>> which makes the light (NMES records) turned on.
>>=20
>> Therefore we should make it the subnode of some gpio-controller, sho=
uldn=92t we?
>=20
> I never thing of enable gpios to be the main interface, since it can
> simply be connected to some voltage and be enabled constantly. It's
> just some kind of helper for the device. It does not really exchange
> data between the system and the device, though. (Note: This is
> not true, if the GPIOs are used for bitbanging some high-level
> protocol, in which case a virtual controller (like i2c-gpio) is
> modelled in DT).
>=20
> So let's have a look at the UART link again. It is transporting
> non-trivial data from the UART to the system and it is handling
> the data I actually want. It's providing access to the device's
> =93registers".

Well, this view can be followed, but is as strange and bent to fit
like my view of the w2sg0004 as a =93regulator=94.

>=20
> For me its clear, that one would expect the GPS under the UART
> port, since when speaking with other developers I would describe
> the GPS as being a "UART attached GPS chip". From me the
> differences between a UART port and a SPI port from a system
> software=92s POV can be reduced to missing multi-device support.

DT does not necessarily have to describe data flow as we have seen
in the video pipeline example.

>=20
>>> Some I2C/SPI devices have additional gpios for power
>>> control.
>>>=20
>>>> For example we have the GTA04 panel as a subnode of SPI (because S=
PI is a
>>>> bus and the panel is controlled through SPI). Other panels need no=
 control
>>>> interface and are simply a child of /.
>>>=20
>>> Yes, some devices do not have an interface worth of being called
>>> =93primary control" :)
>>=20
>> This is why I criticise this criterion to define when we need a
>> parent/child relation.  It is not strict and does not follow a
>> principle but opinions.
>>=20
>> But before we stick to opinions, I have studied again:
>>=20
>> 	http://www.devicetree.org/Device_Tree_Usage#Devices
>>=20
>> In their examples (which unfortunately don=92t cover our special cas=
es)
>> they make clear that subnodes are needed for =93addressable=94 subno=
des
>> like CPUs, Memory banks, i2c clients, ethernet clients etc.
>>=20
>> (well, the first sentence in =93Interrupts=94 can be read to confirm
>> this interpretation: =93Unlike address range translation which
>> follows the natural structure of the tree=94)
>>=20
>> In general I read from this (although it is not explicitly stated)
>> that parent>child hierarchy is about addressing bus clients and
>> mapping devices into memory address space.
>>=20
>> Everything else is to be done through references.
>=20
> Actually I think so far we had only one similar case, so its not
> obviously a corner case, which is underdocumented. The one similar
> case is the HSI subystem, which I maintain (so obviously I'm biased
> ;)). It's also describing a 1:1 dependency (also serial, but with
> multiple logical channels) and uses a child node.
>=20
> Actually the nokia-modem binding is quite similar to your UART
> attached GPS device. It has some GPIOs for power control and even
> an additional GPIO for interrupting. The primary interface is still
> the HSI one, which exchanges all of the configuration and data.
>=20
>>>> The video stream and its connections are arranged through such por=
ts.
>>>> For the video out management we have added our OPA362 video amplif=
ier into
>>>> that video pipeline which starts at the VENC (Video encode) in the=
 SoC,
>>>> goes through the OPA362 and ends in the connector (which has its o=
wn
>>>> node). All this is connected by references. The opa362 node itself=
 is a child
>>>> of /:=20
>>>>=20
>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/omap3-gta04.dtsi?id=3Drefs/tags/v4.0-rc5#n98
>>>>=20
>>>> So to summarize I now see exactly two cases where parent>child is =
used:
>>>> a) for components of an aggregate device (OMAP3 > I2C controllers)
>>>> b) for components connected to a bus controller (I2C > TWL4030)
>>>>=20
>>>> Since the twl regulators are components of the twl chip it complet=
ely explains
>>>> why we see
>>>>=20
>>>> omap3 > i2c > twl4030 > vaux4
>>>>=20
>>>> Everything else is done by references. Therefore we see references=
 for
>>>> * gpios within a controller (independently of it=92s relation on a=
 bus)
>>>> * regulators
>>>> * clocks
>>>> * any function that is not connected by a bus
>>>>=20
>>>> There is no need (and practice) to squeeze everything into a paren=
t > child
>>>> relationship. And I can=92t see your =93control=94 or a =93main in=
terface=94 rule.
>>>=20
>>> And I can't see your bus rule for me the motiviation behind the
>>> parent > child relationship is about the system's primary way for
>>> accessing a device.
>>=20
>> It appears not to be =93my bus rule=94. I just formulated in that wa=
y from the
>> examples I have seen=85
>=20
> yes, me too ;)
>=20
>>> It's coincidence, that this is currently (always?) a bus connection=
,
>>> since most devices are actually connected using some kind of bus.
>>=20
>> I think the view must be reversed and then it is not a coincidence b=
ut a
>> consequence.
>=20
> so show me some non-bus connections, which are actually used to
> exchange non-trivial data (with on/off being trivial). We currently
> do not really have them.

Are we talking about DT or data flow from user space through the kernel=
?

>=20
>>>> At least this is my (a little limited) view from using and program=
ming DT for
>>>> multiple boards.
>>>>=20
>>>> Maybe this is what the DT list should comment or show a clear defi=
nition when
>>>> parent>child relations are wanted and when not.
>>>>=20
>>>> Now back to the GPS chip connected to an UART.
>>>>=20
>>>> Is it
>>>> a) a component of an aggregate device? no
>>>> b) is it connected to a bus (i2c, spi, address bus)? no
>>>=20
>>>> This comes back to the question if UART is a bus.
>>>>=20
>>>> I still think that it is NOT a bus and therefore it should not be =
modeled in DT
>>>> like busses are (enforcing clients to become subnodes).
>>>=20
>>> If I use a SPI device with hardwired chip select its *very* similar
>>> to UART.
>>=20
>> Yes, because you can just connect a single client to SPI and then
>> question if it is a bus. But that is a useage pattern but not a
>> principle.
>>=20
>> And IMHO, DT definitions should follow principles and not current
>> need.
>>=20
>> Otherwise I don=92t understand why the virtual-gpio connected to
>> UART DTR or the regulator is *not* acceptable.
>=20
> I have missed virtual-gpio UART DTR discussion and assume, that the
> regulator is about the regulator on the GPS chip?

Well, it was introduced in platform device kernels that it was possible
to define a dtr-gpio for the uart. And there was a driver for the w2sg0=
004
that presented itself as a gpio-controller with a single gpio. This =93=
virtual=94
gpio was used to power on the chip as soon as DTR was asserted.

Parts of this had been in mainline but have been removed some months
ago.

>=20
> I don't think the regulator is not acceptable. I simply think its
> not useful. Basically the structure would be
>=20
> uart {
>    /* stuff */
>    gps {
>        vdd-supply =3D <&gpsreg>;
>        /* stuff */
>=20
>        gpsreg: regulator {
>            enable-gpio =3D <GPIO 42>;
>            /* stuff */
>        }
>    }
> }

Except that the gpsreg is a subnode of /

>=20
> and could simply be
>=20
> uart {
>    /* stuff */
>    gps {
>        enable-gpio =3D <GPIO 42>;
>        /* stuff */
>    }
> }
>=20
> Without loosing important information.

Only if you assume that the gpsreg must be a subnode of the uart.

> The regulator would only be
> interesting if it is also used by other devices. Other devices also
> do not expose their internal clocks etc.
>=20
>>>> The reason is there no well defined protocol to make multiple clie=
nts and
>>>> you can=92t specify a <reg>.
>>>>=20
>>>> So you are either abusing the notion of a bus or the gps chip must=
 be a separate
>>>> DT node (child of something else).
>>>>=20
>>>> I hope my gut feeling that we are trying to do something fundament=
ally wrong
>>>> with making the gps chip a subode of serial is now argued a little=
 better.
>>>>=20
>>>> For making the serial device control some regulator through a refe=
rence to
>>>> a regulator, I am very fine. It is what you do for the W2CBW bluet=
ooth part.
>>>=20
>>> NAK about referencing the regulator from the UART node. It should b=
e
>>> referenced from the Bluetooth / GPS node. The UART port works
>>> without the regulator. It's the remote side, that does not work.
>>> We also do not add the regulators of I2C clients to the I2C host.
>>=20
>> I think Pavel made a very good comment:
>>=20
>> The uart node should be able to power a rs232 converter/level shifte=
r directly
>> connected to it (through a regulator or gpio-regulator).
>=20
> Yes and this may belong to the UART node.
>=20
>> And there must be a separate mechanism to power the remote rs232 con=
verter
>> and the remote device.
>=20
> Yes and I think this goes to the remote device's node.
>=20
>> The standard signalling for this are the RTS/DTR lines of an UART/RS=
232.
>> UART is not only RX+TX.
>=20
> so?

You said NAK about referencing a regulator from the UART node and now?

>=20
>>> If you want to talk with an I2C device you enable the I2C device
>>> *and* its parent (aka the I2C host controller). I guess the same
>>> should be done for the UART.
>>>=20
>>>>>>>> All the following is very special logic for the w2sg0004 chip =
which should be
>>>>>>>> divided out into a separate driver.
>>>>>>>>=20
>>>>>>>> Marek and me already had proposed such a chip specific driver =
(to be located
>>>>>>>> in drivers/misc) some months ago. It would encapsulate everyth=
ing w2sg0004
>>>>>>>> specific and present itself as a regulator (because that is it=
s main purpose:
>>>>>>>> control the LDO regulator inside the w2sg0004 chip).
>>>>>>>=20
>>>>>>> Presenting itself as a regulator would be wrong because it isn=92=
t a regulator.
>>>>>>=20
>>>>>> It has a regulator that can be controlled by a gpio=85
>>>>>=20
>>>>> Does it?  I guess may it does.
>>>>> Maybe it also has an ARM core and some memory and assorted other =
bits and
>>>>> pieces.  But we don=92t really need to describe them to device tr=
ee.
>>>>=20
>>>> Well, if I look into the data sheet, it has indeed an LDO from 3.3=
V to 1.8V.
>>>>=20
>>>> Not to make you confused: the w2sg0084 would have a WAKEUP output =
which - if
>>>> connected to a GPIO - would tell if the module is really active or=
 not. Using this would
>>>> make monitoring the RX line through different pinmux states obsole=
te.
>>>>=20
>>>> But the only Linux board using the w2sg00x4 appears to be the GTA0=
4 and it has
>>>> not wired the WAKEUP line to a  GPIO.
>>>>=20
>>>>> The w2sg0004 is primarily a GPS device, so that needs to be state=
d in the
>>>>> devices tree description.  If there are subcomponents that can us=
efully be
>>>>> described as well then there could be a place to describe those s=
ubcomponents.
>>>>> I notice that there is a "1V8-out" pin, so presumable the chip ca=
n deliver a
>>>>> 1V8 source based on its 3V3 input.  If a board made use of that, =
it could be
>>>>> useful to describe the regulator inside the GPS so it could be de=
clare that
>>>>> some other device which needed 1V8 made use of that regulator=85.
>>>>=20
>>>> Yes. Well, even if *we* do not use it in this way yet, we should n=
ot make it
>>>> difficult for others to do by enforcing the wrong description.
>>>=20
>>> well this has nothing to do with the parent-child discussion, since
>>> you can obviously reference a regulator independently of its
>>> position in the DT.
>>>=20
>>>>>> Another example to think about: the twl4030 is also not a regula=
tor.
>>>>>> Nevertheless they present some regulator nodes.
>>>>>=20
>>>>> The TWL4030 is a multifunction device which contains regulators a=
nd GPIOs and
>>>>> audio codec and  USB PHY etc etc etc.
>>>>>=20
>>>>> So in device-tree there is a device-node for the TWL4030, and it =
has
>>>>> child-nodes for each sub-device.   They in turn can provide servi=
ces to other
>>>>> devices on the board.
>>>>=20
>>>> Exactly as discussed above. And there, the parent>child relation f=
or the twl4030
>>>> and its subdevices is right.
>>>>=20
>>>>> These sub-devices are much more independent of the whole than the=
 regulator
>>>>> inside the w2sg0004 is.
>>>>=20
>>>> Hm. That is probably argueable as well. At least a vague ciriterio=
n.
>>>>>=20
>>>>>>=20
>>>>>> Or take the OMAP3 pbias_regulator. The OMAP3 isn=92t a regulator=
 as well
>>>>>> but has an internal pbias_regulator that needs to be controlled.
>>>>>=20
>>>>> I don't know much about a "pbias_regulator", but the OMAP3 is a m=
ultifunction
>>>>> device which contains a CPU and multiple other controllers and  c=
ommunicators
>>>>> and stuff.  One of the components in the OMAP3 is this pbias_regu=
lator, and
>>>>> it has a device-node which is a child of the 'ocp' node - which i=
s the main
>>>>> interconnect in the OMAP3 I think.
>>>>>=20
>>>>> So I'm not against describing the regulator in the w2sg0004, but =
for
>>>>> consistency with everything else, it would need to be child-node =
of a
>>>>> device-node which describes the w2sg0004 as a whole.  I'm not sur=
e that doing
>>>>> that would gain anything.
>>>>=20
>>>> Well, it would gain consistency how chips with multiple components=
 inside
>>>> are described.
>>>=20
>>> I don't think so. Many devices do not expose all of their
>>> subdevices. e.g. they do not expose their internal clocks.
>>> Apart from that there are a few devices in the kernel, which
>>> do use enable-gpio(s).
>>=20
>> After reading http://www.devicetree.org/Device_Tree_Usage#Devices I =
must
>> revise my formulation a little.
>>=20
>> It is not that parent>child is used for describing =93busses or grou=
ping subdevices".
>>=20
>> It is only for =93grouping addressable components=94, which implies =
some bus.
>>=20
>> This still explains the ocp component of the OMAP3 - which represent=
s the
>> whole internal =93interconnect=94 bus (see comment in omap3.dtsi).
>>=20
>> Therefore you are right. It is not correct to split up a device into=
 arbitrary
>> components and group them again by the parent>child pattern.
>>=20
>> Although the structure of twl4030.dtsi appears to simply list and gr=
oup
>> subcomponents without telling explicitly how to address them.
>=20
> Yes and this style is not only used for twl4030, but also for other
> multi function devices. I do not have a problem with splitting up a
> device into components as long as they are referenced by other
> components. There is no point in exposing all internal information.
> For the system its not relevant, that the GPS chip has a 30MHz
> clock if its part of the chip and nobody else is using it.
>=20
>>>> And would make it easier to see the whole w2sg0004 a child of /.
>>>=20
>>> Even with the regulator subdevice I would still make the w2sg0004 a
>>> child of the UART port.
>>=20
>> This would mean that a tty / uart is able to address multiple client=
s. How
>> could it do that?
>=20
> In theory it's possible:
>=20
> ? -> uart -> multiplexer -> { device1, device2 }
>=20
> I hope nobody will build such a device, though :)
>=20
> I don't think addressability is important for a parent > child
> connection, though. It is important for a reg node, of course.

That is the key question I am trying to get founded answers, not opinio=
ns :)

>=20
>>> Main reason is, that I would need to go
>>> through the UART to =93communicate" with the w2sg0004.
>>=20
>> You can always "communicate=94 through the UART. Even without DT. As
>> long as the connected chip is powered up by any means (could be
>> some fixed-regulator or hard wired).
>>=20
>> Power control for open()/close() did even work with the DT based
>> DTR->virtual-gpio approach.
>>=20
>> We just do not described in the DT that there is a data connection
>> from uart1 to the RX/TX pins. But you just open /dev/ttyO1.
>>=20
>> Thus, describing a relation between the uart node and the GPS chip
>> in the DT is not even a requirement.
>=20
> It is when the kernel should be able to handle the GPS. The DT is
> supposed to be independent from Linux and other operating systems
> may want to hide the tty if a GPS is attached to it and instead
> provide something like /dev/gps, which could automatically be picked
> up by userspace software.

Well, it is difficult to cover all future use cases.

But then you can still add a uart =3D <&uart1> reference to the DT node
of the driver. Because I understand that then the driver is the master
(and needs access to a hidden UART) and not the GPS chip a slave of
an exposed UART.

>=20
>> Probably the main problem we have is that we want to describe this
>> data connection but the device tree is about describing how to
>> address components and data flow is left to internal APIs. Or
>> =93ports=94 like in the video pipelines.
>=20
> As I wrote the tree structure shows how to "reach" a component for
> accessing its configuration/data from the system.

Yes, you wrote and I already pointed out that I disagree. It contradict=
s
what

http://www.devicetree.org/Device_Tree_Usage#Devices

appears to tell me. So who is right?

>=20
>> Let me raise the question:
>>=20
>> Why do we need to describe in the DT (independently of Linux power
>> control structures and drivers!) that the GPS data interface is
>> connected to a specific UART?
>> Who needs this information and for which purpose?
>=20
> Because an operating system can provide drivers, which completly
> hide away the UART connection. Example:
>=20
> Let's assume we have an UART attached Bluetooth chip connected to
> the second UART.
>=20
> In Linux, userspace currently must know, that the BT module is
> connected to this port and correctly setup the port for BT usage.
> Once this has been done the port is completly handled in the kernel
> and userspace can ignore the UART.

Ok, this is a reasonable example. But I still don=92 see that it requir=
es that the
bt chip must be a subnode of the uart.

>=20
> So why must the user configure the port? Because the kernel does not
> know, that a BT chip is connected to the port.

Then, I would suggest to write it like you have done:

=93the BT chip is connected to the port uart1=94

This can be easily translated into DT language:

/ {
	bt {
		compatible =3D =93vendor,chip=94;
		uart =3D <&uart1>;	/* this chip is connected to uart1 */
		enable-gpio =3D <&gpio3 17 0>;
	};
};

This also resembles the =93port=94 mechanism (just simplified because i=
t is not
a backwards forward linkage).

Or exactly follows the pattern that a driver that wants to use some gpi=
o simply
links to the gpio controller. Or a driver wants to control a gpio.

What I don=92t understand is what is here so special to not use this DT=
 pattern.

But It could also open a different solution for the tty open() -> w2sg =
power on problem.

/ {
	gps {
		compatible =3D =93wi2wi,w2sg0004=94;
		uart =3D <&uart1>;	/* this chip is connected to uart1 */
		enable-gpio =3D <&gpio3 17 0>;
	};
};

Here, the w2sg0004 probe function could register with uart1 to get noti=
fied
about open/close events and then do what it has to do.

In that case the w2sg0004 driver would not even need to present itself
as a virtual gpio (for DTR) or a regulator because it has a kernel inte=
rnal
API to apply to tell the uart what it wants to do.

> If the kernel gets
> this information from DT it can do all the UART handling itself and
> provide a bluetooth device without any user interaction.

I think we should get a better understanding of the DT design patterns.

IMHO (or IMPoV):

* parent>child is not for describing =93control=94 or =93primary interf=
ace=94 but addressability
* if a driver needs access to another component, a reference property i=
s used

BR,
Nikolaus
