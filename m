From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] of/fdt: fix aliases with baudrate in earlycon
Date: Sat, 10 Oct 2015 01:29:30 -0700
Message-ID: <1444465770-3103-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, grant.likely@linaro.org
Cc: galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Many boards use an alias in the stdout-path specification along
with console options after a colon (e.g. serial0:115200n8). When
using earlycon, this specification currently does not work. While
fdt_path_offset supports alias resolution, it does not remove the
console options by itself. Use the fdt_path_offset_namelen variant
and provide the length of the alias to enable aliases with console
options in the stdout-path.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Hi,

Stumbled upon this while testing 32-bit ARM earlycon support. It
seems that this once already came up on the list:
https://lkml.org/lkml/2015/3/13/562

--
Stefan


 drivers/of/fdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 6e82bc42..9fc3568 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -813,8 +813,11 @@ static int __init early_init_dt_scan_chosen_serial(void)
 	if (!p || !l)
 		return -ENOENT;
 
+	/* Remove console options if present */
+	l = strchrnul(p, ':') - p;
+
 	/* Get the node specified by stdout-path */
-	offset = fdt_path_offset(fdt, p);
+	offset = fdt_path_offset_namelen(fdt, p, l);
 	if (offset < 0)
 		return -ENODEV;
 
-- 
2.6.1
