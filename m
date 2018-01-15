From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
Date: Mon, 15 Jan 2018 07:55:29 +0100
Message-ID: <20180115065528.cfelrll6dm6ggf4e@verge.net.au>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWFHRti_Su+01QYnWXHGB2Z=d4Sq93Y9JJgb2ifKSs2vg@mail.gmail.com>
 <1560461.HFdK8RZ078@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1560461.HFdK8RZ078@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 12, 2018 at 03:29:48PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Friday, 12 January 2018 12:13:18 EET Geert Uytterhoeven wrote:
> > On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > > The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> > > corresponding device tree bindings.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > 
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > @@ -0,0 +1,54 @@
> > > +Renesas R-Car LVDS Encoder
> > > +==========================
> > > +
> > > +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> > > Gen2 +and Gen3 SoCs.
> > > +
> > > +Required properties:
> > > +
> > > +- compatible : Shall contain one of
> > > +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS
> > > encoders
> > > +  - "renesas,lvds-r8a7790" for R8A7790 (R-Car H2) compatible LVDS
> > > encoders
> > > +  - "renesas,lvds-r8a7791" for R8A7791 (R-Car M2-W) compatible LVDS
> > > encoders
> > > +  - "renesas,lvds-r8a7793" for R8A7791 (R-Car M2-N) compatible LVDS
> > > encoders
> > > +  - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS
> > > encoders
> > > +  - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS
> > > encoders
> > 
> > As this is a new binding, please use "renesas,<soc>-lvds".
> 
> I've recently been thinking that we made the wrong choice, <ip>-<soc> would be 
> better in my opinion as it aligns with <ip>-<version>, but it's too late to 
> change that, so I'll change the order here.

My recollection is that in the beginning we had a bit of a mixture but
leaned towards <ip>-<soc>, which made sense in my opinion. However, after
some discussion it was agreed that the best-practice for upstream was to
use <soc>-<ip>. Unless that situation has changed lets stock with using
<soc>-<ip> for new bindings.

> > BTW, would it make sense to use "renesas,<soc>-du" for the new DU binding,
> > too? Or have you reserved that for the future version that will have a
> > one-to-one mapping between device nodes and DU channels? ;-)
> 
> It's a good idea, let's reserve it for that evolution. If it ever happens ;-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
