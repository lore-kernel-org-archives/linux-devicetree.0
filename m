From: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: add new compatible strings and
 improve description
Date: Sun, 22 Oct 2017 18:30:53 +0800
Message-ID: <1508668253.14979.5.camel@mhfsdcap03>
References: <1505997906-30921-1-git-send-email-guochun.mao@mediatek.com>
         <1505997906-30921-2-git-send-email-guochun.mao@mediatek.com>
         <1507691713.14979.2.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507691713.14979.2.camel@mhfsdcap03>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cyrille, Marek,

Gentle ping...


On Wed, 2017-10-11 at 11:15 +0800, Guochun Mao wrote:
> gentle ping...
> 
> On Thu, 2017-09-21 at 20:45 +0800, Guochun Mao wrote:
> > Add "mediatak,mt2712-nor" and "mediatek,mt7622-nor"
> > for nor flash node's compatible strings.
> > Explicate the fallback compatible.
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/mtd/mtk-quadspi.txt        |   15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > index 840f940..56d3668 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > @@ -1,13 +1,16 @@
> >  * Serial NOR flash controller for MTK MT81xx (and similar)
> >  
> >  Required properties:
> > -- compatible: 	  The possible values are:
> > -		  "mediatek,mt2701-nor"
> > -		  "mediatek,mt7623-nor"
> > +- compatible: 	  For mt8173, compatible should be "mediatek,mt8173-nor",
> > +		  and it's the fallback compatible for other Soc.
> > +		  For every other SoC, should contain both the SoC-specific compatible
> > +		  string and "mediatek,mt8173-nor".
> > +		  The possible values are:
> > +		  "mediatek,mt2701-nor", "mediatek,mt8173-nor"
> > +		  "mediatek,mt2712-nor", "mediatek,mt8173-nor"
> > +		  "mediatek,mt7622-nor", "mediatek,mt8173-nor"
> > +		  "mediatek,mt7623-nor", "mediatek,mt8173-nor"
> >  		  "mediatek,mt8173-nor"
> > -		  For mt8173, compatible should be "mediatek,mt8173-nor".
> > -		  For every other SoC, should contain both the SoC-specific compatible string
> > -		  and "mediatek,mt8173-nor".
> >  - reg: 		  physical base address and length of the controller's register
> >  - clocks: 	  the phandle of the clocks needed by the nor controller
> >  - clock-names: 	  the names of the clocks
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
