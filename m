From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Tue, 13 Sep 2016 10:21:40 -0700
Message-ID: <20160913172140.GC62872@google.com>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160912185633.GH27946-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

thanks for your review, please find my comments (including info from
our EE) below.

El Mon, Sep 12, 2016 at 07:56:33PM +0100 Mark Brown ha dit:

> On Tue, Sep 06, 2016 at 12:05:24PM -0700, Matthias Kaehlcke wrote:
> 
> > On some boards it's possible that transitioning the PWM regulator
> > downwards too fast will trigger the over voltage protection (OVP) on the
> > regulator.  This is because until the voltage actually falls there is a
> > time when the requested voltage is much lower than the actual voltage.
> 
> So your PWM regulators are not very good and overshooting?  Do you have
> any numbers on this - what values do you end up setting for both the
> delay and safe fall percentages?

No, they just don't actively discharge the rail. Instead, they depend
on the rail self-discharging via the load (the SoC). If the load is
small, it takes longer to transition.

Optimizing the delay time depends on the SoC; we have not measured
this across a wide variety of devices and thus have very conservative
numbers. The percentage is based on the trigger for OVP on the
regulator. In this case, OVP kicks in when the FB node is 20% over
regulation, which is equivalent to a 16% drop in voltage (1/1.2). For
our device safe-fall-percent is set to 16 and slowest-decay-rate is
225.

> > We'll fix this OVP problem by allowing users to specify the maximum
> > voltage that we can safely fall.  Apparently this maximum safe voltage
> > should be specified as a percentage of the current voltage.  The
> > regulator will then break things into separate steps with a delay in
> > between.
> 
> I'd like to see some more thorough analysis than just an "apparently"
> here.  It's making the code more fiddly for something very handwavy.

It's well-understood why it's a percentage. DVS is controlled by
offsetting the FB current, and as above, OVP is based on how far you
are from the FB target.

> > @@ -2753,8 +2753,6 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
> >  	int old_selector = -1;
> >  	int old_uV = _regulator_get_voltage(rdev);
> >  
> > -	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
> > -
> >  	min_uV += rdev->constraints->uV_offset;
> >  	max_uV += rdev->constraints->uV_offset;
> >  
> > @@ -2842,11 +2840,53 @@ no_delay:
> >  				     (void *)data);
> >  	}
> >  
> > -	trace_regulator_set_voltage_complete(rdev_get_name(rdev), best_val);
> > -
> >  	return ret;
> 
> Let's remove some trace points too because...?  These *are* the actual
> voltage changes in the device, we're just splitting things up into a
> series of transitions.

I wasn't sure whether to keep reporting a single voltage change or
the individual steps. Will leave the trace points at their original
location.

> > +static int _regulator_set_voltage(struct regulator_dev *rdev,
> > +				     int min_uV, int max_uV)
> > +{
> > +	int safe_fall_percent = rdev->constraints->safe_fall_percent;
> > +	int slowest_decay_rate = rdev->constraints->slowest_decay_rate;
> > +	int orig_uV = _regulator_get_voltage(rdev);
> > +	int uV = orig_uV;
> > +	int ret;
> > +
> > +	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
> > +
> > +	 /* If we're rising or we're falling but don't need to slow; easy */
> > +	if (min_uV >= uV || !safe_fall_percent)
> 
> Indentation is broken, the two lines above don't agree with each other.

Will fix

> > +	ret = of_property_read_u32(np, "regulator-slowest-decay-rate", &pval);
> > +	if (!ret)
> > +		constraints->slowest_decay_rate = pval;
> > +	else
> > +		constraints->slowest_decay_rate = INT_MAX;
> 
> The documentation said this is mandatory if we have a safe fall rate
> specified but the code says it's optional and we'll silently default to
> an absurdly high rate instead (it's odd that a large number in a field
> marked slowest is fast BTW).  Complaining loudly seems better than
> ignoring the error.

Agreed about complaining. Since there isn't really a reasonable
default value it's probably best to change the interface of the
function and return an error in this case.

> > +	/* We use the value as int and as divider; sanity check */
> > +	if (constraints->slowest_decay_rate == 0) {
> > +		pr_err("%s: regulator-slowest-decay-rate must not be 0\n",
> > +			np->name);
> > +		constraints->slowest_decay_rate = INT_MAX;
> > +	} else if (constraints->slowest_decay_rate > INT_MAX) {
> > +		pr_err("%s: regulator-slowest-decay-rate (%u) too big\n",
> > +			np->name, constraints->slowest_decay_rate);
> > +		constraints->slowest_decay_rate = INT_MAX;
> > +	}
> 
> This should be with the parsing of slowest-decay-rate and checked only
> if we have a safe-fall-percent, there's no error if the value is omitted.

Will change

> > +	if (constraints->safe_fall_percent > 100) {
> > +		pr_err("%s: regulator-safe-fall-percent (%u) > 100\n",
> > +			np->name, constraints->safe_fall_percent);
> > +		constraints->safe_fall_percent = 0;
> > +       }
> 
> Again indentation is borked here, I think you have tab/space issues.

Ok, I will keep an eye on it

> > +	if (constraints->safe_fall_percent &&
> > +		!constraints->slowest_decay_rate) {
> > +		pr_err("%s: regulator-slowest-decay-rate requires "
> > +			"regulator-safe-fall-percent\n", np->name);
> 
> Don't align the second line of the condition with the body of the if,
> that just makes things hard to read - do what the rest of the code does
> and align with the (.
> 
> Don't split text messages over multiple lines, it makes it impossible to
> grep for the error as printed.

ok
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
