From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Date: Mon, 15 Apr 2019 09:14:20 +0200
Message-ID: <20190415091420.3fb86ef7@collabora.com>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190414110549.5c91829d@collabora.com>
 <20190415085859.21f69396@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190415085859.21f69396@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 15 Apr 2019 08:58:59 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 14 Apr
> 2019 11:05:49 +0200:
> 
> > On Thu,  4 Apr 2019 18:21:10 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Allwinner NAND controllers can make use of DMA to enhance the I/O
> > > throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> > > is a bit different than with the older SoCs, hence the introduction of
> > > a new compatible to handle:
> > > * the differences between register offsets,
> > > * the burst length change from 4 to minimum 8,
> > > * drive SRAM accesses through the AHB bus instead of the MBUS.    
> > 
> > Hm, now that you know MBUS accesses are working fine (IIRC, that's what
> > you used for the SPL DMA-based implementation), why not directly use
> > MBUS accesses on A33? I mean, it's likely faster than going through
> > the DMA engine (which is shared by several IPs), and AFAIR, the MBUS
> > setup is pretty simple.  
> 
> Because all the driver is already in shape to use the external DMA
> engine and it was very easy and quick (have a look at the diff of the
> v3) to use it again.

Yes, I see that. I might be wrong but I'd expect the MDMA version to be
just as simple as this one.

> 
> However, the choice I am describing here is not DMA vs. MBUS (or MDMA),
> it is MBUS vs. AHB, it is just about the bus that will access the SRAM
> (this is what we have understood with Maxime from the datasheets and
> the tests we have done).

Yes, sorry, I meant MDMA vs shared DMA engine, but I guess MBUS is only
used through MDMA accesses anyway, right?

> For this choice, we tested with both buses: no
> throughput change so we think that it is not a bottleneck anyway.

Well, you'd need to test with a lot of traffic going through the DMA
engine to check if that makes a difference.

Anyway, it was just a suggestion, keep it like that if you think using
MDMA is not worthwhile.
