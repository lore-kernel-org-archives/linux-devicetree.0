From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/4] ARM: dts: iwg22d-sodimm-dbhd-ca: Add device tree for
 HDMI DB
Date: Mon, 23 Oct 2017 11:11:08 +0000
Message-ID: <TY1PR06MB0895CE4565980694E481790CC0460@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1507899796-7941-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1507899796-7941-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20171017080220.ff5brg2jh4womfj2@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171017080220.ff5brg2jh4womfj2@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello Simon,

>
> On Fri, Oct 13, 2017 at 02:03:15PM +0100, Fabrizio Castro wrote:
> > Add file r8a7745-iwg22d-sodimm-dbhd-ca.dts to provide support for
> > iW-RainboW-G22D with HDMI daughter board plugged in.
> >
> > The interfaces defined in the new .dts file are: scif1, scif5,
> > and hscif2.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
>
> I wonder if this patch should include a chosen node.

the chosen node gets inherited from file r8a7745-iwg22d-sodimm.dts,
I don't think the HW configuration with the carrier board should behave
any different from the HW configuration without the carrier board.

Thanks,
Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
