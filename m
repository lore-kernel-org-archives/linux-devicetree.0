From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable
 EthernetAVB
Date: Mon, 25 Sep 2017 09:07:42 +0200
Message-ID: <20170925070742.GC1019@verge.net.au>
References: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505305119-4257-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX3q=foc1hkcqTc3WQYxCh1x+bc8fu9+YcqVAx9bp4qaA@mail.gmail.com>
 <TY1PR06MB0992906ACD39FA3D176CDFE6D86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20170915073501.GD3924@verge.net.au>
 <TY1PR06MB09920DE49B74D16FABE7699DD8660@TY1PR06MB0992.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <TY1PR06MB09920DE49B74D16FABE7699DD8660@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 10:37:15AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Simon Horman
> > Sent: Friday, September 15, 2017 4:35 PM
> > 
> > On Wed, Sep 13, 2017 at 11:58:47PM +0000, Yoshihiro Shimoda wrote:
> > > Hi Geert-san,
> > >
> > > > From: Geert Uytterhoeven
> > > > Sent: Wednesday, September 13, 2017 11:55 PM
> > > >
> > > > Hi Shimoda-san,
> > > >
> > > > On Wed, Sep 13, 2017 at 2:18 PM, Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > This patch enables EthernetAVB for R-Car D3 draak board.
> > > > >
> > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > > > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > >
> > > > > @@ -37,6 +39,14 @@
> > > > >  };
> > > > >
> > > > >  &pfc {
> > > > > +       avb0_pins: avb {
> > > > > +               mux {
> > > > > +                       groups = "avb0_link", "avb0_phy_int", "avb0_mdc",
> > > > > +                                "avb0_mii";
> > > > > +                       function = "avb0";
> > > >
> > > > This part depends on (an updated version of) "[PATCH 5/8] pinctrl: sh-pfc:
> > > > r8a77995: Add EthernetAVB pins, groups and functions", so it may change?
> > >
> > > Oops, I fotgot to submit v2 PFC patch yesterday...
> > > Yes, it is changed like other gen3 SoCs. I submitted it now.
> > >
> > > > And we will probably have to add driver-strengths later, to avoid a
> > > > dependency on bootloader setup?
> > >
> > > Yes, I will do so, if needed.
> > >
> > > > Apart from that:
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Thank you for your review!
> > 
> > Thanks. I have marked this as "Deferred" pending acceptance of the PFC
> > patch. Please repost or ping me, f.e. via a reply-to-all to this email,
> > once that dependency is resolved.
> 
> Since the PFC patch is applied into renesas-drivers.git / sh-pfc-for-v4.15 branch,
> I'd like to ping you :)
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=sh-pfc-for-v4.15&id=66abd968d0ef3eb10dea45b48a31321eb29258f8
> 
> Or, should I rebase this patch on latest devel tag?
> If so, I will rebase it in next Monday because I'll take a day off tomorrow.

Thanks for pinging me. I have applied this patch.
There was some fuzz when doing so. Please check that the applied
patch is correct once I have pushed an updated devel branch later today.
