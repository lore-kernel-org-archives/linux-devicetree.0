From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 10/14] fdt: Load boot command from device tree
Date: Thu, 25 Oct 2012 19:31:07 -0700
Message-ID: <1351218671-15228-11-git-send-email-sjg@chromium.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Rini <trini@ti.com>
List-Id: devicetree@vger.kernel.org

From: Che-Liang Chiou <clchiou@chromium.org>

Load boot command from /config/bootcmd of device tree if present.

Signed-off-by: Tom Wai-Hong Tam <waihong@chromium.org>
Signed-off-by: Che-Liang Chiou <clchiou@chromium.org>
Signed-off-by: Simon Glass <sjg@chromium.org>
---
 common/main.c |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/common/main.c b/common/main.c
index 9507cec..23a68ee 100644
--- a/common/main.c
+++ b/common/main.c
@@ -30,6 +30,7 @@
 #include <common.h>
 #include <watchdog.h>
 #include <command.h>
+#include <fdtdec.h>
 #include <malloc.h>
 #include <version.h>
 #ifdef CONFIG_MODEM_SUPPORT
@@ -40,6 +41,10 @@
 #include <hush.h>
 #endif
 
+#ifdef CONFIG_OF_CONTROL
+#include <fdtdec.h>
+#endif
+
 #include <post.h>
 #include <linux/ctype.h>
 #include <menu.h>
@@ -284,7 +289,10 @@ void main_loop (void)
 	int rc = 1;
 	int flag;
 #endif
-
+#if defined(CONFIG_BOOTDELAY) && (CONFIG_BOOTDELAY >= 0) && \
+		defined(CONFIG_OF_CONTROL)
+	char *env;
+#endif
 #if defined(CONFIG_BOOTDELAY) && (CONFIG_BOOTDELAY >= 0)
 	char *s;
 	int bootdelay;
@@ -380,6 +388,12 @@ void main_loop (void)
 	else
 #endif /* CONFIG_BOOTCOUNT_LIMIT */
 		s = getenv ("bootcmd");
+#ifdef CONFIG_OF_CONTROL
+	/* Allow the fdt to override the boot command */
+	env = fdtdec_get_config_string(gd->fdt_blob, "bootcmd");
+	if (env)
+		s = env;
+#endif /* CONFIG_OF_CONTROL */
 
 	debug ("### main_loop: bootcmd=\"%s\"\n", s ? s : "<UNDEFINED>");
 
-- 
1.7.7.3
