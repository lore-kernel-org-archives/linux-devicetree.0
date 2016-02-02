From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: r8a7795: Add USB-DMAC device nodes
Date: Tue, 2 Feb 2016 11:30:00 +0100
Message-ID: <20160202102959.GG15554@verge.net.au>
References: <1454322540-5608-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUEUDkB3=jHAwXDozpdgFCimGS=LXsrxSVWac5xW2bg+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUEUDkB3=jHAwXDozpdgFCimGS=LXsrxSVWac5xW2bg+A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 02, 2016 at 11:10:00AM +0100, Geert Uytterhoeven wrote:
> On Mon, Feb 1, 2016 at 11:29 AM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -880,5 +880,31 @@
> >                         power-domains = <&cpg>;
> >                         status = "disabled";
> >                 };
> > +
> > +               usb_dmac0: dma-controller@e65a0000 {
> > +                       compatible = "renesas,r8a7795-usb-dmac",
> > +                                    "renesas,usb-dmac";
> > +                       reg = <0 0xe65a0000 0 0x100>;
> > +                       interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH
> > +                                     0 109 IRQ_TYPE_LEVEL_HIGH>;
> 
> Sorry, I missed you're not using the GIC_SPI defines.

Thanks, I fixed that and queued up the following

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Mon, 1 Feb 2016 19:29:00 +0900
Subject: [PATCH] arm64: dts: r8a7795: Add USB-DMAC device nodes

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 119549e6502d..95967b72db35 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -880,5 +880,31 @@
 			power-domains = <&cpg>;
 			status = "disabled";
 		};
+
+		usb_dmac0: dma-controller@e65a0000 {
+			compatible = "renesas,r8a7795-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65a0000 0 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 330>;
+			power-domains = <&cpg>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
+		usb_dmac1: dma-controller@e65b0000 {
+			compatible = "renesas,r8a7795-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65b0000 0 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&cpg>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
 	};
 };
-- 
2.7.0.rc3.207.g0ac5344
