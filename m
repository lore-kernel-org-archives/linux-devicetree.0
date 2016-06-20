From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Mon, 20 Jun 2016 10:24:45 -0700
Message-ID: <20160620172445.GB33752@google.com>
References: <20160619130514.GB820@makrotopia.org> <6411961.soYuJ4Ixfs@wuerfel>
 <5767A8A3.4030004@nod.at> <4012191.NTCe8d2REM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4012191.NTCe8d2REM@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, dedekind1@gmail.com, Daniel Golle <daniel@makrotopia.org>, robh+dt@kernel.org, linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 20, 2016 at 05:08:51PM +0200, Arnd Bergmann wrote:
> On Monday, June 20, 2016 10:26:11 AM CEST Richard Weinberger wrote:
> > Am 20.06.2016 um 10:09 schrieb Arnd Bergmann:
> > > - MTD partitioning unfortunately does not seem to have a widely used
> > >   method for identifying partitions from what's stored on the flash,
> > >   unlike block devices, so whatever we normally have in the partition
> > >   table has to be stored in DT. This really sucks, but I don't know
> > >   what else to do about it.
> > 
> > Since blocks on a MTD can render bad you'd lose the table sooner or later.
> > That's why we cannot store it on the MTD directly.

That's assuming you're talking about NAND, and that no one has devised
any clever partition scheme that is robust against bad blocks. I've seen
attempts at the latter, but nothing widely used. And eventually, you're
just reimplementing UBI anyway.

About the former: some systems will still use a dual-flash system, where
they get reliable partition information from a NOR flash to bootstrap
getting the NAND up and running. So it's possible to avoid sticking all
partitions in DT.

> > Defining the table in DT is at least less ugly than using the mtdparts=
> > kernel parameter.
> 
> Right, there would be no benefit in using the kernel command line,
> it just moves the information to another place inside of the same DT
> (the /chosen property).
> 
> I think you can normally rely on the first block being readable
> on flash, in particular if you write it very rarely (when updating
> the partition information), so it would be technically possible to
> have a partition table in there, but in practice that's not how
> things are done, so the argument is useless.

It's not completely useless, but it's difficult for real technical
reasons: many SoCs boot straight off address 0 of a flash (hopefully
something reliable like NOR flash, but I've even seen that for NAND...),
so you can't possibly put a partition table there. That doesn't preclude
coming up with a decent non-0-address-based scheme, but nobody's really
done that generically, although there are various vendor-specific
attempts to just progressively scan all blocks on the flash -- see a few
drivers/mtd/*part.c.

Brian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
