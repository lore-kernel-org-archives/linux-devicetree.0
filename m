From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dt: platform driver: Fill the resources before
 probe and defer if needed
Date: Fri, 18 Apr 2014 13:52:14 -0700
Message-ID: <20140418205213.GA21823@atomide.com>
References: <20140320161118.B7075C4067A@trevor.secretlab.ca>
 <1395413185-29763-1-git-send-email-jjhiblot@traphandler.com>
 <1395413185-29763-3-git-send-email-jjhiblot@traphandler.com>
 <CAL_Jsq+aU+rs28gV=Gesb_-Dy6Ht7zuKrRA6_hmqp94Uun23Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+aU+rs28gV=Gesb_-Dy6Ht7zuKrRA6_hmqp94Uun23Yg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [140411 10:33]:
> On Fri, Mar 21, 2014 at 9:46 AM, Jean-Jacques Hiblot
> <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org> wrote:
> > The goal of this patch is to allow drivers to be probed even if at the time of
> > the DT parsing some of their IRQ ressources are not available yet.
> >
> > In the current situation, the IRQ resources of a platform device are filled from
> > the DT at the time the device is created (of_device_alloc()). The drawback of
> > this is that a device sitting close to the top of the DT (ahb for example) but
> > depending on ressources that are initialized later (IRQ domain dynamically
> > created for example) will fail to probe because the ressources don't exist
> > at this time.
> 
> s/ressources/resources/

While I've tested these two patches and they fix the issue for me. I have
some serious doubts again about this whole ------ up string parsing
pile of ---- called device tree.

Do we really need to sprinkle more of_* hacks to the irq subsystem?

There's nothing wrong with with the irq subsystem. Platform bus is just
calling the irq subsystem at the wrong time with uninitialized data.

It seems that we're again papering over the fact that there's nothing
coordinating the setting up of various resources with device tree.
That seems to be the repeating never ending pattern as we've already
seen with GPIOs, pinctrl, and IRQchips. We end up adding all kinds of
cross subsystem calls that were never needed earlier.

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
