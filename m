From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/6] ptp: add QorIQ PTP support for DPAA2
Date: Wed, 12 Jun 2019 15:10:49 +0200
Message-ID: <20190612131049.GC23615@lunn.ch>
References: <20190610032108.5791-1-yangbo.lu@nxp.com>
 <20190610032108.5791-2-yangbo.lu@nxp.com>
 <20190610130601.GD8247@lunn.ch>
 <VI1PR0401MB2237247525AB5DB5B5F275A8F8EC0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB2237247525AB5DB5B5F275A8F8EC0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Y.b. Lu" <yangbo.lu@nxp.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > > diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig index
> > > 9b8fee5..b1b454f 100644
> > > --- a/drivers/ptp/Kconfig
> > > +++ b/drivers/ptp/Kconfig
> > > @@ -44,7 +44,7 @@ config PTP_1588_CLOCK_DTE
> > >
> > >  config PTP_1588_CLOCK_QORIQ
> > >  	tristate "Freescale QorIQ 1588 timer as PTP clock"
> > > -	depends on GIANFAR || FSL_DPAA_ETH || FSL_ENETC || FSL_ENETC_VF
> > > +	depends on GIANFAR || FSL_DPAA_ETH || FSL_DPAA2_ETH ||
> > FSL_ENETC ||
> > > +FSL_ENETC_VF
> > >  	depends on PTP_1588_CLOCK
> > 
> > Hi Yangbo
> > 
> > Could COMPILE_TEST also be added?
> 
> [Y.b. Lu] COMPILE_TEST is usually for other ARCHs build coverage.
> Do you want me to append it after these Ethernet driver dependencies?

Hii Y.b. Lu

Normally, drivers like this should be able to compile independent of
the MAC driver. So you should be able to add COMPILE_TEST here.

    Andrew
