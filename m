From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH V2 0/5] mtd: bcm63xxpart: add device tree support
Date: Thu, 28 Mar 2019 15:19:05 +0100
Message-ID: <20190328141910.5723-1-jonas.gorski@gmail.com>
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
To: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

This patchset adds appropriate bindings for parsing various bcm963xx NOR
flash layouts found in the wild.

The image header is quite limited, and only has fixed fields for the
offsets and sizes of the kernel and rootfs partitions. If any additional
partitions exist, they need to be described externally, e.g. through
fixed partition layouts.

The first two patches add the bindings for the full flash parser for the
"common" case: first erase block bootloader, last erase block nvram,
reminder available for firmware.

The third patch splits out the image header parsing into its own parser.

Then patches four and five add bindings for the split out parser, to
support non-trivial cases with additional partitions, or a non-standard
offset of the firmware partition.

These patches have been in used since a while in OpenWrt.

Changes V1 -> V2:
 * dropped the second example from brcm,bcm963xx-imagetag.txt
 * added reviewed bys from Rob Herring

Jonas Gorski (5):
  dt-bindings: mtd: describe the simple BCM963XX NOR flash layout
  mtd: bcm63xxpart: add of_match_table support
  mtd: bcm63xxpart: move imagetag parsing to its own parser
  dt-bindings: mtd: describe BCM963XX ImageTag format and usage
  mtd: parser_imagetag: add of_match_table support

 .../brcm,bcm963xx-cfe-nor-partitions.txt           |  24 +++
 .../mtd/partitions/brcm,bcm963xx-imagetag.txt      |  45 +++++
 drivers/mtd/Kconfig                                |   1 +
 drivers/mtd/bcm63xxpart.c                          | 163 ++-------------
 drivers/mtd/parsers/Kconfig                        |  11 +
 drivers/mtd/parsers/Makefile                       |   1 +
 drivers/mtd/parsers/parser_imagetag.c              | 222 +++++++++++++++++++++
 7 files changed, 320 insertions(+), 147 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
 create mode 100644 drivers/mtd/parsers/parser_imagetag.c

-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
