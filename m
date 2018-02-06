From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Tue, 6 Feb 2018 15:32:43 +0100
Message-ID: <CACRpkdbuGOrm=y=yPpsrkckk8+uKGxv6J9WGw9y=yiGcmbqn+w@mail.gmail.com>
References: <20180201174923.7385-1-l.stach@pengutronix.de> <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
 <1517825351.3175.3.camel@pengutronix.de> <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
 <1517914394.3175.21.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1517914394.3175.21.camel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "A . s . Dong" <aisheng.dong@nxp.com>, linux-imx@nxp.com, Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Feb 6, 2018 at 11:53 AM, Lucas Stach <l.stach@pengutronix.de> wrote:

Hi Lucas,

your reply seems a bit annoyed.

Are you annoyed with me?

In that case please take it down a bit, I understand it can
be stressful as developer, but I need to maintain the stuff
we're pushing in for years to come and it's my job to
ask the tricksy questions.

> Am Dienstag, den 06.02.2018, 00:13 +0100 schrieb Linus Walleij:
>> > On Mon, Feb 5, 2018 at 11:09 AM, Lucas Stach <l.stach@pengutronix.de> wrote:
>>
>> > > > +Optional Properties:
>> > > > +- drive-strength           Integer: controls Drive Strength
>> > >
>> > > I thought drive-strength is supposed to be be in mA. We should not have
>> > > differing units in common properties.
>> > >
>> > > There was an Atmel binding the other day that this came up.
>> >
>> > I know it's in the common binding, but it's going to be very hard to
>> > support. The drive-strength in mA really depends on external loading of
>> > the pin and the pin voltage, at least for the most widespread
>> > controllers that only switch between resistors, instead of driving the
>> > pin by a current regulator.
>>
>> How does this circuit really look? Can you sketch something so
>> we understand what is going on electronically here?
>
> There is no description of how the circuit really looks like and I
> would very much prefer this not being a prerequisite to get some
> software support in place.

That depends. If you're a hobbyist with limited access to
documentation I agree. In that case let's go for something
that floats your project, I'm fine with that. I have a weak spot
for people with a good project and limited resources, so I
am here to help. I'd say then let's go for some "nxp,foo" property.

If you are working for NXP directly or under contract, what you say
is that the left hand does not know what the right hand is doing and that
is never a good sign. Such as the hardware and software departments
do not talk to each other, do not have each other mail addresses
and practice what is called "throw over the wall-engineering".
Or throw it all the way over to Pengutronix, maybe, a separate
legal entity they don't even prioritize to inform. What do I know.

In this latter case it is more or less my responsibility as subsystem
maintainer to push back at NXP as a legal body, it has nothing to
do with the people involved. Especially not you personally. In this
case I am adressing your organization, not you.

So which one is it?

> The best description we have is from NXP AN5078:
> "The drive strength enable (DSE) can be explained as series resistance
> between an ideal driver's output and its load. To achieve maximal
> transferred power, the impedance of the driver has to match the load
> impedance."
>
> Which means the control bits don't really vary the output impedance,
> but the description models it like that. If we _assume_ the simple MOS
> totempole setup then adding more totempoles will bring down the output
> impedance.

+- drive-strength               Integer: controls Drive Strength
+                                       0: driver disabled
+                                       1: 255 Ohm
+                                       2: 105 Ohm
+                                       3:  75 Ohm
+                                       4:  85 Ohm
+                                       5:  65 Ohm
+                                       6:  45 Ohm
+                                       7:  40 Ohm

As for equal resistances R = Rx/N assuming it is
really 255 Ohms internal resistance per totempole:

1: 255
2: 127,5
3: 85
4: 63,75
5: 51
6: 42,5
7: 36,4

I don't know. Something is not right. Maybe this is how
CMOS work under load?

>> The way I imagine most drive strength out there works is by simply
>> connection more MOS-totempoles after each other and each of them
>> has a production-technology-related max output current like 4mA, so
>> by putting two in a series yoy double that to 8 mA.
>
> So with this description in mind the drive-strength property doesn't
> describe an actual real world drive-strength, but some maximum current
> output under ideal load matching?

I guess that is what other datasheets have been listing.
I have personally seen a few of those.

I don't know if it is as simple as a totem-pole, I guess
IIRC under ideal circumstances the internal resistance of an
operational amplifier is zero. E.g. on a popular TTL part uA 741
it is 5.5 milliohms. What is Rout for a normal CMOS totem-pole?
Some googling suggests ~400 Ohm so 255 Ohm may not be
so far off.

Does anyone else know?

This is pretty interesting stuff :D

> That's pretty confusing actually, as in a real-world setup increasing
> the drive-strength property value might negatively affect the load
> matching, leading to _decreasing_ the actual drive-strength.

This sounds like a perfect argument to create a new
property "output-impedance" and use that in my ears.
It makes more sense to a designer, because what they
really want to do, electrically, is to match impedances.

I am thinking some designer writing this device tree.
What they want to control is the output impedance, not
drive strength. So that name makes more sense.

>> Is that what you mean with "current regulator"?
>>
>> If you mean rather "output impedance", that is something else and
>> something we need a new (generic) property for. I never saw that
>> before, really.
>
> So, just because the description of the drive-strength value uses some
> (idealized) output impedance, we are now going to introduce yet another
> property for the same thing?

Yes it seems like a good idea, if (by your own line of reasoning)
it is the physical principle underlying these resistance settings.
Then we are likely to see it again.

> This is confusing to people reading the
> reference manual, which never speaks about output-impedance, but always
> about drive-strength.

Since we are already (obviously) confused, we have to choose
the lesser evil here.

Apparently what (board- system-) designers want to do is match
output resistance to load, I would argue that it is more confusing
to call that "drive strength", i.e. what is misleading is not what I am
discussing here, but the manual you are referring to. Just a bad
piece of technical writing.

> Hardware people (the ones responsible to come up with the padctrl
> settings) are much more likely to read the reference manual than any
> idealized dt-binding.

Can we talk to them about this?

I don't like to think about them as some foreign people in a far
away dimension we can never understand or communicate
with, how do they really do what they do?

> I want to make it as easy as possible for them to
> match up the hardware and reference manual with the DT description.

I was hoping we could dig in a bit and figure out what we
are going to do and why and how these people think.

I want to avoid poking magic values we don't really understand
into registers and using the manual as alchemic magic or
spellbook, essentially. (As so often happens...)

> So, can we please just keep the drive-strength property and deal with
> it being described in different units in different hardware manuals?

If you want something to match the specific hardware
manual from NXP and you don't want it to be translated
into the units of the DT binding, then I think it is better
to use something prefixed "nxp,*".

That clearly indicates that this is some NXP oddity that
we don't really understand.

I was just hoping not to introduce too many of these.

Yours,
Linus Walleij
