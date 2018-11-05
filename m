Return-Path: <SRS0=HAag=NQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39609 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729675AbeKEWQ7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Nov 2018 17:16:59 -0500
MIME-Version: 1.0
References: <1541418561-21977-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUXVnQtJKCmzBx1Rk0OzZQ4McPqDLtRk2XNb3qaCs8mTA@mail.gmail.com> <20181105124602.GK20885@w540>
In-Reply-To: <20181105124602.GK20885@w540>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 13:57:07 +0100
Message-ID: <CAMuHMdWQyDRTOSnYTqG3r8nXqE7v=OtX0Jv7h-Wu0aOPD4GGsQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Fix VIN endpoint numbering
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

On Mon, Nov 5, 2018 at 1:46 PM jacopo mondi <jacopo@jmondi.org> wrote:
> On Mon, Nov 05, 2018 at 01:07:58PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Nov 5, 2018 at 12:49 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > The VIN driver bindings dictates fixed numbering for VIN endpoints connected
> > > to CSI-2 endpoints, even when a single endpoint exists.
> > >
> > > Without proper endpoint numbering the VIN driver fails to probe.
> > >
> > > Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
> > > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >
> > Was this patch authored by you or by Matsuoka-san?
>
> The original patch didn't apply
>
> $git am index.html\?id\=1b1b73f7558d867d72e198901b84bec1e6ef1405
> Applying: arm64: dts: r8a77990: Fix csi2 endpoint number in VIN node
> error: patch failed: arch/arm64/boot/dts/renesas/r8a77990.dtsi:811
> error: arch/arm64/boot/dts/renesas/r8a77990.dtsi: patch does not apply

Right, the BSP had the unit address and reg property, while upstream hadn't.

So don't you need to re-add:

                                        #address-cells = <1>;
                                        #size-cells = <0>;

else dtc complains:

    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(reg_format): /soc/video@e6ef4000/ports/port@1/endpoint@2:reg:
property has invalid length (4 bytes) (#address-cells == 2,
#size-cells == 1)
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(pci_device_bus_num): Failed prerequisite 'reg_format'
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(simple_bus_reg): Failed prerequisite 'reg_format'
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(i2c_bus_reg): Failed prerequisite 'reg_format'
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(spi_bus_reg): Failed prerequisite 'reg_format'
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(avoid_default_addr_size):
/soc/video@e6ef4000/ports/port@1/endpoint@2: Relying on default
#address-cells value
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(avoid_default_addr_size):
/soc/video@e6ef4000/ports/port@1/endpoint@2: Relying on default
#size-cells value
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(graph_endpoint): /soc/video@e6ef4000/ports/port@1/endpoint@2: graph
node '#address-cells' is -1, must be 1
    arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
(graph_endpoint): /soc/video@e6ef4000/ports/port@1/endpoint@2: graph
node '#size-cells' is -1, must be 0

> So I made a new one, changing the commit message and adding the Fixes
> tag.
>
> I can change author if you want to.

In such a case, I usually add "based on a patch in the BSP by ...", instead of
the original SoB-chain.

> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
