From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] drm: hdlcd: allow HDLCD to be used without interrupt
Date: Thu, 24 Aug 2017 11:16:15 +0100
Message-ID: <20170824101615.GE11316@e110455-lin.cambridge.arm.com>
References: <E1daJCF-0003pG-DI@rmk-PC.armlinux.org.uk>
 <20170726102748.GM31807@n2100.armlinux.org.uk>
 <e68186a4-2435-a969-7eff-21556d6a6b03@arm.com>
 <9cdccb9c-83c5-5867-06a5-3b344102d232@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9cdccb9c-83c5-5867-06a5-3b344102d232-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 03:45:21PM +0100, Vladimir Murzin wrote:
> On 10/08/17 13:15, Vladimir Murzin wrote:
> > On 26/07/17 11:27, Russell King - ARM Linux wrote:
> >> I suspect the above failure is down to either (a) not having enough
> >> memory available to allocate a 1920x1080 frame buffer, or (b) not
> >> (yet) being able to program the hdlcd pixel clock for this platform,
> >> which is currently hard-coded in DT at 23.75MHz.
> > 
> > Given it is NOMMU it is likely (a). Usually, tweaking FORCE_MAX_ZONEORDER
> > helped me in such cases.
> 
> Ok, with CONFIG_FORCE_MAX_ZONEORDER=12 I see
> 
> [    5.242423] [drm] found ARM HDLCD version r0p0
> [    5.493835] tda998x 2-0070: found TDA19988
> [    5.527771] hdlcd 40205000.hdlcd: bound 2-0070 (ops 0x1470f8)
> [    5.535819] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    5.543478] [drm] No driver support for vblank timestamp query.
> [    7.443189] hdlcd 40205000.hdlcd: fb0:  frame buffer device
> [    7.501975] [drm] Initialized hdlcd 1.0.0 20151021 for 40205000.hdlcd on minor 0
> 
> when display is connected.
> 
> To make fb-test [1] happy I had to apply following diff:
> 
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> index 9a18e1b..d4cb1b1 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -10,6 +10,7 @@ config DRM_HDLCD
>         select DRM_ARM
>         select DRM_KMS_HELPER
>         select DRM_KMS_CMA_HELPER
> +       select FB_PROVIDE_GET_FB_UNMAPPED_AREA if !MMU
>         help
>           Choose this option if you have an ARM High Definition Colour LCD
>           controller.
> 
> (The only user of FB_PROVIDE_GET_FB_UNMAPPED_AREA is NOMMU only drivers/gpu/drm/stm/)
> 
> However, I do not see anything on the screen. I'm probably missing something
> obvious, so if you have an idea, please let me know and I can test the patch.

Do you have fbdev/fbcon enabled? If not, then you need some userspace that
makes use of the DRM interface. I usually play with the tests from
libdrm, you can start with modetest.

Best regards,
Liviu

> 
> [1] https://github.com/prpplague/fb-test-app.git 
> 
> Thanks
> Vladimir
> 
> > 
> > Cheers
> > Vladimir
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > 
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
