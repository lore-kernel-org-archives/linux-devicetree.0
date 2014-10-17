From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 2/2] Documentation: devicetree: Add bindings for Wi2Wi w2sg0004 gps
Date: Fri, 17 Oct 2014 21:55:50 +0200
Message-ID: <27AD2801-6410-44E3-9E0C-911D73E6A457@goldelico.com>
References: <1413491183-15018-1-git-send-email-marek@goldelico.com> <1413491183-15018-2-git-send-email-marek@goldelico.com> <20141017093714.GB4202@leverpostej> <D65FF64A-856F-47EC-B3DE-7F2FCE505087@goldelico.com> <20141017110043.GA5335@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141017110043.GA5335@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marek Belisko <marek@goldelico.com>, "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.de>
List-Id: devicetree@vger.kernel.org


Am 17.10.2014 um 13:00 schrieb Mark Rutland <mark.rutland@arm.com>:

> On Fri, Oct 17, 2014 at 11:16:42AM +0100, Dr. H. Nikolaus Schaller wr=
ote:
>>=20
>> Am 17.10.2014 um 11:37 schrieb Mark Rutland <mark.rutland@arm.com>:
>>=20
>>> On Thu, Oct 16, 2014 at 09:26:23PM +0100, Marek Belisko wrote:
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> Signed-off-by: Marek Belisko <marek@goldelico.com>
>>>> ---
>>>> .../devicetree/bindings/misc/wi2wi,w2sg0004.txt    | 44 ++++++++++=
++++++++++++
>>>> 1 file changed, 44 insertions(+)
>>>> create mode 100644 Documentation/devicetree/bindings/misc/wi2wi,w2=
sg0004.txt
>>>>=20
>>>> diff --git a/Documentation/devicetree/bindings/misc/wi2wi,w2sg0004=
=2Etxt b/Documentation/devicetree/bindings/misc/wi2wi,w2sg0004.txt
>>>> new file mode 100644
>>>> index 0000000..e144441
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/misc/wi2wi,w2sg0004.txt
>>>> @@ -0,0 +1,44 @@
>>>> +Wi2Wi GPS module connected through UART
>>>> +
>>>> +Required properties:
>>>> +- compatible: wi2wi,w2sg0004 or wi2wi,w2sg0084
>>>> +- pinctrl: specify two states (default and monitor). One is the d=
efault (UART) mode
>>>> +  and the other is for monitoring the RX line by an interrupt
>>>> +- on-off-gpio: the GPIO that controls the module's on-off toggle =
input
>>>> +
>>>> +Optional properties:
>>>> +- lna-suppy: an (optional) LNA regulator that is enabled together=
 with the GPS receiver
>>>> +
>>>> +example:
>>>> +
>>>> +        gps_receiver: w2sg0004 {
>>>> +                compatible =3D "wi2wi,w2sg0004";
>>>=20
>>> I couldn't spot "wi2wi" in
>>> Documentation/devicetree/bindings/vendor-prefixes.txt (in mainline)=
=2E
>>>=20
>>> Could you please add it?
>>>=20
>>>> +                gpio-controller;
>>>> +                #gpio-cells =3D <2>;
>>>=20
>>> As far as I can see, these properties aren't necessary. This only
>>> consumes a GPIO, it doesn't provide any.
>>=20
>> Well, it provides one GPIO. Sort of a "virtual=93 GPIO. It is needed=
 so that=20
>> it can be wired up to the DTR gpio of the UART driver (unfortunately=
 this
>> patch was reverted some months ago from mainline and we will reintro=
duce
>> it soon).
>=20
> If this GPIO doesn't really exist, then it's a Linux internal
> implementation detail rather than a description of the hardware, and
> doesn't really belong in the DT.

Hm.=20

Let=92s describe it differently.

I can see the Linux driver module as a simple software simulation for a
piece of hardware that could have been connected between the UART
and the GPS chip.

Basically it is a pulse-generator and a flip-flop to detect data flow o=
n the RX
wire. This could be implemented by an external FPGA or uController. Or =
as
it is done on our board for saving hardware by a mix of the main CPU ha=
rdware
(Pinmux + GPIO + IRQ) and a kernel driver.

The best of course would have been if the w2sg0004 would have a physica=
l
=84enable=93 GPIO (instead of that on-off control input).

Then we would hook up that enable to some physical GPIO of the CPU
and simply refer to it as e.g. <&gpio4 12>. And would not even need a d=
river
for it (unless we want to make rfkill gps work).

Therefore the driver we suggest provides an additional gpio controller =
with a
single GPIO so that we can write <&w2sg 0> to refer to this virtual gpi=
o.

So in fact we try to wrap a non-optimal chip design by the driver and m=
ake it
appear as a standard GPIO interface to the DT and user space and whoeve=
r
needs simply to enable/disable the GPS chip.

>=20
> It sounds like what we actually need is the ability to describe devic=
es
> attached to UARTs.

Hm. The purpose of the driver is power control of the chip. Not the ser=
ial
interface.

> Then you could have a mechanism whereby the UART
> driver can notify the other device driver regarding events (e.g. the
> UART being opened for access), or the other driver could claim owners=
hip
> of the UART and expose its own interface to userspace.
>=20
> That would be independent of the particular UART or other device, and
> the only description necessary in the DT would be an accurate
> representation of the way the hardware is wired.
>=20
> There are a few ways that could be done, but I suspect the simplest i=
s
> to just have the device as a sub-node of the UART, like we do for SPI=
 or
> I2C buses:
>=20
> 	serial@f00 {
> 		compatible =3D "vendor,uart";
> 		reg =3D <0xf00 0x100>;
> 		...
>=20
> 		gps {
> 			compatible =3D "wi2wi,w2sg0004";
> 			...
> 		};
> 	};
>=20
> That wouldn't work for devices with multiple UART connections. Do tho=
se
> exist, and are they common in configurations where out-of-band
> management is necessary (e.g. regulators, clocks)?

UARTs are usually point to point interfaces and not busses. So there is
no need to describe the interface. And I would speculate that in most c=
ases
they simply go to some connector and therefore no connected chip that n=
eeds
to be described in the DT at all. Because it has a user-space driver (e=
=2Eg. AT
commands) and no kernel driver.

But we have no idea how such a solution could be implemented or tested.

If someone adds that to the serial drivers, we would be happy to use it=
,
but unless such a thing exists, I think our solution is quite simple an=
d isolated
into this single driver and also uses existing standard interfaces (gpi=
os, pinmux).

>=20
>> The reason to solve it that way is that we did not want to have a di=
rect link
>> between this driver and any serial drivers or other mechanisms how d=
rivers
>> can detect that their serial port (/dev/tty*) is opened.
>>=20
>> It is used to power down the w2sg GPS chip if no user space process =
is
>> accessing its serial port (or de-asserts DTR through tcsetattr/ioctl=
).
>>=20
>>>=20
>>>> +
>>>> +                pinctrl-names =3D "default", "monitor";
>>>> +                pinctrl-0 =3D <&uart2_pins>;
>>>> +                pinctrl-1 =3D <&uart2_rx_irq_pins>;
>>>> +
>>>> +                interrupt-parent =3D <&gpio5>;
>>>> +                interrupts =3D <19 IRQ_TYPE_EDGE_FALLING>;  /* GP=
IO_147: RX - trigger on arrival of start bit */
>>>=20
>>> While interrupts is a standard property, please describe above how =
many
>>> you expect and what their logical function is.
>>>=20
>>> The only part I'm confused about is how the link to the UART is
>>> described. I assume I'm just ignorant of some existing pattern.
>>=20
>> The serial link itself is not described at all because it is assumed=
 to be a =84must have=93.
>=20
> Huh? So it's a "must have" that you "don't have" in the DT?

Yes. The DT does not describe everything. Only those things that need
a kernel driver. And UARTs usually have user-space drivers (e.g. gpsd,
gsmd, pppd) and ioctl/tcsetattr.

>=20
> I think that the relationship is being described incorrectly in the D=
T,
> and I think that there is a more general problem that needs to be
> addressed in order to make this case work.
>=20
>> The driver only needs to monitor the RX line and needs to switch it =
between UART and
>> GPIO/IRQ mode. So this monitoring switch is described (with two diff=
erent pinctrl states).
>=20
> While this particular driver only needs that at this point in time,
> that's not necessarily true of drivers for similar devices, nor is it
> necessarily true if we need to add additional features to this driver=
=2E

Which features are you thinking of to add to this driver? And do
similar devices exist at all? Since we have not found any, we have
declared it as a "misc=93 driver.

>=20
> Describing the relationship leaves a lot more freedom to improve thin=
gs
> without having to update every DTB.
>=20
>> We know that it is a little tricky to control this chip correctly - =
and we think this solution
>> is the most general (no direct dependency on the serial line, and ju=
st to pinmux states
>> and an interrupt).
>=20
> I think that the rough approach I sketched out above is more general,
> and I think that you must describe the relationship with the serial
> line.
>=20
> It's not clear to me whether the interrupt you describe is attached t=
o
> the GPS, or if this is logically part of the UART.

The interrupt is needed to simulate the glue logic connected between
UART and GPS.

The output signal comes from the GPS module and goes to some pad
of the OMAP3 SoC. This pad can be either multiplexed into the UART RX
input or into a GPIO bank of the OMAP. That GPIO controller can generat=
e
the interrupt on incoming data (when none is expected).

Therefore it is a GPS-generated interrupt and has nothing to do with
the UART.

>=20
> Thanks,
> Mark.

BR,
Nikolaus
