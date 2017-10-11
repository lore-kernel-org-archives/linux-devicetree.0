From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Wed, 11 Oct 2017 11:26:02 +0200
Message-ID: <20171011112602.15a7817d@bbrezillon>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
        <c17e158a-3e37-8ae6-e31c-7ed89429166a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c17e158a-3e37-8ae6-e31c-7ed89429166a-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Archit,

On Thu, 7 Sep 2017 15:06:13 +0530
Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

> 
> > +
> > +static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
> > +{
> > +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> > +	struct cdns_dsi *dsi = input_to_dsi(input);
> > +	u32 val;
> > +
> > +	val = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
> > +	val &= ~(IF_VID_SELECT_MASK | IF_VID_MODE | VID_EN | HOST_EOT_GEN |
> > +		 DISP_EOT_GEN);  
> 
> I see some truncation related sparse warnings here and a couple of other places
> when building against arm32. Those would be nice to fix.

I had a look and it seems to happen everytime I use GENMASK() (the
truncation is harmless, but sparse complains).
If you don't mind, I'd prefer to keep GENMASK() rather than manually
defining masks, but maybe you have an idea how to fix these warnings
without getting rid of GENMASK().

> 
> > +	writel(val, dsi->regs + MCTL_MAIN_DATA_CTL);
> > +
> > +	val = readl(dsi->regs + MCTL_MAIN_EN) & ~IF_EN(input->id);
> > +	writel(val, dsi->regs + MCTL_MAIN_EN);
> > +}

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
