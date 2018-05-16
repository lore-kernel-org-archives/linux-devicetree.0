From: David Miller <davem@davemloft.net>
Subject: Re: [RESEND PATCH v2 1/1] net: phy: micrel: add 125MHz reference
 clock workaround
Date: Wed, 16 May 2018 12:21:14 -0400 (EDT)
Message-ID: <20180516.122114.346848669661017521.davem@davemloft.net>
References: <20180515081856.23322-1-m.felsch@pengutronix.de>
        <20180515081856.23322-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180515081856.23322-2-m.felsch@pengutronix.de>
Sender: netdev-owner@vger.kernel.org
To: m.felsch@pengutronix.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, niebelm@tqsc.de
List-Id: devicetree@vger.kernel.org

From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 15 May 2018 10:18:56 +0200

> From: Markus Niebel <Markus.Niebel@tqs.de>
> 
> The micrel KSZ9031 phy has a optional clock pin (CLK125_NDO) which can be
> used as reference clock for the MAC unit. The clock signal must meet the
> RGMII requirements to ensure the correct data transmission between the
> MAC and the PHY. The KSZ9031 phy does not fulfill the duty cycle
> requirement if the phy is configured as slave. For a complete
> describtion look at the errata sheets: DS80000691D or DS80000692D.
> 
> The errata sheet recommends to force the phy into master mode whenever
> there is a 1000Base-T link-up as work around. Only set the
> "micrel,force-master" property if you use the phy reference clock provided
> by CLK125_NDO pin as MAC reference clock in your application.
> 
> Attenation, this workaround is only usable if the link partner can
> be configured to slave mode for 1000Base-T.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tqs.de>
> [m.felsch@pengutronix.de: fix dt-binding documentation]
> [m.felsch@pengutronix.de: use already existing result var for read/write]
> [m.felsch@pengutronix.de: add error handling]
> [m.felsch@pengutronix.de: add more comments]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.
