From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 00/14] mtd: maps: physmap cleanups
Date: Mon,  8 Oct 2018 22:10:13 +0200
Message-ID: <20181008201027.17952-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

This is an attempt at merging physmap_of.c, gpio-addr-flash.c and
physmap.c. The rational behind this decision is code sharing and
consistency with what's done in other parts of the kernel:

- physmap_of is just adding OF/DT support to the physmap logic, and we
  usually put that code in the pre-existing driver instead of creating
  a new one

- gpio-addr-flash is just an extension of the physmap logic which is
  needed when the platform does not have enough native ADDR lines
  to address the whole flash. Again, I think this core belongs in the
  physmap driver

Patches 1 to 9 are just cleanups, and are not really related to the
merging of physmap_of and gpio-addr-flash into physmap.c.

Patch 10 to 13 are doing the actual merging work, and patch 14 is
documenting the addr-gpios property that has been added to support
the gpio-addr-flash on DT platforms.

Let me know what you think of this rework.

Regards,

Boris

Boris Brezillon (13):
  mtd: maps: physmap: Add SPDX header
  mtd: maps: physmap: Rename ->map and ->mtd into ->maps and ->mtds
  mtd: maps: physmap: Use platform_get_resource() to retrieve iomem
    resources
  mtd: maps: physmap: Use dev_notice() and a %pR specifier
  mtd: maps: physmap: Use devm_ioremap_resource()
  mtd: maps: physmap: Remove the MAX_RESOURCES limitation
  mtd: maps: physmap: Check mtd_device_{parse_register,unregister}() ret
    code
  mtd: maps: physmap: Return -ENOMEM directly when info allocation fails
  mtd: maps: physmap: Fix coding style issues reported by checkpatch
  mtd: maps: Prepare merging of physmap and physmap_of
  mtd: maps: Merge physmap_of.c into physmap-core.c
  mtd: maps: Merge gpio-addr-flash.c into physmap-core.c
  mtd: maps: Rename physmap_of_{versatile,gemini} into
    physmap-{versatile,gemini}

Ricardo Ribalda Delgado (1):
  dt-binding: mtd: physmap: Document the addr-gpios property

 .../devicetree/bindings/mtd/mtd-physmap.txt        |   2 +
 drivers/mtd/maps/Kconfig                           |  27 +-
 drivers/mtd/maps/Makefile                          |  10 +-
 drivers/mtd/maps/gpio-addr-flash.c                 | 281 ---------
 drivers/mtd/maps/physmap-core.c                    | 651 +++++++++++++++++++++
 .../maps/{physmap_of_gemini.c => physmap-gemini.c} |   2 +-
 .../maps/{physmap_of_gemini.h => physmap-gemini.h} |   2 +-
 ...{physmap_of_versatile.c => physmap-versatile.c} |   2 +-
 ...{physmap_of_versatile.h => physmap-versatile.h} |   2 +-
 drivers/mtd/maps/physmap.c                         | 280 ---------
 drivers/mtd/maps/physmap_of_core.c                 | 368 ------------
 11 files changed, 674 insertions(+), 953 deletions(-)
 delete mode 100644 drivers/mtd/maps/gpio-addr-flash.c
 create mode 100644 drivers/mtd/maps/physmap-core.c
 rename drivers/mtd/maps/{physmap_of_gemini.c => physmap-gemini.c} (98%)
 rename drivers/mtd/maps/{physmap_of_gemini.h => physmap-gemini.h} (90%)
 rename drivers/mtd/maps/{physmap_of_versatile.c => physmap-versatile.c} (99%)
 rename drivers/mtd/maps/{physmap_of_versatile.h => physmap-versatile.h} (90%)
 delete mode 100644 drivers/mtd/maps/physmap.c
 delete mode 100644 drivers/mtd/maps/physmap_of_core.c

-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
