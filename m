From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/7] dt-bindings: gpu: mali-utgard: add optional supply regulator
Date: Wed, 13 Sep 2017 00:12:24 +0200
Message-ID: <5517832.4TA9c0NYD6@diego>
References: <20170905105739.8330-1-heiko@sntech.de> <20170905105739.8330-3-heiko@sntech.de> <20170912220920.nfg33wbqikja3gml@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170912220920.nfg33wbqikja3gml@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Am Dienstag, 12. September 2017, 17:09:20 CEST schrieb Rob Herring:
> On Tue, Sep 05, 2017 at 12:57:34PM +0200, Heiko Stuebner wrote:
> > Mali GPUs have a separate supplying regulator in a lot of socs,
> > so describe a mali-supply property. The already described
> > operating points will likely also need access to this regulator.
> > 
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> > 
> >  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt index
> > 3b7f6f72f032..bcaa640c883f 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> > 
> > @@ -39,6 +39,9 @@ Optional properties:
> >      Memory region to allocate from, as defined in
> >      Documentation/devicetree/bindi/reserved-memory/reserved-memory.txt
> > 
> > +  - mali-supply : Phandle to regulator for the Mali device. Refer to
> > +    Documentation/devicetree/bindings/regulator/regulator.txt for
> > details.
> 
> Wouldn't a power domain be more appropriate?

At least on Rockchip socs there is a power-domain, but also the separate 
additional regulator. See the similar mali-midgard binding.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
