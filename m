From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Wed, 23 Oct 2013 20:51:15 +0200
Message-ID: <20131023185114.GA7863@ulmo.nvidia.com>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <1382544332.8522.40.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382544332.8522.40.camel-Fexsq3y4057IgHVZqg5X0TlWvGAXklZc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
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
> taint flag too.

A taint flag seems somewhat drastic. It's not like using an experimental
binding should have an influence on the stability of the running kernel.
I always thought that taint flags were supposed to flag conditions where
code of unknown origin or code known to be broken was being executed
because they may destabilize the running kernel.

The worst that should happen if you run an experimental binding is that
some part of the system will just not come up.

> If you've built a kernel with CONFIG_OF_EXPERIMENTAL (which I think we
> were calling CONFIG_UNSTABLE_DT) then you have no expectation that it
> will boot tomorrow, although it might work with your DTB today.

Yes, something like that. Although I would hope that we can actually
come up with reasonably simple and stable bindings for essential things
required to boot. That way you could at least output some kind of
warning to the user that something went wrong. If the system just won't
boot at all then a taint flag won't help very much either.

Thierry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
