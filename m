From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Re: [PATCH v2 1/3] reset: Add shared
 reset_control_[de]assert variants
Date: Mon, 04 Jan 2016 21:39:59 +0100
Message-ID: <1451939999.3884.89.camel@pengutronix.de>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
	 <20151214093607.GF19456@lukather> <1450086655.3407.23.camel@pengutronix.de>
	 <20151216102934.GR19456@lukather> <1450264908.3421.36.camel@pengutronix.de>
	 <20151218110810.GK30359@lukather> <5675378F.5010904@redhat.com>
Reply-To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDUKXHHSSIJBBK5RVO2AKGQENCUJEHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5675378F.5010904-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Samstag, den 19.12.2015, 11:55 +0100 schrieb Hans de Goede:
> On 18-12-15 12:08, Maxime Ripard wrote:
[...]
> > I guess we could also have something like this:
> >
> >    * The driver gets the reference to the reset line using
> >      reset_control_get or its shared variant.
> >
> >      - If you call reset_control_get on a free line, it succeeds, and
> >        marks the line in exclusive use.
> >      - If you call reset_control_get on a busy line, it fails with
> >        EBUSY
> >
> >      - If you call the shared variant on a free line, it succeeds
> >      - If you call the shared variant on a busy exclusive line, it
> >        fails with EBUSY
> >      - If you call the shared variant on a busy !exclusive line, it
> >        succeeds.
>>
> >    * The customer driver can then call reset_control_assert / deassert:
> >
> >      - If the reset line is in exclusive use, the assertion happens
> >        right away, it succeeds and returns 0.
> >
> >      - If the reset line is in a !exclusive use, but with a single
> >        user, the assertion happens right away, it succeeds and returns
> >        0.
>
> Ack for all of the above, this is what I had in mind at first, but I started
> with a more lightweight version as I'm lazy :)  If Philipp likes this
> suggestion I can rework my patch-set into this.

Seconded, this all sounds good to me.

> >      - If the reset line is in a !exclusive use with more than 1 user,
> >        the refcount is modified and an error is returned to notify that
> >        it didn't happen.
>
> Also ack, except for returning the error, if a driver has used
> reset_control_get_shared, it should simply be aware that doing an assert
> might not necessarily actually assert the line, just like doing a clk-disable
> does not really necessary disable the clock, etc. If a driver is not prepared
> to deal with this, it should simply not use reset_control_get_shared.
>
> I see returning an error if the assert did not happen due to other users /
> deassert_count != 0 as inconsistent compared to how clks, regulators and phys
> handle this, these all simply return success in this case.

I wouldn't want drivers to have to differentiate between relevant and
irrelevant error codes, so in the clock-like refcounting use case
reset_assert should not return an error if it just correctly decremented
the refcount. I'd still prefer to have separate API for the counted
must_deassert/may_assert vs the exclusive must_assert/must_deassert use
cases, but I just can't think of a good name.

regards
Philipp
