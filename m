From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 1/4] arm64: dts: rockchip: add VOP and VOP iommu node for rk3399
Date: Thu, 30 Jun 2016 19:52:55 +0200
Message-ID: <2805834.mM1g2PPkiI@phil>
References: <1466564038-18021-1-git-send-email-ykk@rock-chips.com> <1466564069-18220-1-git-send-email-ykk@rock-chips.com> <CAD=FV=URVQTvEKQbUVOXyMnO1a-kGs9inX_AZY3vo_YxXD5-5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=URVQTvEKQbUVOXyMnO1a-kGs9inX_AZY3vo_YxXD5-5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 30. Juni 2016, 10:45:21 schrieb Doug Anderson:
> Hi
> 
> On Tue, Jun 21, 2016 at 7:54 PM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> > From: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > 
> > Add the core display-subsystem node and the two display controllers
> > available on the rk3399.
> > 
> > Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> > Changes in v3: None
> > Changes in v2:
> > - provide some minimal patch description (Heiko)
> > 
> >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 58
> >  ++++++++++++++++++++++++++++++++ 1 file changed, 58 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index 46f325a..54e5c25
> > 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > @@ -543,6 +543,64 @@
> > 
> >                 status = "disabled";
> >         
> >         };
> > 
> > +       vopl: vop@ff8f0000 {
> > +               compatible = "rockchip,rk3399-vop-lit";
> > +               reg = <0x0 0xff8f0000 0x0 0x3efc>;
> > +               interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks = <&cru ACLK_VOP1>, <&cru DCLK_VOP1>, <&cru
> > HCLK_VOP1>; +               clock-names = "aclk_vop", "dclk_vop",
> > "hclk_vop";
> Note that if this lands after Elaine / Caesar's patch ("arm64: dts:
> rockchip: add the power domain node for rk3399")
> <https://patchwork.kernel.org/patch/9206415/> then you need to respin
> adding powerdomain references here for correctness.
> 
> If this lands before Elaine / Caesar's patch then the other patch
> needs to be re-spun.  ;)

so far I haven't seen any activity on the drm-driver patches.
Mark (Yao), what happened to your rk3399 vop patches back from April?

Timing-wise I guess we'll do power-domains first, then display. Especially 
as neither vop nor edp patches have so far appeared in linux-next.


Heiko


> 
> > +               resets = <&cru SRST_A_VOP1>, <&cru SRST_H_VOP1>, <&cru
> > SRST_D_VOP1>; +               reset-names = "axi", "ahb", "dclk";
> > +               iommus = <&vopl_mmu>;
> > +               status = "disabled";
> > +
> > +               vopl_out: port {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +               };
> > +       };
> > +
> > +       vopl_mmu: iommu@ff8f3f00 {
> > +               compatible = "rockchip,iommu";
> > +               reg = <0x0 0xff8f3f00 0x0 0x100>;
> > +               interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > +               interrupt-names = "vopl_mmu";
> > +               #iommu-cells = <0>;
> > +               status = "disabled";
> > +       };
> > +
> > +       vopb: vop@ff900000 {
> > +               compatible = "rockchip,rk3399-vop-big";
> > +               reg = <0x0 0xff900000 0x0 0x3efc>;
> > +               interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru
> > HCLK_VOP0>; +               clock-names = "aclk_vop", "dclk_vop",
> > "hclk_vop";
> Here too, obviously.
> 
> 
> See <http://crosreview.com/356623> for reference.
> 
> 
> -Doug

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
