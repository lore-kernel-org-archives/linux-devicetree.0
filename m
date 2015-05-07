From: "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Thu, 7 May 2015 14:46:15 +0200
Message-ID: <B4D487C5-C260-497B-A441-6C381D53616C@goldelico.com>
References: <55492001.30806@hurleysoftware.com> <DE60E7AA-1BF4-4A68-9638-E09F85FD5C72@goldelico.com> <20150506092738.GB4508@amd> <A2594559-CA92-40C2-A06A-AC2483E85CB1@goldelico.com> <554A03A7.2000504@hurleysoftware.com> <D10E1092-E75F-48F7-86F1-F8987973CEB5@goldelico.com> <20150506123632.GA1764@leverpostej> <BD3D34DD-2FC8-44A2-89FA-35843065F50F@goldelico.com> <20150506141547.GB1764@leverpostej> <EA4AC398-CAEA-40E1-A998-BC528B3788E1@goldelico.com> <20150506171802.GE2974@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150506171802.GE2974@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, List for communicating with real GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am 06.05.2015 um 19:18 schrieb Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:

> On Wed, May 06, 2015 at 05:09:20PM +0100, Dr. H. Nikolaus Schaller wr=
ote:
>> Hi Mark,
>>=20
>> Am 06.05.2015 um 16:15 schrieb Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
>>=20
>>>>>>>> No, I am not playing devil=92s advocate (which would imply tha=
t I am doing this
>>>>>>>> for fun to tease the dog), but I feel I have to be the advocat=
e of future board
>>>>>>>> designers who want to easily import an existing board DT and o=
verwrite device
>>>>>>>> tree nodes to describe design changes, i.e. what slave device =
is connected to
>>>>>>>> which uart.
>>>=20
>>> [...]
>>>=20
>>>>> If this happens, you can move the slave device into a fragment th=
at you
>>>>> can include under the correct node. That's trivial.
>>>>=20
>>>> But less readable. And that is important as well.
>>>=20
>>> I disagree. The manipulation you have to perform to override proper=
ties
>>> is at least as bad as including a file.
>>=20
>> What about:
>>=20
>> #include "omap3-beagle-xm.dts"
>>=20
>> / {
>> 	/* HS USB Port 2 Power enable was inverted with the xM C */
>> 	hsusb2_power: hsusb2_power_reg {
>> 		enable-active-high;
>> 	};
>> };
>>=20
>> compared to=20
>>=20
>> #include =93board1.dts=94
>>=20
>> / {
>> 	/* slave was reconnected to uart4 */
>> 	slave {
>> 		uart =3D <&uart4>;
>> 	};
>> };
>=20
> As I mentioned, you can easily carve up your DTS to make that work wi=
th
> includes if you really must:
>=20
> /* UART0 board variant */
> #include "board.dtsi"
> &uart0 {
> 	#include "some-uart-slave.dtsi"
> };
>=20
> /* UART1 board variant */
> #include "board.dtsi"
> &uart1 {
> 	#include "some-uart-slave.dtsi"
> };
>=20
> If you happen to find includes ugly then you can say it's ugly, but i=
t's
> functionally equivalent, and also means you can avoid having
> disabled/partial nodes all over the place.

=46unctionally equivalent would also be to copy the whole source file a=
nd
s/&uart0/&uart1/.

But this is not the best solution for the DT programmer since there is =
no
automatic *reuse* of common parts.

And your proposal requires 3 source files instead of 2 which deteriorat=
es
readibility and understanding what is really going on. And if you need =
to
change the some-uart-slave, you have to touch a different file than for
changing some other slave.

Yes, it works, but IMHO other factors for a good design are also import=
ant.

Maybe our main difference in PoV is that I specifically want to avoid t=
hat
we force future DT programmers into =93ugly=94 solutions (even if they =
work).

If you think that DT programmers have to live with what they are
given and do the best with it, we can end the discussion.

>=20
> If you really wanted you could macro the label instead and have the
> slaved node in full.

Hm. I have tried to find a single example where a DT source file has an
#include *not* on top level. Or a macro that defines multiple propertie=
s
or a complete subnode.

Maybe it is a commonly used DT design pattern and I just didn=92t find =
it
in the device trees I have checked.

>=20
> [...]
>=20
>>> As Neil mentioned earlier, ignore "bus". Here we're caring about a =
1-1
>>> connection between master (UART) and slave (device), and it happens=
 that
>>> in most other cases the master is actually a bus, so that's how thi=
ngs
>>> happen to be named.
>>=20
>> So you also mean that all master-slave connections must be represent=
ed
>> by DT subnodes and everything else is not acceptable?
>>=20
>> What about:
>>=20
>> 	sound {
>> 		compatible =3D "ti,omap-twl4030";
>> 		ti,model =3D "omap3beagle";
>>=20
>> 		ti,mcbsp =3D <&mcbsp2>;
>> 	};
>>=20
>> Isn=92t McBSP a =93bus=94 with your definition as well? Like a =93ma=
ster=94. And the =93twl4030=94
>> is the slave (codec)?
>=20
> I'm nowhere near familiar enough with the audio hardware nor their
> bindings to comment on that, I'm afraid. My rough understanding was t=
hat
> the twl4030 node here was referring to the logical subsystem as a who=
le,
> with the mcbsp being a physical component, but that's almost certainl=
y
> somewhat wrong.

The McBSP is a 4-wire serial interface controller sitting on the OMAP c=
hip.
It is accessed by MMIO and DMA. The twl4030 is the other end and the da=
ta
that is transferred is PCM audio to/from speakers/microphone.

So this node defines: there is a sound slave that is a twl4030 and the =
PCM interface
is the mcbsp2 of the OMAP SoC. Exactly the same pattern as I want to de=
scribe
a GPS slave that is connected to uart1 of the OMAP SoC.

>=20
>> &usb_otg_hs {
>> 	interface-type =3D <0>;
>> 	usb-phy =3D <&usb2_phy>;
>> 	phys =3D <&usb2_phy>;
>> 	phy-names =3D "usb2-phy";
>> 	mode =3D <3>;
>> 	power =3D <50>;
>> };
>>=20
>> Isn=92t a PHY interface (e.g. ULPI-PHY) a =93slave=94 connected to a=
 12 wire ULPI =93bus=94 as well?
>=20
> Not necessarily. If you took a look at the bindings you'd notice that
> many PHYs have MMIO interfaces for configuration which we have to pok=
e.
> Those MMIO interfaces live on an MMIO bus so we describe those and li=
nk
> to the phy by phandle reference.

Yes, that is the reason why it can only be solved by a phandle, because=
 the =93main interface=94
of the PHY chip is sometimes the MMIO bus, but could also be I2C or SPI=
=2E

In the case of osb_otg_hs I have copied, it is not. The PHY is *only* c=
onnected through
the ULPI wires and all register programming goes through that interface=
=2E It is not connected to
the MMIO bus at all.

>=20
> A given device could operate as a PHY to multiple controllers, hence
> phy-cells, and hence in general a PHY cannot be considered a slave
> device.
>=20
>> At least in this two areas everything done so far appears to contrad=
ict your argument.
>=20
> Not really. You've found bindings with a different idiom, but those s=
eem
> to be organised as they are for reasons which don't appear to apply t=
o
> UART slave devices as you describe them.

In my view I2C and SPI also follow a different idiom (addressable, mult=
iple slaves)
which does not appear to apply for an UART slave device.

>=20
>> This is for me the blueprint how it should be done for UART slaves l=
ike any point-to-point
>> multi-wire interfaces (question not even discussed: does UART-to-UAR=
T have clear master
>> and slave roles? Isn=92t the connected device the =93master=94? but =
I don=92t want to broaden the
>> discussion again).
>>=20
>> This is basically why I keep this discussion open, because it is not=
 that obvious
>> that Neil=92s proposal is right and mine is wrong.
>>=20
>>>=20
>>>>> for other
>>>>> interfaces like SPI and I2C. I do not see a compelling reason to =
do
>>>>> otherwise for devices
>=20
> [...]
>=20
>>>>> hanging off of UARTs -- doing so would make things
>>>>> less straightforward because you have a fundamentally different i=
diom.
>>>>=20
>>>> Yes, my proposal is fundamentally different from I2C and SPI pract=
ice, but
>>>> it is the same that is heavily used for e.g. GPIOs and Regulators.
>>>=20
>>> Well, those cases are somewhat distinct, and I'd say that UART slav=
es
>>> are much closer to SPI/I2C devices than GPIOs or regulators.
>>=20
>> As shown above they are IMHO closer to McBSP and ULPI-PHY (and some
>> other interfaces).
>=20
> As above, I disagree.
>=20
>>> Let's say I have a GPIO described via a phandle. That GPIO is actua=
lly
>>> owned by some GPIO controller whose control interface is sat on an =
MMIO
>>> bus. What we're describing with the phandle is use of the GPIO, but=
 not
>>> the main interface for interactive with the GPIO, which is the MMIO
>>> interface of the controller.
>>=20
>> Right. For the UART we do the same: the UART controller is connected
>> to the MMIO and (in my proposal) the phandle describes the use of th=
e UART
>> (to connect to some slave device). Exactly the same situation.
>=20
> Except that your fundamental interface to the device is via the UART,
> which is not typically the case for things like regulators and/or GPI=
Os.
> If I want a regulator to do something, I ask it to do so via the
> controller's MMIO interface. If you want the device to do something, =
you
> ask it to do so via the UART.=20

I also ask the UART controller through the MMIO to send bytes to the de=
vice.
=46or a GPIO it is just a single bit that is =93sent=94 or =93received=94=
=2E

And, I do not ask the device to do something through UART. I exchange
data. And only if the specific device has it I use some escape mechanis=
ms
(like AT commands) to do control. If a vt52 is connected I only send ch=
aracters
and receive keyboard codes.

So I don=92t think that being able to control the slave is a common pro=
perty
of all UART-slave connections.

BTW: the GPS chip we use is doing something without any instructions. I=
t starts
to send NMEA records right after power on. It would even be useful with=
 a unidirectional
connection from GPS to UART. Hence there are no commands that need to b=
e
sent through UART. Rather it just needs some GPIO to be activated or po=
wered down
when /dev/tty is opened/closed.

So one could argue that in this real case (which we try to solve in an =
acceptable way
since 2 years) the fundamental/main interface (control command interfac=
e) of this chip
is the power on/off line. And UART isn=92t involved at all. Or just as =
an =93activity detector=94.

But that is on the lowest detail level.

>=20
>>> In the case of UART slave devices the control interface is attached=
 to
>>> the UART, and effectively the slave sits on the UART's "bus". We co=
uld
>>> refer to it from elsewhere by phandle, but its canonical parent sho=
uld
>>> be the UART, as that=92s what its main interface is attached to.
>>=20
>> What is the =93main interface=94 of some device? Why should it have =
a special
>> role in DT? I have doubts that it is useful to declare some interfac=
e as =93main=94,
>> unless it is a MMIO bus connection.
>>=20
>> There are e.g. chips with multi-interfaces like a twl4030. They have=
 2 I2C busses, 2 PCM
>> =93busses=94, an ULIP-PHY and some GPIOs.
>=20
> I think that would already be covered as an I2C device with two I2C I=
Ds,
> much like we would cater for an MMIO-interfaced PHY with two MMIO
> control register regions

Yes, as long as multiple interfaces fall into the same category.

>=20
>> Or some 3G/4G modems which have
>> USB, UART (both useable for AT commands in parallel!), PCM and some =
GPIOs.
>=20
> Of these I would expect that the USB or UART inerfaces would be the m=
ain
> ones,

Both are equally valid to be the =93main" interface (because you can us=
e both to send
AT commands).

> though I would expect that we'd require two separate nodes which
> we would have to link up.

And how would you do that without phandles?

=46ortunately this is an easy to solve problem since USB has enumeratio=
n and the
USB interface does not need to be described in DT.

>=20
>> Which interface is =93main=94? For the twl4030 it happens that one o=
f the I2C interfaces
>> is chosen (because it allows to access the registers inside the chip=
).
>=20
> Because it happens to be the =93main=94 interface ;)

It depends on the angle of viewing onto the chip components, to see it =
as the main interface.

If you look from =93how can the kernel access registers=94, it is. If y=
ou look from a
sound (PCM payload) perspective the PCM interface would be =93main=94.

But I agree that a =93main interface=94 should be defined as the interf=
ace that allows
the most broad control the chip. I.e. it should not be defined by =93bi=
ggest payload
bandwidth=94 or similar.

>=20
>> Now you might say: yes, the registers of some uart connected device =
can
>> be accessed through the uart as well. But usually there is a higher =
level
>> protocol (AT commands) that give some sort of =93register addressing=
=94. But
>> that is a different level than using I2C to access e.g. the gpio con=
troller in the twl4030.
>>=20
>> I just want to say that requiring and focussing on a =93main=94 inte=
rface of a peripheral
>> chip may lead to troubles.
>=20
> I don't disagree that it falls apart in some cases. However, that's n=
ot
> the general case, and it applies to other interface types too, so I
> don't think it should matter in the context of this discussions.
>=20
>>>> From my DT designer PoV I would say the UART exists in some SoC
>>>> (independently of a device being connected) and then, a device is =
connected
>>>> to the UART. Hence the proposal of adding this connection link to =
the device=92s
>>>> node and not making the device a subnode. And having the device dr=
iver do
>>>> power management and only ask the uart/tty driver to be notified a=
bout open()
>>>> and close() events. How power is managed in detail is then not any=
 part of the
>>>> tty/serial drivers.
>>>=20
>>> The way that the power management interfaces are organised within L=
inux
>>> is orthogonal to the way we describe things in the DT.
>>=20
>> Agreed. And therefore power management registration, notifications e=
tc.
>> are to be hidden by the drivers and should not be an argument to say=
 =93with
>> subnodes it is easier to implement and probing is done in the right =
order=94.
>=20
> While generally we shouldn't treat OS internals as an argument for DT
> organisation, laying things out in a sensible manner for
> discoverabilitiy is somewhat different from stating that the run-time
> use of a device is fundamentally tied to its description in the DT.
>=20
> We _could_ list all nodes in a flat list with cross references instea=
d
> of having a tree. But it would be horrible for _any_ OS to deal with,=
 so
> we don=92t do that.

Agreed.

=93Discoverability=94 is something I have not yet thought about. For I2=
C it is
important to tell the I2C controller at which address to look for devic=
es
(so that it does not have to scan all of them). This is most easily ach=
ieved
by making the (potential) slaves subnodes of the i2c bus controller and
nicely fits with the <reg> property subnodes usually have.

UART slaves are static. Or simply respond/don=92t respond. So there is
no well defined discovery mechanism involved and therefore the slave
does not require to be a subnode of the uart to support descovery.

BTW: there is a solution to the probe sequence issue:
1. each UART registers itself in some uart map (phandle -> driver insta=
nce)
    as soon as probed successfully
2. a slave driver checks if it can find its attached uart in the list
3. if not -> -EPROBE_DEFER
4. if yes, it can register with the uart driver to receive tty open/clo=
se notifications


But mainly we do not agree on priority and importance of criteria when =
evaluating
the two solutions that are on the table.

We can continue with examples and counter examples to identify the impl=
ications
(for Driver developers and for DT developers) of choosing either one.

It is a very complex problem without a single criterion that makes one =
solution
better than the other. Hence I think the discussion is necessary.

So should we continue or does someone decide?

BR and thanks,
Nikolaus

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
