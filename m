From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
Date: Fri, 13 Jul 2018 18:14:21 +0300
Message-ID: <a521b9fc-4c10-06c1-fd73-5c64379538f6@yadro.com>
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="PWnsBJ4fBKFA5s63utchMKWHuSJz7aaGw"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eugene.Cho@dell.com, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, stewart@linux.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--PWnsBJ4fBKFA5s63utchMKWHuSJz7aaGw
Content-Type: multipart/mixed; boundary="zomQLYF2IoQwriKKqWgOrLLlRK83HPLyN";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eugene.Cho@dell.com,
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 stewart@linux.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Message-ID: <a521b9fc-4c10-06c1-fd73-5c64379538f6@yadro.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
In-Reply-To: <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>

--zomQLYF2IoQwriKKqWgOrLLlRK83HPLyN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Andrew, Ben, first of all let me thank you for bringing in this set of
patches.

=46rom the discussion it looks to me like Rob is not familiar with
specifics of BMC-managed servers and tries to apply to them the rules
that have proven to be good for workstations and laptops.

As someone using /dev/mem these days to configure those registers in
BMCs, I'm all for this patch set as it will make BMC configuration less
obscure. Writing 1 or 0 to a named node is way clearer than writing some
magic value at some magic offset in /dev/mem. I like the idea of having
it all configurable via DT as it allows for only having exported the
nodes that are actually needed, thus reducing, as you have said, the
foot-gun.

So far I do not have any objections or constructive comments to the
architecture of the proposed patches.

So I'm writing this to support your position in this discussion and to
let Rob and other reviewers know that this feature is actually needed.

With best regards,
Alexander Amelkin

13.07.2018 09:31, Andrew Jeffery wrote:
> Hi Rob, Ben,
>
> I've replied to you both inline below, hopefully it's clear enough from=
 the context.
>
> On Fri, 13 Jul 2018, at 10:25, Benjamin Herrenschmidt wrote:
>> On Thu, 2018-07-12 at 09:11 -0600, Rob Herring wrote:
>>> On Wed, Jul 11, 2018 at 6:54 PM Andrew Jeffery <andrew@aj.id.au> wrot=
e:
>>>> Hi Rob,
>>>>
>>>> Thanks for the response.
>>>>
>>>> On Thu, 12 Jul 2018, at 05:34, Rob Herring wrote:
>>>>> On Wed, Jul 11, 2018 at 03:01:19PM +0930, Andrew Jeffery wrote:
>>>>>> Baseboard Management Controllers (BMCs) are embedded SoCs that exi=
st to
>>>>>> provide remote management of (primarily) server platforms. BMCs ar=
e
>>>>>> often tightly coupled to the platform in terms of behaviour and pr=
ovide
>>>>>> many hardware features integral to booting and running the host sy=
stem.
>>>>>>
>>>>>> Some of these hardware features are simple, for example scratch
>>>>>> registers provided by the BMC that are exposed to both the host an=
d the
>>>>>> BMC. In other cases there's a single bit switch to enable or disab=
le
>>>>>> some of the provided functionality.
>>>>>>
>>>>>> The documentation defines bindings for fields in registers that do=
 not
>>>>>> integrate well into other driver models yet must be described to a=
llow
>>>>>> the BMC kernel to assume control of these features.
>>>>> So we'll get a new binding when that happens? That will break
>>>>> compatibility.
>>>> Can you please expand on this? I'm not following.
>>> If we have a subsystem in the future, then there would likely be an
>>> associated binding which would be different. So if you update the DT,=

>>> then old kernels won't work with it.
>> What kind of "subsystem" ? There is almost no way there could be one
>> for that sort of BMC tunables. We've look at several BMC chips out
>> there and requirements from several vendors, BIOS and system
>> manufacturers and it's all over the place.
> Right - This is the fundamental principle backing these patches: There =
will never be a coherent subsystem catering to any of what we want to des=
cribe with these bindings.
>
>>>> I feel like this is an argument of tradition. Maybe people have
>>>> been dissuaded from doing so when they don't have a reasonable use-
>>>> case? I'm not saying that what I'm proposing is unquestionably
>>>> reasonable, but I don't want to dismiss it out of hand.
> ...
>>> It comes up with system controller type blocks too that just have a
>>> bunch of random registers.=20
> This matches the situation at hand.
>
>>> Those change in every SoC and not in any
>>> controlled or ordered way that would make describing the individual
>>> sub-functions in DT worthwhile.
> "Not worthwhile" is what I'm pushing back against for our use cases. I =
think they are narrow and limited enough to make it worthwhile.
>
> Obviously we want to avoid describing these things *badly* - you mentio=
ned the clock bindings - so I'm happy to hash out what the right represen=
tation should be. But I struggle to think the solution is not describing =
some of our hardware features at all.
>
>> So what's the alternative ? Because without something like what we
>> propose, what's going to happen is /dev/mem ... that's what people do
>> today.
> Yep. And I've outlined in the cover letter what I think are the advanta=
ges of what I'm proposing over /dev/mem. It's not an incredible gain, but=
 has several of nice-to-have properties.
>
>>>>> A node per register bit doesn't scale.
>>>> It isn't meant to scale in terms of a single system. Using it
>>>> extensively is very likely wrong. Separately, register-bit-led does
>>>> pretty much the same thing. Doesn't the scale argument apply there?
>>>> Who is to stop me from attaching an insane number of LEDs to a
>>>> system?
>>> Review.
>>>
>>> If you look, register-bit-led is rarely used outside of some ARM, Ltd=
=2E
>>> boards. It's simply quite rare to have MMIO register bits that have a=

>>> fixed function of LED control.
>> Well, same here, we hope to review what goes upstream to make it
>> reasonable. Otherwise it doens't matter. If a random vendor, let's say=

>> IBM, chose to chip a system where they put an insane amount of cruft i=
n
>> there, it will only affect those systems's BMC and the userspace stack=

>> on it.
>>
>> Thankfully that stack is OpenBMC and IBM is aiming at having their
>> device-tree's upstream, thus reviewed, thus it won't happen.
>>
>> *Anything* can be abused. The point here is that we have a number,
>> thankfully rather small, maybe a dozen or two, of tunables that are
>> quite specific to a combination (system vendor, bmc vendor, system
>> model) which control a few HW features that essentially do *NOT* fit i=
n
>> a subsystem.
> Exactly. I tried to head off the abuse vector by requiring that uses be=
 listed in the bindings document, and thus enforce some level of review. =
It might not be the most effective approach at the end of the day, but at=
 least it is something.
>
>> For everything that does, we have created proper drivers (and are doin=
g
>> more).
>>
>>
>>>> Obviously if there are lots of systems using it sparingly and
>>>> legitimately then maybe there's a scale issue, but isn't that just
>>>> a reality of different hardware designs? Whoever is implementing
>>>> support for the system is going to have to describe the hardware
>>>> one way or another.
>>>>
>>>>> Maybe this should be modelled using GPIO binding? There's a line th=
ere
>>>>> too as whether the signals are "general purpose" or not.
>>>> I don't think so, mainly because some of the things it is intended t=
o be used for are not GPIOs. For instance, take the DAC mux I've describe=
d in the patch. It doesn't directly influence anything external to the So=
C (i.e. it's certainly not a traditional GPIO in any sense). However, it =
does *indirectly* influence the SoC's behaviour by muxing the DAC interna=
lly between:
>>>>
>>>> 0. VGA device exposed on the host PCIe bus
>>>> 1. The "Graphics CRT" controller
>>>> 2. VGA port A
>>>> 3. VGA port B
>>> And this mux control is fixed in the SoC design?
>> This specific family of SoC (Aspeed) support those 4 configurations.
>> How they need to be configured at runtime depends on the combination o=
f
>> system vendor and system model, along with in some cases the need to
>> switch it at runtime.
>>
>> This is just one example. Another one is the handful of scratch
>> registers that need to be populated with the "right" values for the
>> host system BIOS, VGA BIOS and VGA driver. (The host bits access them
>> via LPC IO space).
>>
>> The host system BIOS will read some basic config info there before its=

>> IPMI stack is up (and some BIOSes already rely on that). The VGA BIOS
>> will get some strapping info and panel info. The VGA driver (which is
>> already upstream, has been for a long time) will look for other things=

>> in some of these guys, such as connector configuration.
>>
>> Andrew, if it helps, we could put together a list of what we typically=

>> need on an OpenPower system today. That would give people like Rob a
>> better idea of what this is all about.
> It's primarily what I've outlined at the bottom of the bindings documen=
t, though the use cases aren't provided there as they are a bit out-of-sc=
ope. So the SuperIO and VGA scratch registers, plus the DAC mux. A bunch =
of tunable things.
>
> OpenPOWER platforms make use of the SuperIO scratch registers to convey=
 configuration information from the BMC to the host. Information provided=
 includes low-level control of the host firmware initialisation process, =
UART and logging configuration, and the strategy for handling errors (cra=
sh vs log). This is all an "arbitrary" contract between the BMC userspace=
 and the host firmware, i.e. different platforms/firmware could lay out t=
he same information in different ways or communicate entirely different i=
nformation altogether. The BMC kernel shouldn't care about any of it, oth=
er than provide sensible access to the hardware.
>
> Again on OpenPOWER systems using the ASPEED BMC SoCs running OpenBMC, t=
he BMC uses the VGA scratch registers to sense initialisation of the host=
 graphics driver in the host's boot process. When the BMC userspace detec=
ts the host VGA driver is up we switch the DAC mux from the BMC CRT devic=
e to the host VGA device so that the host is now driving the VGA output. =
Non-OpenPOWER OpenBMC configurations may do something entirely different,=
 or not do anything at all with the hardware, so as above, it's not reall=
y the job of the BMC kernel to be involved in any of this, other than to =
provide sensible access to userspace.
>
> There are a number of other switches that control the availability of A=
SPEED BMC hardware features to the host system that also don't fit any pa=
rticular subsystem and so will use these bindings, but our (OpenPOWER/Ope=
nBMC) current uses are what's described above.
>
> Dell also suggested they had some use-cases that aligned with the inten=
t of the bindings, but I don't know what they had in mind. Eugene (on Cc)=
 can elaborate.
>
>>>> Maybe this could be modelled by pinmux, but then we still need some
>>>> way to expose the mux functions to userspace for selection
>>>> (userspace needs to transition arbitrarily between at least options
>>>> 0 and 1 at runtime), at which point we haven't achieved much beyond
>>>> adding a whole heap of infrastructure in the chain.
>>>>
>>>> Given 0 and 1, maybe exposing attributes in relevant drivers would
>>>> be reasonable, except 0 isn't exposed on the SoC's internal bus so
>>>> there is no driver on the BMC-side to do so. Taking into account 2
>>>> and 3 are also purely hardware paths further dashes the idea, as
>>>> the configuration doesn't really "belong" to the Graphics CRT
>>>> device more than it belongs anywhere else, except for the fact that
>>>> there isn't anywhere else to expose it.
>>>>
>>>> Further, the BMC's kernel can't make the decision as to when to
>>>> switch the mux as it knows nothing of the host's state. The BMC
>>>> userspace is controlling the host's boot state and so *does* know
>>>> when to flip the switch. Finally, the mux is in separate IP to the
>>>> CRT or VGA blocks: It lives in the System Control Unit.
>>>>
>>>> My current point of view is the DAC mux field is effectively its
>>>> own device, and we need to control it from userspace, so we need
>>>> some way to describe it (i.e. not ignore it) in order for its
>>>> capability to be exposed.
>>>>
>>>> I'm fully aware what I'm proposing isn't awesome as it's not
>>>> providing any real abstraction, but the problem(s) at hand also
>>>> seem to defy abstraction, and in order to avoid a plethora of
>>>> bespoke bindings I thought it was reasonable to define something
>>>> generic.
>>>>
>>>> All-in-all I appreciate the suggestion, but assuming you agree with
>>>> my reasoning above do you have thoughts on other alternatives?
>>> Seems the controls are more fixed than I first thought. All the data
>>> you have here could simply be within a driver.=20
> Rob: A driver for what though? One unique to this particular mux? That =
feels overly specific when we can generalise the concept to cover a wider=
 range of use-cases.
>
>>> Help me understand what
>>> functions are fixed (in the SoC) and which ones vary by board. Only
>>> what's changing per board really needs to go into DT.
> I think this last sentence identifies a difference in our starting poin=
ts, so I'd like to explore that. Blocks of functionality might move aroun=
d inside the SoC as well, so don't we need a way to describe those functi=
ons appropriately? And from there describe how the SoC integrates the fun=
ctions, and then describe how a board integrates the SoC? This all compos=
es, and the problem at the end of the day comes down to what we want to v=
iew as a point of abstraction, right?
>
> It seems ideal to me that the metadata about hardware features resides =
in the description of the relevant system (DT, for a function, a SoC or a=
 board), otherwise don't we wind up with crazy, unfocused, monolithic dri=
vers for things like system controllers? (There's MFD/syscon, but having =
used it previously I'm still grappling with the benefit over some of the =
weirdness it injects into devicetree - maybe I did it wrong.) Or alternat=
ively, a generic driver that's choc full of platform-specific data coveri=
ng the platforms that require it? The driver that implements the behaviou=
r of the bindings described here turns out quite focused (even if the fir=
st attempt was a bit of a basket case, hopefully the second is better (so=
rry Greg)).
>
>> Most of these things is specific to a given board or may even need to
>> be changed at runtime.
> *snip*...
>
>> Talking of which: Andrew, did you put "default values" in your binding=

>> ? That would be a nice way to deal with system specific immutables, so=

>> that userspace doesn't even have to care.
> Yes, I described a `default-value`property for RW fields, and `default-=
set` and `default-clear`properties for write-1-set/write-1-clear fields f=
or exactly this purpose.
>
>> So to clarify once and for all, *anything* that fits in a subsystem,
>> we're putting in one. All the random board control is all GPIOs and
>> that's fine as well. For some things that require a bit of fiddly usag=
e
>> like the "MBOX" logic between BIOS and BMC we are also doing a
>> dedicated driver.
> (As an aside, the "MBOX" functionality is slightly different from the s=
cratch registers in that it has configurable interrupts each way (BMC-to-=
Host and Host-to-BMC) - as such it can be used to implement a dynamic pro=
tocol and so deserves its own driver. This is in contrast to the dumb scr=
atch registers we're describing with these bindings which have no such in=
terrupts.)
>
>> But there's a few stragglers here, and they tend to be so
>> board/system/BIOS specific that it's not sustainable to create/change
>> random drivers all the time just for exposing those few tunables.
>>
> Yes, this is my feeling too.
>
> Cheers,
>
> Andrew



--zomQLYF2IoQwriKKqWgOrLLlRK83HPLyN--

--PWnsBJ4fBKFA5s63utchMKWHuSJz7aaGw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbSMHNAAoJEOiTWHtbdBeNjl8P/jgL6aby47LNJiTua8s1k2Qq
2iBqgKcKXgTUp0fKgazqIkldjWvQP/UOQA83CUUit5LbQAitRZdh2EcPjKKFYwKV
fDNQc5MHr40+RLo9Dyy+hY2RPR8FJozSPHT6wOc9robDJswIg4PhrgBhQKokQPiU
+4q8j6iMucH+AZuzPaTcbuwdkf3cSq3Bab+TZAvoCmKuo0gOBxtz0KNRXXb/Zabv
Of9nPkkZ5nfDVGOow7fFrePTY0pN9XsaCW/0gSygT+KOzPvdWqpyuRnTMIYdzdDA
teiY1OBxpvXVtEhxexqR7u3nMG6k3477r7c77bqAvB7GJWprzq+1lHBiYVO5vADh
LRb6L4n/KA0IQT3s+BsWNXHCrL7c1hQ6ZuuBSwHmx7g5pahNKk5iiPOGcZ9OkI+V
AYhSoXbA0ELYtzxbKRT6/oA+ppjF2ezRn7krKXQN0aQsQK/1W0VkVPWQjEBXO/tu
R5MrTiS8xmXakWY/TWC6f9NpABfk8/B467+ARFRvWDz2X7XxOI6QBXE2wHO5YYgI
IRpU6nCEO/uuyYOaUfApnUzlMK8yBkTqdipy93lV94y6kDuGE81YMbS0Sifbx81/
T5R7KOP6HYTVn7vVIFx0tV+CyluE1SJQ79rJ6LIv904q5nArx9g2cuK5jS2KgJNk
VrRJv8/GkMWXsGcbRKCe
=8BH/
-----END PGP SIGNATURE-----

--PWnsBJ4fBKFA5s63utchMKWHuSJz7aaGw--
