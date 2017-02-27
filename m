From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1] regulator: Add driver for voltage controlled
 regulators
Date: Mon, 27 Feb 2017 10:53:10 -0800
Message-ID: <20170227185310.GA153648@google.com>
References: <20170210204348.107871-1-mka@chromium.org>
 <20170222002214.sejshtotyiobn6n2@rob-hp-laptop>
 <20170225031919.GB56005@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170225031919.GB56005-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

El Fri, Feb 24, 2017 at 07:19:19PM -0800 Matthias Kaehlcke ha dit:

> El Tue, Feb 21, 2017 at 06:22:14PM -0600 Rob Herring ha dit:
> >
> > > +Optional properties:
> > > +--------------------
> > > ...
> > > +- min-slew-down-rate	: Describes how slowly the regulator voltage will decay
> > > +			  down in the worst case (lightest expected load).
> > > +			  Specified in uV / us (like main regulator ramp rate).
> > > +			  This value is required when ovp-threshold-percent is
> > > +			  specified.
> > 
> > Don't we have a standard prop for this or that's just for ramp?
> 
> regulator-ramp-delay is related, but not exactly the same. The
> ramp-delay is applied at the end of an up- or downward transition,
> while this prop only specifies the downward rate and is applied in
> between partial transitions towards the final voltage.
> 
> We possibly could use ramp-delay and add a set_voltage_time() op to
> vctrl to prevent the core code from adding the "normal" ramp-delay at
> the end of the transition. However it could be confusing that vctrl
> handles the ramp-delay differently than other drivers, especially we
> don't want a delay in the upward transition for vctrl. But maybe
> nobody would care about the different behavior, as long as the
> regulator does its job ...

Actually the behavior of a delay on the downward transition and no
delay on the upward transition is hardware specific. Other users of
this driver might need a standard ramp delay, therefore I think it's
not a good idea to (re-)use this property in vctrl.

Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
