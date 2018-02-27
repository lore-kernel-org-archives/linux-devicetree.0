From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 5/6] arm: dts: pxa: use reworked NAND controller driver
Date: Tue, 27 Feb 2018 21:42:45 +0100
Message-ID: <20180227214245.4267448e@bbrezillon>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
 <20180219223557.2458-6-miquel.raynal@bootlin.com>
 <20180222104618.1ff78b52@bbrezillon>
 <87efl66vow.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <87efl66vow.fsf@belgarion.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: devicetree@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Antoine Tenart <antoine.tenart@bootlin.com>, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, Nadav Haklai <nadavh@marvell.com>, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Tue, 27 Feb 2018 21:09:51 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Boris Brezillon <boris.brezillon@bootlin.com> writes:
> 
> > +Arnd and the LAKML
> >
> > Hi Miquel,
> >
> > Please try to Cc the LAKML and the arm-soc maintainers when you send DT
> > changes.
> >
> > Arnd, Robert, I'd like to apply this patch through the MTD tree since
> > it depends on patch 1 of this series ("mtd: nand: use Marvell reworked
> > NAND controller driver with all platforms").
> > Otherwise, I can leave it to Robert for 4.18.  
> 
> This one looks conflict free, so I have no objection if you carry it through
> your tree.

Already prepared an immutable branch with all patches of this series
for you to pull in the pxa tree:

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git nand/pxa3xx-removal

for you to fetch changes up to fa4d26b6f00e2c3460c2cc070f467c74d163bf40:

  MAINTAINERS: remove entry for deleted pxa3xx_nand driver (2018-02-23 22:12:15 +0100)

----------------------------------------------------------------
Miquel Raynal (6):
      mtd: nand: use Marvell reworked NAND controller driver with all platforms
      mtd: nand: remove deprecated pxa3xx_nand driver
      mtd: nand: remove useless fields from pxa3xx NAND platform data
      dt-bindings: mtd: remove pxa3xx NAND controller documentation
      arm: dts: pxa: use reworked NAND controller driver
      MAINTAINERS: remove entry for deleted pxa3xx_nand driver

 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt |   50 -
 MAINTAINERS                                           |    6 -
 arch/arm/boot/dts/pxa3xx.dtsi                         |    6 +-
 arch/arm/configs/cm_x300_defconfig                    |    2 +-
 arch/arm/configs/pxa3xx_defconfig                     |    3 +-
 arch/arm/configs/pxa_defconfig                        |    2 +-
 arch/arm/configs/raumfeld_defconfig                   |    2 +-
 arch/arm/mach-mmp/ttc_dkb.c                           |    4 +-
 arch/arm/mach-pxa/cm-x300.c                           |    8 +-
 arch/arm/mach-pxa/colibri-pxa3xx.c                    |    8 +-
 arch/arm/mach-pxa/colibri.h                           |    2 +-
 arch/arm/mach-pxa/littleton.c                         |   10 +-
 arch/arm/mach-pxa/mxm8x10.c                           |   10 +-
 arch/arm/mach-pxa/raumfeld.c                          |    6 +-
 arch/arm/mach-pxa/zylonite.c                          |   10 +-
 drivers/mtd/nand/Kconfig                              |   11 -
 drivers/mtd/nand/Makefile                             |    1 -
 drivers/mtd/nand/marvell_nand.c                       |    3 +-
 drivers/mtd/nand/pxa3xx_nand.c                        | 2105 ------------------------------------------
 include/linux/platform_data/mtd-nand-pxa3xx.h         |   43 +-
 20 files changed, 43 insertions(+), 2249 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
 delete mode 100644 drivers/mtd/nand/pxa3xx_nand.c


> 
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Unfortunately I didn't have your ack when I prepared the branch, so it's
not there. Let me know if this is a problem.

Regards,

Boris


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
