From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Add USB2.0 phy and
 host(EHCI/OHCI) device nodes
Date: Thu, 30 Aug 2018 16:50:23 +0200
Message-ID: <20180830145023.lkroiqsgdt33qprc@verge.net.au>
References: <1535107429-5458-1-git-send-email-biju.das@bp.renesas.com>
 <1535107429-5458-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVWE7F84BdbiqLBfKZLwb9QNg8chsUgWsKtPdikGWeXJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVWE7F84BdbiqLBfKZLwb9QNg8chsUgWsKtPdikGWeXJA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Biju Das <biju.das@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 30, 2018 at 02:29:02PM +0200, Geert Uytterhoeven wrote:
> On Fri, Aug 24, 2018 at 12:50 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Add USB2.0 phy and host (EHCI/OHCI) device nodes on RZ/G2M SoC dtsi.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 73 +++++++++++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > index cd204f5..a794089 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> 
> > +               ehci0: usb@ee080100 {
> > +                       compatible = "generic-ehci";
> > +                       reg = <0 0xee080100 0 0x100>;
> > +                       interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 703>;
> > +                       phys = <&usb2_phy0>;
> > +                       phy-names = "usb";
> > +                       companion= <&ohci0>;
> 
> Please insert a space before the "=".

I fixed that by adding the update to your fixup patch for many similar
problems. Let me know if pain persists after I've pushed the devel branch.

> 
> > +                       power-domains = <&sysc 32>;
> > +                       resets = <&cpg 703>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               ehci1: usb@ee0a0100 {
> > +                       compatible = "generic-ehci";
> > +                       reg = <0 0xee0a0100 0 0x100>;
> > +                       interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 702>;
> > +                       phys = <&usb2_phy1>;
> > +                       phy-names = "usb";
> > +                       companion= <&ohci1>;
> 
> Likewise.
> 
> > +                       power-domains = <&sysc 32>;
> > +                       resets = <&cpg 702>;
> > +                       status = "disabled";
> > +               };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
