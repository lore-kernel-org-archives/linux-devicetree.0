Return-Path: <SRS0=puHF=HB=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 3/4] soc: renesas: rcar-sysc: Add support for R-Car E3
 power areas
Date: Thu, 12 Apr 2018 08:25:22 +0000
Message-ID: <TY1PR06MB09922C1E3B83DF01EB084714D8BC0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523439386-1032-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVP5U2W3Zmpfe689UYBdNfS6nK7jFW5oQcJQ_QakW1UfQ@mail.gmail.com>
 <20180412075506.frylywvges5c6nzx@verge.net.au>
In-Reply-To: <20180412075506.frylywvges5c6nzx@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Geert-san, Simon-san,

> From: Simon Horman <horms@verge.net.au>, Sent: Thursday, April 12, 2018 4=
:55 PM
>=20
> On Wed, Apr 11, 2018 at 05:10:02PM +0200, Geert Uytterhoeven wrote:
> > Hi Shimoda-san,
> >
> > On Wed, Apr 11, 2018 at 11:36 AM, Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >
> > > This patch adds Cortex-A53 CPU{0,1}, Cortex-A53 SCU, Cortex-R7, A3VC,
> > > A2VC1 and 3DG-{A,B} power domain areas for the R8A77990 SoC.
> >
> > Thanks for your patch!
> >
> > > NOTE:
> > > - The 3DG power domain resume order of R-Car E3 is [3DG-B] -> [3DG-A]=
,
> >
> > So 3DG-B is the parent of 3DG-A?
> > I have to take your word on this, as I cannot find this in the document=
ation.

Geert-san, you're correct. the documentation doesn't have any description a=
bout this.
So, software team are asking HW guys about this.
This means, should we drop 3DGs (or always on these domains) at initial sup=
port?

> > >   which is different from R-Car H3, M3 and M3N SoCs.
> >
> > M3-W and M3-N?
>=20
> Shimoda-san, could you confirm the above?

I agreed with Geert-san. These words should be M3-W and M3-N.

Best regards,
Yoshihiro Shimoda

> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > [shimoda: add SPDX-License-Identifier]
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
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
