From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 06/11] drm/sun4i: add support for
 Allwinner DE2 mixers
Date: Thu, 20 Apr 2017 10:37:07 +0200
Message-ID: <20170420083707.wdtrdlxpvocpzc7g@lukather>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-7-icenowy@aosc.io>
 <20170418090047.7i2k6dtoqxfdqwwy@lukather>
 <88F5FAC9-1873-4C76-9AB9-FF361C07664E@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qhz3kxodf4smqjbf"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPPG4HDQKGQESTMDC4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <88F5FAC9-1873-4C76-9AB9-FF361C07664E-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qhz3kxodf4smqjbf
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Apr 18, 2017 at 06:47:56PM +0800, Icenowy Zheng wrote:
> >> +	/* Get the physical address of the buffer in memory */
> >> +	gem = drm_fb_cma_get_gem_obj(fb, 0);
> >> +
> >> +	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
> >> +
> >> +	/* Compute the start of the displayed memory */
> >> +	bpp = fb->format->cpp[0];
> >> +	paddr = gem->paddr + fb->offsets[0];
> >> +	paddr += (state->src_x >> 16) * bpp;
> >> +	paddr += (state->src_y >> 16) * fb->pitches[0];
> >> +
> >> +	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
> >> +
> >> +	paddr_u32 = (uint32_t) paddr;
> >
> >How does that work on 64-bits systems ?
> 
> The hardware is not designed to work on 64-bit systems.
> 
> Even 64-bit A64/H5 has also 3GiB memory limit.

That's a fragile assumption.

> The address cell in mixer hardware is also only 32-bit.
> 
> So we should just keep the force conversion here. If we then really
> met 4GiB-capable AW SoC without changing DE2, I think we should have
> other way to limit CMA pool inside 4GiB.

The register name looks like this is only the lower 32 bits that you
can set here, and that there is another register for the upper 32 bits
of that address somewhere.

In that case, please use the lower_32_bits and upper_32_bits helper,
and don't cast it that way.

If it isn't the case, you should set the DMA mask (through
dma_set_mask) so that we only allocate memory that can be accessed by
this device.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--qhz3kxodf4smqjbf--
