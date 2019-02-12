From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 00/10] mtd: rawnand: denali: exec_op(),
 controller/chip separation, and cleanups
Date: Tue, 12 Feb 2019 16:12:52 +0900
Message-ID: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

I took time for the Denali driver to catch up with the latest framework.

 - switch over to exec_op() and remove legacy hooks

 - separate controller/chips

 - various cleanups


Masahiro Yamada (10):
  mtd: rawnand: denali: use nand_chip pointer more for internal
    functions
  mtd: rawnand: denali: refactor syndrome layout handling for raw access
  mtd: rawnand: denali: remove unneeded casts in denali_{read,write}_pio
  mtd: rawnand: denali: switch over to ->exec_op() from legacy hooks
  mtd: rawnand: denali: use more precise timeout for
    NAND_OP_WAITRDT_INSTR
  mtd: rawnand: denali: use bool type instead of int where appropriate
  mtd: rawnand: denali_pci: rename goto labels
  mtd: rawnand: denali: decouple controller and NAND chips
  mtd: rawnand: denali: remove DENALI_NR_BANKS macro
  mtd: rawnand: denali: clean up coding style

 .../devicetree/bindings/mtd/denali-nand.txt        |   39 +-
 drivers/mtd/nand/raw/denali.c                      | 1144 +++++++++++---------
 drivers/mtd/nand/raw/denali.h                      |  119 +-
 drivers/mtd/nand/raw/denali_dt.c                   |   98 +-
 drivers/mtd/nand/raw/denali_pci.c                  |   38 +-
 5 files changed, 850 insertions(+), 588 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
