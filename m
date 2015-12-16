From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] reset: Add shared
 reset_control_[de]assert variants
Date: Wed, 16 Dec 2015 12:21:48 +0100
Message-ID: <1450264908.3421.36.camel@pengutronix.de>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
	 <20151214093607.GF19456@lukather> <1450086655.3407.23.camel@pengutronix.de>
	 <20151216102934.GR19456@lukather>
Reply-To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDUKXHHSSIJBBVESYWZQKGQEZYFXQCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151216102934.GR19456@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Am Mittwoch, den 16.12.2015, 11:29 +0100 schrieb Maxime Ripard:
> On Mon, Dec 14, 2015 at 10:50:55AM +0100, Philipp Zabel wrote:
> > Am Montag, den 14.12.2015, 10:36 +0100 schrieb Maxime Ripard:
> > > Hi,
> > > 
> > > On Fri, Dec 11, 2015 at 04:41:58PM +0100, Hans de Goede wrote:
> > > > diff --git a/include/linux/reset.h b/include/linux/reset.h
> > > > index c4c097d..1cca8ce 100644
> > > > --- a/include/linux/reset.h
> > > > +++ b/include/linux/reset.h
> > > > @@ -11,6 +11,8 @@ int reset_control_reset(struct reset_control *rstc);
> > > >  int reset_control_assert(struct reset_control *rstc);
> > > >  int reset_control_deassert(struct reset_control *rstc);
> > > >  int reset_control_status(struct reset_control *rstc);
> > > > +int reset_control_assert_shared(struct reset_control *rstc);
> > > > +int reset_control_deassert_shared(struct reset_control *rstc);
> > > 
> > > Shouldn't that be handled in reset_control_get directly?

I think I see your point now. Maybe we should add a flags parameter to
reset_control_get and/or wrap it in two versions,
reset_control_get_exclusive and reset_control_get_shared (or just add
the _shared variant). Then reset_control_get(_exclusive) could return
-EBUSY if a reset line is already in use.

> > This is about different expectations of the caller.
> > A driver calling reset_control_assert expects the reset line to be
> > asserted after the call.
> 
> Is that behaviour documented explicitly somewhere?

/**                                                                                                                                           
 * reset_control_assert - asserts the reset line
 * @rstc: reset controller
 */

Also, that expected behavior matches the function name, which I like.
So I still welcome adding new API calls for the shared/refcounting
variant.

> > A driver calling reset_control_assert_shared
> > just signals that it doesn't care about the state of the reset line
> > anymore.
> > We could just as well call the two new functions
> > reset_control_deassert_get and reset_control_deassert_put.
> 
> What happens if you mix them? What happens if you have several drivers
> ignoring this API?

The core should give useful error messages and disallow non-shared reset
calls on shared lines.

> The current default API totally allows to have several drivers getting
> the same reset line, and happily poking that reset line without any
> way for the others to A) know they're not the single users B) let them
> know their device has been reset.

That's why I'd like the WARN_ON and error return in reset_control_* when
the reset_line reference count is > 1.

> And not being able to tell at the consumer level if and when our
> device is going to be reset behind our back is a big issue. Because
> then, we simply have to expect it can be reset at any point in time,
> good luck writing a driver with that expectation.

Yes, that is unacceptable.

> The reset framework should make sure that the shared case is an
> exception, and not the default case (and make sure that it cannot
> happen in the default case). Just like for any other framework with
> similar resources constraints.

regards
Philipp
