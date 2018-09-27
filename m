From: Maksym Kokhan <maksym.kokhan@globallogic.com>
Subject: [PATCH 2/8] drivers: of: ifdef out cmdline section
Date: Thu, 27 Sep 2018 19:55:27 +0300
Message-ID: <1538067327-5785-1-git-send-email-maksym.kokhan@globallogic.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Daniel Walker <dwalker@fifo99.com>, Daniel Walker <danielwa@cisco.com>, Andrii Bordunov <aborduno@cisco.com>, Ruslan Bilovol <rbilovol@cisco.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Daniel Walker <danielwa@cisco.com>

It looks like there's some seepage of cmdline stuff into
the generic device tree code. This conflicts with the
generic cmdline implementation so I remove it in the case
when that's enabled.

Cc: Daniel Walker <dwalker@fifo99.com>
Cc: Daniel Walker <danielwa@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
Signed-off-by: Maksym Kokhan <maksym.kokhan@globallogic.com>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 800ad25..74b85ad 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1096,7 +1096,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
 	 * is set in which case we override whatever was found earlier.
 	 */
-#ifdef CONFIG_CMDLINE
+#if defined(CONFIG_CMDLINE) && !defined(CONFIG_GENERIC_CMDLINE)
 #if defined(CONFIG_CMDLINE_EXTEND)
 	strlcat(data, " ", COMMAND_LINE_SIZE);
 	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-- 
2.7.4
