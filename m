From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 4/6] arm64: dts: fsl: ls1028a: Add Felix switch
 port DT node
Date: Fri, 5 Jul 2019 06:49:45 +0200
Message-ID: <20190705044945.GA30115@lunn.ch>
References: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
 <1561131532-14860-5-git-send-email-claudiu.manoil@nxp.com>
 <20190621164940.GL31306@lunn.ch>
 <VI1PR04MB4880D8F90BBCD30BF8A69C9696E00@VI1PR04MB4880.eurprd04.prod.outlook.com>
 <20190624115558.GA5690@piout.net>
 <20190624142625.GR31306@lunn.ch>
 <20190624152344.3bv46jjhhygo6zwl@lx-anielsen.microsemi.net>
 <20190624162431.GX31306@lunn.ch>
 <20190624182614.GC5690@piout.net>
 <CA+h21hqGtA5ou7a3wjSuHxa_4fXk4GZohTAxnUdfLZjV3nq5Eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+h21hqGtA5ou7a3wjSuHxa_4fXk4GZohTAxnUdfLZjV3nq5Eg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Allan W. Nielsen" <allan.nielsen@microchip.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Allan Nielsen <Allan.Nielsen@microsemi.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir

> - DSA is typically used for discrete switches, switchdev is typically
> used for embedded ones.

Typically DSA is for discrete switches, but not exclusively. The
b53/SF2 is embedded in a number of Broadcom SoCs. So this is no
different to Ocelot, except ARM vs MIPS. Also, i would disagree that
switchdev is used for embedded ones. Mellonex devices are discrete, on
a PCIe bus. I believe Netronome devices are also discrete PCIe
devices. In fact, i think ocelot is the only embedded switchdev
switch.

So embedded vs discrete plays no role here at all.

> - The D in DSA is for cascaded switches. Apart from the absence of
> such a "Ocelot SoC" driver (which maybe can be written, I don't know),
> I think the switching core itself has some fundamental limitations
> that make a DSA implementation questionable:

There is no requirement to implement D in DSA. In fact, only Marvell
does. None of the other switches do. And you will also find that most
boards with a Marvell switch use a single device. D in DSA is totally
optional. In fact, DSA is built from the ground up that nearly
everything is optional. Take a look at mv88e6060, as an example. It
implements nearly nothing. It cannot even offload a bridge to the
switch.

> So my conclusion is that DSA for Felix/Ocelot doesn't make a lot of
> sense if the whole purpose is to hide the CPU-facing netdev.

You actually convinced me the exact opposite. You described the
headers which are needed to implement DSA. The switch sounds like it
can do what DSA requires. So DSA is the correct model.

     Andrew
