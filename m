From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/3] mtd: rawnand: denali: add new clocks and improve
 setup_data_interface
Date: Thu, 14 Jun 2018 14:11:04 +0900
Message-ID: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Philipp Rosenberger <p.rosenberger@linutronix.de>, Richard Weinberger <richard@sigma-star.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org


The ->setup_data_interface() hook needs to know the clock frequency.
In fact, this IP needs three clocks, bus "which clock?" is really
confusing.  (It is not described in the DT-binding at all.)

This series adds more clocks.  In the new binding, three clocks
are required: core clock, bus interface clock, ECC engine clock.

This series also takes care of the backward compatibility by
providing hardcoded values in case the new clocks are missing.
So, existing DT should work.


Changes in v2:
  - Split patches into sensible chunks

Masahiro Yamada (3):
  mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
  mtd: rawnand: denali_dt: add more clocks based on IP datasheet
  mtd: rawnand: denali: optimize timing parameters for data interface

 .../devicetree/bindings/mtd/denali-nand.txt        |  5 ++
 drivers/mtd/nand/raw/denali.c                      | 49 ++++++++--------
 drivers/mtd/nand/raw/denali.h                      |  1 +
 drivers/mtd/nand/raw/denali_dt.c                   | 66 ++++++++++++++++++----
 drivers/mtd/nand/raw/denali_pci.c                  |  1 +
 5 files changed, 86 insertions(+), 36 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
