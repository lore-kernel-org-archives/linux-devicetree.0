From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 6/6] ARM: sun8i: h3: add partial CPU thermal zone
Date: Sun, 24 Sep 2017 15:23:04 +0100
Message-ID: <20170924152304.02551715@archlinux>
References: <20170914145251.21784-1-icenowy@aosc.io>
        <20170914145251.21784-7-icenowy@aosc.io>
        <b41a80ec-23d5-a614-f6cc-d09c5a459e03@free-electrons.com>
        <20170916151734.10968b7a@archlinux>
        <20170918082703.riqntqilakzhirc5@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170918082703.riqntqilakzhirc5-ZC1Zs529Oq4@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 18 Sep 2017 10:27:03 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Jonathan,
> 
> On Sat, Sep 16, 2017 at 03:17:34PM -0700, Jonathan Cameron wrote:
> > On Sat, 16 Sep 2017 12:05:49 +0200
> > Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >   
> > > Hi Icenowy,
> > > 
> > > On 14/09/2017 16:52, Icenowy Zheng wrote:  
> > > > Because of the restriction of the OF thermal framework, the thermal
> > > > sensor will fail to probe if the thermal zone doesn't exist.
> > > >     
> > > 
> > > Oh no, that's not good.
> > > 
> > > We discussed about it on IRC and I even proposed a patch for it, telling
> > > you I would post it on the mailing list soon after. Of course, I forgot
> > > and you definitely should have yelled at me for not doing it :)
> > > 
> > > I won't be able to test the patch soon. I can send it to you so that you
> > > can test it and integrate it in your patch series so it won't block you.
> > > Otherwise, we'll have to wait for a week or two for me to test it.
> > > 
> > > Thanks and sorry for forgetting to post the patch you need,
> > > Quentin  
> > 
> > Other this outstanding issue I'm happy with the series, so hopefully
> > with Quentin's patch added we should be good to merge this one.  
> 
> We will at least need a v5.
> 
> Maxime
> 
Sure - I can see other issues are coming out of the woodwork!

Thanks,

Jonathan
