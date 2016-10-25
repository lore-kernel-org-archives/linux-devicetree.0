From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v7 0/2] tango NFC support + bindings doc
Date: Tue, 25 Oct 2016 15:14:58 +0200
Message-ID: <580F5AD2.9020909@sigmadesigns.com>
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
To: linux-mtd <linux-mtd@lists.infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>
Cc: Mark Rutland <mark.rutland@arm.com>, DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sebastian Frias <sf84@laposte.net>, Mason <slash.tmp@free.fr>
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds support for the NAND Flash controller
on recent Tango chips, along with the bindings documentation.

Marc Gonzalez (2):
  mtd: nand: add tango NFC dt bindings doc
  mtd: nand: add tango NAND flash controller support

 Documentation/devicetree/bindings/mtd/tango-nand.txt |  38 ++
 drivers/mtd/nand/Kconfig                             |   6 +
 drivers/mtd/nand/Makefile                            |   1 +
 drivers/mtd/nand/tango_nand.c                        | 654 +++++++++++++++++++++++++++++
 4 files changed, 699 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/tango-nand.txt
 create mode 100644 drivers/mtd/nand/tango_nand.c

Regards.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
