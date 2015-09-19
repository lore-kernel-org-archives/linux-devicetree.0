From: Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 0/2] v3 ath79 misc irq controller
Date: Sat, 19 Sep 2015 06:26:18 +0200
Message-ID: <1442636780-2891-1-git-send-email-lynxis@fe80.eu>
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>
List-Id: devicetree@vger.kernel.org

Hi,

sorry for the noise, I've overseen the IRQ Chip maintainers.
Hopefully I've now all maintainers in cc.

v3:
 remove log line when setup ar7100 misc irq controller
 doc: write out {ar7100,ar7240} into two seperate lines

v2:
 move new IRQ_DECLARE just behind the new init for ar7100
 don't remove newline
 add log line when setup ar7100 misc irq controller
 improve commit message for missing irq ack handler

Alexander Couzens (2):
  MIPS: ath79: set missing irq ack handler for ar7100-misc-intc irq chip
  MIPS: ath79: add irq chip ar7240-misc-intc

 .../interrupt-controller/qca,ath79-misc-intc.txt   | 20 ++++++++++++++++++--
 arch/mips/ath79/irq.c                              | 22 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.4.0
