From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 05/11] drm/sun4i: abstract a engine type
Date: Mon, 24 Apr 2017 11:05:00 +0200
Message-ID: <20170424090500.i3k6u7pcahc7m3hv@lukather>
References: <20170423103754.50012-1-icenowy@aosc.io>
 <20170423103754.50012-6-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l72qyua2fb6rcfpc"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBUP763DQKGQEVBKVAJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170423103754.50012-6-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--l72qyua2fb6rcfpc
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

Thanks a lot for that work.

On Sun, Apr 23, 2017 at 06:37:48PM +0800, Icenowy Zheng wrote:
> As we are going to add support for the Allwinner DE2 engine in sun4i-drm
> driver, we will finally have two types of display engines -- the DE1
> backend and the DE2 mixer. They both do some display blending and feed
> graphics data to TCON, so I choose to call them both "engine" here.
> 
> Abstract the engine type to a new struct with an ops struct, which contains
> functions that should be called outside the engine-specified code (in
> TCON, CRTC or TV Encoder code).
> 
> A dedicated Kconfig option is also added to control whether
> sun4i-backend-specified code (sun4i_backend.c and sun4i_layer.c) should
> be built. As we removed the codes in CRTC code that directly call the
> layer code, we can now extract the layer part and combine it with the
> backend part into a new module, sun4i-backend.ko.

While the code itself is good now, the patch mixes a few things that
would be better to be split in separate patches. I think it would be
better if you had patches organized like this:
  - Abstract the engine type by create the sunxi_engine structure and
    fixing all the callers.
  - Move the layers and backend files in the same module, and remove
    the now useless EXPORT_SYMBOLS.
  - Create a Kconfig option.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--l72qyua2fb6rcfpc--
