From: Daniel Drake <dsd@laptop.org>
Subject: [PATCH] OLPC: add missing elements to device tree
Date: Wed, 16 Mar 2011 15:17:01 +0000 (GMT)
Message-ID: <20110316151701.F279E9D401E@zog.reactivated.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: hpa@zytor.com, mingo@redhat.com, tglx@linutronix.de, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

In response to new device tree code in the kernel, OLPC will start
using it for probing of certain devices. However, some firmware fixes
are needed to put the devicetree into a usable state.

Retain compatibility with old firmware by fixing up the device tree
at boot-time if it does not contain the new nodes/properties that
we need for probing. This is the same approach taken on PPC platforms.

Signed-off-by: Daniel Drake <dsd@laptop.org>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
Acked-by: Andres Salomon <dilinger@queued.net>
---
 arch/x86/platform/olpc/olpc_dt.c |  103 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 103 insertions(+), 0 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index d39f63d..d6ee929 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -165,6 +165,107 @@ static struct of_pdt_ops prom_olpc_ops __initdata = {
 	.pkg2path = olpc_dt_pkg2path,
 };
 
+static phandle __init olpc_dt_finddevice(const char *path)
+{
+	phandle node;
+	const void *args[] = { path };
+	void *res[] = { &node };
+
+	if (olpc_ofw("finddevice", args, res)) {
+		pr_err("olpc_dt: finddevice failed!\n");
+		return 0;
+	}
+
+	if ((s32) node == -1)
+		return 0;
+
+	return node;
+}
+
+static int __init olpc_dt_interpret(const char *words)
+{
+	int result;
+	const void *args[] = { words };
+	void *res[] = { &result };
+
+	if (olpc_ofw("interpret", args, res)) {
+		pr_err("olpc_dt: interpret failed!\n");
+		return -1;
+	}
+
+	return result;
+}
+
+/*
+ * Extract board revision directly from OFW device tree.
+ * We can't use olpc_platform_info because that hasn't been set up yet.
+ */
+static u32 __init olpc_dt_get_board_revision(void)
+{
+	phandle node;
+	__be32 rev;
+	int r;
+
+	node = olpc_dt_finddevice("/");
+	if (!node)
+		return 0;
+
+	r = olpc_dt_getproperty(node, "board-revision-int",
+				(char *) &rev, sizeof(rev));
+	if (r < 0)
+		return 0;
+
+	return be32_to_cpu(rev);
+}
+
+void __init olpc_dt_fixup(void)
+{
+	int r;
+	char buf[64];
+	phandle node;
+	u32 board_rev;
+
+	node = olpc_dt_finddevice("/battery@0");
+	if (!node)
+		return;
+
+	/*
+	 * If the battery node has a compatible property, we are running a new
+	 * enough firmware and don't have fixups to make.
+	 */
+	r = olpc_dt_getproperty(node, "compatible", buf, sizeof(buf));
+	if (r > 0)
+		return;
+
+	pr_info("PROM DT: Old firmware detected, applying fixes\n");
+
+	/* Add olpc,xo1-battery compatible marker to battery node */
+	olpc_dt_interpret("\" /battery@0\" find-device"
+		" \" olpc,xo1-battery\" +compatible"
+		" device-end");
+
+	board_rev = olpc_dt_get_board_revision();
+	if (!board_rev)
+		return;
+
+	if (board_rev >= olpc_board_pre(0xd0)) {
+		/* XO-1.5: add dcon device */
+		olpc_dt_interpret("\" /pci/display@1\" find-device"
+			" new-device"
+			" \" dcon\" device-name \" olpc,xo1-dcon\" +compatible"
+			" finish-device device-end");
+	} else {
+		/* XO-1: add dcon device, mark RTC as olpc,xo1-rtc */
+		olpc_dt_interpret("\" /pci/display@1,1\" find-device"
+			" new-device"
+			" \" dcon\" device-name \" olpc,xo1-dcon\" +compatible"
+			" finish-device device-end"
+			" \" /rtc\" find-device"
+			" \" olpc,xo1-rtc\" +compatible"
+			" device-end");
+	}
+}
+
 void __init olpc_dt_build_devicetree(void)
 {
 	phandle root;
@@ -172,6 +273,8 @@ void __init olpc_dt_build_devicetree(void)
 	if (!olpc_ofw_is_installed())
 		return;
 
+	olpc_dt_fixup();
+
 	root = olpc_dt_getsibling(0);
 	if (!root) {
 		pr_err("PROM: unable to get root node from OFW!\n");
-- 
1.7.4
