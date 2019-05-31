From: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add YADRO VESNIN BMC
Date: Fri, 31 May 2019 09:07:31 +0300
Message-ID: <20190531060731.GA22597@bbwork.lan>
References: <20190530143933.25414-1-a.filippov@yadro.com>
 <20190530203653.GD1561@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190530203653.GD1561@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexander Filippov <a.filippov@yadro.com>, linux-aspeed@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2019 at 10:36:53PM +0200, Andrew Lunn wrote:
> On Thu, May 30, 2019 at 05:39:33PM +0300, Alexander Filippov wrote:
> > VESNIN is an OpenPower machine with an Aspeed 2400 BMC SoC manufactured
> > by YADRO.
> > 
> > Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
> > ---
> >  arch/arm/boot/dts/Makefile                  |   1 +
> >  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 234 ++++++++++++++++++++
> >  2 files changed, 235 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 834cce80d1b8..811e9312cf22 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1259,6 +1259,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >  	aspeed-bmc-microsoft-olympus.dtb \
> >  	aspeed-bmc-opp-lanyang.dtb \
> >  	aspeed-bmc-opp-palmetto.dtb \
> > +	aspeed-bmc-opp-vesnin.dtb \
> >  	aspeed-bmc-opp-romulus.dtb \
> >  	aspeed-bmc-opp-swift.dtb \
> >  	aspeed-bmc-opp-witherspoon.dtb \
> 
> Hi Alexander

Hi Andrew,

> 
> Still not correctly sorted.
> 

Thanks, I've fixed it in V3

>       Andrew
