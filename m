From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
Date: Fri, 19 Jan 2018 15:23:58 -0600
Message-ID: <20180119212358.jdhabsemxosoffa2@rob-hp-laptop>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXYJmh8ssSRt8u75fTv5gyrpcoPKAuCT=BaF1Eu27CaiQ@mail.gmail.com>
 <2018729.fSqyra5bAZ@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2018729.fSqyra5bAZ@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 12, 2018 at 12:44:45PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Friday, 12 January 2018 11:49:28 EET Geert Uytterhoeven wrote:
> > On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > > The internal LVDS encoders now have their own DT bindings, representing
> > > them as part of the DU is deprecated.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > 
> > FWIW, you're not really deprecating the LVDS part, but removing it
> > completely. Do you want to keep a reference instead?
> 
> I don't think we should keep a reference as it would only confuse DT authors. 
> The information is kept in the git history. I can rewrite the commit message, 
> but I consider this as deprecating the legacy bindings.

We've done it both ways. I'm fine with just deleting.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
