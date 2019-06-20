Return-Path: <SRS0=S4YW=UT=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: madera: Add DT bindings for Cirrus Logic Madera codecs" to the asoc tree
In-Reply-To: <20190619134159.23580-1-ckeepax@opensource.cirrus.com>
Message-Id: <20190620133226.399B4440046@finisterre.sirena.org.uk>
Date: Thu, 20 Jun 2019 14:32:26 +0100 (BST)
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org, lee.jones@linaro.org, lgirdwood@gmail.comMarkBrownbroonie@kernel.org, mark.rutland@arm.com, patches@opensource.cirrus.com, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   ASoC: madera: Add DT bindings for Cirrus Logic Madera codecs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From f0b1f5f08dfbc043fb3759a3ed6d0a249d55e8ec Mon Sep 17 00:00:00 2001
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Date: Wed, 19 Jun 2019 14:41:55 +0100
Subject: [PATCH] ASoC: madera: Add DT bindings for Cirrus Logic Madera codecs

The Cirrus Logic Madera codecs are a family of related codecs with
extensive digital and analogue I/O, digital mixing and routing,
signal processing and programmable DSPs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/madera.txt      | 67 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 include/dt-bindings/sound/madera.h            | 29 ++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/madera.txt
 create mode 100644 include/dt-bindings/sound/madera.h

diff --git a/Documentation/devicetree/bindings/sound/madera.txt b/Documentation/devicetree/bindings/sound/madera.txt
new file mode 100644
index 000000000000..5e669ce552f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/madera.txt
@@ -0,0 +1,67 @@
+Cirrus Logic Madera class audio codecs
+
+This describes audio configuration bindings for these codecs.
+
+See also the core bindings for the parent MFD driver:
+See Documentation/devicetree/bindings/mfd/madera.txt
+
+and defines for values used in these bindings:
+include/dt-bindings/sound/madera.h
+
+These properties are all contained in the parent MFD node.
+
+Optional properties:
+  - cirrus,dmic-ref : Indicates how the MICBIAS pins have been externally
+    connected to DMICs on each input, one cell per input.
+    <IN1 IN2 IN3 ...>
+    A value of 0 indicates MICVDD and is the default, other values depend on the
+    codec:
+    For CS47L35 one of the CS47L35_DMIC_REF_xxx values
+    For all other codecs one of the MADERA_DMIC_REF_xxx values
+    Also see the datasheet for a description of the INn_DMIC_SUP field.
+
+  - cirrus,inmode : A list of input mode settings for each input. A maximum of
+    16 cells, with four cells per input in the order INnAL, INnAR INnBL INnBR.
+    For non-muxed inputs the first two cells for that input set the mode for
+    the left and right channel and the second two cells must be 0.
+    For muxed inputs the first two cells for that input set the mode of the
+    left and right A inputs and the second two cells set the mode of the left
+    and right B inputs.
+    Valid mode values are one of the MADERA_INMODE_xxx. If the array is shorter
+    than the number of inputs the unspecified inputs default to
+    MADERA_INMODE_DIFF.
+
+  - cirrus,out-mono : Mono bit for each output, maximum of six cells if the
+    array is shorter outputs will be set to stereo.
+
+  - cirrus,max-channels-clocked : Maximum number of channels that I2S clocks
+    will be generated for. Useful when clock master for systems where the I2S
+    bus has multiple data lines.
+    One cell for each AIF, use a value of zero for AIFs that should be handled
+    normally.
+
+  - cirrus,pdm-fmt : PDM speaker data format, must contain 2 cells
+    (OUT5 and OUT6). See the PDM_SPKn_FMT field in the datasheet for a
+    description of this value.
+    The second cell is ignored for codecs that do not have OUT6.
+
+  - cirrus,pdm-mute : PDM mute format, must contain 2 cells
+    (OUT5 and OUT6). See the PDM_SPKn_CTRL_1 register in the datasheet for a
+    description of this value.
+    The second cell is ignored for codecs that do not have OUT6.
+
+Example:
+
+cs47l35@0 {
+	compatible = "cirrus,cs47l35";
+
+	cirrus,dmic-ref = <0 0 CS47L35_DMIC_REF_MICBIAS1B 0>;
+	cirrus,inmode = <
+		MADERA_INMODE_DMIC MADERA_INMODE_DMIC /* IN1A digital */
+		MADERA_INMODE_SE   MADERA_INMODE_SE   /* IN1B single-ended */
+		MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN2 differential */
+		0 0 	/* not used on this codec */
+	>;
+	cirrus,out-mono = <0 0 0 0 0 0>;
+	cirrus,max-channels-clocked = <2 0 0>;
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index b3d686fba562..c35d1f72bc73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3915,6 +3915,7 @@ W:	https://github.com/CirrusLogic/linux-drivers/wiki
 S:	Supported
 F:	Documentation/devicetree/bindings/mfd/madera.txt
 F:	Documentation/devicetree/bindings/pinctrl/cirrus,madera-pinctrl.txt
+F:	include/dt-bindings/sound/madera*
 F:	include/linux/irqchip/irq-madera*
 F:	include/linux/mfd/madera/*
 F:	drivers/gpio/gpio-madera*
diff --git a/include/dt-bindings/sound/madera.h b/include/dt-bindings/sound/madera.h
new file mode 100644
index 000000000000..9ff4eae5259b
--- /dev/null
+++ b/include/dt-bindings/sound/madera.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Device Tree defines for Madera codecs
+ *
+ * Copyright (C) 2016-2017 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef DT_BINDINGS_SOUND_MADERA_H
+#define DT_BINDINGS_SOUND_MADERA_H
+
+#define MADERA_INMODE_DIFF		0
+#define MADERA_INMODE_SE		1
+#define MADERA_INMODE_DMIC		2
+
+#define MADERA_DMIC_REF_MICVDD		0
+#define MADERA_DMIC_REF_MICBIAS1	1
+#define MADERA_DMIC_REF_MICBIAS2	2
+#define MADERA_DMIC_REF_MICBIAS3	3
+
+#define CS47L35_DMIC_REF_MICBIAS1B	1
+#define CS47L35_DMIC_REF_MICBIAS2A	2
+#define CS47L35_DMIC_REF_MICBIAS2B	3
+
+#endif
-- 
2.20.1
