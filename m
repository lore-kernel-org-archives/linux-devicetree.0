From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 3/6] irqdomain: move IRQ_DOMAIN_NAME_ALLOCATED define to the original position
Date: Thu,  7 Sep 2017 20:41:59 +0900
Message-ID: <1504784522-26841-4-git-send-email-yamada.masahiro@socionext.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Commit 6a6544e520ab ("genirq/irqdomain: Remove auto-recursive hierarchy
support") not only deleted IRQ_DOMAIN_FLAG_AUTO_RECURSIVE, but also
moved IRQ_DOMAIN_NAME_ALLOCATED up.

Get it back to the original position to sort the enum by the bit shift.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
  - Newly added


 include/linux/irqdomain.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 81e4889..31be32d 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -180,9 +180,6 @@ enum {
 	/* Irq domain is hierarchical */
 	IRQ_DOMAIN_FLAG_HIERARCHY	= (1 << 0),
 
-	/* Irq domain name was allocated in __irq_domain_add() */
-	IRQ_DOMAIN_NAME_ALLOCATED	= (1 << 6),
-
 	/* Irq domain is an IPI domain with virq per cpu */
 	IRQ_DOMAIN_FLAG_IPI_PER_CPU	= (1 << 2),
 
@@ -195,6 +192,9 @@ enum {
 	/* Irq domain implements MSI remapping */
 	IRQ_DOMAIN_FLAG_MSI_REMAP	= (1 << 5),
 
+	/* Irq domain name was allocated in __irq_domain_add() */
+	IRQ_DOMAIN_NAME_ALLOCATED	= (1 << 6),
+
 	/*
 	 * Flags starting from IRQ_DOMAIN_FLAG_NONCORE are reserved
 	 * for implementation specific purposes and ignored by the
-- 
2.7.4
