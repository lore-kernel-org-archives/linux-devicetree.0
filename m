Return-Path: <SRS0=IU/R=NR=verge.net.au=horms@kernel.org>
Date: Tue, 6 Nov 2018 13:25:25 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] ARM: dts: r8a77470: Add watchdog support to SoC dtsi
Message-ID: <20181106122524.hlcgcgetunlp563w@verge.net.au>
References: <1540546347-42791-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdX0rQFn330ZhOOs0tA91+oYfVxND9g1kkizgfMeA3UxPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX0rQFn330ZhOOs0tA91+oYfVxND9g1kkizgfMeA3UxPA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 06, 2018 at 11:18:14AM +0100, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> On Fri, Oct 26, 2018 at 11:40 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > This patch adds watchdog support to the r8a77470 SoC dtsi.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm/boot/dts/r8a77470.dtsi
> > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > @@ -196,6 +196,16 @@
> >                         reg = <0 0xe6160000 0 0x100>;
> >                 };
> >
> > +               rwdt: watchdog@e6020000 {
> 
> Please follow the sort order rules:
>   - By unit-address (if present), per group,
>   - Alphabetically.

Thanks for noticing.

As I had already applied this patch I took the liberty of updating
it to preserve node sort order. The updates patch is as follows:

From: Biju Das <biju.das@bp.renesas.com>
Date: Fri, 26 Oct 2018 10:32:26 +0100
Subject: [PATCH] ARM: dts: r8a77470: Add watchdog support to SoC dtsi

This patch adds watchdog support to the r8a77470 SoC dtsi.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
[simon: moved node to preserve sort order]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 6ac7f467065e..a703b74cc1f9 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -79,6 +79,16 @@
 		#size-cells = <2>;
 		ranges;
 
+		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a77470-wdt",
+				     "renesas,rcar-gen2-wdt";
+			reg = <0 0xe6020000 0 0x0c>;
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77470",
 				     "renesas,rcar-gen2-gpio";
-- 
2.11.0
