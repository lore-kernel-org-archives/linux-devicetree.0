From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v2 01/29] dt-bindings: bus: add H6 DE3 bus binding
Date: Mon, 08 Oct 2018 16:25:06 +0200
Message-ID: <3254500.X28SCFYq22@jernej-laptop>
References: <20181007093905.11253-1-jernej.skrabec@siol.net> <20181007093905.11253-2-jernej.skrabec@siol.net> <20181008083154.hhrelzmmpbjwu7sy@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBTWR5XOQKGQELR2LMCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181008083154.hhrelzmmpbjwu7sy@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne ponedeljek, 08. oktober 2018 ob 10:31:54 CEST je Maxime Ripard napisal(a):
> On Sun, Oct 07, 2018 at 11:38:37AM +0200, Jernej Skrabec wrote:
> > From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > 
> > The Allwinner H6 DE3 bus is similar to the A64 DE2 one.
> > 
> > Add its compatible string with the A64 string as fallback to the
> > binding.
> > 
> > Some description of the binding is modified to make it more generic.
> > 
> > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > ---
> > 
> >  Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
> > b/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt index
> > 87dfb33fb3be..ac1445b95f41 100644
> > --- a/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
> > +++ b/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
> > @@ -1,11 +1,14 @@
> > -Device tree bindings for Allwinner A64 DE2 bus
> > +Device tree bindings for Allwinner DE2/3 bus
> > 
> >  The Allwinner A64 DE2 is on a special bus, which needs a SRAM region
> >  (SRAM C)> 
> > -to be claimed for enabling the access.
> > +to be claimed for enabling the access. The DE3 on Allwinner H6 is at the
> > same +situation, and the binding also applies.
> > 
> >  Required properties:
> > - - compatible:		Should contain "allwinner,sun50i-a64-de2"
> > + - compatible:		Should be one of:
> > +				- "allwinner,sun50i-a64-de2"
> > +				- "allwinner,sun50i-a6-de3", "allwinner,sun50i-a64-de2"
> 
>                                                     ^ that would be h6 I
> guess?

Good catch! Yes, it should.

Best regards,
Jernej
