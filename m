From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/9] clk: sunxi: Give sunxi_factors_register
 a registers parameter
Date: Fri, 21 Nov 2014 12:15:03 +0100
Message-ID: <20141121111503.GC4752@lukather>
References: <1416498928-1300-1-git-send-email-hdegoede@redhat.com>
 <1416498928-1300-2-git-send-email-hdegoede@redhat.com>
 <20141121083555.GK24143@lukather>
 <546EFB83.1020806@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB3N7XSRQKGQEHZC5O5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <546EFB83.1020806-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Nov 21, 2014 at 09:44:51AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/21/2014 09:35 AM, Maxime Ripard wrote:
> > Hi Hans,
> > 
> > On Thu, Nov 20, 2014 at 04:55:20PM +0100, Hans de Goede wrote:
> >> Before this commit sunxi_factors_register uses of_iomap(node, 0) to get
> >> the clk registers. The sun6i prcm has factor clocks, for which we want to
> >> use sunxi_factors_register, but of_iomap(node, 0) does not work for the prcm
> >> factor clocks, because the prcm uses the mfd framework, so the registers
> >> are not part of the dt-node, instead they are added to the platform_device,
> >> as platform_device resources.
> >>
> >> This commit makes getting the registers the callers duty, so that
> >> sunxi_factors_register can be used with mfd instantiated platform device too.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > 
> > Funny, I was thinking of doing exactly the same thing for MMC clocks :)
> > 
> >> ---
> >>  drivers/clk/sunxi/clk-factors.c    | 10 ++++------
> >>  drivers/clk/sunxi/clk-factors.h    |  7 ++++---
> >>  drivers/clk/sunxi/clk-mod0.c       |  6 ++++--
> >>  drivers/clk/sunxi/clk-sun8i-mbus.c |  2 +-
> >>  drivers/clk/sunxi/clk-sunxi.c      |  3 ++-
> >>  5 files changed, 15 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
> >> index f83ba09..fc4f4b5 100644
> >> --- a/drivers/clk/sunxi/clk-factors.c
> >> +++ b/drivers/clk/sunxi/clk-factors.c
> >> @@ -156,9 +156,10 @@ static const struct clk_ops clk_factors_ops = {
> >>  	.set_rate = clk_factors_set_rate,
> >>  };
> >>  
> >> -struct clk * __init sunxi_factors_register(struct device_node *node,
> >> -					   const struct factors_data *data,
> >> -					   spinlock_t *lock)
> >> +struct clk *sunxi_factors_register(struct device_node *node,
> >> +				   const struct factors_data *data,
> >> +				   spinlock_t *lock,
> >> +				   void __iomem *reg)
> >>  {
> >>  	struct clk *clk;
> >>  	struct clk_factors *factors;
> >> @@ -168,11 +169,8 @@ struct clk * __init sunxi_factors_register(struct device_node *node,
> >>  	struct clk_hw *mux_hw = NULL;
> >>  	const char *clk_name = node->name;
> >>  	const char *parents[FACTORS_MAX_PARENTS];
> >> -	void __iomem *reg;
> >>  	int i = 0;
> >>  
> >> -	reg = of_iomap(node, 0);
> >> -
> >>  	/* if we have a mux, we will have >1 parents */
> >>  	while (i < FACTORS_MAX_PARENTS &&
> >>  	       (parents[i] = of_clk_get_parent_name(node, i)) != NULL)
> >> diff --git a/drivers/clk/sunxi/clk-factors.h b/drivers/clk/sunxi/clk-factors.h
> >> index 9913840..1f5526d 100644
> >> --- a/drivers/clk/sunxi/clk-factors.h
> >> +++ b/drivers/clk/sunxi/clk-factors.h
> >> @@ -37,8 +37,9 @@ struct clk_factors {
> >>  	spinlock_t *lock;
> >>  };
> >>  
> >> -struct clk * __init sunxi_factors_register(struct device_node *node,
> >> -					   const struct factors_data *data,
> >> -					   spinlock_t *lock);
> >> +struct clk *sunxi_factors_register(struct device_node *node,
> >> +				   const struct factors_data *data,
> >> +				   spinlock_t *lock,
> >> +				   void __iomem *reg);
> > 
> > Why are you dropping the __init there?
> 
> Because it is going to be used from mfd instantiation, so from a platform_dev
> probe function which is not __init.

Ah right. Mentionning it in the commit log would be nice.

> 
> > 
> >>  
> >>  #endif
> >> diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
> >> index 4a56385..9530833 100644
> >> --- a/drivers/clk/sunxi/clk-mod0.c
> >> +++ b/drivers/clk/sunxi/clk-mod0.c
> >> @@ -78,7 +78,8 @@ static DEFINE_SPINLOCK(sun4i_a10_mod0_lock);
> >>  
> >>  static void __init sun4i_a10_mod0_setup(struct device_node *node)
> >>  {
> >> -	sunxi_factors_register(node, &sun4i_a10_mod0_data, &sun4i_a10_mod0_lock);
> >> +	sunxi_factors_register(node, &sun4i_a10_mod0_data,
> >> +			       &sun4i_a10_mod0_lock, of_iomap(node, 0));
> > 
> > As of_iomap can fail, I'd rather check the returned value before
> > calling sunxi_factors_register.
> > 
> > I know it wasn't done before, but it's the right thing to do, as it
> > would lead to an instant crash if that fails.
> 
> Ok, I'll wait for you to review the rest of the series and then do a v2 of the
> patch-set with this fixed (as time permits).

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--/e2eDi0V/xtL+Mc8--
