From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Wed, 23 Oct 2013 09:55:12 -0700
Message-ID: <20131023165512.GB22394@roeck-us.net>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <1382544332.8522.40.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382544332.8522.40.camel-Fexsq3y4057IgHVZqg5X0TlWvGAXklZc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 05:05:32PM +0100, David Woodhouse wrote:
> On Wed, 2013-10-23 at 17:06 +0200, Thierry Reding wrote:
> > +       /* check if binding is experimental */
> > +       if (dev != device || drv != driver) {
> > +               pr_warn("of: device %s (%s) uses an experimental binding\n",
> > +                       np->name, np->full_name);
> > +
> 
> In the discussions earlier I think we decided that this should set a
> taint flag too. If you've built a kernel with CONFIG_OF_EXPERIMENTAL
> (which I think we were calling CONFIG_UNSTABLE_DT) then you have no
> expectation that it will boot tomorrow, although it might work with your
> DTB today.
> 
So to avoid tainting the kernel and clogging the kernel log I'll have
to remove all the "!" from the dt sources, or not use any "!" in the
dt bindings in the first place. Given that, not sure if anyone will
really use this mechanism. And CONFIG_OF_EXPERIMENTAL/CONFIG_UNSTABLE_DT
might have the same ultimate fate as CONFIG_EXPERIMENTAL.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
