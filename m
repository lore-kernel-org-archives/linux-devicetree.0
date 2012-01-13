From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/6] fdt: Add debugging to fdtdec_get_int/addr()
Date: Fri, 13 Jan 2012 15:10:51 -0800
Message-ID: <1326496256-5559-2-git-send-email-sjg@chromium.org>
References: <1326496256-5559-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326496256-5559-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The new debugging shows the value of integers and addresses read
from the device tree.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 lib/fdtdec.c |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index f08bfca..5d97e2a 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -77,11 +77,16 @@ fdt_addr_t fdtdec_get_addr(const void *blob, int node,
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
 
@@ -91,10 +96,15 @@ s32 fdtdec_get_int(const void *blob, int node, const char *prop_name,
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
