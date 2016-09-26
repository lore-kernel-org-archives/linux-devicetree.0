From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Mon, 26 Sep 2016 10:41:59 -0700
Message-ID: <CAD=FV=V_ncaKDzwEyCrZNqicoE+dGXN8CJ8dDuvxQ6XP8uxsDg@mail.gmail.com>
References: <20160906190524.GB79728@google.com> <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com> <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com> <20160916163253.GA10189@sirena.org.uk>
 <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com> <20160924184133.seh6v6eayt7hwgue@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160924184133.seh6v6eayt7hwgue-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Sep 24, 2016 at 11:41 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Sep 19, 2016 at 11:39:24AM -0700, Doug Anderson wrote:
>> On Fri, Sep 16, 2016 at 9:32 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> > So the PWM is just configuring this external regulator chip (which
>> > doesn't seem to be described in DT...) and that's just incredibly bad at
>> > coping with voltage changes?  It does sound rather like we ought to be
>> > representing this chip directly in case it needs other workarounds.
>
>> I'm not 100% sure you can blame the regulator chip.  What we describe
>> in the device tree as a "PWM Regulator" is actually:
>
>> 1. Some discreet buck regulator whose output voltage is configured by
>> adjusting an input voltage.  AKA: the buck regulator has "3" inputs:
>> vin, vout, config.  You put a certain voltage on the "config" pin and
>> that controls the value that comes out of "vout".
>
>> 2. A network of resistors, capacitors, and inductors that take the
>> output of a PWM and filter / smooth it enough that it can be a good
>> config input to the discreet buck.
>
> Ugh, right.  So you're using the PWM regulator output voltage as an
> input to this other regulator.  TBH that sounds even more like this
> other regulator should be represented in DT as the consumer of the PWM
> regulator, the PWM regulator is not actually producing the voltages
> claimed directly.

I guess I think of the whole network of components as the PWM
regulator and not the individual discreet BUCK.  I'm also not quite
sure how you would model it as you're asking.  I suppose you could say
that all of the resistors / capacitors / inductors end up producing a
voltage and this voltage is an input to the BUCK.  ...then the BUCK
looks as the voltage on this control input and uses that to decide how
to convert VIN to VOUT.  That's sorta how I think about it, but I
_think_ it's more intertwined than that.  Looking at the schematics
there are plenty of connections from the output voltage back to the
PWM (through various discreets).  I really think you can't model it as
two distinct things: this whole glom of stuff is one beast.

I know for sure that our EEs have massively modified the behavior of
the whole thing by just changing the resistors / capacitors /
inductors, changing the undershoot, OVP issue, voltage ranges, default
voltage, etc.  That's what leads me to believe it's not so separable.

You could possible include some sort of string indicating what the
model of the BUCK is, but I'm not sure how you would use it at the
moment.


>> The actual behavior of the PWM regulator depends as much (or more) on
>> what values you have for the resistors, capacitors, and inductors than
>> it does on the actual buck.  ...so two people using the same discreet
>> buck might have very different behaviors in terms of rise time and how
>> much they are impacted by the over voltage protection.
>
> Right, these are properties of the PWM regulator.  But for some reason
> the DCDC is still incapable of understanding it's own transitions and
> flags out of spec too easily?  That isn't really a sign of high quality,
> but then this does seem like the DCDC is really intended for a fixed
> voltage application and is being abused in this system design to scale
> dynamically so really it's a badly concieved hardware design I suppose.

Yes, it's not ideal hardware.  :(  I wish we could change it to avoid
this, but at this point I think we're stuck with it.

As I heard it described, the whole PWM regulator concept allows you to
take relatively low cost BUCKs and make them easy to adjust up or down
in software.  It may have its downsides, but if it is inexpensive and
can be made to work by adding a few delays for downward transitions I
have a feeling that people will want to use it.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
