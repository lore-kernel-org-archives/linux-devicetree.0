From: Daniel Walker <danielwa@cisco.com>
Subject: [PATCH 2/4] drivers: of: generic command line support
Date: Tue, 19 Mar 2019 16:24:46 -0700
Message-ID: <20190319232448.45964-3-danielwa@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh+dt@kernel.org>, xe-linux-external@cisco.com, linuxppc-dev@lists.ozlabs.org, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds support for the generic command line implementation into the
device tree code. This allows some platforms to use the original
CONFIG_CMDLINE implementation, but powerpc platforms can used the newer
generic command line code. As platforms support the generic command line
code they can simply add "select GENERIC_CMDLINE" and delete their
Kconfig options for the current CMDLINE.

Change-Id: Ief473a5ffac01a999b0aba7619f5b63bc4b36ac4
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 drivers/of/fdt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 7099c652c6a5..9dc5550697c2 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -24,6 +24,7 @@
 #include <linux/debugfs.h>
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
+#include <linux/cmdline.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1102,7 +1103,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
 	 * is set in which case we override whatever was found earlier.
 	 */
-#ifdef CONFIG_CMDLINE
+#if defined(CONFIG_CMDLINE) && !defined(CONFIG_GENERIC_CMDLINE)
 #if defined(CONFIG_CMDLINE_EXTEND)
 	strlcat(data, " ", COMMAND_LINE_SIZE);
 	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
@@ -1113,7 +1114,12 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	if (!((char *)data)[0])
 		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #endif
-#endif /* CONFIG_CMDLINE */
+#endif /* CONFIG_CMDLINE  && !CONFIG_GENERIC_CMDLINE */
+
+	/* append and prepend any arguments built into the kernel via
+	 * generic cmdline.
+	 */
+	cmdline_add_builtin(data, NULL, COMMAND_LINE_SIZE);
 
 	pr_debug("Command line is: %s\n", (char*)data);
 
-- 
2.19.1
