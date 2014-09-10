From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC 2/3] ARM: regulator: add Freescale MXS regulator
 driver
Date: Wed, 10 Sep 2014 15:18:53 +0100
Message-ID: <20140910141853.GA4994@leverpostej>
References: <1410089869-6611-1-git-send-email-info@lategoodbye.de>
 <1410089869-6611-3-git-send-email-info@lategoodbye.de>
 <20140909182211.GG3896@leverpostej>
 <540F523D.4010904@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <540F523D.4010904-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Cc: "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "stefan.wahren-eS4NqCHxEME@public.gmane.org" <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 09, 2014 at 08:17:17PM +0100, Stefan Wahren wrote:
> Hi,

[...]

> >> +       sreg = devm_kzalloc(dev, sizeof(*sreg), GFP_KERNEL);
> >> +       if (!sreg)
> >> +               return -ENOMEM;
> >> +       sreg->initdata = initdata;
> >> +       sreg->name = of_get_property(np, "regulator-name", NULL);
> >
> > I'm not keen on using of_get_property here. We have no idea if
> > regulator-name is even a string (it should be, but we have no
> > guarantee).
> 
> Better using of_property_read_string?

Yes. That will check the value is NUL-terminated, at least.

> >> +       sreg->cur_uA = 0;
> >> +       sreg->cur_uV = 0;
> >> +       sreg->base_addr = base_addr;
> >> +       sreg->power_addr = power_addr;
> >> +       init_waitqueue_head(&sreg->wait_q);
> >> +       spin_lock_init(&sreg->lock);
> >> +       sreg->max_reg_val = val;
> >> +
> >> +       rdesc = &sreg->rdesc;
> >> +       rdesc->name = sreg->name;
> >> +       rdesc->owner = THIS_MODULE;
> >> +       rdesc->ops = &mxs_rops;
> >> +
> >> +       if (strcmp(rdesc->name, "overall_current") == 0)
> >> +               rdesc->type = REGULATOR_CURRENT;
> >> +       else
> >> +               rdesc->type = REGULATOR_VOLTAGE;
> >
> > Wouldn't it make more sense to explicitly match the names you expect?
> >
> 
> Okay, i make "regulator-name" a required property and use a white list 
> of all possible regulators.

I'm not sure if regulator-name is the right way to go. I believe the
thing to do is match on the node name of the subnodes (as you were doing
here).

The only thing I didn't like was assuming the nodes were voltage
regulators if they weren't called "overall_current". I'd prefer explicit
matching, or something more general.

[...]

> >> +       of_property_read_u32(np, "mxs-default-microvolt",
> >> +                                  &val);
> >> +
> >> +       if (val)
> >> +               mxs_set_voltage(rdev, val, val, NULL);
> >
> > As I mentioned in my comments on the binding, I'd like to know why this
> > is necessary and if it is why it shouldn't be a standardised property.
> 
>  From my understanding the standardised properties only defines a range, 
> but no default state of the regulators. If the initialization from the 
> bootloader or a hardcoded initialization in the driver is okay then the 
> property is not necessary.

Sure. My questions was why it is necessary to preconfigure the
regulators at all rather than why it is necessary to do so in this
manner.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
