From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: Add a binding for Mediatek MDP
Date: Wed, 20 Jul 2016 20:14:42 +0800
Message-ID: <1469016882.12306.3.camel@mtksdaap41>
References: <1468498681-19955-1-git-send-email-minghsiu.tsai@mediatek.com>
	 <1468498681-19955-3-git-send-email-minghsiu.tsai@mediatek.com>
	 <20160716230113.GA31551@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160716230113.GA31551@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2016-07-16 at 18:01 -0500, Rob Herring wrote:
> On Thu, Jul 14, 2016 at 08:17:59PM +0800, Minghsiu Tsai wrote:
> > Add a DT binding documentation of MDP for the MT8173 SoC
> > from Mediatek
> > 
> > Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/mediatek-mdp.txt     |   92 ++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> > new file mode 100644
> > index 0000000..ef570c3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> > @@ -0,0 +1,92 @@
> > +* Mediatek Media Data Path
> > +
> > +Media Data Path is used for scaling and color space conversion.
> > +
> > +Required properties:
> > +  - compatible : should contain them as below:
> > +        "mediatek,mt8173-mdp"
> > +        "mediatek,mt8173-mdp-rdma"
> > +        "mediatek,mt8173-mdp-rsz"
> > +        "mediatek,mt8173-mdp-wdma"
> > +        "mediatek,mt8173-mdp-wrot"
> > +  - clocks : device clocks
> > +  - power-domains : a phandle to the power domain.
> > +  - mediatek,larb : should contain the larbes of current platform
> > +  - iommus : Mediatek IOMMU H/W has designed the fixed associations with
> > +        the multimedia H/W. and there is only one multimedia iommu domain.
> > +        "iommus = <&iommu portid>" the "portid" is from
> > +        dt-bindings\iommu\mt8173-iommu-port.h, it means that this portid will
> > +        enable iommu. The portid default is disable iommu if "<&iommu portid>"
> > +        don't be added.
> > +  - mediatek,vpu : the node of video processor unit
> 
> These properties don't apply to all the nodes. I think you need a 
> section for each IP block.


I will add description for those IP block, thanks.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
