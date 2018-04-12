Return-Path: <SRS0=puHF=HB=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 4/4] soc: renesas: rcar-rst: Add support for R-Car E3
Date: Thu, 12 Apr 2018 08:11:22 +0000
Message-ID: <TY1PR06MB099243FEB726CEEF0CD8C616D8BC0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523439386-1032-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVssUyEq7ipQ-p4DzCpZKkV64TZnSV0OKpshjigaNFb2g@mail.gmail.com>
 <20180412075430.kkqg63djci6jkno2@verge.net.au>
In-Reply-To: <20180412075430.kkqg63djci6jkno2@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Thursday, April 12, 2018 4:55 PM
>=20
> On Wed, Apr 11, 2018 at 05:18:28PM +0200, Geert Uytterhoeven wrote:
> > Hi Shimoda-san,
> >
> > Thanks for your patch!
> >
> > On Wed, Apr 11, 2018 at 11:36 AM, Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >
> > > This patch adds definition of reset vector for the R8A77990 SoC.
> >
> > The description doesn't seem to match what the patch does?
>=20
> How about this text, based on Sergei's test for the R8a77980?
>=20
> Add support for R-Car E3 (R8A77990) to the R-Car RST driver.
> This driver is needed for the clock driver to work.

It's good to me. So, should I submit v2 patch?

Best regards,
Yoshihiro Shimoda

> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > [shimoda: rebase]
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > The actual patch contents are fine, so:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker=
. But
> > when I'm talking to journalists I just say "programmer" or something li=
ke that.
> >                                 -- Linus Torvalds
> >
