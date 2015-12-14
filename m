From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] reset: Add shared
 reset_control_[de]assert variants
Date: Mon, 14 Dec 2015 10:12:19 +0100
Message-ID: <1450084339.3407.16.camel@pengutronix.de>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
	 <1449853825.3419.50.camel@pengutronix.de> <566B1424.2060700@redhat.com>
Reply-To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDUKXHHSSIJBB7MPXKZQKGQEKWLOPZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <566B1424.2060700-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

Am Freitag, den 11.12.2015, 19:21 +0100 schrieb Hans de Goede:
[...]
> >> @@ -119,13 +134,55 @@ EXPORT_SYMBOL_GPL(reset_control_assert);
> >>   int reset_control_deassert(struct reset_control *rstc)
> >>   {
> >
> > Maybe WARN_ON(rstc->line->refcnt > 1) ?
> 
> I assume you mean deasser_cnt ? Seems reasonable with that change.

I meant refcnt. Currently drivers sharing reset lines (refcnt > 1)
and then using the non-shared reset control functions are bound to cause
unexpected behaviour. Now we can detect this for the first time.

> >>   	if (rstc->rcdev->ops->deassert)
> >> -		return rstc->rcdev->ops->deassert(rstc->rcdev, rstc->id);
> >> +		return rstc->rcdev->ops->deassert(rstc->rcdev, rstc->line->id);
> >>
> >>   	return -ENOTSUPP;
> >>   }
> >>   EXPORT_SYMBOL_GPL(reset_control_deassert);
> >>
> >>   /**
> >> + * reset_control_assert_shared - asserts a shared reset line
> >> + * @rstc: reset controller
> >> + *
> >> + * Assert a shared reset line, this functions decreases the deassert count
> >> + * of the line by one and asserts it if, and only if, the deassert count
> >> + * reaches 0.
> >
> > "After calling this function the shared reset line may be asserted, or
> >   it may still be deasserted, as long as other users keep it so."
> 
> I take it this is to replace the text about "deassert count" ?

I thought you might append something like it. I just imagine that when
reading the documentation it might be helpful to also see the intended
effect described, especially given that a call to an _assert_ function
might leave the reset line in deasserted state, depending on the
refcount.

> >> + */
> >> +int reset_control_assert_shared(struct reset_control *rstc)
> >> +{
> >> +	if (!rstc->rcdev->ops->assert)
> >> +		return -ENOTSUPP;
> >
> > WARN_ON(rstc->line->deassert_cnt == 0)
> >
> > Actually, what to do in this case? Assume ops->assert was called, or do
> > it again to be sure? Certainly we don't want to wrap deassert_cnt, or
> > the next deassert_shared will do nothing.
> >
> >> +	rstc->line->deassert_cnt--;
> >> +	if (rstc->line->deassert_cnt)
> >
> > deassert_cnt isn't protected by any lock.
> 
> Right, good catch. I believe the best way to fix this is to change deassert_cnt
> into an atomic_t and use atomic_dec_return / atomic_int_return,

Yes, that would work.

> Downside of using an atomic_t is that doing the WARN_ON you are asking for above
> will not be race free, then, but since it is a should never happen scenario I
> guess we do not care about the check not being 100% race free. Or we can even
> just leave out the check ?

Since this is only a warning to notify driver developers we don't
support shared resets (apart from the clock-like use)

Not if we warn about refcnt instead of deassert_cnt above.

[...]
> >> + * of the line by one and deasserts the reset line (if it was not already
> >> + * deasserted).
> >
> > "After calling this function, the shared reset line is guaranteed to be
> >   deasserted."
> 
> Same question as above.

Same imprecise answer. I'd like to see the expected state after calling
this function in the description, in addition to the mechanism. This is
more important for the assert function. After calling deassert, the
reset line is deasserted, no reason to be surprised about that.

regards
Philipp
