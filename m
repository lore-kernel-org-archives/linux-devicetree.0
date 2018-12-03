From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] SPI-NOR add NPCM FIU controller driver
Date: Mon,  3 Dec 2018 11:14:54 +0200
Message-ID: <20181203091456.454030-1-tmaimon77@gmail.com>
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
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch set adds Flash Interface Unit(FIU) SPI-NOR
support for the Nuvoton NPCM Baseboard Management 
Controller (BMC).
    
The FIU supports single, dual or quad communication interface.
    
the FIU controller can operate in following modes:
- User Mode Access(UMA): provides flash access by using an
  indirect address/data mechanism.
- direct rd/wr mode: maps the flash memory into the core
  address space.
- SPI-X mode: used for an expansion bus to an ASIC or CPLD.

The NPCM750/730/715/710 supports up to three FIU devices:
- FIU0 supports two chip select.
- FIU3 supports four chip select.
- FIUX supports two chip select.

The NPCM FIU driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: mtd: add NPCM FIU controller
  mtd: spi-nor: add NPCM FIU controller driver

 Documentation/devicetree/bindings/mtd/npcm-fiu.txt |  64 ++
 drivers/mtd/spi-nor/Kconfig                        |   8 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/npcm-fiu.c                     | 930 +++++++++++++++++++++
 4 files changed, 1003 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/npcm-fiu.txt
 create mode 100644 drivers/mtd/spi-nor/npcm-fiu.c

-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
