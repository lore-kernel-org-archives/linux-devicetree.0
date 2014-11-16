From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V2 01/22] irqchip: Update docs regarding irq_domain_add_tree()
Date: Sat, 15 Nov 2014 16:17:25 -0800
Message-ID: <1416097066-20452-2-git-send-email-cernekee@gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Several drivers now use this API, including the ARM GIC driver, so remove
the outdated comment.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 Documentation/IRQ-domain.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/IRQ-domain.txt b/Documentation/IRQ-domain.txt
index 8a8b82c..0ccd7b7 100644
--- a/Documentation/IRQ-domain.txt
+++ b/Documentation/IRQ-domain.txt
@@ -95,8 +95,7 @@ since it doesn't need to allocate a table as large as the largest
 hwirq number.  The disadvantage is that hwirq to IRQ number lookup is
 dependent on how many entries are in the table.
 
-Very few drivers should need this mapping.  At the moment, powerpc
-iseries is the only user.
+Very few drivers should need this mapping.
 
 ==== No Map ===-
 irq_domain_add_nomap()
-- 
2.1.1
