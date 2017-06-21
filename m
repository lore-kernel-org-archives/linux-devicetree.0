From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] ARM: dts: iwg20d-q7: Add pinctl support for scif0
Date: Wed, 21 Jun 2017 13:58:28 +0000
Message-ID: <KL1PR06MB170212437975F886787AAB09B8DA0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1497625049-46802-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVe7sRcGohSPvSUrryNMetddomoMbN7ffOtq9Y3DBt=zQ@mail.gmail.com>
 <20170621113354.GC17965@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170621113354.GC17965@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <Chris.Paterson2@renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Simon,

> On Mon, Jun 19, 2017 at 10:42:18AM +0200, Geert Uytterhoeven wrote:
> > Hi Biju,
> >
> > On Fri, Jun 16, 2017 at 4:57 PM, Biju Das <biju.das@bp.renesas.com>
> wrote:
> > > Adding pinctrl support for scif0 interface.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > The patch looks good to me, but without schematics, we cannot verify
> > the actual pins used.
> >
> > Are the schematics somewhere available? Having access to them would
> > allow us doing a better job reviewing your DTS patches.
>
> Echoing Geert's request, it would be great to be able to compare the DT
> description against some documentation.
>
> My understanding is that this patch depends on "[PATCH v2 0/3] Add
> R8A7743/SK-RZG1M PFC support" which in turn depends on pfc driver
> support which is on target to be included in v4.13-rc1.
>
> Accordingly I have marked this patch as deferred. Please repost or otherw=
ise
> ping me once the driver dependency is present in an rc release.

Thanks. I will repost/ping you once the pfc driver dependency is present in=
 an rc release.

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
