From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: Add a binding for Mediatek MDP
Date: Wed, 27 Jul 2016 09:44:46 +0800
Message-ID: <1469583886.27630.18.camel@mtksdaap41>
References: <1469176383-35210-1-git-send-email-minghsiu.tsai@mediatek.com>
	 <1469176383-35210-3-git-send-email-minghsiu.tsai@mediatek.com>
	 <20160726185433.GA14609@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160726185433.GA14609@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-07-26 at 13:54 -0500, Rob Herring wrote:
> On Fri, Jul 22, 2016 at 04:33:01PM +0800, Minghsiu Tsai wrote:
> > Add a DT binding documentation of MDP for the MT8173 SoC
> > from Mediatek
> > 
> > Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/mediatek-mdp.txt     |   96 ++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> > new file mode 100644
> > index 0000000..2dad031
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> > @@ -0,0 +1,96 @@
> > +* Mediatek Media Data Path
> > +
> > +Media Data Path is used for scaling and color space conversion.
> > +
> > +Required properties (all function blocks):
> > +- compatible: "mediatek,<chip>-mdp"
> 
> What is this, ...
> 

It is used to match platform driver.


> > +        "mediatek,<chip>-mdp-<function>", one of
> 
> and this?
> 

It is string format of HW block. <chip> could be "mt8173", and
<function> are "rdma", "rsz", "wdma", and "wrot".  


> > +        "mediatek,<chip>-mdp-rdma"  - read DMA
> > +        "mediatek,<chip>-mdp-rsz"   - resizer
> > +        "mediatek,<chip>-mdp-wdma"  - write DMA
> > +        "mediatek,<chip>-mdp-wrot"  - write DMA with rotation
> 
> List what are valid values of <chip>.
> 

<chip> - mt8173. There should be other chip added in future.
I will change the property as blow:

- compatible: "mediatek,<chip>-mdp"
        Should be one of
        "mediatek,<chip>-mdp-rdma"  - read DMA
        "mediatek,<chip>-mdp-rsz"   - resizer
        "mediatek,<chip>-mdp-wdma"  - write DMA
        "mediatek,<chip>-mdp-wrot"  - write DMA with rotation
        <chip> - could be 8173


If don't need <chip>, I also can change it as below. It is more clear.
- compatible: "mediatek,mt8173-mdp"
        Should be one of
        "mediatek,mt8173-mdp-rdma"  - read DMA
        "mediatek,mt8173-mdp-rsz"   - resizer
        "mediatek,mt8173-mdp-wdma"  - write DMA
        "mediatek,mt8173-mdp-wrot"  - write DMA with rotation


> > +- reg: Physical base address and length of the function block register space
> > +- clocks: device clocks
> > +- power-domains: a phandle to the power domain.
> > +- mediatek,vpu: the node of video processor unit
> > +
> > +Required properties (DMA function blocks):
> > +- compatible: Should be one of
> > +        "mediatek,<chip>-mdp-rdma"
> > +        "mediatek,<chip>-mdp-wdma"
> > +        "mediatek,<chip>-mdp-wrot"
> > +- iommus: should point to the respective IOMMU block with master port as
> > +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +  for details.
> > +- mediatek,larb: must contain the local arbiters in the current Socs.
> 
> It is still not clear which properties apply to which compatible 
> strings.
> 

I found out the document for larb. 
I will change the property as below:

- mediatek,larb: must contain the local arbiters in the current Socs,
see
Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt 
  for details.


> > +
> > +Example:
> > +	mdp_rdma0: rdma@14001000 {
> > +		compatible = "mediatek,mt8173-mdp-rdma",
> > +			     "mediatek,mt8173-mdp";
> > +		reg = <0 0x14001000 0 0x1000>;
> > +		clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> > +			 <&mmsys CLK_MM_MUTEX_32K>;
> > +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> > +		mediatek,larb = <&larb0>;
> > +		mediatek,vpu = <&vpu>;
> > +	};
> > +
> > +	mdp_rdma1: rdma@14002000 {
> > +		compatible = "mediatek,mt8173-mdp-rdma";
> > +		reg = <0 0x14002000 0 0x1000>;
> > +		clocks = <&mmsys CLK_MM_MDP_RDMA1>,
> > +			 <&mmsys CLK_MM_MUTEX_32K>;
> > +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
> > +		mediatek,larb = <&larb4>;
> > +	};
> > +
> > +	mdp_rsz0: rsz@14003000 {
> > +		compatible = "mediatek,mt8173-mdp-rsz";
> > +		reg = <0 0x14003000 0 0x1000>;
> > +		clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> > +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +	};
> > +
> > +	mdp_rsz1: rsz@14004000 {
> > +		compatible = "mediatek,mt8173-mdp-rsz";
> > +		reg = <0 0x14004000 0 0x1000>;
> > +		clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> > +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +	};
> > +
> > +	mdp_rsz2: rsz@14005000 {
> > +		compatible = "mediatek,mt8173-mdp-rsz";
> > +		reg = <0 0x14005000 0 0x1000>;
> > +		clocks = <&mmsys CLK_MM_MDP_RSZ2>;
> > +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +	};
> > +
> > +	mdp_wdma0: wdma@14006000 {
> > +		compatible = "mediatek,mt8173-mdp-wdma";
> > +		reg = <0 0x14006000 0 0x1000>;
> > +		clocks = <&mmsys CLK_MM_MDP_WDMA>;
> > +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +		iommus = <&iommu M4U_PORT_MDP_WDMA>;
> > +		mediatek,larb = <&larb0>;
> > +	};
> > +
> > +	mdp_wrot0: wrot@14007000 {
> > +		compatible = "mediatek,mt8173-mdp-wrot";
> > +		reg = <0 0x14007000 0 0x1000>;
> > +		clocks = <&mmsys CLK_MM_MDP_WROT0>;
> > +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +		iommus = <&iommu M4U_PORT_MDP_WROT0>;
> > +		mediatek,larb = <&larb0>;
> > +	};
> > +
> > +	mdp_wrot1: wrot@14008000 {
> > +		compatible = "mediatek,mt8173-mdp-wrot";
> > +		reg = <0 0x14008000 0 0x1000>;
> > +		clocks = <&mmsys CLK_MM_MDP_WROT1>;
> > +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +		iommus = <&iommu M4U_PORT_MDP_WROT1>;
> > +		mediatek,larb = <&larb4>;
> > +	};
> > -- 
> > 1.7.9.5
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
