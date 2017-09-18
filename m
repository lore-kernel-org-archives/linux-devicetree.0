From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 4/6] iio: adc: sun4i-gpadc-iio: add
 support for H3 thermal sensor
Date: Mon, 18 Sep 2017 10:24:02 +0200
Message-ID: <20170918082402.fa5mg2ucqouh3ti5@flea.lan>
References: <20170914145251.21784-1-icenowy@aosc.io>
 <20170914145251.21784-5-icenowy@aosc.io>
 <445ea236-35e9-8d5a-e580-b2bdcf5f7776@free-electrons.com>
 <0b395ea1743a14a62855fc2a2dc74411@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yc6aqu6lsph33767"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLEF73GQKGQEJHR4FUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <0b395ea1743a14a62855fc2a2dc74411-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yc6aqu6lsph33767
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Sep 16, 2017 at 06:14:08PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> > The H3 apparently supports IRQs, why do you not support them for the
> > temperature? They might be broken as it is on A33 but then it might be a
> > good idea to write it down in a comment in the driver (and not adding
> > the unused registers in the header file) or at least in the commit log.
> > 
> > 3) Now that you have support for clocks, wouldn't it be a good idea to
> > disable them during suspend?
> 
> Interesting... It's meaningful to disable the mod clock during suspend.

All clocks, actually. And put the device back into reset.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--yc6aqu6lsph33767--
