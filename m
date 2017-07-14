From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/5] arm64: dts: rockchip: Add rk3399 vop and display-subsystem
Date: Fri, 14 Jul 2017 08:33:07 +0200
Message-ID: <3813924.64TLu7Ua5F@phil>
References: <1499875435-23944-1-git-send-email-jacob-chen@iotwrt.com> <4655605.dLm3uFpe8F@phil> <CAFLEztSbZExA2_t5D+TWGsrCU5Gqrg7azdi97brhjO2wPdup3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFLEztSbZExA2_t5D+TWGsrCU5Gqrg7azdi97brhjO2wPdup3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, long jacob <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jacob,

Am Freitag, 14. Juli 2017, 09:52:30 CEST schrieb Jacob Chen:
> 2017-07-14 7:34 GMT+08:00 Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>:
> > Am Donnerstag, 13. Juli 2017, 00:03:51 CEST schrieb Jacob Chen:
> >> Add devicetree nodes for rk3399 VOP (Video Output Processors), and the
> >> top level display-subsystem root node.
> >>
> >> Later patches add endpoints (eDP, HDMI, MIPI, etc) that attach to the
> >> VOPs' output ports.
> >>
> >> Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 65 ++++++++++++++++++++++++++++++++
> >>  1 file changed, 65 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> >> index e795135..300e500 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> >> @@ -1455,6 +1455,71 @@
> >>               status = "disabled";
> >>       };
> >>
> >> +     vopl: vop@ff8f0000 {
> >> +             compatible = "rockchip,rk3399-vop-lit";
> >> +             reg = <0x0 0xff8f0000 0x0 0x1ffc>, <0x0 0xff8f2000 0x0 0x400>;
> >
> > What is this second memory region doing? It looks like this is the meant
> > to cover VOP_GAMMA_LUT_ADDR, but can't you just map the whole area?
> > ChromeOS seems to be doing fine using the whole area as
> >         <0x0 0xff8f0000 0x0 0x3efc>
> > and I've also not seen any code changes actually mapping/using this
> > second area.
> >
> 
> 0x1c00 - 0x200 for cabc_lut
> 0x2000 - 0x300 for gama_lut
> 
> My mistakes, It seems mark havn't send gamma and cabc support to upstream.
> We shoud just using the whole area map.
> 
> 
> >
> >> +             interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
> >> +             clocks = <&cru ACLK_VOP1>, <&cru DCLK_VOP1>, <&cru HCLK_VOP1>, <&cru DCLK_VOP1_DIV>;
> >> +             clock-names = "aclk_vop", "dclk_vop", "hclk_vop", "dclk_source";
> >
> > While I know that this is based on my idea on handling the hdmi pll-rate
> > requirements, I haven't found the matching code- and dt-binding-changes
> > posted to a list yet.
> >
> 
> Yeah, should i collect mark's patches or remove it at first?

As we don't know how much discussion is necessary for that, removing
dclk_source in the first iteration and re-add it once the feature.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
