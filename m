From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3 00/11] Allwinner H3/H5/A64(DE2) SimpleFB support
Date: Wed, 27 Dec 2017 12:10:59 +0800
Message-ID: <4610834.pRdGNWpFpX@ice-x220i>
References: <20171222122243.25735-1-icenowy@aosc.io> <CAGb2v653n_Q-spOSP9RTXBrL7CtrYiV7dAyRAVYCxg3KpzRvoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v653n_Q-spOSP9RTXBrL7CtrYiV7dAyRAVYCxg3KpzRvoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

在 2017年12月27日星期三 CST 下午12:09:41，Chen-Yu Tsai 写道：
> On Fri, Dec 22, 2017 at 8:22 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> > This patchset adds support for the SimpleFB on Allwinner SoCs with
> > "Display Engine 2.0".
> > 
> > PATCH 1 to PATCH 3 are DE2 CCU fixes for H3/H5 SoCs.
> > 
> > PATCH 4 adds the pipeline strings for DE2 SimpleFB.
> > 
> > PATCH 5 to 7 adds necessary device tree nodes (DE2 CCU and SimpleFB)
> > for H3/H5 SoCs.
> > 
> > PATCH 8 to 11 are for Allwinner A64 SoC to enable SimpleFB.
> 
> Changelog?

They're in seperate patches.

> 
> ChenYu
> 
> > Icenowy Zheng (11):
> >   dt-bindings: fix the binding of Allwinner DE2 CCU of A83T and H3
> >   clk: sunxi-ng: add support for Allwinner H3 DE2 CCU
> >   clk: sunxi-ng: fix the A64/H5 clock description of DE2 CCU
> >   dt-bindings: simplefb-sunxi: add pipelines for DE2
> >   ARM: sun8i: h3/h5: add DE2 CCU device node for H3
> >   arm64: allwinner: h5: add compatible string for DE2 CCU
> >   ARM: sunxi: h3/h5: add simplefb nodes
> >   dt-bindings: add binding for A64 DE2 CCU SRAM
> >   clk: sunxi-ng: add support for Allwinner A64 DE2 CCU
> >   arm64: allwinner: a64: add DE2 CCU for A64 SoC
> >   arm64: allwinner: a64: add simplefb for A64 SoC
> >  
> >  .../devicetree/bindings/clock/sun8i-de2.txt        | 10 ++-
> >  .../bindings/display/simple-framebuffer-sunxi.txt  |  4 +
> >  arch/arm/boot/dts/sun8i-h3.dtsi                    |  4 +
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 43 +++++++++++
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 65 +++++++++++++++++
> >  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |  4 +
> >  drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 85
> >  +++++++++++++++++++--- 7 files changed, 202 insertions(+), 13
> >  deletions(-)
> > 
> > --
> > 2.14.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
