From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: Add a binding for Mediatek MDP
Date: Tue, 2 Aug 2016 13:49:46 +0800
Message-ID: <1470116986.16982.5.camel@mtksdaap41>
References: <1469176383-35210-1-git-send-email-minghsiu.tsai@mediatek.com>
 <1469176383-35210-3-git-send-email-minghsiu.tsai@mediatek.com>
 <20160726185433.GA14609@rob-hp-laptop>
 <1469583886.27630.18.camel@mtksdaap41>
 <CAL_JsqK4Lz9mSJ+EXAY1g9L-CzBmbsed+MfCjkf_545y1Ov0iw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAL_JsqK4Lz9mSJ+EXAY1g9L-CzBmbsed+MfCjkf_545y1Ov0iw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-07-28 at 10:55 -0500, Rob Herring wrote:
> On Tue, Jul 26, 2016 at 8:44 PM, Minghsiu Tsai
> <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > On Tue, 2016-07-26 at 13:54 -0500, Rob Herring wrote:
> >> On Fri, Jul 22, 2016 at 04:33:01PM +0800, Minghsiu Tsai wrote:
> >> > Add a DT binding documentation of MDP for the MT8173 SoC
> >> > from Mediatek
> >> >
> >> > Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >> > ---
> >> >  .../devicetree/bindings/media/mediatek-mdp.txt     |   96 ++++++++++++++++++++
> >> >  1 file changed, 96 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> >> > new file mode 100644
> >> > index 0000000..2dad031
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> >> > @@ -0,0 +1,96 @@
> >> > +* Mediatek Media Data Path
> >> > +
> >> > +Media Data Path is used for scaling and color space conversion.
> >> > +
> >> > +Required properties (all function blocks):
> >> > +- compatible: "mediatek,<chip>-mdp"
> >>
> >> What is this, ...
> >>
> >
> > It is used to match platform driver.
> 
> Would structuring things like this work instead:
> 
> {
>   compatible = "mediatek,<chip>-mdp";
>   ranges = ...;
>   {
>     compatible = "mediatek,<chip>-mdp-rdma";
>     ...
>   };
>   {
>     compatible = "mediatek,<chip>-mdp-wdma";
>     ...
>   };
>   ...
> };
> 

I am trying to modify it as structured node. But mdp failed to convert
image. Under debugging.


> >
> >
> >> > +        "mediatek,<chip>-mdp-<function>", one of
> >>
> >> and this?
> >>
> >
> > It is string format of HW block. <chip> could be "mt8173", and
> > <function> are "rdma", "rsz", "wdma", and "wrot".
> >
> >
> >> > +        "mediatek,<chip>-mdp-rdma"  - read DMA
> >> > +        "mediatek,<chip>-mdp-rsz"   - resizer
> >> > +        "mediatek,<chip>-mdp-wdma"  - write DMA
> >> > +        "mediatek,<chip>-mdp-wrot"  - write DMA with rotation
> >>
> >> List what are valid values of <chip>.
> >>
> >
> > <chip> - mt8173. There should be other chip added in future.
> > I will change the property as blow:
> >
> > - compatible: "mediatek,<chip>-mdp"
> >         Should be one of
> >         "mediatek,<chip>-mdp-rdma"  - read DMA
> >         "mediatek,<chip>-mdp-rsz"   - resizer
> >         "mediatek,<chip>-mdp-wdma"  - write DMA
> >         "mediatek,<chip>-mdp-wrot"  - write DMA with rotation
> >         <chip> - could be 8173
> >
> >
> > If don't need <chip>, I also can change it as below. It is more clear.
> 
> Up to you. Depends on how many different chips you will have.
> 

I will replace "<chip>" with "mt8173"


> > - compatible: "mediatek,mt8173-mdp"
> >         Should be one of
> >         "mediatek,mt8173-mdp-rdma"  - read DMA
> >         "mediatek,mt8173-mdp-rsz"   - resizer
> >         "mediatek,mt8173-mdp-wdma"  - write DMA
> >         "mediatek,mt8173-mdp-wrot"  - write DMA with rotation
> >
> >
> >> > +- reg: Physical base address and length of the function block register space
> >> > +- clocks: device clocks
> >> > +- power-domains: a phandle to the power domain.
> >> > +- mediatek,vpu: the node of video processor unit
> >> > +
> >> > +Required properties (DMA function blocks):
> >> > +- compatible: Should be one of
> >> > +        "mediatek,<chip>-mdp-rdma"
> >> > +        "mediatek,<chip>-mdp-wdma"
> >> > +        "mediatek,<chip>-mdp-wrot"
> >> > +- iommus: should point to the respective IOMMU block with master port as
> >> > +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >> > +  for details.
> >> > +- mediatek,larb: must contain the local arbiters in the current Socs.
> >>
> >> It is still not clear which properties apply to which compatible
> >> strings.
> >>
> >
> > I found out the document for larb.
> > I will change the property as below:
> >
> > - mediatek,larb: must contain the local arbiters in the current Socs,
> > see
> > Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> >   for details.
> 
> That's good, but not what I meant. You still have properties which
> only apply to certain blocks, but are listed for all blocks like
> mediatek,vpu for example.
> 
> Rob


I find out other properties' document. 

- clocks: device clocks, see
  Documentation/devicetree/bindings/clock/clock-bindings.txt for
details.
- power-domains: a phandle to the power domain, see
  Documentation/devicetree/bindings/power/power_domain.txt for details.
- mediatek,vpu: the node of video processor unit, see
  Documentation/devicetree/bindings/media/mediatek-vpu.txt for details.
