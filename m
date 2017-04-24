From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/9] drm/sun4i: Support multiple display pipelines
Date: Mon, 24 Apr 2017 07:51:04 +0200
Message-ID: <20170424055104.geg4mg3dxtqwaluw@lukather>
References: <20170421083857.29636-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mgc4g2h54rhgk34d"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSNE63DQKGQE6YZDONI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170421083857.29636-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mgc4g2h54rhgk34d
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Apr 21, 2017 at 04:38:48PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> This is v2 of the series previously named "drm/sun4i: Support two
> display pipelines". As the name change suggests, the driver now
> supports any number of pipelines, though the hardware only has
> 2 or 3.
> 
> Changes since v1:
> 
>   - Add component endpoint ID numbering scheme to device tree binding.
> 
>   - Use lists to keep references to registered backends and tcons.
> 
>   - Save pointer to device node for backends.
> 
>   - Traverse the device tree of_graph starting from the tcons, going
>     up towards the inputs, and matching the device nodes with the
>     device nodes of registered backends, to find the one linked with
>     the tcon the search started from.
> 
>   - Copy the ID for the tcon from its upstream backend, instead of
>     trying, and possibly failing, to figure it out from the device
>     tree.
> 
>   - Split out hunk dropping trailing 0 from a backend error message.
> 
> Patch 1 adds the component endpoint ID numbering scheme to the
> device tree binding. New in v2.
> 
> Patch 2 adds lists to track registered display backends and TCONs,
> instead of just one pointer per component type. Previously added
> arrays of pointers in v1.
> 
> Patch 3 drops the trailing 0 from one of the backend's bind error
> messages. This was previously part of the patch "drm/sun4i: Support
> two display pipelines".
> 
> Patch 4 adds a function to fetch a backend's ID from the device tree.
> Unchanged.
> 
> Patch 5 adds a device node field to the backend data structure and
> saves a reference to the underlying device node of the backend.
> New in v2.
> 
> Patch 6 makes the tcon driver find its upstream backend by traversing
> the of_graph and matching device nodes against the device nodes of
> registered backends.
> New in v2.
> 
> Patch 7 makes the tcon driver use the ID from its associated backend.
> New in v2. This is not immediately used in this series, but will be
> used in similar fashion for downstream encoders to figure out IDs and
> muxing
> 
> Patch 8 adds device nodes for sun6i's second display pipeline.
> Unchanged.
> 
> Patch 9 enables sun6i's tcon0 by default.
> Unchanged.

Applied everything, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--mgc4g2h54rhgk34d--
