From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas: Add R-Car M3-W
 HDMI TX DT bindings
Date: Tue, 11 Jul 2017 11:00:55 +0200
Message-ID: <20170711090055.GE4517@verge.net.au>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170621093133.5677-2-laurent.pinchart+renesas@ideasonboard.com>
 <20170626155642.6ux7rdtwup6vzhnk@rob-hp-laptop>
 <20170710092531.GA15635@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170710092531.GA15635-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 10, 2017 at 11:25:31AM +0200, Simon Horman wrote:
> On Mon, Jun 26, 2017 at 10:56:42AM -0500, Rob Herring wrote:
> > On Wed, Jun 21, 2017 at 12:31:27PM +0300, Laurent Pinchart wrote:
> > > The M3-W HDMI TX controller seems to be compatible for the H3. No
> > > extension to the DT bindings are needed, add an SoC-specific compatible
> > > string in case differences between the IP versions are found later and
> > > require model-specific handling.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Applied for v4.14.
> 
> I am not applying the dts changes for now pending resolution of the
> potential bisection problem in patch 4 which I pointed out in response to that patch.

That problem has now been resolved and I have applied this series for v4.14.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
