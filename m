From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PULL] of nand generic binding
Date: Fri, 17 Feb 2012 16:57:07 +0100
Message-ID: <20120217155707.GR1214@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

HI,

	please find attached the generic binding for the MTD nand

	This will add boolean and nand helpers

The following changes since commit d65b4e98d7ea3038b767b70fe8be959b2913f16d:

  Linux 3.3-rc3 (2012-02-08 19:21:53 -0800)

are available in the git repository at:
  git://github.com/at91linux/linux-at91.git for-grant-dt

Jean-Christophe PLAGNIOL-VILLARD (2):
      of: introduce helper to manage boolean
      of/mtd/nand: add generic bindings and helpers

 Documentation/devicetree/bindings/mtd/nand.txt |    7 ++
 drivers/of/Kconfig                             |    4 +
 drivers/of/Makefile                            |    1 +
 drivers/of/base.c                              |   30 ++++++++
 drivers/of/of_mtd.c                            |   85 ++++++++++++++++++++++++
 include/linux/of.h                             |    8 ++
 include/linux/of_mtd.h                         |   19 +++++
 7 files changed, 154 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/nand.txt
 create mode 100644 drivers/of/of_mtd.c
 create mode 100644 include/linux/of_mtd.h

Best Regards,
J.
