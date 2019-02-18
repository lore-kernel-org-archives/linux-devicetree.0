Return-Path: <SRS0=QsKN=QZ=ccbib.org=harald@kernel.org>
From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
In-reply-to: <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
References: <20190216174859.15738-1-marek.vasut@gmail.com> <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at> <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com> <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at> <75846117-242c-6861-ace5-dccf88711208@gmail.com> <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at> <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1161.1550484296.1@stardust.g4.wien.funkfeuer.at>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Feb 2019 11:04:56 +0100
Message-Id: <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Marek Vasut writes:
> On 2/17/19 9:00 PM, Harald Geyer wrote:
> > Marek Vasut writes:
> >> On 2/17/19 3:26 PM, Harald Geyer wrote:
> >>> Marek Vasut writes:
> >>>> On 2/16/19 9:20 PM, Harald Geyer wrote:
> >>>>> marek.vasut@gmail.com writes:
> >>>>>> +			  regulator voltage/current listed in "states".
> >>>>>> +- gpios-states		: Initial state of GPIO pins in "gpios" array.
> >>>>>> +			  0: LOW, 1: HIGH.
> >>>>>> +			  Default is LOW if nothing else is specified.
> >>>>>
> >>>>> This is not very clear. Maybe add an example below or explain it b=
etter.
> >>>>>
> >>>>> I guess we can't change it now anymore anyway, but it's not clear =
to
> >>>>> me, why we have this in the first place: A regulator should only b=
e
> >>>>> active when it has a consumer or is "always-on".
> >>>>
> >>>> Be careful here, the regulator-gpio may be instantiated such that i=
t
> >>>> will select between two voltage states, neither of which is 0V/off.
> >>>> Consider eMMC vccq supply, which alternates between 1V8 and 3V3, bu=
t
> >>>> does not have a third, 0V/off state (unless you pull the plug).
> >>>
> >>> Yes, if it is always on (or simply has no enable-gpio) then we might
> >>> select a voltage while probing the device. My point is: At some poin=
t
> >>> (probably when the first consumer probes, but I think there are no
> >>> guarantees) the core will switch the regulator state. That usually
> >>> happens a few milliseconds to seconds after probing the regulator
> >>> itself. This seems to be nothing but a source of undefined behaviour=
.
> >>
> >> Why would the core switch the regulator state when the first consumer
> >> probes ? It is up to the consumer to reconfigure the regulator when/a=
s
> >> it sees fit.
> > =

> > AFAIK the core is free to switch the regulator to any state that is
> > compatible with all consumers. Ie there are no guarantees before the
> > first consumer requests the regulator.
> =

> That's correct.
> =

> > I only mentioned probing the
> > first consumer, because it is a time where the core is likely to
> > revisit it's decisions. The root problem is, that this property (as it
> > is documented now, and also as it is implemented in linux now) doesn't
> > actually define behaviour beyond "gpios will be set to this state once
> > (but at an unkown time and for an unkown duration)".
> =

> ACK
> =

> >> The core should only set the default state and that's it.
> > =

> > That's hits exactly the problem I see:
> > * gpios-states is not a _default_ state (but an initial state)
> =

> Right, OK, this we should clarify.
> =

> > * the core doesn't set this state (the driver writes it during probe -=
 maybe
> >   at a time where probing might still fail)
> =

> Presumably the regulator driver, yes ?

Yes, the  regulator-gpio driver.

> > * the core doesn't even know about this state
> > =

> >>> If continuous operation of the regulator is important, I'd expect
> >>> we don't touch whatever the firmware setup instead of by default
> >>> setting all gpios to low.
> >>>
> >>> However as we can't change this now, there isn't much point in
> >>> discussin this further.
> >>
> >> The firmware could've left the regulator in non-default state.
> > =

> > If this is the case, why would we need to set an initial state instead
> > of just waiting what the first consumer requests. I still don't see
> > a use case (aside from don't accidentally shut down something importan=
t
> > during probing).
> =

> Possibly to prevent a state which might be harmful until the first
> consumer comes up. However this is rather theoretical.
> =

> >>>>> IIRC the regulator
> >>>>> core automatically selects the lowest voltage/current compatible w=
ith
> >>>>> all consumers. It seems the only usecase is to specify an initial
> >>>>> state that is different from all states in the "states" property, =
before
> >>>>> the regulator is turned on for the first time. However it also is =
not
> >>>>> an off-state, because it won't be set again on turning the regulat=
or off.
> >>>>
> >>>> Correct, this is not an off state. If you have a better wording, I =
am
> >>>> open to that.
> >>>
> >>> I think it should be clearer that this is an array. (Looking at vari=
ous
> >>> users I doubt everybody was aware of that, but since we have only in=
stances
> >>> with one gpio, there is no functional difference between array and b=
it field.)
> >>> Also it should be recommended to set this to match whatever the boot=
loader
> >>> sets up. Maybe something like:
> >>>
> >>> - gpios-states: Array of GPIOs values set during probing the regulat=
or.
> >>> 		0: LOW, 1: HIGH. If continuous operation during boot is
> >>> 		desired, this needs to match what the firmware or bootloader
> >>> 		sets up. By default all GPIOs are set to low during probing.
> >>
> >> gpios-states has nothing to do with continuous operation, that's what
> >> enable-gpios is for, we should not confuse the readers with it.
> > =

> > I think we have some misunderstanding here, because I don't see how
> > enable-gpios is relevant. Also maybe I still haven't understood the
> > usecase, but IMO that indicates, that it should be cleared up in
> > the document.
> =

> The enable-gpios property is what turns the regulator ON/OFF , the
> gpio-states is what selects the output voltage/current . Thus, I think
> we should not mention "continuous operation" in the description.

Okay, I see where you are coming from. Yes, gpios-states is only part
of what is required for continuous operation during boot. Still it seems
to be the only realistic usecase, we have come up so far. (Also in
existing DTs it seems to be used mostly with "boot-on" regulators.)
Maybe we can word it better then I did above, but I think mentioning
this helps a lot to make it clearer how an implementation must behave
if this property is present.

> >> Also
> >> note that "probing" is OS specific, so we should use "default" instea=
d.
> >> What about this:
> > =

> >> gpios-states		: Array of initial states of GPIO pins in "gpios" array=
.
> >> 0: LOW, 1: HIGH. Default is LOW if nothing else is specified.
> > =

> > "initial" is a bit too unspecific IMO.
> =

> Well, got any better idea ? It's not "default" either.

Yes, it's difficult - which is why I cheated above and described what the
linux implementation does instead of describing it in general terms.
If the semantics of this property are too unclear to unambiguously
describe in an implementation indepenent way, then that's a point in
favor of marking this property deprecated and let whoever actually
needs it come up with something better.

> > I believe this description doesn't define behaviour sufficiently and a
> > future rewrite (or reimplementation for a different OS) is likely to
> > interpret it in an incompatible way. I think one could even argue that
> > completely ignoring this property and just setting up a valid state fr=
om
> > "states" is allowed behaviour. This would likely break existing DTs, w=
here
> > among other things this regulator is used to set the CPU's voltage.
> =

> I suspect ignoring this property, when it's present, wouldn't be a good
> idea. After all, it adds additional information about the behavior of
> the system upon start up.

Yes, it wouldn't be good, because it likely causes breakage. No, I don't
think it adds much additional information, because it is too unclear.

> btw I am rewording it exactly because there was a recent breakage in the
> regulator code.

Yeah, thanks for that. Your patch is an improvement and shouldn't be
held back because it doesn't address the other problems discussed above.

thanks,
Harald

-- =

If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
