From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 00/11] mscc: ocelot: add support for SerDes muxing
 configuration
Date: Tue, 4 Sep 2018 16:03:51 -0700
Message-ID: <20180904230351.vwlq2s7joulvqw2i@pburton-laptop>
References: <20180903093308.24366-1-quentin.schulz@bootlin.com>
 <20180903133415.GF4445@lunn.ch>
 <20180903134522.GC13888@piout.net>
 <20180903.220910.899357653888940454.davem@davemloft.net>
 <20180904151653.GI13888@piout.net>
 <20180904161028.nh5ejrtj22r5az5e@pburton-laptop>
 <20180904180006.d5th3jrbhr4vtahi@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180904180006.d5th3jrbhr4vtahi@qschulz>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, David Miller <davem@davemloft.net>, andrew@lunn.ch, ralf@linux-mips.org, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

Hi Quentin,

On Tue, Sep 04, 2018 at 08:00:06PM +0200, Quentin Schulz wrote:
> On Tue, Sep 04, 2018 at 09:10:28AM -0700, Paul Burton wrote:
> > Hi Alexandre, Quentin, all,
> > 
> > On Tue, Sep 04, 2018 at 05:16:53PM +0200, Alexandre Belloni wrote:
> > > On 03/09/2018 22:09:10-0700, David Miller wrote:
> > > > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Date: Mon, 3 Sep 2018 15:45:22 +0200
> > > > 
> > > > > On 03/09/2018 15:34:15+0200, Andrew Lunn wrote:
> > > > >> > I suggest patches 1 and 8 go through MIPS tree, 2 to 5 and 11 go through
> > > > >> > net while the others (6, 7, 9 and 10) go through the generic PHY subsystem.
> > > > >> 
> > > > >> Hi Quentin
> > > > >> 
> > > > >> Are you expecting merge conflicts? If not, it might be simpler to gets
> > > > >> ACKs from each maintainer, and then merge it though one tree.
> > > > > 
> > > > > There are some other DT changes for this cycle so those should probably
> > > > > go through MIPS.
> > > > 
> > > > No objection for this going through the MIPS tree, and from me:
> > > >
> > > > Acked-by: David S. Miller <davem@davemloft.net>
> > > 
> > > What I meant was that 1/11 and 8/11 should go through MIPS because of
> > > the potential conflicts. The other patches can go through net-next as
> > > that will make more sense. Maybe Quentin can split the series in two,
> > > one for MIPS and one for net if that makes it easier for you to apply.
> > 
> > I'd be happy to take the .dts changes through the MIPS tree, though
> > looking at them won't patch 1 break bisection?
> > 
> > Since you remove the hsio reg entry it looks to me like
> > mscc_ocelot_probe() will fail with -EINVAL (which comes from
> > devm_ioremap_resource() with res=NULL) until patch 3.
> > 
> 
> That's correct.
> 
> > I'd feel more comfortable merging this piecemeal if it doesn't result in
> > us breaking bisection for however long it takes for both the trees
> > involved to be merged.
> > 
> 
> How do you want to proceed then?

Well, it sounded like David is OK with this all going through the MIPS
tree, though we'd need an ack for the PHY parts.

Alternatively I'd be happy for the DT changes to go through the net-next
tree, which may make more sense given that the .dts changes are pretty
trivial in comparison with the driver changes. If David wants to do that
then for patches 1 & 8:

    Acked-by: Paul Burton <paul.burton@mips.com>

Either way there may be conflicts for ocelot.dtsi when it comes to
merging to master, but they should be simple to resolve. It seems
Wolfram already took your DT changes for I2C so there's probably going
to be multiple trees updating that file this cycle already anyway.

Ideally I'd say "don't break bisection" but that's sort of a separate
issue here since even if you restructure your series to do that it would
still need to go through one tree. For example you could adjust
mscc_ocelot_probe() to handle either the reg property or the syscon,
then adjust the DT to use the syscon, then remove the code dealing with
the reg property, and I'd consider that a good idea anyway but it would
still probably all need to go through one tree to make sure things get
merged in the right order & avoid breaking bisection.

Thanks,
    Paul
