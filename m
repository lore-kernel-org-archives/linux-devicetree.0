From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 00/11] mscc: ocelot: add support for SerDes muxing
 configuration
Date: Tue, 4 Sep 2018 09:10:28 -0700
Message-ID: <20180904161028.nh5ejrtj22r5az5e@pburton-laptop>
References: <20180903093308.24366-1-quentin.schulz@bootlin.com>
 <20180903133415.GF4445@lunn.ch>
 <20180903134522.GC13888@piout.net>
 <20180903.220910.899357653888940454.davem@davemloft.net>
 <20180904151653.GI13888@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180904151653.GI13888@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, quentin.schulz@bootlin.com
Cc: David Miller <davem@davemloft.net>, andrew@lunn.ch, ralf@linux-mips.org, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

Hi Alexandre, Quentin, all,

On Tue, Sep 04, 2018 at 05:16:53PM +0200, Alexandre Belloni wrote:
> On 03/09/2018 22:09:10-0700, David Miller wrote:
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Date: Mon, 3 Sep 2018 15:45:22 +0200
> > 
> > > On 03/09/2018 15:34:15+0200, Andrew Lunn wrote:
> > >> > I suggest patches 1 and 8 go through MIPS tree, 2 to 5 and 11 go through
> > >> > net while the others (6, 7, 9 and 10) go through the generic PHY subsystem.
> > >> 
> > >> Hi Quentin
> > >> 
> > >> Are you expecting merge conflicts? If not, it might be simpler to gets
> > >> ACKs from each maintainer, and then merge it though one tree.
> > > 
> > > There are some other DT changes for this cycle so those should probably
> > > go through MIPS.
> > 
> > No objection for this going through the MIPS tree, and from me:
> >
> > Acked-by: David S. Miller <davem@davemloft.net>
> 
> What I meant was that 1/11 and 8/11 should go through MIPS because of
> the potential conflicts. The other patches can go through net-next as
> that will make more sense. Maybe Quentin can split the series in two,
> one for MIPS and one for net if that makes it easier for you to apply.

I'd be happy to take the .dts changes through the MIPS tree, though
looking at them won't patch 1 break bisection?

Since you remove the hsio reg entry it looks to me like
mscc_ocelot_probe() will fail with -EINVAL (which comes from
devm_ioremap_resource() with res=NULL) until patch 3.

I'd feel more comfortable merging this piecemeal if it doesn't result in
us breaking bisection for however long it takes for both the trees
involved to be merged.

Thanks,
    Paul
