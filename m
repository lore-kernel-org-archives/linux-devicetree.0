From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] ARM: l2c: add options to overwrite prefetching behavior
Date: Thu, 14 May 2015 01:42:00 +0200
Message-ID: <1431560520-12544-1-git-send-email-hauke@hauke-m.de>
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
To: linux@arm.linux.org.uk, arnd@arndb.de
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be, catalin.marinas@arm.com
List-Id: devicetree@vger.kernel.org

These options make it possible to overwrites the data and instruction
prefetching behavior of the arm pl310 cache controller.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 Documentation/devicetree/bindings/arm/l2cc.txt |  4 ++++
 arch/arm/mm/cache-l2x0.c                       | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
index 0dbabe9..528821a 100644
--- a/Documentation/devicetree/bindings/arm/l2cc.txt
+++ b/Documentation/devicetree/bindings/arm/l2cc.txt
@@ -67,6 +67,10 @@ Optional properties:
   disable if zero.
 - arm,prefetch-offset : Override prefetch offset value. Valid values are
   0-7, 15, 23, and 31.
+- arm,prefetch-data : Enable data prefetch. Enabling prefetching
+  can improve performance.
+- arm,prefetch-instr : Enable instruction prefetch. Enabling prefetching
+  can improve performance.
 
 Example:
 
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index e309c8f..f919548 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1149,6 +1149,16 @@ static void __init l2c310_of_parse(const struct device_node *np,
 		}
 	}
 
+	if (of_property_read_bool(np, "arm,prefetch-data")) {
+		*aux_val |= L310_AUX_CTRL_DATA_PREFETCH;
+		*aux_mask &= ~L310_AUX_CTRL_DATA_PREFETCH;
+	}
+
+	if (of_property_read_bool(np, "arm,prefetch-instr")) {
+		*aux_val |= L310_AUX_CTRL_INSTR_PREFETCH;
+		*aux_mask &= ~L310_AUX_CTRL_INSTR_PREFETCH;
+	}
+
 	prefetch = l2x0_saved_regs.prefetch_ctrl;
 
 	ret = of_property_read_u32(np, "arm,double-linefill", &val);
-- 
2.1.4
