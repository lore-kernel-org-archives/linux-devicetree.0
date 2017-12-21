From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 8/9] ARM: dts: iwg22d-sodimm: Sound DMA support via SRC
 on DTS
Date: Thu, 21 Dec 2017 12:20:17 +0100
Message-ID: <20171221112013.fll76q5zdpqoonoc@verge.net.au>
References: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
 <1513800125-53213-9-git-send-email-biju.das@bp.renesas.com>
 <20171221104443.rk6prrib4gdi7qyz@verge.net.au>
 <KL1PR06MB17023E4E4DE156A8ADB88411B80D0@KL1PR06MB1702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <KL1PR06MB17023E4E4DE156A8ADB88411B80D0@KL1PR06MB1702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 11:01:28AM +0000, Biju Das wrote:
> Hi Simon,
> 
> > -----Original Message-----
> > From: Simon Horman [mailto:horms@verge.net.au]
> > Sent: 21 December 2017 10:45
> > To: Biju Das <biju.das@bp.renesas.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> > Chris Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>; devicetree@vger.kernel.org; linux-renesas-
> > soc@vger.kernel.org
> > Subject: Re: [PATCH 8/9] ARM: dts: iwg22d-sodimm: Sound DMA support via
> > SRC on DTS
> >
> > On Wed, Dec 20, 2017 at 08:02:04PM +0000, Biju Das wrote:
> > > DMA transfer to/from SRC
> > >
> > >      DMA      DMApp
> > > [MEM] -> [SRC] -> [SSIU] -> [SSI]
> > >
> > >      DMA      DMApp
> > > [MEM] <- [SRC] <- [SSIU] <- [SSI]
> > >
> > > Current sound driver is supporting SSI/SRC random connection.
> > > So, this patch is trying
> > > SSI3 -> SRC3
> > > SSI4 <- SRC4
> >
> > I am curious to know why the selection here differs from that present in
> > iwg20d-q7-common. Is it an arbitrary decision?
> >
> > Likewise for other uses of ssi*, src* and dvc* in this patchset.
> 
> For ssi*,  on this board, SSI3/4 interface is connected to Audio In/Out.
> 
> For src*,  the original bsp from iwave is using src3/src4, also it is arbitrary as per the data sheet.
> 
> For dvc*,  Again it is arbitrary as per the data sheet.

Thanks, understood.
