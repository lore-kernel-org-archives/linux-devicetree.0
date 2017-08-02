From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mtd: add new compatible strings for mtk
 nor controller
Date: Wed, 2 Aug 2017 10:36:37 +0200
Message-ID: <20170802103637.16cd6548@bbrezillon>
References: <1500948617-19627-1-git-send-email-guochun.mao@mediatek.com>
        <1500948617-19627-2-git-send-email-guochun.mao@mediatek.com>
        <03016ea3-51ad-0b2d-e824-0a20913bd7c1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <03016ea3-51ad-0b2d-e824-0a20913bd7c1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Tue, 1 Aug 2017 14:33:22 +0200
Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 07/25/2017 04:10 AM, Guochun Mao wrote:
> > Add "mediatek,mt2712-nor" and "mediatek,mt7622-nor"
> > for nor flash node's compatible strings.
> > 
> > Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   .../devicetree/bindings/mtd/mtk-quadspi.txt        |    2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > index 5ded66a..9845ff4 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > @@ -3,6 +3,8 @@
> >   Required properties:
> >   - compatible: 	  The possible values are:
> >   		  "mediatek,mt2701-nor"
> > +		  "mediatek,mt2712-nor"
> > +		  "mediatek,mt7622-nor"
> >   		  "mediatek,mt7623-nor"
> >   		  "mediatek,mt8173-nor"
> >   		  For mt8173, compatible should be "mediatek,mt8173-nor".
> >   
> 
> Boris, will you take this through your tree, or do you prefer that I take it?

I'm not the spi-nor maintainer, you should ask Cyrille or Marek.

Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
