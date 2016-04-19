From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 01/19] clk: composite: Add unregister function
Date: Tue, 19 Apr 2016 11:52:50 +0200
Message-ID: <20160419095250.GA26050@lukather>
References: <1458751122-23976-1-git-send-email-maxime.ripard@free-electrons.com>
 <1458751122-23976-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160415222856.GQ14441@codeaurora.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7P7264AKGQE45WLNOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160415222856.GQ14441-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Apr 15, 2016 at 03:28:56PM -0700, Stephen Boyd wrote:
> On 03/23, Maxime Ripard wrote:
> > The composite clock didn't have any unregistration function, which forced
> > us to use clk_unregister directly on it.
> > 
> > While it was already not great from an API point of view, it also meant
> > that we were leaking the clk_composite structure allocated in
> > clk_register_composite.
> > 
> > Add a clk_unregister_composite function to fix this.
> > 
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> 
> I'm currently attempting to change the way clks are registered so
> that we don't return clk pointers from clk_register and have
> users add OF clk providers that return clk_hw pointers instead of
> clk pointers. Just a note, that this whole thing should be
> deleted in the next cycle if I can convert everything!

Ok.

> 
> >  drivers/clk/clk-composite.c  | 15 +++++++++++++++
> >  include/linux/clk-provider.h |  1 +
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> > index 1f903e1f86a2..b0f3b84ebd13 100644
> > --- a/drivers/clk/clk-composite.c
> > +++ b/drivers/clk/clk-composite.c
> > @@ -286,3 +286,18 @@ err:
> >  	kfree(composite);
> >  	return clk;
> >  }
> > +
> > +void clk_unregister_composite(struct clk *clk)
> > +{
> > +	struct clk_composite *composite;
> > +	struct clk_hw *hw;
> > +
> > +	hw = __clk_get_hw(clk);
> > +	if (!hw)
> > +		return;
> > +
> > +	composite = to_clk_composite(hw);
> > +
> > +	clk_unregister(clk);
> > +	kfree(composite);
> > +}
> 
> EXPORT_SYMBOL_GPL?

The register function is not registered, so I don't think that's
necessary.

> Do I need to pick this up?

I have a bunch of other clock patches that need this, so I guess it
would be easier if applied it directly with your acked-by, or if you
could apply it and give a stable branch I can base my future PR on.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--4Ckj6UjgE2iN1+kY--
