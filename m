From: Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/4] ARM: STi: add stid127 soc support
Date: Thu, 30 Jan 2014 15:55:41 +0100
Message-ID: <1391093744-19905-2-git-send-email-patrice.chotard@st.com>
References: <1391093744-19905-1-git-send-email-patrice.chotard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391093744-19905-1-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: maxime.coquelin-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

This patch adds support to STiD127 SoC.
The main adaptation is the L2 cache way size compare to STiH41x SoCs.

Signed-off-by: alexandre torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/mach-sti/board-dt.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-dt.c
index 1217fb5..be018a9 100644
--- a/arch/arm/mach-sti/board-dt.c
+++ b/arch/arm/mach-sti/board-dt.c
@@ -9,6 +9,7 @@
 
 #include <linux/irq.h>
 #include <linux/of_platform.h>
+#include <linux/of.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 
@@ -18,6 +19,10 @@ void __init stih41x_l2x0_init(void)
 {
 	u32 way_size = 0x4;
 	u32 aux_ctrl;
+
+	if (of_machine_is_compatible("st,stid127"))
+		way_size = 0x3;
+
 	/* may be this can be encoded in macros like BIT*() */
 	aux_ctrl = (0x1 << L2X0_AUX_CTRL_SHARE_OVERRIDE_SHIFT) |
 		(0x1 << L2X0_AUX_CTRL_DATA_PREFETCH_SHIFT) |
@@ -36,6 +41,7 @@ static void __init stih41x_machine_init(void)
 static const char *stih41x_dt_match[] __initdata = {
 	"st,stih415",
 	"st,stih416",
+	"st,stid127",
 	NULL
 };
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
