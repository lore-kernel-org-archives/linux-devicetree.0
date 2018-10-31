Return-Path: <SRS0=fPTE=NL=verge.net.au=horms@kernel.org>
Date: Wed, 31 Oct 2018 13:50:28 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable cmt0
Message-ID: <20181031125028.nvirj7btb4sr6qw4@verge.net.au>
References: <1540543709-35959-1-git-send-email-biju.das@bp.renesas.com>
 <1540543709-35959-2-git-send-email-biju.das@bp.renesas.com>
 <20181030155151.7jxqfzvd4y44zuij@verge.net.au>
 <OSBPR01MB21031B41A3384F13D02E9BDCB8CC0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB21031B41A3384F13D02E9BDCB8CC0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 30, 2018 at 04:48:30PM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable cmt0
> >
> > On Fri, Oct 26, 2018 at 09:48:29AM +0100, Biju Das wrote:
> > > This patch enables cmt0 support on the iWave iwg23s sbc.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Thanks, I applied this for v4.21, resolving a conflict.
> > The result is as follows:
> >
> > From: Biju Das <biju.das@bp.renesas.com>
> > Date: Fri, 26 Oct 2018 09:48:29 +0100
> > Subject: [PATCH] ARM: dts: iwg23s-sbc: Enable cmt0
> >
> > This patch enables cmt0 support on the iWave iwg23s sbc.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> > b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> > index ffd8216f28c3..295f11afac21 100644
> > --- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> > +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
> > @@ -77,6 +77,10 @@
> >  clock-frequency = <20000000>;
> >  };
> >
> > +&cmt0 {
> > +status = "okay";
> > +};
> 
> I believe as per our process, the nodes should be in alphabetical order,
> If it is the case, it should be above  extal_clk
> 
> &extal_clk {
>         clock-frequency = <20000000>;
> };
> 
> >  &pfc {
> >  mmc_pins_uhs: mmc_uhs {
> >  groups = "mmc_data8", "mmc_ctrl";

Yes, indeed. That was my intention but I messed things up.
I've updated the patch accordingly.


From: Biju Das <biju.das@bp.renesas.com>
Date: Fri, 26 Oct 2018 09:48:29 +0100
Subject: [PATCH] ARM: dts: iwg23s-sbc: Enable cmt0

This patch enables cmt0 support on the iWave iwg23s sbc.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index ffd8216f28c3..18d22631e188 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -73,6 +73,10 @@
 	};
 };
 
+&cmt0 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <20000000>;
 };
-- 
2.11.0
