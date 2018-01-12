From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
Date: Fri, 12 Jan 2018 15:36:55 +0200
Message-ID: <24461573.LqbDqcKzYR@avalon>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWMgst-1evod+0hZujU2xPtO3UmO9c2CPPrTg=gpHpTbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWMgst-1evod+0hZujU2xPtO3UmO9c2CPPrTg=gpHpTbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Friday, 12 January 2018 11:45:56 EET Geert Uytterhoeven wrote:
> On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> > corresponding device tree bindings.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -0,0 +1,54 @@
> > +Renesas R-Car LVDS Encoder
> > +==========================
> > +
> > +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> > Gen2 +and Gen3 SoCs.
> > +
> > +Required properties:
> > +
> > +- compatible : Shall contain one of
> > +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7790" for R8A7790 (R-Car H2) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7791" for R8A7791 (R-Car M2-W) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7793" for R8A7791 (R-Car M2-N) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS
> > encoders
> > +
> > +- reg: Base address and length for the memory-mapped registers
> > +- clocks: A phandle + clock-specifier pair for the functional clock
> 
> Please document the "resets" property, too, and add it to the example.
> According to the rcar-3.6.0 BSP, reset support is needed desperately.

Good point. I'll make it mandatory in the new bindings but treat it as 
optional in the driver as the live DT patching doesn't create the reset 
properties.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
