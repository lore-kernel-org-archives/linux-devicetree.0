From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH] drm: hdlcd: allow HDLCD to be used without interrupt
Date: Fri, 28 Jul 2017 16:58:27 +0100
Message-ID: <20170728155827.GV31807@n2100.armlinux.org.uk>
References: <E1daJCF-0003pG-DI@rmk-PC.armlinux.org.uk>
 <20170726102748.GM31807@n2100.armlinux.org.uk>
 <20170728152311.GA970@e110455-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170728152311.GA970-A/Nd4k6kWRHZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 28, 2017 at 04:23:11PM +0100, Liviu Dudau wrote:
> On Wed, Jul 26, 2017 at 11:27:48AM +0100, Russell King - ARM Linux wrote:
> > On Wed, Jul 26, 2017 at 11:05:39AM +0100, Russell King wrote:
> > > Some ARM platforms do not wire the HDLCD interrupt.  Allow hdlcd to
> > > initialise without an interrupt present.
> > > 
> > > Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> > 
> 
> Hi Russell,
> 
> Sorry for my silence, I was on holiday this week and just came back
> today.
> 
> > This isn't fully functional on ARM MPS platforms yet, but at least
> > gets us further.  Without any display connected:
> > 
> > [   14.315986] [drm] found ARM HDLCD version r0p0
> > [   14.557038] tda998x 2-0070: found TDA19988
> > [   14.622232] hdlcd 40205000.hdlcd: bound 2-0070 (ops 0x213534)
> > [   14.630406] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> > [   14.639335] [drm] No driver support for vblank timestamp query.
> > [   14.653210] [drm] Cannot find any crtc or sizes - going 1024x768
> > [   15.232556] hdlcd 40205000.hdlcd: fb0:  frame buffer device
> > [   15.284076] [drm] Initialized hdlcd 1.0.0 20151021 for 40205000.hdlcd on minor 0
> > 
> > With a TV connected, the driver doesn't initialise:
> > 
> > [   14.422810] [drm] found ARM HDLCD version r0p0
> > [   14.657227] tda998x 2-0070: found TDA19988
> > [   14.722439] hdlcd 40205000.hdlcd: bound 2-0070 (ops 0x213534)
> > [   14.730613] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> > [   14.739538] [drm] No driver support for vblank timestamp query.
> > [   15.311977] hdlcd 40205000.hdlcd: Failed to set initial hw configuration.
> > [   15.357402] hdlcd 40205000.hdlcd: master bind failed: -12
> > [   15.365082] tda998x: probe of 2-0070 failed with error -12
> > 
> > I don't think this is correct behaviour - if we fail to set an initial
> > configuration (which will be based on the resolution of the connected
> > display) why should the driver fail to probe - it's not that there is
> > no device, it's (in this case) that there aren't the resources for the
> > chosen mode.  Userspace could always try setting a different mode.
> > 
> > I suspect the above failure is down to either (a) not having enough
> > memory available to allocate a 1920x1080 frame buffer, or (b) not
> > (yet) being able to program the hdlcd pixel clock for this platform,
> > which is currently hard-coded in DT at 23.75MHz.
> 
> I don't think it is the clock, if that fails then you would not see the
> r0p0 version number being printed. Due to the fact that until now HDLCD
> has run mostly on platforms that have SCP, which takes care of actual
> setup of the clocks, it is pretty lax on errors on pixel clock setup.

Note, however, that in this case, the clock is a fixed frequency clock.
I wasn't meaning a failure to obtain the clock, I was meaning a failure
to set the appropriate rate.

> Also, may I ask what MPS platform you are trying to use? I might be able
> to source one internally and try to reproduce your problems.

I'll point you in the direction of Ian Rickards in ARM for that
information.  (I'm not sure if I can mention the board publically
yet as its early days...)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
