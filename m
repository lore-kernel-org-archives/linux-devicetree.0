From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 03/20] fdt: Add basic support for decoding GPIO definitions
Date: Wed, 11 Jan 2012 20:32:52 -0800
Message-ID: <1326342789-5781-4-git-send-email-sjg@chromium.org>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326342789-5781-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

This adds some support into fdtdec for reading GPIO definitions from
the fdt. We permit up to FDT_GPIO_MAX GPIOs in the system. Each GPIO
is of the form:

gpio-function-name = <phandle gpio_num flags>;

where:

phandle is a pointer to the GPIO node
gpio_num is the number of the GPIO (0 to 223)
flags is a flag, as follows:

   bit    meaning
   0      0=polarity normal, 1=active low (inverted)

An example is:

gpio-enable-propounder = <&gpio 43 0>;

which means that GPIO 43 is used to enable the propounder (setting the
GPIO high), or that you can detect that the propounder is enabled by
checking if the GPIO is high (the fdt does not indicate input/output).

Two main functions are provided:

fdtdec_decode_gpio() reads a GPIO property from an fdt node and decodes it
into a structure.

fdtdec_setup_gpio() sets up the GPIO by calling gpio_request for you.

Both functions can cope with the property being missing, which is taken to
mean that that GPIO function is not available or is not needed.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 include/fdtdec.h |   45 +++++++++++++++++++++++++++++++
 lib/fdtdec.c     |   78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 047f603..6c0a2d1 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -61,6 +61,23 @@ enum fdt_compat_id {
 	COMPAT_COUNT,
 };
 
+/* GPIOs are numbered from 0 */
+enum {
+	FDT_GPIO_NONE = -1U,	/* an invalid GPIO used to end our list */
+
+	FDT_GPIO_ACTIVE_LOW = 1 << 0,	/* input is active low (else high) */
+};
+
+/* This is the state of a GPIO pin as defined by the fdt */
+struct fdt_gpio_state {
+	const char *name;	/* name of the fdt property defining this */
+	uint gpio;		/* GPIO number, or FDT_GPIO_NONE if none */
+	u8 flags;		/* FDT_GPIO_... flags */
+};
+
+/* This tells us whether a fdt_gpio_state record is valid or not */
+#define fdt_gpio_isvalid(x) ((x)->gpio != FDT_GPIO_NONE)
+
 /**
  * Find the next numbered alias for a peripheral. This is used to enumerate
  * all the peripherals of a certain type.
@@ -227,3 +244,31 @@ int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
  * @return 1 if the properly is present; 0 if it isn't present
  */
 int fdtdec_get_bool(const void *blob, int node, const char *prop_name);
+
+/**
+ * Decode a single GPIOs from an FDT.
+ *
+ * If the property is not found, then the GPIO structure will still be
+ * initialised, with gpio set to FDT_GPIO_NONE. This makes it easy to
+ * provide optional GPIOs.
+ *
+ * @param blob		FDT blob to use
+ * @param node		Node to look at
+ * @param prop_name	Node property name
+ * @param gpio		gpio elements to fill from FDT
+ * @return 0 if ok, -FDT_ERR_NOTFOUND if the property is missing.
+ */
+int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
+		struct fdt_gpio_state *gpio);
+
+/**
+ * Set up a GPIO pin according to the provided gpio information. At present this
+ * just requests the GPIO.
+ *
+ * If the gpio is FDT_GPIO_NONE, no action is taken. This makes it easy to
+ * deal with optional GPIOs.
+ *
+ * @param gpio		GPIO info to use for set up
+ * @return 0 if all ok or gpio was FDT_GPIO_NONE; -1 on error
+ */
+int fdtdec_setup_gpio(struct fdt_gpio_state *gpio);
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 977528b..f0b2196 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -24,6 +24,9 @@
 #include <libfdt.h>
 #include <fdtdec.h>
 
+/* we need the generic GPIO interface here */
+#include <asm-generic/gpio.h>
+
 DECLARE_GLOBAL_DATA_PTR;
 
 /*
@@ -336,3 +339,78 @@ int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
 	cell = fdt_getprop(blob, node, prop_name, &len);
 	return cell != NULL;
 }
+
+/**
+ * Decode a list of GPIOs from an FDT. This creates a list of GPIOs with no
+ * terminating item.
+ *
+ * @param blob		FDT blob to use
+ * @param node		Node to look at
+ * @param prop_name	Node property name
+ * @param gpio		Array of gpio elements to fill from FDT. This will be
+ *			untouched if either 0 or an error is returned
+ * @param max_count	Maximum number of elements allowed
+ * @return number of GPIOs read if ok, -FDT_ERR_BADLAYOUT if max_count would
+ * be exceeded, or -FDT_ERR_NOTFOUND if the property is missing.
+ */
+static int fdtdec_decode_gpios(const void *blob, int node,
+		const char *prop_name, struct fdt_gpio_state *gpio,
+		int max_count)
+{
+	const struct fdt_property *prop;
+	const u32 *cell;
+	const char *name;
+	int len, i;
+
+	debug("%s: %s\n", __func__, prop_name);
+	assert(max_count > 0);
+	prop = fdt_get_property(blob, node, prop_name, &len);
+	if (!prop) {
+		debug("FDT: %s: property '%s' missing\n", __func__, prop_name);
+		return -FDT_ERR_NOTFOUND;
+	}
+
+	/* We will use the name to tag the GPIO */
+	name = fdt_string(blob, prop->nameoff);
+	cell = (u32 *)prop->data;
+	len /= sizeof(u32) * 3;		/* 3 cells per GPIO record */
+	if (len > max_count) {
+		debug("FDT: %s: too many GPIOs / cells for "
+			"property '%s'\n", __func__, prop_name);
+		return -FDT_ERR_BADLAYOUT;
+	}
+
+	/* Read out the GPIO data from the cells */
+	for (i = 0; i < len; i++, cell += 3) {
+		gpio[i].gpio = fdt32_to_cpu(cell[1]);
+		gpio[i].flags = fdt32_to_cpu(cell[2]);
+		gpio[i].name = name;
+	}
+
+	return len;
+}
+
+int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
+		struct fdt_gpio_state *gpio)
+{
+	int err;
+
+	debug("%s: %s\n", __func__, prop_name);
+	gpio->gpio = FDT_GPIO_NONE;
+	err = fdtdec_decode_gpios(blob, node, prop_name, gpio, 1);
+	return err == 1 ? 0 : err;
+}
+
+int fdtdec_setup_gpio(struct fdt_gpio_state *gpio)
+{
+	/*
+	 * Return success if there is no GPIO defined. This is used for
+	 * optional GPIOs)
+	 */
+	if (!fdt_gpio_isvalid(gpio))
+		return 0;
+
+	if (gpio_request(gpio->gpio, gpio->name))
+		return -1;
+	return 0;
+}
-- 
1.7.7.3
