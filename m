From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] dts-bindings: usb-uhci: Document newly added properties
Date: Sat, 20 Jan 2018 11:38:23 +1100
Message-ID: <1516408703.7489.13.camel@kernel.crashing.org>
References: <1516061175.31850.140.camel@kernel.crashing.org>
         <20180119232243.7lspbosyt4gvhote@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180119232243.7lspbosyt4gvhote@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-01-19 at 17:22 -0600, Rob Herring wrote:
> On Tue, Jan 16, 2018 at 11:06:15AM +1100, Benjamin Herrenschmidt wrote:
> > Commit 4642d34a439f80e16af0d56ed6258a33abae257a
> > "usb/uhci: Add support for Aspeed BMC SoCs" added
> > support for a new #ports property, along with
> > Aspeed specific compatible strings. This adds
> > documentation for them.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-uhci.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb-uhci.txt b/Documentation/devicetree/bindings/usb/usb-uhci.txt
> > index 298133416c97..c1153eb38a9a 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-uhci.txt
> > +++ b/Documentation/devicetree/bindings/usb/usb-uhci.txt
> > @@ -3,8 +3,14 @@ Generic Platform UHCI Controller
> >  
> >  Required properties:
> >  - compatible : "generic-uhci" (deprecated: "platform-uhci")
> > +  supports additional Aspeed specific workarounds by also
> > +  including the "aspeed,ast2400-uhci" or "aspeed,ast2500-uhci"
> > +  string.
> 
> That's usually why we have SoC compatibles, so the description doesn't 
> really add anything. Can you format with one valid compatible list per 
> line:
> 
> compatible : Should be one of:
> 	"aspeed,ast2500-uhci", "generic-uhci"
> 	"aspeed,ast2400-uhci", "generic-uhci"
> 	"generic-uhci"
> 	"platform-uhci" (deprecated)
> 
> We should deprecate "generic-uhci" too IMO, but hardly anyone adds new 
> UHCI controllers.

So I made a mistake in the code, I need both the aspeed specific
compatible *and* the platform-uhci one since I didn't amend the driver
to match on the aspeed ones. I suppose I could just send a fixup patch
as nobody yet has deployed anything yet on the field.

> >  - reg : Should contain 1 register ranges(address and length)
> >  - interrupts : UHCI controller interrupt
> > +- #ports: (optional) 1 cell, number of ports (overrides
> > +  auto-detection which is needed among others on some Aspeed
> > +  parts).
> >  
> >  Example:
> >  
> > 
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
