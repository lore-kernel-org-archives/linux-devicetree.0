From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1] regulator: Add driver for voltage controlled
 regulators
Date: Fri, 24 Feb 2017 19:19:19 -0800
Message-ID: <20170225031919.GB56005@google.com>
References: <20170210204348.107871-1-mka@chromium.org>
 <20170222002214.sejshtotyiobn6n2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170222002214.sejshtotyiobn6n2@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob, thanks for your comments!

El Tue, Feb 21, 2017 at 06:22:14PM -0600 Rob Herring ha dit:

> On Fri, Feb 10, 2017 at 12:43:48PM -0800, Matthias Kaehlcke wrote:
> > The output voltage of a voltage controlled regulator can be controlled
> > through the voltage of another regulator. The current version of this
> > driver assumes that the output voltage is a linear function of the control
> > voltage.
> >
> > ...
> > 
> >  .../devicetree/bindings/regulator/vctrl.txt        |  56 +++
> 
> Please split bindings to separate patch.

The driver is not functional without the bindings, is a separate patch
preferred nevertheless? I saw other recentish regulator drivers
(ltc3676, pv88080) added the driver and the bindings together.

> > +Optional properties:
> > +--------------------
> > ...
> > +- min-slew-down-rate	: Describes how slowly the regulator voltage will decay
> > +			  down in the worst case (lightest expected load).
> > +			  Specified in uV / us (like main regulator ramp rate).
> > +			  This value is required when ovp-threshold-percent is
> > +			  specified.
> 
> Don't we have a standard prop for this or that's just for ramp?

regulator-ramp-delay is related, but not exactly the same. The
ramp-delay is applied at the end of an up- or downward transition,
while this prop only specifies the downward rate and is applied in
between partial transitions towards the final voltage.

We possibly could use ramp-delay and add a set_voltage_time() op to
vctrl to prevent the core code from adding the "normal" ramp-delay at
the end of the transition. However it could be confusing that vctrl
handles the ramp-delay differently than other drivers, especially we
don't want a delay in the upward transition for vctrl. But maybe
nobody would care about the different behavior, as long as the
regulator does its job ...

> Perhaps this should be common?

I agree this could be a property other regulators might have. I think
it could be common as long as it is a descriptive property which
regulator drivers can use or not, without adding functionality to the
core code (except for DT parsing).

Mark, what do you think?

> > +
> > +Example:
> > +
> > +	vctrl_reg {
> 
> Don't use '_' in node names.

Will fix in next revision.

> > +		compatible = "vctrl-regulator";
> > +		regulator-name = "vctrl_reg";
> > +
> > +		ctrl-supply = <&ctrl_supply>;
> > +
> 
> > +		regulator-min-microvolt = <800000>;
> > +		regulator-max-microvolt = <1500000>;
> > +
> > +		output-voltage-range = <800000 1500000>;
> 
> Why do you need both?

We don't necessarily need both. The constraints are not available yet
when the driver parses and validates the DT node, but we can read
regulator-min/max-microvolt manually in the driver instead of
duplicating the values.

> > +		ctrl-voltage-range = <200000 500000>;
> > +
> > +		slew-rate = <225>;
> 
> Not documented.

Should be min-slew-down-rate. Will fix in next revision.

Thanks

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
