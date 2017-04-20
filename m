From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 05/11] drm/sun4i: abstract a engine type
Date: Thu, 20 Apr 2017 16:39:57 +0200
Message-ID: <20170420143957.t4vppaeydlaeocgh@lukather>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-6-icenowy@aosc.io>
 <20170418085548.4cisone2yfcuizcp@lukather>
 <5F52665D-8A24-40D3-B84B-E8991B3BE457@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="52falea6r2qekzsn"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPMQ4PDQKGQE2TMESRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <5F52665D-8A24-40D3-B84B-E8991B3BE457-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--52falea6r2qekzsn
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Apr 18, 2017 at 07:05:12PM +0800, Icenowy Zheng wrote:
> >> @@ -56,7 +55,7 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc
> >*crtc,
> >>  
> >>  	DRM_DEBUG_DRIVER("Committing plane changes\n");
> >>  
> >> -	sun4i_backend_commit(scrtc->backend);
> >> +	scrtc->engine_ops->commit(scrtc->engine);
> >
> >You rely on the backend having setup things properly, which is pretty
> >fragile. Ideally, you should have a function to check that engine_ops
> >and commit is !NULL, and call it, and the consumers would use that
> >function...
> 
> If it's really NULL how should the function return?

It depends on the return code. ENOSYS if it returns an int, and simply
does nothing if it's a void. I don't think any of the current
functions return an error code at the moment though, so I'd just keep
the current behaviour and just call the function if it's set.

You cannot fail in atomic_flush anyway.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--52falea6r2qekzsn--
