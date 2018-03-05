Return-Path: <SRS0=9mlS=F3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36627 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751486AbeCEQud (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Mar 2018 11:50:33 -0500
Received: by mail-wm0-f65.google.com with SMTP id 188so16828515wme.1
        for <devicetree@vger.kernel.org>; Mon, 05 Mar 2018 08:50:33 -0800 (PST)
Received: from [198.90.202.87] ([5.172.152.52])
        by smtp.gmail.com with ESMTPSA id d23sm8648328wma.20.2018.03.05.08.50.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Mar 2018 08:50:31 -0800 (PST)
Reply-To: Lucas Tanure <tanure@linux.com>
From: Lucas Tanure <tanure@linux.com>
Subject: Device tree overlay properties order issue
Message-ID: <52dae8af-e2a7-0141-61a0-b016dbcb25e3@linux.com>
Date: Mon, 5 Mar 2018 16:50:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

I'm working with Raspberry Pi 3 and overlays.
I'm seeing one issue with overlays, that I don't see with normal device 
trees.

Using the attached patch with Rpi 4.9 kernel and loading 
dts-test-overlay.dts,
the order that my machine driver reads properties "cpu-codec" is the 
opposite
of what I is specified on dts.

[    4.558259] dts-test-order soc:sound: dts_test_probe
[    4.558275] dts-test-order soc:sound: Dai Name cpu-codec1
[    4.558284] dts-test-order soc:sound: Dai Name cpu-codec0

Just for testing, commenting out drivers/of/fdt.c , line 451, did make 
the order be
the same as dts file.
Looking at the history of the code in that area it appears that it was 
actually trying
to preserve the order of sub-nodes, but for some reason it no longer 
works for
overlays on raspberry pi.

     /*
      * Reverse the child list. Some drivers assumes node order matches .dts
      * node order
      */
     if (!dryrun)
         reverse_nodes(root);

This is a issue with overlays or I'm missing something ?

Thanks
Lucas

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
  arch/arm/boot/dts/overlays/Makefile             |  1 +
  arch/arm/boot/dts/overlays/dts-test-overlay.dts | 19 ++++++++++++
  arch/arm/configs/bcm2709_defconfig              |  1 +
  sound/soc/cirrus/Kconfig                        |  3 ++
  sound/soc/cirrus/Makefile                       |  3 ++
  sound/soc/cirrus/dts-test.c                     | 40 
+++++++++++++++++++++++++
  6 files changed, 67 insertions(+)
  create mode 100644 arch/arm/boot/dts/overlays/dts-test-overlay.dts
  create mode 100644 sound/soc/cirrus/dts-test.c

diff --git a/arch/arm/boot/dts/overlays/Makefile 
b/arch/arm/boot/dts/overlays/Makefile
index e99392ca95f9..a6b78c3a513c 100644
--- a/arch/arm/boot/dts/overlays/Makefile
+++ b/arch/arm/boot/dts/overlays/Makefile
@@ -17,6 +17,7 @@ dtbo-$(CONFIG_ARCH_BCM2835) += \
      audioinjector-wm8731-audio.dtbo \
      audremap.dtbo \
      bmp085_i2c-sensor.dtbo \
+    dts-test.dtbo \
      dht11.dtbo \
      dionaudio-loco.dtbo \
      dionaudio-loco-v2.dtbo \
diff --git a/arch/arm/boot/dts/overlays/dts-test-overlay.dts 
b/arch/arm/boot/dts/overlays/dts-test-overlay.dts
new file mode 100644
index 000000000000..e6c91c1fc5a4
--- /dev/null
+++ b/arch/arm/boot/dts/overlays/dts-test-overlay.dts
@@ -0,0 +1,19 @@
+/dts-v1/;
+/plugin/;
+
+/{
+    compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
+
+    fragment@0 {
+        target = <&sound>;
+        __overlay__ {
+            status = "okay";
+            compatible = "dts,test-order";
+
+            cpu-codec0 {
+            };
+            cpu-codec1 {
+            };
+        };
+    };
+};
diff --git a/arch/arm/configs/bcm2709_defconfig 
b/arch/arm/configs/bcm2709_defconfig
index 281f1381b9b3..d7ff1e89742b 100644
--- a/arch/arm/configs/bcm2709_defconfig
+++ b/arch/arm/configs/bcm2709_defconfig
@@ -1348,3 +1348,4 @@ CONFIG_CRYPTO_SHA1_ARM_NEON=m
  CONFIG_CRYPTO_AES_ARM_BS=m
  CONFIG_CRC_ITU_T=y
  CONFIG_LIBCRC32C=y
+CONFIG_SND_SOC_DTS_TEST=m
diff --git a/sound/soc/cirrus/Kconfig b/sound/soc/cirrus/Kconfig
index c7cd60f009e9..d981c054e171 100644
--- a/sound/soc/cirrus/Kconfig
+++ b/sound/soc/cirrus/Kconfig
@@ -41,3 +41,6 @@ config SND_EP93XX_SOC_EDB93XX
      help
        Say Y or M here if you want to add support for I2S audio on the
        Cirrus Logic EDB93xx boards.
+
+config SND_SOC_DTS_TEST
+    tristate "Device Tree Order Test"
diff --git a/sound/soc/cirrus/Makefile b/sound/soc/cirrus/Makefile
index 5514146cbdf0..436f1974cd2e 100644
--- a/sound/soc/cirrus/Makefile
+++ b/sound/soc/cirrus/Makefile
@@ -15,3 +15,6 @@ snd-soc-edb93xx-objs                := edb93xx.o
  obj-$(CONFIG_SND_EP93XX_SOC_SNAPPERCL15)    += snd-soc-snappercl15.o
  obj-$(CONFIG_SND_EP93XX_SOC_SIMONE)        += snd-soc-simone.o
  obj-$(CONFIG_SND_EP93XX_SOC_EDB93XX)        += snd-soc-edb93xx.o
+
+snd-soc-dts-test-objs                := dts-test.o
+obj-$(CONFIG_SND_SOC_DTS_TEST)            += snd-soc-dts-test.o
diff --git a/sound/soc/cirrus/dts-test.c b/sound/soc/cirrus/dts-test.c
new file mode 100644
index 000000000000..fe7a5099a005
--- /dev/null
+++ b/sound/soc/cirrus/dts-test.c
@@ -0,0 +1,40 @@
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+static int dts_test_probe(struct platform_device *pdev)
+{
+    struct device_node *dai;
+    struct device_node *np = pdev->dev.of_node;
+
+    dev_info(&pdev->dev,"dts_test_probe\n");
+    for_each_child_of_node(np, dai) {
+        dev_info(&pdev->dev,"Dai Name %s\n", dai->name);
+    }
+    return 0;
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id dts_test_of_match[] = {
+    { .compatible = "dts,test-order", },
+    {},
+};
+MODULE_DEVICE_TABLE(of, dts_test_of_match);
+#endif /* CONFIG_OF */
+
+static struct platform_driver dts_test_driver = {
+    .driver        = {
+        .name    = "dts-test-order",
+        .owner    = THIS_MODULE,
+        .of_match_table = of_match_ptr(dts_test_of_match),
+    },
+
+    .probe        = dts_test_probe,
+};
+
+module_platform_driver(dts_test_driver);
+
+MODULE_DESCRIPTION("Device Order Test");
+MODULE_AUTHOR("Lucas Tanure <tanure@linux.com>");
+MODULE_LICENSE("GPL");
-- 
2.11.0


