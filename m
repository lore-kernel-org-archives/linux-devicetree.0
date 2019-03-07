Return-Path: <SRS0=Wpk1=RK=ragnatech.se=niklas.soderlund@kernel.org>
Date: Thu, 7 Mar 2019 01:44:43 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 1/5] media: dt-bindings: media: rcar-csi2: Add r8a774a1
 support
Message-ID: <20190307004443.GO9239@bigcity.dyn.berto.se>
References: <1536589878-26218-1-git-send-email-biju.das@bp.renesas.com>
 <1536589878-26218-2-git-send-email-biju.das@bp.renesas.com>
 <TYXPR01MB1775F18270FB477D010C180EC0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <8a5429a0-b4c5-a208-3e56-406bd031b01b@xs4all.nl>
 <20190301130613.GB32244@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190301130613.GB32244@pendragon.ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Biju Das <biju.das@bp.renesas.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Hans, Laurent,

On 2019-03-01 15:06:13 +0200, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Mar 01, 2019 at 01:55:53PM +0100, Hans Verkuil wrote:
> > Hi Fabrizio,
> > 
> > It looks like this series fell through the cracks.
> > 
> > I looked at it and the main problem is that it is missing a Reviewed-by
> > from Rob Herring (devicetree maintainer). It's a bit surprising since he
> > is usually fairly prompt.
> > 
> > I recommend that you rebase and repost it and I'll delegate the v2 series
> > to me so we can hopefully get it in for 5.2 (5.1 is likely too late) once
> > Rob reviews it.
> > 
> > BTW, I'm the one who usually processes rcar patches. But it was delegated in
> > patchwork to Laurent, so I never saw it.
> 
> I handle the VSP and FDP patches. I propose delegating the CSI-2 and VIN
> to Niklas.

I be more then happy to collect patches for R-Car VIN and CSI-2 and send
PRs for them to you Hans. Would that work for you Hans?

-- 
Regards,
Niklas S�derlund
