From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 13/18] fdt: Add function to return peripheral/clock ID
Date: Tue, 24 Jan 2012 15:21:07 -0800
Message-ID: <1327447272-30182-14-git-send-email-sjg@chromium.org>
References: <1327447272-30182-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327447272-30182-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

A common requirement is to find the clock ID for a peripheral. This is the
second cell of the 'clocks' property (the first being the phandle itself).

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v4:
- Add fdtdec function to return peripheral ID

 include/fdtdec.h |   13 +++++++++++++
 lib/fdtdec.c     |   13 +++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 6c0a2d1..f3115a6 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -272,3 +272,16 @@ int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
  * @return 0 if all ok or gpio was FDT_GPIO_NONE; -1 on error
  */
 int fdtdec_setup_gpio(struct fdt_gpio_state *gpio);
+
+/**
+ * Decode a peripheral ID from a device tree node. This may be a temporary
+ * function depending on what happens with clocks in the Linux fdt.
+ *
+ * This works by looking up the peripheral's 'clocks' node and reading out
+ * the second cell, which is the clock number / peripheral ID.
+ *
+ * @param blob		FDT blob to use
+ * @param node		Node to look at
+ * @return
+ */
+int fdtdec_decode_periph_id(const void *blob, int node);
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index c748cac..f999ed0 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -415,3 +415,16 @@ int fdtdec_setup_gpio(struct fdt_gpio_state *gpio)
 		return -1;
 	return 0;
 }
+
+int fdtdec_decode_periph_id(const void *blob, int node)
+{
+	u32 cell[2];
+	int err;
+
+	err = fdtdec_get_int_array(blob, node, "clocks", cell,
+				   ARRAY_SIZE(cell));
+	if (err)
+		return -1;
+
+	return cell[1];
+}
-- 
1.7.7.3
