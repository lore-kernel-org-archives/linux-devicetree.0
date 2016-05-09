From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] irqchip: Support Aspeed IRQ controller
Date: Mon,  9 May 2016 22:03:57 +0930
Message-ID: <1462797239-14765-1-git-send-email-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: devicetree@vger.kernel.org, arnd@arndb.de, jk@ozlabs.org, linux-arm-kernel@lists.infradead.org, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

Hello All,

This adds support for the IRQ controller found in the Aspeed ast2400 and
ast2500 BMC SoCs.

It's been tested on the ast2400 in an OpenPower Palmetto system, and on the
ast2500-edk developer kit.

Cheers,

Joel

Benjamin Herrenschmidt (1):
  irqchip: Add irq controller for Aspeed

Joel Stanley (1):
  doc/devicetree: Add Aspeed VIC bindings

 .../interrupt-controller/aspeed,ast2400-vic.txt    |  24 +++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-aspeed-vic.c                   | 238 +++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
 create mode 100644 drivers/irqchip/irq-aspeed-vic.c

-- 
2.8.1
