From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [RESEND PATCH 0/3] mtd: nand: standardize ECC maximization
Date: Wed,  8 Jun 2016 17:04:21 +0200
Message-ID: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
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
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hello,

Sorry for the noise, but I forgot to add DT maintainers in Cc.

This series aims at standardizing a feature already supported by
some NAND controller drivers: setting the maximum ECC strength
based on the OOB area size instead of using the ECC strength/step_size
information retrieved from the DT or NAND detection code.

This is particularly useful when the NAND device is used in by a
FS/wear-leveling layer that is not using the OOB area at all (this is
the case of UBI).

Note that drivers already implementing this kind of logic are not
converted to the new approach (because of backward compatibility
concern), but new drivers or drivers that do not already implement
this 'ECC maximization' logic are encouraged to do it.

Regards,

Boris

Boris Brezillon (3):
  mtd: nand: Add an option to maximize the ECC strength
  mtd: nand: Support maximizing ECC when using software BCH
  mtd: nand: sunxi: Support ECC maximization

 Documentation/devicetree/bindings/mtd/nand.txt |  9 ++++++++
 drivers/mtd/nand/nand_base.c                   | 23 ++++++++++++++++++++
 drivers/mtd/nand/sunxi_nand.c                  | 29 ++++++++++++++++++++++++++
 include/linux/mtd/nand.h                       |  1 +
 4 files changed, 62 insertions(+)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
