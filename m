From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 1/3] ARM: l2c: allow CA9 optimizations to be disabled
Date: Thu, 16 Feb 2017 10:37:24 -0500
Message-ID: <20170216153726.22919-2-chris.brandt@renesas.com>
References: <20170216153726.22919-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170216153726.22919-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Brad Mouring <brad.mouring@ni.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Cochran <rcochran@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

If a PL310 is added to a system, but the sideband signals are not
connected, some Cortex A9 optimizations cannot be used. In particular,
enabling Full Line of Zeros in the CA9 without sidebands connected will
crash the system since the CA9 will expect the L2C to perform operations,
yet the L2C never gets the commands. Early BRESP also does not work
without sideband signals.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
* split "arm,pl310-no-sideband" into "arm,early-bresp-disable" and
  "arm,full-line-zero-disable"
---
 Documentation/devicetree/bindings/arm/l2c2x0.txt |  3 +++
 arch/arm/mm/cache-l2x0.c                         | 13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.txt b/Documentation/devicetree/bindings/arm/l2c2x0.txt
index 917199f..d9650c1 100644
--- a/Documentation/devicetree/bindings/arm/l2c2x0.txt
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.txt
@@ -90,6 +90,9 @@ Optional properties:
 - arm,standby-mode: L2 standby mode enable. Value <0> (forcibly disable),
   <1> (forcibly enable), property absent (OS specific behavior,
   preferably retain firmware settings)
+- arm,early-bresp-disable : Disable the CA9 optimization Early BRESP (PL310)
+- arm,full-line-zero-disable : Disable the CA9 optimization Full line of zero
+  write (PL310)
 
 Example:
 
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 2290be3..486cc6d 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -57,6 +57,9 @@ static unsigned long sync_reg_offset = L2X0_CACHE_SYNC;
 
 struct l2x0_regs l2x0_saved_regs;
 
+static bool l2x0_bresp_dis;
+static bool l2x0_flz_dis;
+
 /*
  * Common code for all cache controllers.
  */
@@ -620,7 +623,7 @@ static void __init l2c310_enable(void __iomem *base, unsigned num_lock)
 	u32 aux = l2x0_saved_regs.aux_ctrl;
 
 	if (rev >= L310_CACHE_ID_RTL_R2P0) {
-		if (cortex_a9) {
+		if (cortex_a9 && !l2x0_bresp_dis) {
 			aux |= L310_AUX_CTRL_EARLY_BRESP;
 			pr_info("L2C-310 enabling early BRESP for Cortex-A9\n");
 		} else if (aux & L310_AUX_CTRL_EARLY_BRESP) {
@@ -629,7 +632,7 @@ static void __init l2c310_enable(void __iomem *base, unsigned num_lock)
 		}
 	}
 
-	if (cortex_a9) {
+	if (cortex_a9 && !l2x0_flz_dis) {
 		u32 aux_cur = readl_relaxed(base + L2X0_AUX_CTRL);
 		u32 acr = get_auxcr();
 
@@ -1200,6 +1203,12 @@ static void __init l2c310_of_parse(const struct device_node *np,
 		*aux_mask &= ~L2C_AUX_CTRL_PARITY_ENABLE;
 	}
 
+	if (of_property_read_bool(np, "arm,early-bresp-disable"))
+		l2x0_bresp_dis = true;
+
+	if (of_property_read_bool(np, "arm,full-line-zero-disable"))
+		l2x0_flz_dis = true;
+
 	prefetch = l2x0_saved_regs.prefetch_ctrl;
 
 	ret = of_property_read_u32(np, "arm,double-linefill", &val);
-- 
2.10.1
