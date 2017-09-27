From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable
 EthernetAVB
Date: Wed, 27 Sep 2017 02:03:14 +0000
Message-ID: <TY1PR06MB0992BB60AFD2AC0E24032FE2D8780@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505305119-4257-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX3q=foc1hkcqTc3WQYxCh1x+bc8fu9+YcqVAx9bp4qaA@mail.gmail.com>
 <TY1PR06MB0992906ACD39FA3D176CDFE6D86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20170915073501.GD3924@verge.net.au>
 <TY1PR06MB09920DE49B74D16FABE7699DD8660@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20170925070742.GC1019@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170925070742.GC1019-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: ja-JP
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

> From: Simon Horman
> Sent: Monday, September 25, 2017 4:08 PM
>=20
> On Thu, Sep 21, 2017 at 10:37:15AM +0000, Yoshihiro Shimoda wrote:
> > Hi Simon-san,
> >
> > > From: Simon Horman
> > > Sent: Friday, September 15, 2017 4:35 PM
> > >
> > > On Wed, Sep 13, 2017 at 11:58:47PM +0000, Yoshihiro Shimoda wrote:
> > > > Hi Geert-san,
> > > >
> > > > > From: Geert Uytterhoeven
> > > > > Sent: Wednesday, September 13, 2017 11:55 PM
> > > > >
> > > > > Hi Shimoda-san,
> > > > >
> > > > > On Wed, Sep 13, 2017 at 2:18 PM, Yoshihiro Shimoda
> > > > > <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> > > > > > This patch enables EthernetAVB for R-Car D3 draak board.
> > > > > >
> > > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.=
com>
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > > > > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > > >
> > > > > > @@ -37,6 +39,14 @@
> > > > > >  };
> > > > > >
> > > > > >  &pfc {
> > > > > > +       avb0_pins: avb {
> > > > > > +               mux {
> > > > > > +                       groups =3D "avb0_link", "avb0_phy_int",=
 "avb0_mdc",
> > > > > > +                                "avb0_mii";
> > > > > > +                       function =3D "avb0";
> > > > >
> > > > > This part depends on (an updated version of) "[PATCH 5/8] pinctrl=
: sh-pfc:
> > > > > r8a77995: Add EthernetAVB pins, groups and functions", so it may =
change?
> > > >
> > > > Oops, I fotgot to submit v2 PFC patch yesterday...
> > > > Yes, it is changed like other gen3 SoCs. I submitted it now.
> > > >
> > > > > And we will probably have to add driver-strengths later, to avoid=
 a
> > > > > dependency on bootloader setup?
> > > >
> > > > Yes, I will do so, if needed.
> > > >
> > > > > Apart from that:
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > > >
> > > > Thank you for your review!
> > >
> > > Thanks. I have marked this as "Deferred" pending acceptance of the PF=
C
> > > patch. Please repost or ping me, f.e. via a reply-to-all to this emai=
l,
> > > once that dependency is resolved.
> >
> > Since the PFC patch is applied into renesas-drivers.git / sh-pfc-for-v4=
.15 branch,
> > I'd like to ping you :)
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
/commit/?h=3Dsh-pfc-for-v4.15&id=3D66abd968d0ef
> 3eb10dea45b48a31321eb29258f8
> >
> > Or, should I rebase this patch on latest devel tag?
> > If so, I will rebase it in next Monday because I'll take a day off tomo=
rrow.
>=20
> Thanks for pinging me. I have applied this patch.
> There was some fuzz when doing so. Please check that the applied
> patch is correct once I have pushed an updated devel branch later today.

Thank you for applying!
I checked renesas.git / renesas-devel-20170925-v4.14-rc2 tag, and it's corr=
ect.

Best regards,
Yoshihiro Shimoda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
