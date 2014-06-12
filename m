From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCHv5 2/3] ARM: mvebu: move Armada 375 external abort logic as a quirk
Date: Thu, 12 Jun 2014 17:09:31 +0200
Message-ID: <1402585772-10405-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402585772-10405-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402585772-10405-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In preparation to a small re-organization of the initialization
sequence in board-v7.c, this commit moves the registration of the
custom external abort handler on Armada 375 later in the boot
sequence, and makes it more similar to the other quirks that we
already have. There is indeed no need to register this abort handler
particularly early, it simply needs to be registered before switching
to userspace.

In addition to this, this commit makes the registration of the custom
abort handler conditional on Armada 375 Z1, because Armada 375 A0 and
later iterations are not affected by the issue.

This commit was tested on both Armada 375 Z1 and Armada 375 A0
platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-mvebu/board-v7.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board-v7.c
index 8bb742f..804c952 100644
--- a/arch/arm/mach-mvebu/board-v7.c
+++ b/arch/arm/mach-mvebu/board-v7.c
@@ -78,10 +78,17 @@ static void __init mvebu_timer_and_clk_init(void)
 	mvebu_scu_enable();
 	coherency_init();
 	BUG_ON(mvebu_mbus_dt_init(coherency_available()));
+}
+
+static void __init external_abort_quirk(void)
+{
+	u32 dev, rev;
 
-	if (of_machine_is_compatible("marvell,armada375"))
-		hook_fault_code(16 + 6, armada_375_external_abort_wa, SIGBUS, 0,
-				"imprecise external abort");
+	if (mvebu_get_soc_id(&dev, &rev) == 0 && rev > ARMADA_375_Z1_REV)
+		return;
+
+	hook_fault_code(16 + 6, armada_375_external_abort_wa, SIGBUS, 0,
+			"imprecise external abort");
 }
 
 static void __init i2c_quirk(void)
@@ -169,8 +176,10 @@ static void __init mvebu_dt_init(void)
 {
 	if (of_machine_is_compatible("plathome,openblocks-ax3-4"))
 		i2c_quirk();
-	if (of_machine_is_compatible("marvell,a375-db"))
+	if (of_machine_is_compatible("marvell,a375-db")) {
+		external_abort_quirk();
 		thermal_quirk();
+	}
 
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
 }
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
