From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC 1/3] of: Migrate of_find_node_by_name() users to for_each_node_by_name()
Date: Thu,  5 Jun 2014 16:43:39 +0100
Message-ID: <1401983021-13829-2-git-send-email-grant.likely@linaro.org>
References: <1401983021-13829-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401983021-13829-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are a bunch of users open coding the for_each_node_by_name() by
calling of_find_node_by_name() directly instead of using the macro. This
is getting in the way of some cleanups, and the possibility of removing
of_find_node_by_name() entirely. Clean it up so that all the users are
consistent.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/powerpc/platforms/powermac/feature.c  | 20 +++++---------------
 arch/powerpc/platforms/powermac/pci.c      |  2 +-
 arch/powerpc/platforms/powermac/smp.c      |  2 +-
 arch/powerpc/platforms/powermac/udbg_adb.c |  2 +-
 arch/powerpc/platforms/pseries/setup.c     |  3 +--
 drivers/cpufreq/pmac64-cpufreq.c           |  3 +--
 drivers/edac/cell_edac.c                   |  3 +--
 drivers/pci/hotplug/rpaphp_core.c          |  4 ++--
 drivers/tty/serial/pmac_zilog.c            |  9 +++------
 sound/ppc/pmac.c                           |  6 +++---
 10 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 63d82bbc05e9..39e1d163c427 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2805,25 +2805,20 @@ set_initial_features(void)
 		/* Enable GMAC for now for PCI probing. It will be disabled
 		 * later on after PCI probe
 		 */
-		np = of_find_node_by_name(NULL, "ethernet");
-		while(np) {
+		for_each_node_by_name(np, "ethernet")
 			if (of_device_is_compatible(np, "K2-GMAC"))
 				g5_gmac_enable(np, 0, 1);
-			np = of_find_node_by_name(np, "ethernet");
-		}
 
 		/* Enable FW before PCI probe. Will be disabled later on
 		 * Note: We should have a batter way to check that we are
 		 * dealing with uninorth internal cell and not a PCI cell
 		 * on the external PCI. The code below works though.
 		 */
-		np = of_find_node_by_name(NULL, "firewire");
-		while(np) {
+		for_each_node_by_name(np, "firewire") {
 			if (of_device_is_compatible(np, "pci106b,5811")) {
 				macio_chips[0].flags |= MACIO_FLAG_FW_SUPPORTED;
 				g5_fw_enable(np, 0, 1);
 			}
-			np = of_find_node_by_name(np, "firewire");
 		}
 	}
 #else /* CONFIG_POWER4 */
@@ -2834,13 +2829,11 @@ set_initial_features(void)
 		/* Enable GMAC for now for PCI probing. It will be disabled
 		 * later on after PCI probe
 		 */
-		np = of_find_node_by_name(NULL, "ethernet");
-		while(np) {
+		for_each_node_by_name(np, "ethernet") {
 			if (np->parent
 			    && of_device_is_compatible(np->parent, "uni-north")
 			    && of_device_is_compatible(np, "gmac"))
 				core99_gmac_enable(np, 0, 1);
-			np = of_find_node_by_name(np, "ethernet");
 		}
 
 		/* Enable FW before PCI probe. Will be disabled later on
@@ -2848,8 +2841,7 @@ set_initial_features(void)
 		 * dealing with uninorth internal cell and not a PCI cell
 		 * on the external PCI. The code below works though.
 		 */
-		np = of_find_node_by_name(NULL, "firewire");
-		while(np) {
+		for_each_node_by_name(np, "firewire") {
 			if (np->parent
 			    && of_device_is_compatible(np->parent, "uni-north")
 			    && (of_device_is_compatible(np, "pci106b,18") ||
@@ -2858,18 +2850,16 @@ set_initial_features(void)
 				macio_chips[0].flags |= MACIO_FLAG_FW_SUPPORTED;
 				core99_firewire_enable(np, 0, 1);
 			}
-			np = of_find_node_by_name(np, "firewire");
 		}
 
 		/* Enable ATA-100 before PCI probe. */
 		np = of_find_node_by_name(NULL, "ata-6");
-		while(np) {
+		for_each_node_by_name(np, "ata-6") {
 			if (np->parent
 			    && of_device_is_compatible(np->parent, "uni-north")
 			    && of_device_is_compatible(np, "kauai-ata")) {
 				core99_ata100_enable(np, 1);
 			}
-			np = of_find_node_by_name(np, "ata-6");
 		}
 
 		/* Switch airport off */
diff --git a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platforms/powermac/pci.c
index cf7009b8c7b6..7e868ccf3b0d 100644
--- a/arch/powerpc/platforms/powermac/pci.c
+++ b/arch/powerpc/platforms/powermac/pci.c
@@ -698,7 +698,7 @@ static void __init fixup_nec_usb2(void)
 {
 	struct device_node *nec;
 
-	for (nec = NULL; (nec = of_find_node_by_name(nec, "usb")) != NULL;) {
+	for_each_node_by_name(nec, "usb") {
 		struct pci_controller *hose;
 		u32 data;
 		const u32 *prop;
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 5cbd4d67d5c4..af094ae03dbb 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -577,7 +577,7 @@ static void __init smp_core99_setup_i2c_hwsync(int ncpus)
 	int ok;
 
 	/* Look for the clock chip */
-	while ((cc = of_find_node_by_name(cc, "i2c-hwclock")) != NULL) {
+	for_each_node_by_name(cc, "i2c-hwclock") {
 		p = of_get_parent(cc);
 		ok = p && of_device_is_compatible(p, "uni-n-i2c");
 		of_node_put(p);
diff --git a/arch/powerpc/platforms/powermac/udbg_adb.c b/arch/powerpc/platforms/powermac/udbg_adb.c
index 44e0b55a2a02..366bd221edec 100644
--- a/arch/powerpc/platforms/powermac/udbg_adb.c
+++ b/arch/powerpc/platforms/powermac/udbg_adb.c
@@ -191,7 +191,7 @@ int __init udbg_adb_init(int force_btext)
 	 * of type "adb". If not, we return a failure, but we keep the
 	 * bext output set for now
 	 */
-	for (np = NULL; (np = of_find_node_by_name(np, "keyboard")) != NULL;) {
+	for_each_node_by_name(np, "keyboard") {
 		struct device_node *parent = of_get_parent(np);
 		int found = (parent && strcmp(parent->type, "adb") == 0);
 		of_node_put(parent);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 099d2df976a2..4131f6644fd6 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -232,8 +232,7 @@ static void __init pseries_discover_pic(void)
 	struct device_node *np;
 	const char *typep;
 
-	for (np = NULL; (np = of_find_node_by_name(np,
-						   "interrupt-controller"));) {
+	for_each_node_by_name(np, "interrupt-controller") {
 		typep = of_get_property(np, "compatible", NULL);
 		if (strstr(typep, "open-pic")) {
 			pSeries_mpic_node = of_node_get(np);
diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index 8bc422977b5b..4ff86878727f 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -499,8 +499,7 @@ static int __init g5_pm72_cpufreq_init(struct device_node *cpunode)
 	}
 
 	/* Lookup the i2c hwclock */
-	for (hwclock = NULL;
-	     (hwclock = of_find_node_by_name(hwclock, "i2c-hwclock")) != NULL;){
+	for_each_node_by_name(hwclock, "i2c-hwclock") {
 		const char *loc = of_get_property(hwclock,
 				"hwctrl-location", NULL);
 		if (loc == NULL)
diff --git a/drivers/edac/cell_edac.c b/drivers/edac/cell_edac.c
index 374b57fc596d..a12c8552f6a6 100644
--- a/drivers/edac/cell_edac.c
+++ b/drivers/edac/cell_edac.c
@@ -134,8 +134,7 @@ static void cell_edac_init_csrows(struct mem_ctl_info *mci)
 	int				j;
 	u32				nr_pages;
 
-	for (np = NULL;
-	     (np = of_find_node_by_name(np, "memory")) != NULL;) {
+	for_each_node_by_name(np, "memory") {
 		struct resource r;
 
 		/* We "know" that the Cell firmware only creates one entry
diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 4796c15fba94..f276ddcb27cc 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -369,11 +369,11 @@ static void __exit cleanup_slots(void)
 
 static int __init rpaphp_init(void)
 {
-	struct device_node *dn = NULL;
+	struct device_node *dn;
 
 	info(DRIVER_DESC " version: " DRIVER_VERSION "\n");
 
-	while ((dn = of_find_node_by_name(dn, "pci")))
+	for_each_node_by_name(dn, "pci")
 		rpaphp_add_slot(dn);
 
 	return 0;
diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index e9d420ff3931..1d6d16b8f8b1 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1650,8 +1650,7 @@ static int __init pmz_probe(void)
 	/*
 	 * Find all escc chips in the system
 	 */
-	node_p = of_find_node_by_name(NULL, "escc");
-	while (node_p) {
+	for_each_node_by_name(node_p, "escc") {
 		/*
 		 * First get channel A/B node pointers
 		 * 
@@ -1669,7 +1668,7 @@ static int __init pmz_probe(void)
 			of_node_put(node_b);
 			printk(KERN_ERR "pmac_zilog: missing node %c for escc %s\n",
 				(!node_a) ? 'a' : 'b', node_p->full_name);
-			goto next;
+			continue;
 		}
 
 		/*
@@ -1696,11 +1695,9 @@ static int __init pmz_probe(void)
 			of_node_put(node_b);
 			memset(&pmz_ports[count], 0, sizeof(struct uart_pmac_port));
 			memset(&pmz_ports[count+1], 0, sizeof(struct uart_pmac_port));
-			goto next;
+			continue;
 		}
 		count += 2;
-next:
-		node_p = of_find_node_by_name(node_p, "escc");
 	}
 	pmz_ports_count = count;
 
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 7a43c0c38316..8a431bcb056c 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -992,9 +992,9 @@ static int snd_pmac_detect(struct snd_pmac *chip)
 		return -ENODEV;
 
 	if (!sound) {
-		sound = of_find_node_by_name(NULL, "sound");
-		while (sound && sound->parent != chip->node)
-			sound = of_find_node_by_name(sound, "sound");
+		for_each_node_by_name(sound, "sound")
+			if (sound->parent == chip->node)
+				break;
 	}
 	if (! sound) {
 		of_node_put(chip->node);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
