From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 07/10] dt-bindings: phy: add DT binding for Microsemi
 Ocelot SerDes muxing
Date: Tue, 14 Aug 2018 14:45:47 +0200
Message-ID: <20180814124547.GL943@piout.net>
References: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
 <cd75c96640cc7fe306ee355acb1db85adb5b796f.1532954208.git-series.quentin.schulz@bootlin.com>
 <bcea7c75-e5a6-4533-aee0-65c893e8a422@gmail.com>
 <20180801081539.gxkviv6rnpwzoyxb@qschulz>
 <20180813223748.GA20086@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180813223748.GA20086@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, allan.nielsen@microsemi.com, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 13/08/2018 16:37:48-0600, Rob Herring wrote:
> > I'm fine with a define for the second value (which is basically the enum
> > serdes_type I've defined at the beginning of the serdes driver) but I
> > don't see the point of defining the index of the SerDes. What would it
> > look like?
> > 
> > enum serdes_type {
> > 	SERDES1G = 1,
> > 	SERDES6G = 6,
> > }
> > 
> > #define SERDES1G_0	0
> > #define SERDES1G_1	1
> > #define SERDES1G_2	2
> > #define SERDES6G_0	0
> > #define SERDES6G_1	1
> > 
> > Then, e.g.:
> > 
> > &port5 {
> > 	phys = <&serdes 5 SERDES1G SERDES1G_0>
> > };
> > 
> > If you want a define for the pair (serdes_type, serdes_index), I don't
> > see how I could re-use it on the driver side but it makes more sense on the
> > DeviceTree side:
> > 
> > #define SERDES1G_0	1 0
> > #define SERDES1G_1	1 1
> > #define SERDES1G_2	1 2
> > #define SERDES6G_0	6 0
> > #define SERDES6G_1	6 1
> 
> I prefer #defines which are a single number. Otherwise if you read a dts 
> file when #phy-cells is 3, it will look like an error in that you have 
> what looks like 2 cells.
> 

Maybe we should not have the type in DT and simply have an index. The
driver will now what the serdes type is anyway and the defines would be:

#define SERDES1G_0  0
#define SERDES1G_1  1
#define SERDES1G_2  2
#define SERDES6G_0  3
#define SERDES6G_1  4

The main drawback is that this requires one include file per soc.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
