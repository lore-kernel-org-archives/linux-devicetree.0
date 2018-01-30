From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add Cadence DSI driver
Date: Tue, 30 Jan 2018 09:17:12 +0100
Message-ID: <20180130091712.04363928@bbrezillon>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
        <47b5af31-4870-9109-291c-894455a1a15c@ti.com>
        <20180129173854.1f1ee8ce@bbrezillon>
        <19cc13ff-d2eb-bc46-6ceb-c020ea3ddad3@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19cc13ff-d2eb-bc46-6ceb-c020ea3ddad3-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Suresh Punnoose <sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Jan 2018 09:51:49 +0200
Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:

> On 29/01/18 18:38, Boris Brezillon wrote:
> 
> > Note that the TX byte clk should be configured to match the DPI pixel
> > clock, which means we should refuse any config where the variation is
> > too big to be recovered. Anyway, we still don't have a way to configure
> > the PLL rate (which is driving the TX byte clk), so there's not much I
> > can do about that right now.  
> 
> We could have the code to check the allowed difference in place.

Not sure I understand what you mean. I can put a TODO/FIXME comment in
the code to say that, once we'll have the 'PLL generator' in place we'll
need to check that the pixel and TX byte clk are close enough, but I
don't see what code you want me to add? Right now, the check will
always succeed, because I assume the pixel and TX byte clk
match perfectly.

If that's a hard requirement, I'll do it, but I think it's pretty
useless given that I won't be able to test the logic in a real
situation.

> 
> >> Another thing is that the mode->crtc_clock is in kHz, I wonder if that
> >> rounding can cause miscalculations in the above code.  
> > 
> > Do we really have modes exposing pixel clks not aligned on a Khz? I  
> 
> Well, I think the clocks in the logical video modes are aligned, but the
> actual clock from the display controller or the PHY most likely is not
> aligned.

Hm, they probably will be for standard definitions.

> 
> > know the display controller can adjust the timings, but then, the
> > variation caused by the Khz approx should not be that big (999Khz /
> > 10+MHz < 1/10000), and anyway, that's what the DRM framework
> > manipulates...  
> 
> Depends on how strict the HW is about the allowed difference between the
> crtc and the DSI IP. It maybe that that 1 Hz is one too many... But that
> can be avoided by just making sure that the check rounds the values
> properly, or maybe just reduces the allowed range by 1kHz on both ends.

My point is, even the display controller can't adjust the pixel clk
rate at the sub-KHz level because mode->crtc_clock is expressed in KHz,
so why should we bother? Do you want to change the DRM API to pass the
pixel clk frequency in Hz?

> 
> So I don't think it's an issue, but it is something to keep in mind.
> 
>  Tomi
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
