From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 4/6] arm64: dts: fsl: ls1028a: Add Felix switch
 port DT node
Date: Mon, 24 Jun 2019 18:24:31 +0200
Message-ID: <20190624162431.GX31306@lunn.ch>
References: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
 <1561131532-14860-5-git-send-email-claudiu.manoil@nxp.com>
 <20190621164940.GL31306@lunn.ch>
 <VI1PR04MB4880D8F90BBCD30BF8A69C9696E00@VI1PR04MB4880.eurprd04.prod.outlook.com>
 <20190624115558.GA5690@piout.net>
 <20190624142625.GR31306@lunn.ch>
 <20190624152344.3bv46jjhhygo6zwl@lx-anielsen.microsemi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190624152344.3bv46jjhhygo6zwl@lx-anielsen.microsemi.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Allan W. Nielsen" <allan.nielsen@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Allan Nielsen <Allan.Nielsen@microsemi.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 05:23:45PM +0200, Allan W. Nielsen wrote:
> Hi Andrew,
> 
> The 06/24/2019 16:26, Andrew Lunn wrote:
> > > > Yeah, there are 2 ethernet controller ports (managed by the enetc driver) 
> > > > connected inside the SoC via SGMII links to 2 of the switch ports, one of
> > > > these switch ports can be configured as CPU port (with follow-up patches).
> > > > 
> > > > This configuration may look prettier on DSA, but the main restriction here
> > > > is that the entire functionality is provided by the ocelot driver which is a
> > > > switchdev driver.  I don't think it would be a good idea to copy-paste code
> > > > from ocelot to a separate dsa driver.
> > > > 
> > > 
> > > We should probably make the ocelot driver a DSA driver then...
> > An important part of DSA is being able to direct frames out specific
> > ports when they ingress via the CPU port. Does the silicon support
> > this? At the moment, i think it is using polled IO.
> 
> That is supported, it requires a bit of initial configuration of the Chip, but
> nothing big (I believe this configuration is part of Claudiu's change-set).
> 
> But how do you envision this done?
> 
> - Let the existing SwitchDev driver and the DSA driver use a set of common
>   functions.
> - Convert the existing Ocelot driver from SwitchDev to DSA
> - Fork (copy) the existing driver of Ocelot, and modify it as needed for the
>   Felix driver
> 
> My guess is the first one, but I would like to understand what you have in mind.

I don't know the various architectures the switch is used in. But it
does seem like a core library, and then a switchdev wrapper for Ocelot
and a DSA wrapper for Felix would make sense.
 
  Andrew
