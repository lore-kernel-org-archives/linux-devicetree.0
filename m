From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 6/6] ARM: sun8i: h3: add partial CPU thermal zone
Date: Sat, 16 Sep 2017 15:17:34 -0700
Message-ID: <20170916151734.10968b7a@archlinux>
References: <20170914145251.21784-1-icenowy@aosc.io>
        <20170914145251.21784-7-icenowy@aosc.io>
        <b41a80ec-23d5-a614-f6cc-d09c5a459e03@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b41a80ec-23d5-a614-f6cc-d09c5a459e03-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 16 Sep 2017 12:05:49 +0200
Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Icenowy,
> 
> On 14/09/2017 16:52, Icenowy Zheng wrote:
> > Because of the restriction of the OF thermal framework, the thermal
> > sensor will fail to probe if the thermal zone doesn't exist.
> >   
> 
> Oh no, that's not good.
> 
> We discussed about it on IRC and I even proposed a patch for it, telling
> you I would post it on the mailing list soon after. Of course, I forgot
> and you definitely should have yelled at me for not doing it :)
> 
> I won't be able to test the patch soon. I can send it to you so that you
> can test it and integrate it in your patch series so it won't block you.
> Otherwise, we'll have to wait for a week or two for me to test it.
> 
> Thanks and sorry for forgetting to post the patch you need,
> Quentin

Other this outstanding issue I'm happy with the series, so hopefully
with Quentin's patch added we should be good to merge this one.

Jonathan

> 
> > Add a partial thermal zone which claims the H3 THS as the thermal sensor.
> > 
> > The cooling device (CPU DVFS) is still not added as it's not ready, and
> > the trip points are also not added yet.
> > 
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-h3.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> > index 3220da3ad790..687c6457d214 100644
> > --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> > @@ -89,6 +89,15 @@
> >  		};
> >  	};
> >  
> > +	thermal-zones {
> > +		cpu-thermal {
> > +			/* milliseconds */
> > +			polling-delay-passive = <250>;
> > +			polling-delay = <1000>;
> > +			thermal-sensors = <&ths>;
> > +		};
> > +	};
> > +
> >  	timer {
> >  		compatible = "arm,armv7-timer";
> >  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> >   
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
