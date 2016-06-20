From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Mon, 20 Jun 2016 21:57:45 +0200
Message-ID: <57684AB9.5040607@nod.at>
References: <20160619130514.GB820@makrotopia.org> <6411961.soYuJ4Ixfs@wuerfel>
 <5767A8A3.4030004@nod.at> <4012191.NTCe8d2REM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dedekind1@gmail.com, Hauke Mehrtens <hauke@hauke-m.de>, Daniel Golle <daniel@makrotopia.org>, robh+dt@kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

Am 20.06.2016 um 17:08 schrieb Arnd Bergmann:
>> Since blocks on a MTD can render bad you'd lose the table sooner or later.
>> That's why we cannot store it on the MTD directly.
>> Defining the table in DT is at least less ugly than using the mtdparts=
>> kernel parameter.
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

Speaking of NAND, only SLC (and also here not all) chips guarantee that the first
block is better than the other ones.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
