From: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nvmem: imx-ocotp: read uniq CPU ID and export as system serial number
Date: Wed,  4 Oct 2017 17:16:16 +0200
Message-ID: <20171004151616.2622-1-marcus.folkesson@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The uniq ID is usually exported as ATAG_SERIAL but in case of
devicetrees, this information is not passed.

The uniq ID is stored in OCOTP memory (bank 0, Word 1,2) on imx CPUs.
Read the ID and set as system serial number.

This function is activated by setting `read-system-serial`
dt property for the imx-ocotp node.

Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Comment:
I'm not sure if this functionality really should be in a device driver.
Maybe it should be in arch/arm/mach-imx/. However, it's not
completely wrong so I give it a shot.

 .../devicetree/bindings/nvmem/imx-ocotp.txt        |  1 +
 drivers/nvmem/imx-ocotp.c                          | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
index 70d791b03ea1..bf0cc9e5e50f 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
@@ -16,6 +16,7 @@ Required properties:
 
 Optional properties:
 - read-only: disable write access
+- read-system-serial: read uniq ID and export as system serial number. Available in /proc/cpuinfo
 
 Example:
 
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 193ca8fd350a..574cab017611 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -28,10 +28,16 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <asm/system_info.h>
 
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
 					       */
+
+/* Uniq ID used for Serial number */
+#define IMX_OCOTP_OFFSET_UID_LOW	(IMX_OCOTP_OFFSET_B0W0 + 0x10)
+#define IMX_OCOTP_OFFSET_UID_HIGH	(IMX_OCOTP_OFFSET_B0W0 + 0x20)
+
 #define IMX_OCOTP_OFFSET_PER_WORD	0x10  /* Offset between the start addr
 					       * of two consecutive OTP words.
 					       */
@@ -298,6 +304,34 @@ static int imx_ocotp_write(void *context, unsigned int offset, void *val,
 	return bytes;
 }
 
+static int imx_ocotp_setserial(struct ocotp_priv *priv)
+{
+	int ret;
+
+	mutex_lock(&ocotp_mutex);
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret < 0) {
+		mutex_unlock(&ocotp_mutex);
+		dev_err(priv->dev, "failed to prepare/enable ocotp clk\n");
+		return ret;
+	}
+
+	ret = imx_ocotp_wait_for_busy(priv->base, 0);
+	if (ret < 0) {
+		dev_err(priv->dev, "timeout during read setup\n");
+		goto out;
+	}
+
+	system_serial_low = readl(priv->base + IMX_OCOTP_OFFSET_UID_LOW);
+	system_serial_high = readl(priv->base + IMX_OCOTP_OFFSET_UID_HIGH);
+
+out:
+	clk_disable_unprepare(priv->clk);
+	mutex_unlock(&ocotp_mutex);
+	return ret;
+}
+
 static struct nvmem_config imx_ocotp_nvmem_config = {
 	.name = "imx-ocotp",
 	.read_only = false,
@@ -352,6 +386,10 @@ static int imx_ocotp_probe(struct platform_device *pdev)
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
+	if (of_property_read_bool(pdev->dev.of_node, "read-system-serial")) {
+		if (!imx_ocotp_setserial(priv))
+			dev_warn(&pdev->dev, "Could not read CPU uniq serial number");
+	}
 	platform_set_drvdata(pdev, nvmem);
 
 	return 0;
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
