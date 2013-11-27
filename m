From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] of/platform: Fix no irq domain found errors when
 populating interrupts
Date: Wed, 27 Nov 2013 13:53:10 -0800
Message-ID: <20131127215310.GC26766@atomide.com>
References: <20131123004334.GJ10023@atomide.com>
 <20131124213651.59750C402C3@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131124213651.59750C402C3-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [131124 13:37]:
> 
> I actually like the idea of completely allocating the resource structure
> but leaving some entries empty. However, I agree with rmk that putting
> garbage into a resource structure is a bad idea. What about changing the
> value of flags to 0 or some other value to be obviously an empty
> property and give the follow up parsing some context about which ones it
> needs to attempt to recalculate?

If we want to play it safe, we should probably introduce something like
this to ioport.h:

+#define IORESOURCE_IRQ_DEFERRED	(1<<6)

Then we can populate IRQ resources initially with that. And later on
during the driver probe, we know it's safe to populate the resource
if res->flags & IORESOURCE_IRQ_DEFERRED.

That fixes the $Subject bug, and gets us a little bit further for
making more changes later on.

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
