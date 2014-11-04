From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V3 4/4] clocksource: mips-gic: Add device-tree support
Date: Tue, 4 Nov 2014 15:49:16 -0800
Message-ID: <CAL1qeaG0EpxdbV+QxAsdYgAWc19yWf8eLW0mfVxevQaJDxER6w@mail.gmail.com>
References: <1414541562-10076-1-git-send-email-abrestic@chromium.org>
	<1414541562-10076-5-git-send-email-abrestic@chromium.org>
	<20141029175142.GC26471@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141029175142.GC26471@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

>> +static void __init gic_clocksource_of_init(struct device_node *node)
>> +{
>> +     if (of_property_read_u32(node, "clock-frequency", &gic_frequency)) {
>> +             pr_err("GIC frequency not specified.\n");
>> +             return;
>> +     }
>> +     gic_timer_irq = irq_of_parse_and_map(node, 0);
>> +     if (!gic_timer_irq) {
>> +             pr_err("GIC timer IRQ not specified.\n");
>> +             return;
>> +     }
>> +
>> +     __gic_clocksource_init();
>> +}
>> +CLOCKSOURCE_OF_DECLARE(mips_gic_timer, "mti,interaptiv-gic-timer",
>> +                    gic_clocksource_of_init);
>
> Your binding document expected the timer node under the GIC node, and it
> looks like this relies on GIC internals. Hwoever, this allows for people
> to put the timer node anywhere (and it turns out people are _really_ bad
> at putting things together as the binding author expected).
>
> It might be better if the GIC driver detected the sub node and probed
> the clocksource driver (or registered a platform device that the
> clocksource driver gets registered from). that could prevent some
> horrible issues with probe ordering and/or bad dts.

Probing the clocksource during probe of the irqchip doesn't work
because time-keeping isn't set up at the time.  Registering a platform
device for the timer pushes back GIC timer registration to later in
the boot process (assuming it now becomes a module_platform_driver)
and makes it rather non-parallel to how it's done in the non-DT case
(this could be changed, though IMO it's a lot of churn just to thwart
bad DT authors).

Probe ordering shouldn't be an issue because irqchips are probed
before clocksources.  Perhaps checking for the presence of GIC
(there's the global gic_present) and node->parent (to enforce the
parent-child relationship) would be sufficient?

Thanks,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
