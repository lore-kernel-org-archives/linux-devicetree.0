From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Mon, 12 Dec 2016 13:15:02 -0800
Message-ID: <20161212211502.GA96889@google.com>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com>
 <20160916163253.GA10189@sirena.org.uk>
 <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com>
 <20160924184133.seh6v6eayt7hwgue@sirena.org.uk>
 <CAD=FV=V_ncaKDzwEyCrZNqicoE+dGXN8CJ8dDuvxQ6XP8uxsDg@mail.gmail.com>
 <20161028181521.ywzmow6bgndfotq3@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161028181521.ywzmow6bgndfotq3-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

El Fri, Oct 28, 2016 at 07:15:21PM +0100 Mark Brown ha dit:

> On Mon, Sep 26, 2016 at 10:41:59AM -0700, Doug Anderson wrote:
> 
> > I guess I think of the whole network of components as the PWM
> > regulator and not the individual discreet BUCK.  I'm also not quite
> > sure how you would model it as you're asking.  I suppose you could say
> > that all of the resistors / capacitors / inductors end up producing a
> > voltage and this voltage is an input to the BUCK.  ...then the BUCK
> 
> Yes, that's what's happening.
> 
> > I know for sure that our EEs have massively modified the behavior of
> > the whole thing by just changing the resistors / capacitors /
> > inductors, changing the undershoot, OVP issue, voltage ranges, default
> > voltage, etc.  That's what leads me to believe it's not so separable.
> 
> What you're describing to me is a discrete DCDC that has an input
> voltage that sets the output voltage which happens to be set with a PWM.
> It's of course going to be the case that the passives are important to
> the system performance but it seems we have two bits here - the PWM
> regulator providing an input to the DCDC and the DCDC itself which is
> sensitive to rate changes.

I experimented a bit with this. Besides the question of how to model
the passives I wonder how the two regulators would interact. The
correct thing seems to be to specify the input regulator as a supply
of the DCDC. dcdc->set_voltage breaks down a voltage transition into
steps (if needed) and calls regulator_set_voltage(supply) for each
step. The problem with that is that regulator_set_voltage(dcdc)
acquires the supply lock(s), later regulator_set_voltage(supply) tries
to acquire its own lock which is already held. This can be worked
around by only using the supply regulator in the DCDC, but not
specify it as a supply. However this seems more a hack than a proper
solution.

Am I missing something obvious here or approaching this from a wrong
angle?

Thanks

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
