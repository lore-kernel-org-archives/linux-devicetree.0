From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add Cadence DSI driver
Date: Mon, 29 Jan 2018 17:38:54 +0100
Message-ID: <20180129173854.1f1ee8ce@bbrezillon>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
        <47b5af31-4870-9109-291c-894455a1a15c@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <47b5af31-4870-9109-291c-894455a1a15c-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Suresh Punnoose <sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Tomi,

On Mon, 29 Jan 2018 16:29:21 +0200
Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:

> On 18/01/18 15:43, Boris Brezillon wrote:
> > Add a driver for Cadence DPI -> DSI bridge.
> > 
> > This driver only support a subset of Cadence DSI bridge capabilities.
> > 
> > Here is a non-exhaustive list of missing features:
> >  * burst mode
> >  * DPHY init/configuration steps
> >  * support for additional input interfaces (SDI input)  
> 
> I think it would be good to have a list of features that are supported
> and tested, and perhaps a word about the development setup you have.
> 
> One thing that slightly worries me are the DPHY and input pixel clock
> rates. Now the code expects that those values match perfectly, which is
> not the case in real life. So what's the accepted difference, and is
> there something in the registers to program differently depending on the
> diff?

Just had a quick chat with Simon, and it seems some of the bits I was
setting were already activating the HSYNC/VSYNC recovery mechanism:

* VID_IGNORE_MISS_VSYNC: recover the case where pixel clock runs slower
  than TX byte clk
* the engine already handles the other case (pixel clock runs faster
  than TX byte clk) automatically (or maybe this is configured with the
  RECOVERY_MODE() field, I'm not sure)

Simon, don't hesitate to provide more information or correct me if I'm
wrong.

Note that the TX byte clk should be configured to match the DPI pixel
clock, which means we should refuse any config where the variation is
too big to be recovered. Anyway, we still don't have a way to configure
the PLL rate (which is driving the TX byte clk), so there's not much I
can do about that right now.

> 
> Another thing is that the mode->crtc_clock is in kHz, I wonder if that
> rounding can cause miscalculations in the above code.

Do we really have modes exposing pixel clks not aligned on a Khz? I
know the display controller can adjust the timings, but then, the
variation caused by the Khz approx should not be that big (999Khz /
10+MHz < 1/10000), and anyway, that's what the DRM framework
manipulates...

Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
