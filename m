From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 4/6] arm64: dts: fsl: ls1028a: Add Felix switch
 port DT node
Date: Fri, 5 Jul 2019 15:19:14 +0200
Message-ID: <20190705131914.GA4428@lunn.ch>
References: <20190621164940.GL31306@lunn.ch>
 <VI1PR04MB4880D8F90BBCD30BF8A69C9696E00@VI1PR04MB4880.eurprd04.prod.outlook.com>
 <20190624115558.GA5690@piout.net>
 <20190624142625.GR31306@lunn.ch>
 <20190624152344.3bv46jjhhygo6zwl@lx-anielsen.microsemi.net>
 <20190624162431.GX31306@lunn.ch>
 <20190624182614.GC5690@piout.net>
 <CA+h21hqGtA5ou7a3wjSuHxa_4fXk4GZohTAxnUdfLZjV3nq5Eg@mail.gmail.com>
 <20190705044945.GA30115@lunn.ch>
 <VI1PR04MB4880DEA9D7836A68E0EE141396F50@VI1PR04MB4880.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR04MB4880DEA9D7836A68E0EE141396F50@VI1PR04MB4880.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "Allan W. Nielsen" <allan.nielsen@microchip.com>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Allan Nielsen <Allan.Nielsen@microsemi.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Nice discussion, again, but there's a missing point that has not been
> brought up yet.  We actually intend to support the following hardware
> configuration: a single PCI device consisting of the Microsemi's switch core
> and our DMA rings.
> The hardware supports this configuration into a single PCI function (PF), 
> with a unique PCI function id (0xe111), so that the same driver has access to 
> both switch registers and DMA rings connected to the CPU port.  This device
> would qualify  as a  switchdev device, and we can simply reuse the existing
> ocelot code for the switch core part.  The initial patch set was the first step in
> supporting the switch core on our platform, we just need to add the support
> for the DMA rings part, to make it a complete switchdev solution.

Hi Claudiu

It sound like in the end you will have a core library and then two
drivers wrapped around it, giving a pure switchdev device with polled
IO or DMA, and a DSA driver using a CPU port.

   Andrew
