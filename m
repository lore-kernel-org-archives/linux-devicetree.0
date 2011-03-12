From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: [RFC v2] OLPC: add missing elements to device tree
Date: Sat, 12 Mar 2011 18:04:48 +0000 (GMT)
Message-ID: <20110312180448.572A49D401E@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

In response to new device tree code in the kernel, OLPC will start
using it for probing of certain devices. However, some firmware fixes
are needed to put the devicetree into a usable state.

Retain compatibility with old firmware by fixing up the device tree
at boot-time if it does not contain the new nodes/properties that
we need for probing.

Signed-off-by: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
---
 arch/x86/platform/olpc/olpc_dt.c |  104 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 104 insertions(+), 0 deletions(-)

v2: ask OpenFirmware to adjust the tree instead of manipulating the tree
on the linux level.

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index 24f2598..d6ee929 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/of_pdt.h>
+#include <asm/olpc.h>
 #include <asm/olpc_ofw.h>
 
 static phandle __init olpc_dt_getsibling(phandle node)
@@ -164,6 +165,107 @@ static struct of_pdt_ops prom_olpc_ops __initdata = {
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
@@ -171,6 +273,8 @@ void __init olpc_dt_build_devicetree(void)
 	if (!olpc_ofw_is_installed())
 		return;
 
+	olpc_dt_fixup();
+
 	root = olpc_dt_getsibling(0);
 	if (!root) {
 		pr_err("PROM: unable to get root node from OFW!\n");
-- 
1.7.4
