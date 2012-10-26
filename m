From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 14/14] fdt: Set kernaddr if fdt indicates a kernel
	is present
Date: Thu, 25 Oct 2012 19:31:11 -0700
Message-ID: <1351218671-15228-15-git-send-email-sjg@chromium.org>
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
Cc: Tom Rini <trini@ti.com>, Jerry Van Baren <vanbaren@cideas.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

If kernel-offset is specified in the fdt, set an environment variable
so that scripts can access the attached kernel.

This can be used by a packaging program to tell U-Boot about a kernel
that has been downloaded alongside U-Boot. The value in the fdt is
the offset of the kernel from the start of the U-Boot image, so we can
find it just by adding CONFIG_SYS_TEXT_BASE.

It is then fairly easy to put something like this in the environment
variables in the board header file:

		"if test ${kernaddr} != \"\"; then "\
			"echo \"Using bundled kernel\"; "\
			"bootm ${kernaddr};" \
		"fi; "\
		/* rest of boot sequence follows here */

Signed-off-by: Simon Glass <sjg@chromium.org>
---
 common/main.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/common/main.c b/common/main.c
index 03c63b4..3137b75 100644
--- a/common/main.c
+++ b/common/main.c
@@ -333,6 +333,20 @@ err:
 	hang();
 }
 
+static void process_fdt_options(const void *blob)
+{
+	ulong addr;
+
+	/* Add an env variable to point to a kernel payload, if available */
+	addr = fdtdec_get_config_int(gd->fdt_blob, "kernel-offset", 0);
+	if (addr)
+		setenv_addr("kernaddr", (void *)(CONFIG_SYS_TEXT_BASE + addr));
+
+	/* Add an env variable to point to a root disk, if available */
+	addr = fdtdec_get_config_int(gd->fdt_blob, "rootdisk-offset", 0);
+	if (addr)
+		setenv_addr("rootaddr", (void *)(CONFIG_SYS_TEXT_BASE + addr));
+}
 #endif /* CONFIG_OF_CONTROL */
 
 
@@ -451,6 +465,8 @@ void main_loop (void)
 	if (env)
 		s = env;
 
+	process_fdt_options(gd->fdt_blob);
+
 	/*
 	 * If the bootsecure option was chosen, use secure_boot_cmd().
 	 * Always use 'env' in this case, since bootsecure requres that the
-- 
1.7.7.3
