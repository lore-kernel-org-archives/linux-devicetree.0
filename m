From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/9] media: platform: Add Sunxi Cedrus
 decoder driver
Date: Thu, 19 Apr 2018 16:58:18 +0200
Message-ID: <d2df04bd29b040001577d3bb905c81b3aff8f594.camel@bootlin.com>
References: <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
	 <20180309101445.16190-3-paul.kocialkowski@bootlin.com>
	 <20180309135702.pk4webt7xnj7lrza@flea>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lYPRh0T5wzpLHC3is229"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBVO54LLAKGQEVTHLQBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180309135702.pk4webt7xnj7lrza@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Florent Revest <revestflo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thomas van Kleef <thomas-XCRq7eEM0/pmR6Xm/wNWPw@public.gmane.org>, "Signed-off-by : Bob Ham" <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-lYPRh0T5wzpLHC3is229
Content-Type: text/plain; charset="UTF-8"

Hi and thanks for the review,

On Fri, 2018-03-09 at 14:57 +0100, Maxime Ripard wrote:
> On Fri, Mar 09, 2018 at 11:14:41AM +0100, Paul Kocialkowski wrote:
> > +/*
> > + * mem2mem callbacks
> > + */
> > +
> > +void job_abort(void *priv)
> > +{}
> 
> Is that still needed?

v2 contains a proper implementation of job abortion, so yes :)

> > +/*
> > + * device_run() - prepares and starts processing
> > + */
> > +void device_run(void *priv)
> > +{
> 
> This function (and the one above) should probably made static. Or at
> least if you can't, they should have a much more specific name in
> order not to conflict with anything from the core.

Agreed, will fix in v2.

> > +	/*
> > +	 * The VPU is only able to handle bus addresses so we have
> > to subtract
> > +	 * the RAM offset to the physcal addresses
> > +	 */
> > +	in_buf     -= PHYS_OFFSET;
> > +	out_luma   -= PHYS_OFFSET;
> > +	out_chroma -= PHYS_OFFSET;
> 
> You should take care of that by putting it in the dma_pfn_offset field
> of the struct device (at least before we come up with something
> better).
> 
> You'll then be able to use the dma_addr_t directly without modifying
> it.

Ditto.

> > +	vpu->syscon = syscon_regmap_lookup_by_phandle(vpu->dev-
> > >of_node,
> > +						      "syscon");
> > +	if (IS_ERR(vpu->syscon)) {
> > +		vpu->syscon = NULL;
> > +	} else {
> > +		regmap_write_bits(vpu->syscon,
> > SYSCON_SRAM_CTRL_REG0,
> > +				  SYSCON_SRAM_C1_MAP_VE,
> > +				  SYSCON_SRAM_C1_MAP_VE);
> > +	}
> 
> This should be using our SRAM controller driver (and API), see
> Documentation/devicetree/bindings/sram/sunxi-sram.txt
> include/linux/soc/sunxi/sunxi_sram.h

This will require adding support for the VE (and the A33 along the way)
in the SRAM driver, so a dedicated patch series will be sent in this
direction eventually.

> > +	ret = clk_prepare_enable(vpu->ahb_clk);
> > +	if (ret) {
> > +		dev_err(vpu->dev, "could not enable ahb clock\n");
> > +		return -EFAULT;
> > +	}
> > +	ret = clk_prepare_enable(vpu->mod_clk);
> > +	if (ret) {
> > +		clk_disable_unprepare(vpu->ahb_clk);
> > +		dev_err(vpu->dev, "could not enable mod clock\n");
> > +		return -EFAULT;
> > +	}
> > +	ret = clk_prepare_enable(vpu->ram_clk);
> > +	if (ret) {
> > +		clk_disable_unprepare(vpu->mod_clk);
> > +		clk_disable_unprepare(vpu->ahb_clk);
> > +		dev_err(vpu->dev, "could not enable ram clock\n");
> > +		return -EFAULT;
> > +	}
> 
> Ideally, this should be using runtime_pm to manage the device power
> state, and disable it when not used.
> 
> > +	reset_control_assert(vpu->rstc);
> > +	reset_control_deassert(vpu->rstc);
> 
> You can use reset_control_reset here

Will do in v2.

> > +	return 0;
> > +}
> > +
> > +void sunxi_cedrus_hw_remove(struct sunxi_cedrus_dev *vpu)
> > +{
> > +	clk_disable_unprepare(vpu->ram_clk);
> > +	clk_disable_unprepare(vpu->mod_clk);
> > +	clk_disable_unprepare(vpu->ahb_clk);
> 
> The device is not put back into reset here

Good catch!

Cheers,

-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-lYPRh0T5wzpLHC3is229--
