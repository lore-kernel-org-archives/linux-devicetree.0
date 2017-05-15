From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 04/13] drm/sun4i: return only planes for
 layers created
Date: Mon, 15 May 2017 11:24:53 +0200
Message-ID: <20170515092453.uv5j3avcktgx4no5@flea.home>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-5-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ees4ru5q7pb5d7yx"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZPH4XEAKGQE7JIRFUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170514163045.40366-5-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ees4ru5q7pb5d7yx
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, May 15, 2017 at 12:30:36AM +0800, Icenowy Zheng wrote:
> As we are going to add support for the Allwinner DE2 Mixer in sun4i-drm
> driver, we will finally have two types of layers.
> 
> Each layer is bound to a drm_plane that is CRTC-specific, so we create
> them when initializing CRTC (calling sun4i_layers_init, which will be
> generalized in next patch). The drm_plane's will be used when creating
> CRTC, but the CRTC initialization code do not care other properties of
> the layer, so we let the sun4i_layers_init function return drm_plane's
> only.
> 
> As we have no need to trace the layers after the CRTC is properly
> created, we drop the layers pointer in sun4i_crtc struct.
> 
> Doing this uncouples the CRTC code from the type of layer (the
> sun4i_layers_init function name is still hardcoded and will be changed
> in the next patch), so that we can finally gain support for the
> mixer in DE2, which has different layers.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--ees4ru5q7pb5d7yx--
