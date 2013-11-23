From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/platform: Fix no irq domain found errors when
 populating interrupts
Date: Sat, 23 Nov 2013 09:42:44 -0600
Message-ID: <CAL_JsqKV7K+QdLHS+3LtfcVx5Dpc7n6A8UwwNWKBP33Gs19c8g@mail.gmail.com>
References: <20131123004334.GJ10023@atomide.com>
	<20131123005509.GJ16735@n2100.arm.linux.org.uk>
	<20131123010850.GN10023@atomide.com>
	<20131123011515.GO10023@atomide.com>
	<20131123015034.GP10023@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131123015034.GP10023-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 22, 2013 at 7:50 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> * Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [131122 17:16]:
>> * Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [131122 17:09]:
>> > * Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> [131122 16:56]:
>> > > On Fri, Nov 22, 2013 at 04:43:35PM -0800, Tony Lindgren wrote:
>> > > > +               /* See of_device_resource_notify for populating interrupts */
>> > > > +               for (i = 0; i < num_irq; i++, res++) {
>> > > > +                       res->flags = IORESOURCE_IRQ;
>> > > > +                       res->start = -EPROBE_DEFER;
>> > > > +                       res->end = -EPROBE_DEFER;
>> > >
>> > > NAK.  Definitely a bad idea to start introducing magic values other into
>> > > resources.  Please don't do this.
>> >
>> > Do you have any better ideas on how to sort out this issue then?
>>
>> I guess we could allocate all the resources lazily here, I'll take a look
>> at that.
>
> Here's a version that allocates the resources lazily with the notifier.
> Seems to boot, need to play with it a bit more though to make sure we're
> not overwriting resources for any legacy devices.

Have you seen Thierry's series[1]? While your approach is certainly
more concise, it seems like a work-around for the problem. I don't
think a notifier is the right long term solution.

Rob

[1] http://www.spinics.net/lists/arm-kernel/msg274110.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
