From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Wed, 20 Sep 2017 14:08:46 +0200
Message-ID: <20170920140846.22534328@bbrezillon>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
        <70f446c1-64d8-928c-4ea7-aa16dda12253@ti.com>
        <20170919152533.78fb2b3e@bbrezillon>
        <2ccf3816-8a98-5626-7e4e-1dd13f167811@ti.com>
        <20170919154814.02485818@bbrezillon>
        <6cbad342-aac8-d0d4-1d82-26aef33f0e82@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6cbad342-aac8-d0d4-1d82-26aef33f0e82-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 19 Sep 2017 17:25:29 +0300
Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:

> ﻿
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> On 19/09/17 16:48, Boris Brezillon wrote:
> > On Tue, 19 Sep 2017 16:38:31 +0300
> > Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
> >   
> >> ﻿
> >> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> >>
> >> On 19/09/17 16:25, Boris Brezillon wrote:  
> >>> On Tue, 19 Sep 2017 15:59:20 +0300
> >>> Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
> >>>     
> >>>> ﻿Hi Boris,
> >>>>
> >>>>
> >>>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> >>>>
> >>>> On 31/08/17 18:55, Boris Brezillon wrote:    
> >>>>> Add a driver for Cadence DPI -> DSI bridge.
> >>>>>
> >>>>> This driver only support a subset of Cadence DSI bridge capabilities.
> >>>>>
> >>>>> Here is a non-exhaustive list of missing features:
> >>>>>  * burst mode
> >>>>>  * dynamic configuration of the DPHY based on the
> >>>>>  * support for additional input interfaces (SDI input)
> >>>>>
> >>>>> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>      
> >>>>
> >>>> <snip>
> >>>>    
> >>>>> +	dsi->pclk = devm_clk_get(&pdev->dev, "pclk");
> >>>>> +	if (IS_ERR(dsi->pclk))
> >>>>> +		return PTR_ERR(dsi->pclk);      
> >>>>
> >>>> What's the purpose of pclk? Isn't that normally dealt with the normal
> >>>> modesetting, enabled with the video stream? How could it even be enabled
> >>>> here, without anyone setting the rate?    
> >>>
> >>> It's the peripheral clock, not the pixel clock, and AFAIU it has to be
> >>> enabled before accessing DSI registers.    
> >>
> >> Is that the dsi_p_clk? I can't find "peripheral clock" in the specs.  
> > 
> > Yep, it is dsi_p_clk (the APB clock).
> >   
> >>
> >> I think calling it "pclk" in a display driver is very confusing, as
> >> pclk, at least for me, always means pixel clock =).  
> > 
> > I can rename it if you prefer. What name would you like to see?
> > abp_clk? periph_clk? Something else?  
> 
> Is there something wrong with dsi_p_clk? If possible, it's nice if the
> terms in SW match to the HW docs. In the minimum, the DT doc should give
> the mapping from SW to HW terms, at the moment it just says "pclk".

I'll switch to dsi_p_clk and dsi_sys_clk.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
