From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: Document Cadence DSI
 bridge bindings
Date: Tue, 6 Jun 2017 15:06:02 +0200
Message-ID: <20170606150602.66880c92@bbrezillon>
References: <1496405096-18275-1-git-send-email-boris.brezillon@free-electrons.com>
        <1496405096-18275-2-git-send-email-boris.brezillon@free-electrons.com>
        <62284d00-c204-dc2e-a780-0357b2094b62@ti.com>
        <20170606143723.52962a22@bbrezillon>
        <99525652-0270-4eb0-73bc-c65ac51bc39e@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <99525652-0270-4eb0-73bc-c65ac51bc39e-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 6 Jun 2017 16:01:45 +0300
Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:

> On 06/06/17 15:37, Boris Brezillon wrote:
> > Hi Tomi,
> > 
> > On Tue, 6 Jun 2017 15:30:26 +0300
> > Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
> >   
> >> On 02/06/17 15:04, Boris Brezillon wrote:  
> >>> Document the bindings used for the Cadence DSI bridge.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>> ---
> >>>  .../bindings/display/bridge/cdns,dsi.txt           | 55 ++++++++++++++++++++++
> >>>  1 file changed, 55 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> >>> new file mode 100644
> >>> index 000000000000..770c5c5b1e93
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> >>> @@ -0,0 +1,55 @@
> >>> +Cadence DSI bridge
> >>> +==================
> >>> +
> >>> +The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI lanes.
> >>> +
> >>> +Required properties:
> >>> +- compatible: should be set to "cdns,dsi".
> >>> +- reg: physical base address and length of the controller's registers.
> >>> +- interrupts: interrupt line connected to the DSI bridge.
> >>> +- clocks: DSI bridge clocks.
> >>> +- clock-names: must contain "pclk" and "sysclk".    
> >>
> >> clock-names doesn't match the example below.  
> > 
> > Indeed. I'll fix the example.
> >   
> >>  
> >>> +- phys: phandle link to the MIPI D-PHY controller.
> >>> +- phy-names: must contain "dphy".
> >>> +- #address-cells: must be set to 1.
> >>> +- #size-cells: must be set to 0.
> >>> +
> >>> +Required subnodes:
> >>> +- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
> >>> +  Currently contains a single input port at address 0 representing the DPI
> >>> +  input. Other ports will be added later to support the SDI inputs.    
> >>
> >> Typo with "SDI".  
> > 
> > No, the 2nd and 3rd input ports are really called SDI. Here
> > is the datasheet description:
> > 
> > "
> > SDI: 
> > Serial Display Interface - this is the name of the block that is built
> > to interface the Display application processor to the DSI link. This is
> > a proprietary interface.
> > "  
> 
> Ok. Well, I think that's a bit pointless comment in the binding doc,
> it'll only confuse =). Describe what the current binding is, not what
> might be added later (but that can be mentioned in the commit desc if
> you want).

OK. Will do that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
