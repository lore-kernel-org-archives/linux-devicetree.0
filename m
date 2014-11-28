From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V4 01/16] irqchip: Update docs regarding irq_domain_add_tree()
Date: Thu, 27 Nov 2014 20:32:07 -0800
Message-ID: <1417149142-3756-2-git-send-email-cernekee@gmail.com>
References: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Several drivers now use this API, including the ARM GIC driver, so remove
the outdated comment.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 Documentation/IRQ-domain.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/IRQ-domain.txt b/Documentation/IRQ-domain.txt
index 8a8b82c9ca53..0ccd7b7f6043 100644
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
2.1.0
