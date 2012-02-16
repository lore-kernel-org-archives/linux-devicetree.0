From: Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH v5 14/27] mfd: twl-core.c: Fix the number of interrupts
 managed by twl4030
Date: Thu, 16 Feb 2012 02:09:15 -0700
Message-ID: <1329383368-12122-15-git-send-email-grant.likely@secretlab.ca>
References: <1329383368-12122-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1329383368-12122-1-git-send-email-grant.likely@secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Milton Miller <miltonm@bga.com>, Rob Herring <rob.herring@calxeda.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Benoit Cousson <b-cousson@ti.com>
List-Id: devicetree@vger.kernel.org

From: Benoit Cousson <b-cousson@ti.com>

TWL4030 does handle 3 different interrupts ranges: 8 for the core, 8 for
the power events and 18 for the GPIOs.

Change the total number of interrupts managed by TWL4030 from 8 to 34.

Signed-off-by: Benoit Cousson <b-cousson@ti.com>
Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/mfd/twl-core.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index 8ce3959..4967733 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -149,7 +149,7 @@
 
 #define TWL_MODULE_LAST TWL4030_MODULE_LAST
 
-#define TWL4030_NR_IRQS    8
+#define TWL4030_NR_IRQS    34 /* core:8, power:8, gpio: 18 */
 #define TWL6030_NR_IRQS    20
 
 /* Base Address defns for twl4030_map[] */
-- 
1.7.9
