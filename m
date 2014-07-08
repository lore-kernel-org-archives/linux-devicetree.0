From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4] phy: Renesas R-Car Gen2 PHY driver
Date: Wed, 09 Jul 2014 01:27:17 +0400
Message-ID: <53BC6235.5010804@cogentembedded.com>
References: <201405240206.04700.sergei.shtylyov@cogentembedded.com> <538F05BC.7000800@ti.com> <538F95A7.8010409@cogentembedded.com> <5396E160.7000707@ti.com> <53AB4A48.5030805@cogentembedded.com> <53B2B37F.6080300@ti.com> <53B71439.8040709@cogentembedded.com> <53BBE224.7020502@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <53BBE224.7020502@ti.com>
Sender: linux-sh-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, devicetree@vger.kernel.org
Cc: rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-sh@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 07/08/2014 04:20 PM, Kishon Vijay Abraham I wrote:

>>>>>>>> This PHY, though formally being a part of Renesas USBHS contro=
ller,
>>>>>>>> contains
>>>>>>>> the
>>>>>>>> UGCTRL2 register that controls multiplexing of the USB ports (=
Renesas calls
>>>>>>>> them
>>>>>>>> channels) to the different USB controllers: channel 0 can be c=
onnected to
>>>>>>>> either
>>>>>>>> PCI EHCI/OHCI or USBHS controllers, channel 2 can be connected=
 to PCI
>>>>>>>> EHCI/OHCI
>>>>>>>> or xHCI controllers.

[...]

>>>>>>> So ideally only two sub-nodes should be created for channel '0'=
 and channel
>>>>>>> '1'.

>>>>>>       Hm, but I need to perform a special PHY power up sequence =
for the
>>>>>> USBHS PHY
>>>>>> itself (corresponding to channel #0, selector #1).

>>>>>>> You can configure a channel to a particular mode by passing the=
 mode in
>>>>>>> PHY specifier

>>>>>>       I already have "#phy-cells" prop equal to 2.

>>>>>>> (The channel should be configured to a particualr mode in xlate=
).

>>>>>>       I have even considered using the of_xlate() method at firs=
t but then
>>>>>> abandoned that idea for the phy_init() method...

>>>>> If you want to configure the PHY to a particular mode, xlate shou=
ld be the
>>>>> best place.

>>>>      I tried to move the code there from the init() method but the=
n I realized
>>>> that I need to prepare/enable the USBHS clock before writing to th=
e UGCTRL2
>>>> register and there's no place I can disable/unprepare this clock i=
f I do the

>>     Unless I prepare/enable the clock when probing, and undo it on r=
emoval, that
>> is.

>>>> channel routing in the xlate() method. So no, I don't agree here.

>>> enabling clock from init() seems correct to me. We need a better wa=
y to avoid
>>> overriding the PHY to a particular mode.

>>     In fact, in my case such override may be rather desirable.

> Don't understand how overriding is desirable.

    Consider the scenario where OHCI/EHCI drivers load first: they woul=
d claim=20
all channels for themselves (despite channel #0 might have a host conne=
cted=20
instead of a device). With the channel exclusion mechanism in place, th=
e USBHS=20
driver loaded later won't be able to take control of the channel #0, wh=
ile=20
it's actually desirable.

> Won't it affect the first controller that got the PHY?

    It will, though it might be desirable. But I'd probably agree that =
making=20
the host/UDC driver hold into its PHY forbidding the other drivers to b=
ind to=20
the same channel would be more straight-forward way: just load the driv=
ers=20
that you want to control a given channel first, not second. I guess you=
 want=20
me to invent something here?

[...]

>>>>>>>> +struct rcar_gen2_phy_driver {
>>>>>>>> +    void __iomem *base;
>>>>>>>> +    struct clk *clk;
>>>>>>>> +    spinlock_t lock;
>>>>>>>> +    struct rcar_gen2_phy phys[NUM_USB_CHANNELS][2];

>>>>>>> This can be created dynamically based on the number of sub-node=
s. In this
>>>>>>> case

>>>>      Did you mean that I'll need to use linked list here instead o=
f an array?

>>> Nope. I meant something like below.

>>> struct rcar_gen2_phy_driver {
>>>      .
>>>      .
>>>      struct rcar_gen2_phy **phys;
>>> }
>>>
>>> probe()
>>> {
>>>      <snip>
>>>      int i =3D 0, channel_count;
>>>      struct rcar_gen2_phy **phys;
>>>      channel_count =3D of_get_child_count(np);

>>     Didn't know of such function...

>>>      phys =3D kzalloc(sizeof(*phys) * channel_count, GFP_KERNEL);

>>     Rather kcalloc().

>>>      for_each_child_of_node(dev->of_node, np) {
>>>          struct rcar_gen2_phy *phy;
>>>          .
>>>          .
>>>          phy =3D kzalloc(sizeof(*phy), GFP_KERNEL);
>>>          .
>>>          .
>>>          phy->phy =3D devm_phy_create(dev, &rcar_gen2_phy_ops, NULL=
);
>>>          phys[i++] =3D phy;
>>>      }
>>>      drv->phys =3D phys;
>>>      <snip>
>>> }

>>> Then you can access 'phys' just like how you access an array.

>>     Aren't you over-engineering things? I'd rather have just an arra=
y of 'struct
>> rcar_gen2_phy' dynamically allocated at once, instead of an array of=
 pointers
>> to struct rcar_gen2_phy' and then PHYs allocated piecemeal...

> yeah.. that can be done.

    That would a bit simpler and even faster, I think.

>>     Anyway, this means that I'll have to do linear search for the ne=
eded PHY in
>> the xlate() method, just like it would have been with a linked list.

> indeed. Unless we directly pass the index in the phy specifier (from =
dt). But I

    The DT subnodes are not guaranteed to be in a certain order or even=
 have=20
consecutive channel #'s, no?

> would prefer linear search instead.

    OK.

>> Complication. :-)

>> [...]

>>>>>>> it'll be only rcar_gen2_phy phys[2], one for each channel.
>>>>>>> By this we need not hard code NUM_USB_CHANNELS.

>>>>>>       I don't quite understand what's up with hard-coding it -- =
this
>>>>>> constant is
>>>>>> dictated by the UGCTRL2 register layout anyway.

>>>>> right but you don't want to change the driver a whole lot when th=
ey change the
>>>>> no of channels in the next version

>>>>      They have already done so: R8A7790 has 3 USB channels, R8A779=
1 has only 2.
>>>> However, the number of controllable channels didn't change.

>>> right.. that's where I'd like to have status =3D "disabled" for tha=
t channel in
>>> your dt node.

    Looking at the IEEE1275-1994 standard, I do not think "disabled" co=
uld=20
mean that the device is not present:

=93disabled=94
	The device represented by this node is not operational, but it might
	become operational in the future (e.g., an external switch is turned
	off, or something isn=92t plugged in.)

    So I would really prefer the non-existing channels to not be descri=
bed in DT.

>>     I disagree here. First, channel #1 is not controllable anyway, s=
o of no
>> interest to us. Anyway, if more controllable channel appear, may poi=
nt is that
>> should be a matter of introducing and properly handling a new "compa=
tible"
>> property, not just adding/removing subnodes.

> That will lead to broken dt data.

    Could you elaborate?

> I think we have to do both.

    Well, if we agree that we'd have subnodes, yes.

>>>>> or they use a slightly modified version of
>>>>> this IP in a different SoC. And finding the number of channels dy=
namically is
>>>>> not complicated anyway IMO.

>>>>      Sorry, but what you're saying here just doesn't make sense to=
 me. I'd need
>>>> to modify the driver for the different number of the controllable =
channels in
>>>> any case since the UGCTRL2 masks/values have to be hard coded in t=
he driver as
>>>> you said. If they were read from the device tree, that would have =
made sense
>>>> but you seem to be against that...

>>> R8A7790 has 3 USB channels and R8A7791 has only 2. So what should b=
e the
>>> NUM_CHANNELS in this driver?

    I have now read the info on all members of the R-Car generation 2 S=
oCs,=20
most will have the same two channels as R8A7791, only R8A7790 has 3 cha=
nnels.
There's still some hope that the future SoC family (a few years away fr=
om now)=20
would have more sane PHY design...

>>     Two; we have only two controllable channels in any case.

> NAK.

    Seriously, I don't want to waste any memory on non-switchable chann=
el,=20
even when it exists.

> -Kishon

WBR, Sergei

