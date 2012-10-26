From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 12/14] fdt: Allow device tree to specify secure booting
Date: Thu, 25 Oct 2012 19:31:09 -0700
Message-ID: <1351218671-15228-13-git-send-email-sjg@chromium.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Gabe Black <gabeblack-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

When secure booting is chosen:
* The u-boot shell is never invoked during boot--we just do a simple
  table lookup to find the command.  This means we could even remove
  the shell parsing from u-boot and still be able to boot.
* The boot command can't be interruped.
* Failure doesn't cause us to fall back to the shell.

Signed-off-by: Gabe Black <gabeblack-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 common/main.c |   62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/common/main.c b/common/main.c
index cf1b5f9..03c63b4 100644
--- a/common/main.c
+++ b/common/main.c
@@ -283,6 +283,59 @@ int abortboot(int bootdelay)
 # endif	/* CONFIG_AUTOBOOT_KEYED */
 #endif	/* CONFIG_BOOTDELAY >= 0  */
 
+/*
+ * Runs the given boot command securely.  Specifically:
+ * - Doesn't run the command with the shell (run_command or parse_string_outer),
+ *   since that's a lot of code surface that an attacker might exploit.
+ *   Because of this, we don't do any argument parsing--the secure boot command
+ *   has to be a full-fledged u-boot command.
+ * - Doesn't check for keypresses before booting, since that could be a
+ *   security hole; also disables Ctrl-C.
+ * - Doesn't allow the command to return.
+ *
+ * Upon any failures, this function will drop into an infinite loop after
+ * printing the error message to console.
+ */
+
+#if defined(CONFIG_BOOTDELAY) && (CONFIG_BOOTDELAY >= 0) && \
+	defined(CONFIG_OF_CONTROL)
+static void secure_boot_cmd(char *cmd)
+{
+	cmd_tbl_t *cmdtp;
+	int rc;
+
+	if (!cmd) {
+		printf("## Error: Secure boot command not specified\n");
+		goto err;
+	}
+
+	/* Disable Ctrl-C just in case some command is used that checks it. */
+	disable_ctrlc(1);
+
+	/* Find the command directly. */
+	cmdtp = find_cmd(cmd);
+	if (!cmdtp) {
+		printf("## Error: \"%s\" not defined\n", cmd);
+		goto err;
+	}
+
+	/* Run the command, forcing no flags and faking argc and argv. */
+	rc = (cmdtp->cmd)(cmdtp, 0, 1, &cmd);
+
+	/* Shouldn't ever return from boot command. */
+	printf("## Error: \"%s\" returned (code %d)\n", cmd, rc);
+
+err:
+	/*
+	 * Not a whole lot to do here.  Rebooting won't help much, since we'll
+	 * just end up right back here.  Just loop.
+	 */
+	hang();
+}
+
+#endif /* CONFIG_OF_CONTROL */
+
+
 /****************************************************************************/
 
 void main_loop (void)
@@ -397,6 +450,15 @@ void main_loop (void)
 	env = fdtdec_get_config_string(gd->fdt_blob, "bootcmd");
 	if (env)
 		s = env;
+
+	/*
+	 * If the bootsecure option was chosen, use secure_boot_cmd().
+	 * Always use 'env' in this case, since bootsecure requres that the
+	 * bootcmd was specified in the FDT too.
+	 */
+	if (fdtdec_get_config_int(gd->fdt_blob, "bootsecure", 0))
+		secure_boot_cmd(env);
+
 #endif /* CONFIG_OF_CONTROL */
 
 	debug ("### main_loop: bootcmd=\"%s\"\n", s ? s : "<UNDEFINED>");
-- 
1.7.7.3
