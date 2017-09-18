From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 6/6] ARM: sun8i: h3: add partial CPU
 thermal zone
Date: Mon, 18 Sep 2017 10:27:03 +0200
Message-ID: <20170918082703.riqntqilakzhirc5@flea.lan>
References: <20170914145251.21784-1-icenowy@aosc.io>
 <20170914145251.21784-7-icenowy@aosc.io>
 <b41a80ec-23d5-a614-f6cc-d09c5a459e03@free-electrons.com>
 <20170916151734.10968b7a@archlinux>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dmmblfkwzntjwbo4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBYUG73GQKGQE6A5GVHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170916151734.10968b7a@archlinux>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dmmblfkwzntjwbo4
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Jonathan,

On Sat, Sep 16, 2017 at 03:17:34PM -0700, Jonathan Cameron wrote:
> On Sat, 16 Sep 2017 12:05:49 +0200
> Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > Hi Icenowy,
> > 
> > On 14/09/2017 16:52, Icenowy Zheng wrote:
> > > Because of the restriction of the OF thermal framework, the thermal
> > > sensor will fail to probe if the thermal zone doesn't exist.
> > >   
> > 
> > Oh no, that's not good.
> > 
> > We discussed about it on IRC and I even proposed a patch for it, telling
> > you I would post it on the mailing list soon after. Of course, I forgot
> > and you definitely should have yelled at me for not doing it :)
> > 
> > I won't be able to test the patch soon. I can send it to you so that you
> > can test it and integrate it in your patch series so it won't block you.
> > Otherwise, we'll have to wait for a week or two for me to test it.
> > 
> > Thanks and sorry for forgetting to post the patch you need,
> > Quentin
> 
> Other this outstanding issue I'm happy with the series, so hopefully
> with Quentin's patch added we should be good to merge this one.

We will at least need a v5.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--dmmblfkwzntjwbo4--
