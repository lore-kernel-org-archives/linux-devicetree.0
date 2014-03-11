From: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] mfd: Support SiRF audio modules
Date: Tue, 11 Mar 2014 10:36:26 +0800
Message-ID: <1394505387-13665-2-git-send-email-rongjun.ying@csr.com>
References: <1394505387-13665-1-git-send-email-rongjun.ying@csr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394505387-13665-1-git-send-email-rongjun.ying-kQvG35nSl+M@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>

The audio modules consist of an internal audio codec, internal
audio port and i2s controller.

These modules sharing same register address space.
sirf-audio.c provides common regmap mmio handling for all audio modules.
The sound drivers will get regmap from sirf audio mfd driver.

Signed-off-by: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
---
-v2:
1. Fixed a lot of english syntax error
2. Add "OF" depend
3. Get codec compatible from child node of dts
4. Use a standard header

 drivers/mfd/Kconfig            |   10 +++
 drivers/mfd/Makefile           |    1 +
 drivers/mfd/sirf-audio.c       |  128 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/sirf/audio.h |   22 +++++++
 4 files changed, 161 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mfd/sirf-audio.c
 create mode 100644 include/linux/mfd/sirf/audio.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index b7c74a7..d3e79f7 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -546,6 +546,16 @@ config MFD_SI476X_CORE
 	  To compile this driver as a module, choose M here: the
 	  module will be called si476x-core.
 
+config MFD_SIRF_AUDIO
+	tristate "SiRF Audio modules"
+	depends on ARCH_SIRF && OF
+	select MFD_CORE
+	select REGMAP_MMIO
+	help
+	  This is the driver for the SiRF audio modules, which consists of I2S,
+	  internal audio codec, internal audio port and AC97. These modules share
+	  the same address space. So this MFD driver is used to manage the regmap.
+
 config MFD_SM501
 	tristate "Silicon Motion SM501"
 	 ---help---
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 8a28dc9..9182170 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -164,3 +164,4 @@ obj-$(CONFIG_MFD_RETU)		+= retu-mfd.o
 obj-$(CONFIG_MFD_AS3711)	+= as3711.o
 obj-$(CONFIG_MFD_AS3722)	+= as3722.o
 obj-$(CONFIG_MFD_STW481X)	+= stw481x.o
+obj-$(CONFIG_MFD_SIRF_AUDIO)	+= sirf-audio.o
diff --git a/drivers/mfd/sirf-audio.c b/drivers/mfd/sirf-audio.c
new file mode 100644
index 0000000..3bcb198
--- /dev/null
+++ b/drivers/mfd/sirf-audio.c
@@ -0,0 +1,128 @@
+/*
+ * airf-audio.c -- Register map share for all SiRF audio modules
+ *
+ * Copyright (c) 2014 Cambridge Silicon Radio Limited, a CSR plc group company.
+ *
+ * Author: RongJun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/sirf/audio.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+static struct mfd_cell sirf_audio_devs[] = {
+	{
+		.name = "sirf-audio-codec",
+	}, {
+		.of_compatible = "sirf,prima2-i2s",
+		.name = "sirf-i2s",
+	}, {
+		.of_compatible = "sirf,audio-port",
+		.name = "sirf-audio-port",
+	}
+};
+
+static const struct regmap_config sirf_audio_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int sirf_audio_probe(struct platform_device *pdev)
+{
+	struct resource *mem_res;
+	struct sirf_audio_dev *sirf_audio;
+	void __iomem *base;
+	struct regmap *regmap;
+	struct device_node *codec_np;
+	const char *compatible;
+	int cplen;
+	int ret;
+
+	sirf_audio = devm_kzalloc(&pdev->dev, sizeof(*sirf_audio),
+				GFP_KERNEL);
+	if (!sirf_audio)
+		return -ENOMEM;
+
+	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, mem_res);
+	if (!base)
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					    &sirf_audio_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	sirf_audio->regmap = regmap;
+
+	platform_set_drvdata(pdev, sirf_audio);
+
+	codec_np = of_get_child_by_name(pdev->dev.of_node, "audiocodec");
+	if (!codec_np)
+		return -EINVAL;
+
+	compatible = of_get_property(codec_np, "compatible", &cplen);
+	if (!compatible)
+		return -EINVAL;
+
+	/* Overwrite internal codec compatible string */
+	sirf_audio_devs[0].of_compatible = kstrdup(compatible, GFP_KERNEL);
+
+	ret =  mfd_add_devices(&pdev->dev, -1, sirf_audio_devs,
+			ARRAY_SIZE(sirf_audio_devs),
+			NULL, 0, NULL);
+	if (ret) {
+		dev_err(&pdev->dev, "add mfd devices failed: %d\n", ret);
+		goto err_add_devs;
+	}
+
+	return 0;
+
+err_add_devs:
+	kfree(sirf_audio_devs[0].of_compatible);
+	return ret;
+}
+
+static int sirf_audio_remove(struct platform_device *pdev)
+{
+	kfree(sirf_audio_devs[0].of_compatible);
+	mfd_remove_devices(&pdev->dev);
+	return 0;
+}
+
+static const struct of_device_id sirf_audio_of_match[] = {
+	{ .compatible = "sirf,audio", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sirf_audio_of_match);
+
+static struct platform_driver sirf_audio_driver = {
+	.driver = {
+		.name = "sirf-audio",
+		.owner = THIS_MODULE,
+		.of_match_table = sirf_audio_of_match,
+	},
+	.probe = sirf_audio_probe,
+	.remove = sirf_audio_remove,
+};
+
+module_platform_driver(sirf_audio_driver);
+
+MODULE_DESCRIPTION("SiRF Audio MFD driver");
+MODULE_AUTHOR("RongJun Ying <Rongjun.Ying-kQvG35nSl+M@public.gmane.org>");
+MODULE_LICENSE("GPL v2");
+
diff --git a/include/linux/mfd/sirf/audio.h b/include/linux/mfd/sirf/audio.h
new file mode 100644
index 0000000..f010466
--- /dev/null
+++ b/include/linux/mfd/sirf/audio.h
@@ -0,0 +1,22 @@
+/*
+ * audio.h -- Provide a struct to share the regmap to all child drivers
+ *
+ * Copyright (c) 2014 Cambridge Silicon Radio Limited, a CSR plc group company.
+ *
+ * Author: RongJun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ */
+
+#ifndef __MFD_SIRF_AUDIO_H
+#define __MFD_SIRF_AUDIO_H
+
+struct sirf_audio_dev {
+	struct regmap *regmap;
+};
+
+#endif /* __MFD_SIRF_AUDIO_H */
-- 
1.7.5.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
