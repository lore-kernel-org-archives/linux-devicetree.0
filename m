From: Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH v5 5/9] ARM: versatile: Map local timers using Device Tree
 when possible
Date: Fri,  9 Dec 2011 19:03:48 +0000
Message-ID: <1323457432-4800-6-git-send-email-pawel.moll@arm.com>
References: <1323457432-4800-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1323457432-4800-1-git-send-email-pawel.moll@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

If twd_base is not set, try to map the TWD registers from
"arm,smp-twd" Device Tree node (compatible value as used in
Highbank's DT).

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 arch/arm/plat-versatile/localtimer.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-versatile/localtimer.c b/arch/arm/plat-versatile/localtimer.c
index 0fb3961..e3da322 100644
--- a/arch/arm/plat-versatile/localtimer.c
+++ b/arch/arm/plat-versatile/localtimer.c
@@ -11,6 +11,8 @@
 #include <linux/init.h>
 #include <linux/smp.h>
 #include <linux/clockchips.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <asm/smp_twd.h>
 #include <asm/localtimer.h>
@@ -21,6 +23,16 @@
  */
 int __cpuinit local_timer_setup(struct clock_event_device *evt)
 {
+#if defined(CONFIG_OF)
+	if (!twd_base) {
+		struct device_node *np = of_find_compatible_node(NULL,
+				NULL, "arm,smp-twd");
+
+		twd_base = of_iomap(np, 0);
+		if (!twd_base)
+			return -ENXIO;
+	}
+#endif
 	evt->irq = IRQ_LOCALTIMER;
 	twd_timer_setup(evt);
 	return 0;
-- 
1.7.5.4
