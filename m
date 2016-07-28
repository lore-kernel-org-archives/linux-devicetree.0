From: Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3] arm64: dts: mt8173: add mmsel clocks for 4K support
Date: Thu, 28 Jul 2016 10:47:17 +0800
Message-ID: <1469674037.29230.0.camel@mtksdaap41>
References: <1469607914-64831-1-git-send-email-bibby.hsieh@mediatek.com>
	 <1469611556.11841.77.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469611556.11841.77.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, YH Huang <yh.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Junzhi Zhao <ju>
List-Id: devicetree@vger.kernel.org

Hi, CK,

Thanks for your comments.

On Wed, 2016-07-27 at 17:25 +0800, CK Hu wrote:
> Hi, Bibby:
> 
> On Wed, 2016-07-27 at 16:25 +0800, Bibby Hsieh wrote:
> > If MT8173 can support HDMI 4K resoultion, the
> > VENCPLL should be configured to 800MHZ.
> > We didn't set VENCPLL directly, we set the
> > mm_sel to 400MHz statically in the board device tree.
> 
> You may rewrite the description as below:
> 
> 'To support HDMI 4K resolution, mmsys need clock mm_sel to be 400MHz.'
> 
> You need not to mention VENCPLL because it's controlled by clock driver.
> 
Ok, I will modify that.
> > 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> > Changes since v2:
> >  - Align the clocks of dpi0 node.
> > 
> > Changes since v1:
> >  - Do not set the VENCPLL by clk_set_rate
> >    at display driver.
> >  - Configure the mm_sel to 400MHz statically
> >    in the board device tree.
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 78529e4..9c22204 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -690,7 +690,9 @@
> >  			compatible = "mediatek,mt8173-mmsys", "syscon";
> >  			reg = <0 0x14000000 0 0x1000>;
> >  			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > +			clocks = <&topckgen CLK_TOP_MM_SEL>;
> >  			#clock-cells = <1>;
> > +			clock-frequency  = <400000000>;
> >  		};
> >  
> >  		ovl0: ovl@1400c000 {
> 
> Regards,
> CK
> 


Bibby

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
