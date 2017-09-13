From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/7] dt-bindings: gpu: mali-utgard: add optional supply
 regulator
Date: Wed, 13 Sep 2017 09:34:15 -0500
Message-ID: <20170913143415.fcds556hdqwnhsvm@rob-hp-laptop>
References: <20170905105739.8330-1-heiko@sntech.de>
 <20170905105739.8330-3-heiko@sntech.de>
 <20170912220920.nfg33wbqikja3gml@rob-hp-laptop>
 <5517832.4TA9c0NYD6@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5517832.4TA9c0NYD6@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 12:12:24AM +0200, Heiko Stübner wrote:
> Hi Rob,
> 
> Am Dienstag, 12. September 2017, 17:09:20 CEST schrieb Rob Herring:
> > On Tue, Sep 05, 2017 at 12:57:34PM +0200, Heiko Stuebner wrote:
> > > Mali GPUs have a separate supplying regulator in a lot of socs,
> > > so describe a mali-supply property. The already described
> > > operating points will likely also need access to this regulator.
> > > 
> > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > ---
> > > 
> > >  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > > b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt index
> > > 3b7f6f72f032..bcaa640c883f 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > > 
> > > @@ -39,6 +39,9 @@ Optional properties:
> > >      Memory region to allocate from, as defined in
> > >      Documentation/devicetree/bindi/reserved-memory/reserved-memory.txt
> > > 
> > > +  - mali-supply : Phandle to regulator for the Mali device. Refer to
> > > +    Documentation/devicetree/bindings/regulator/regulator.txt for
> > > details.
> > 
> > Wouldn't a power domain be more appropriate?
> 
> At least on Rockchip socs there is a power-domain, but also the separate 
> additional regulator. See the similar mali-midgard binding.

And that regulator's state is independent of the power domain's state? 

But I guess OPPs need a regulator. Really we should allow OPPs to be 
tied to the power domain. Maybe we do, I can't keep up with the ever 
evolving PM stuff.

So, given we already have it for midgard,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
