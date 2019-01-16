Return-Path: <shawnguo@kernel.org>
Date: Wed, 16 Jan 2019 11:33:58 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] dt-bindings: imx8mq: Number clocks consecutively
Message-ID: <20190116033356.GG15808@dragon>
References: <20190115163512.GA31914@bogon.m.sigxcpu.org>
 <1547571231.4339.17.camel@pengutronix.de>
 <20190115173012.GA3172@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190115173012.GA3172@bogon.m.sigxcpu.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abel Vesa <abel.vesa@nxp.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 15, 2019 at 06:30:12PM +0100, Guido G�nther wrote:
> Hi Lucas,
> On Tue, Jan 15, 2019 at 05:53:51PM +0100, Lucas Stach wrote:
> > Am Dienstag, den 15.01.2019, 17:35 +0100 schrieb Guido G�nther:
> > > Signed-off-by: Guido G�nther <agx@sigxcpu.org>
> > 
> > This is a breaking change in terms of devicetree stability. So either
> > we rush this into 5.0-rcX, before the current definition spreads around
> > or we need to drop this change. I'll leave this for Shawn (CCed) to
> > decide.
> 
> Note that 232 is currently used for both IMX8MQ_CLK_HDMI_ROOT and
> IMX8MQ_SYS1_PLL_OUT so we need to fix that one up - or need to come up
> with a new name and have that duplicate assignment in there forever. So
> fixing this for 5.0 would be cool.

I would like to fix it for 5.0.

@Guido,

Please write up a proper commit log as suggested by Abel, add a Fixes
tag and resend (with me copied).

Shawn
