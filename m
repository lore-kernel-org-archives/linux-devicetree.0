From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH  0/3] Add SMP support
Date: Thu, 10 Aug 2017 09:18:13 +0000
Message-ID: <KL1PR06MB17028862FF6D21E2D611B24AB8880@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
 <20170809083554.GI2705@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170809083554.GI2705@verge.net.au>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 09 August 2017 09:36
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> Russell King <linux@armlinux.org.uk>; Chris Paterson
> <Chris.Paterson2@renesas.com>; devicetree@vger.kernel.org; linux-renesas-
> soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 0/3] Add SMP support
>
> On Tue, Aug 08, 2017 at 11:56:30AM +0100, Biju Das wrote:
> > This series aims to add SMP support for r8a7743 SoC.
> >
> > This series has been tested against Linux-next tag 20170727 and
> > renesas-dev branch.
>
> It seems that these patches are targeted at the renesas tree.
> The best practice in that case is to base patches on the latest devel branch.
> Please consider doing so in future.
>
> The patches themselves seem good to me, however, I would like to enquire
> about testing. In particular, have you tested CPU hotplug and suspend to RAM
> with these patches (and without in the case of the latter)?

I have tested CPU hotplug with this patch and it works ok.

Currently iWave platform doesn't support STR I guess. But we should check the changes on other M2 platforms to prove that
things don't break.

[>]
> I am cautious about any regressions that may creep in when going from UP to
> SMP.

> >
> > Biju Das (3):
> >   dt-bindings: apmu: Document r8a7743 support
> >   ARM: dts: r8a7743: Add APMU node and second CPU core
> >   ARM: dts: r8a7743: Add OPP table for frequency scaling
> >
> >  .../devicetree/bindings/power/renesas,apmu.txt     |  3 ++-
> >  arch/arm/boot/dts/r8a7743.dtsi                     | 25 ++++++++++++++++++++++
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >
> > --
> > 1.9.1
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
