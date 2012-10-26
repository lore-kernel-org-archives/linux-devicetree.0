From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 09/14] fdt: Add polarity-aware gpio functions to fdtdec
Date: Thu, 25 Oct 2012 19:31:06 -0700
Message-ID: <1351218671-15228-10-git-send-email-sjg@chromium.org>
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
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add get and set gpio functions to fdtdec that take into account the
polarity field in fdtdec_gpio_state.flags.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   16 ++++++++++++++++
 lib/fdtdec.c     |   20 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 12f73a7..17daa99 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -90,6 +90,22 @@ struct fdt_gpio_state {
 #define fdt_gpio_isvalid(x) ((x)->gpio != FDT_GPIO_NONE)
 
 /**
+ * Read the GPIO taking into account the polarity of the pin.
+ *
+ * @param gpio		pointer to the decoded gpio
+ * @return value of the gpio if successful, < 0 if unsuccessful
+ */
+int fdtdec_get_gpio(struct fdt_gpio_state *gpio);
+
+/**
+ * Write the GPIO taking into account the polarity of the pin.
+ *
+ * @param gpio		pointer to the decoded gpio
+ * @return 0 if successful
+ */
+int fdtdec_set_gpio(struct fdt_gpio_state *gpio, int val);
+
+/**
  * Find the next numbered alias for a peripheral. This is used to enumerate
  * all the peripherals of a certain type.
  *
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 6c417d2..91ba558 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -487,6 +487,26 @@ int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
 	return err == 1 ? 0 : err;
 }
 
+int fdtdec_get_gpio(struct fdt_gpio_state *gpio)
+{
+	int val;
+
+	if (!fdt_gpio_isvalid(gpio))
+		return -1;
+
+	val = gpio_get_value(gpio->gpio);
+	return gpio->flags & FDT_GPIO_ACTIVE_LOW ? val ^ 1 : val;
+}
+
+int fdtdec_set_gpio(struct fdt_gpio_state *gpio, int val)
+{
+	if (!fdt_gpio_isvalid(gpio))
+		return -1;
+
+	val = gpio->flags & FDT_GPIO_ACTIVE_LOW ? val ^ 1 : val;
+	return gpio_set_value(gpio->gpio, val);
+}
+
 int fdtdec_setup_gpio(struct fdt_gpio_state *gpio)
 {
 	/*
-- 
1.7.7.3
