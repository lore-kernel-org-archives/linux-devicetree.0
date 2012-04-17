From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 2/7] fdt: Add debugging to fdtdec_get_int/addr()
Date: Tue, 17 Apr 2012 11:50:09 -0700
Message-ID: <1334688614-4977-3-git-send-email-sjg@chromium.org>
References: <1334688614-4977-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1334688614-4977-1-git-send-email-sjg@chromium.org>
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
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Scott Wood <scottwood@freescale.com>
List-Id: devicetree@vger.kernel.org

The new debugging shows the value of integers and addresses read
from the device tree.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 lib/fdtdec.c |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 42c3e89..3885634 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -79,11 +79,16 @@ fdt_addr_t fdtdec_get_addr(const void *blob, int node,
 	const fdt_addr_t *cell;
 	int len;
 
-	debug("get_addr: %s\n", prop_name);
+	debug("%s: %s\n", __func__, prop_name);
 	cell = fdt_getprop(blob, node, prop_name, &len);
 	if (cell && (len == sizeof(fdt_addr_t) ||
-			len == sizeof(fdt_addr_t) * 2))
-		return fdt_addr_to_cpu(*cell);
+			len == sizeof(fdt_addr_t) * 2)) {
+		fdt_addr_t addr = fdt_addr_to_cpu(*cell);
+
+		debug("%p\n", (void *)addr);
+		return addr;
+	}
+	debug("(not found)\n");
 	return FDT_ADDR_T_NONE;
 }
 
@@ -93,10 +98,15 @@ s32 fdtdec_get_int(const void *blob, int node, const char *prop_name,
 	const s32 *cell;
 	int len;
 
-	debug("get_size: %s\n", prop_name);
+	debug("%s: %s: ", __func__, prop_name);
 	cell = fdt_getprop(blob, node, prop_name, &len);
-	if (cell && len >= sizeof(s32))
-		return fdt32_to_cpu(cell[0]);
+	if (cell && len >= sizeof(s32)) {
+		s32 val = fdt32_to_cpu(cell[0]);
+
+		debug("%#x (%d)\n", val, val);
+		return val;
+	}
+	debug("(not found)\n");
 	return default_val;
 }
 
-- 
1.7.7.3
