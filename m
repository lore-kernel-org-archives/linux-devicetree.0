Return-Path: <SRS0=s4R5=MK=verge.net.au=horms@kernel.org>
Date: Fri, 28 Sep 2018 09:16:48 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7-dbcm-ca: Improve model string
Message-ID: <20180928071647.gb4pe4tqqxbelijl@verge.net.au>
References: <1537956082-17542-1-git-send-email-chris.paterson2@renesas.com>
 <CAMuHMdXQSwp_rVPADG8BWPj8BJCPZXLF7hkt6wgDPjUf4QM6mg@mail.gmail.com>
 <TYAPR01MB2285EFCBFF6ACFF0CC2A8211B7150@TYAPR01MB2285.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB2285EFCBFF6ACFF0CC2A8211B7150@TYAPR01MB2285.jpnprd01.prod.outlook.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 26, 2018 at 11:54:36AM +0000, Chris Paterson wrote:
> Hello Geert,
> 
> > From: devicetree-owner@vger.kernel.org <devicetree-
> > owner@vger.kernel.org> On Behalf Of Geert Uytterhoeven
> > Sent: 26 September 2018 12:41
> > 
> > Hi Chris,
> > 
> > On Wed, Sep 26, 2018 at 12:01 PM Chris Paterson
> > <chris.paterson2@renesas.com> wrote:
> > > Update the model string for this platform configuration and fix the
> > > grammar at the same time.
> > >
> > > This brings the syntax in line with the RZ/G1E iWave board.
> > >
> > > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > > ---
> > > Perhaps this patch isn't really needed, but the current string annoys me.
> > >
> > > Patch applies cleanly to renesas-devel-20180925-v4.19-rc5.
> > > ---
> > >  arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> > > b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> > > index 0d006aea99da1b40..6811ddc4af6460ce 100644
> > > --- a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> > > +++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> > > @@ -11,7 +11,7 @@
> > >  #include "iwg20d-q7-dbcm-ca.dtsi"
> > >
> > >  / {
> > > -       model = "iW-RainboW-G20D-Q7 RZ/G1M based plus camera daughter
> > board";
> > > +       model = "iWave RainboW-G20D-Q7 RZ/G1M based board with camera
> > > + add-on";
> > >         compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743";
> > > };
> > 
> > Perhaps you want to harmonize the other differences, too?
> >   - "iWave" vs. "iWave Systems",
> >   - "Q7" vs. "Qseven",
> >   - "iW-Rainbow" vs. "Rainbow".
> 
> Probably not a bad idea...

I lets see if we can make all these updates in one patch.
Accordingly I'm marking this one as "Changes Requested".
