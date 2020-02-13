Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208B3C3B18C
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1761218AC
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OcbaJySh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387524AbgBMPw3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 10:52:29 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56034 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbgBMPwU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 10:52:20 -0500
Received: by mail-wm1-f67.google.com with SMTP id q9so6799151wmj.5
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 07:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tveyt6J2X+uabgEQ/mj5bAqqccazTsWZH5vIdnttJSg=;
        b=OcbaJyShdx1CRYbEg0P7r6/7tU4ttgaXvOw6dIVStzuNDwuKZO9sZNgWdCK71k8pFE
         b5WfunilEzaZF/54lgN1xTSDCi8dtm+WwiyEoWeHJHdRbKu65sCJehSgDxSqLMjvjIlW
         yX4Kb7FqQFH/cos/EMvelQGbB1mLmMkYqpS6OhqmmuPN0Z8Gp+qcUKe1i0bEKveAIsJH
         Tn4kkGKR82GtzFUa5hRT5YyorS9UTW3iFMnyNpPKh04AdbXI9l7uGBrm917etxPjNnMP
         SrcIGXWJ6tWyHuSv7aCiQSbNuq+b9jHF0ozI3VdqXAbEAq8WkGyb1R7X62iKuS6GDHwG
         6NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tveyt6J2X+uabgEQ/mj5bAqqccazTsWZH5vIdnttJSg=;
        b=HPAkVSNNjtUJx1B+8FZHoPuXb8e1p4+1UjrLRsCi/yQFj+opOUMiI1ByH7Qpl5K1rZ
         tH9jn1lUheMSzB+651POqrIcR+ZW9I+EmJbda1ANApuFgRzXc4J8O+Z8b3BZdz391REY
         XdPEzhjU6pjXcI+GzFUM/LyObb6Tb1EY3rT7jcTRT+87DjEZl6Wz38Fb5Ppp5OIKDov4
         n9C3WYVdKYTNgmPgr17+F4puR+8ehpWK4LjupvgxBybj7GYwghgBZHZx9+6FPPP4JYDU
         WS5aGUwQFw+dhi1UbBaxf5/22lvWQEmZxuuoakpYX7ZCfCy3iOiv/Dg6NI8pC3QiSENI
         Fz/w==
X-Gm-Message-State: APjAAAXli56oKESe9LDVR8cU4TO+8ZAPZJZkUadWWG27W3Qcvzbjw1P+
        jZhamhKI2fTtboC7tGvACT21Mg==
X-Google-Smtp-Source: APXvYqwA041IWnaiiF8p6WaNGCtAIMpLGWSuvS9KZogSxJnR7PyvLosI31gLD3ccOvYkV2nUj2AC7g==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr6783621wmi.118.1581609136778;
        Thu, 13 Feb 2020 07:52:16 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 07:52:16 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 9/9] ASoC: meson: gx: add sound card support
Date:   Thu, 13 Feb 2020 16:51:59 +0100
Message-Id: <20200213155159.3235792-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the sound card used on the amlogic GX SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig   |   7 ++
 sound/soc/meson/Makefile  |   2 +
 sound/soc/meson/gx-card.c | 141 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 sound/soc/meson/gx-card.c

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 347fa78e309a..22d2af75b59e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -101,6 +101,13 @@ config SND_MESON_CARD_UTILS
 config SND_MESON_CODEC_GLUE
 	tristate
 
+config SND_MESON_GX_SOUND_CARD
+	tristate "Amlogic GX Sound Card Support"
+	select SND_MESON_CARD_UTILS
+	imply SND_MESON_AIU
+	help
+	  Select Y or M to add support for the GXBB/GXL SoC sound card
+
 config SND_MESON_G12A_TOHDMITX
 	tristate "Amlogic G12A To HDMI TX Control Support"
 	select REGMAP_MMIO
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index bef2b72fd7a7..f9c90c391498 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -21,6 +21,7 @@ snd-soc-meson-axg-spdifout-objs := axg-spdifout.o
 snd-soc-meson-axg-pdm-objs := axg-pdm.o
 snd-soc-meson-card-utils-objs := meson-card-utils.o
 snd-soc-meson-codec-glue-objs := meson-codec-glue.o
+snd-soc-meson-gx-sound-card-objs := gx-card.o
 snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
@@ -37,4 +38,5 @@ obj-$(CONFIG_SND_MESON_AXG_SPDIFOUT) += snd-soc-meson-axg-spdifout.o
 obj-$(CONFIG_SND_MESON_AXG_PDM) += snd-soc-meson-axg-pdm.o
 obj-$(CONFIG_SND_MESON_CARD_UTILS) += snd-soc-meson-card-utils.o
 obj-$(CONFIG_SND_MESON_CODEC_GLUE) += snd-soc-meson-codec-glue.o
+obj-$(CONFIG_SND_MESON_GX_SOUND_CARD) += snd-soc-meson-gx-sound-card.o
 obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
new file mode 100644
index 000000000000..7b01dcb73e5e
--- /dev/null
+++ b/sound/soc/meson/gx-card.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "meson-card.h"
+
+struct gx_dai_link_i2s_data {
+	unsigned int mclk_fs;
+};
+
+/*
+ * Base params for the codec to codec links
+ * Those will be over-written by the CPU side of the link
+ */
+static const struct snd_soc_pcm_stream codec_params = {
+	.formats = SNDRV_PCM_FMTBIT_S24_LE,
+	.rate_min = 5525,
+	.rate_max = 192000,
+	.channels_min = 1,
+	.channels_max = 8,
+};
+
+static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct gx_dai_link_i2s_data *be =
+		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
+
+	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
+}
+
+static const struct snd_soc_ops gx_card_i2s_be_ops = {
+	.hw_params = gx_card_i2s_be_hw_params,
+};
+
+static int gx_card_parse_i2s(struct snd_soc_card *card,
+			     struct device_node *node,
+			     int *index)
+{
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai_link *link = &card->dai_link[*index];
+	struct gx_dai_link_i2s_data *be;
+
+	/* Allocate i2s link parameters */
+	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
+	if (!be)
+		return -ENOMEM;
+	priv->link_data[*index] = be;
+
+	/* Setup i2s link */
+	link->ops = &gx_card_i2s_be_ops;
+	link->dai_fmt = meson_card_parse_daifmt(node, link->cpus->of_node);
+
+	of_property_read_u32(node, "mclk-fs", &be->mclk_fs);
+
+	return 0;
+}
+
+static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
+				char *match)
+{
+	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
+		if (strstr(c->dai_name, match))
+			return 1;
+	}
+
+	/* dai not matched */
+	return 0;
+}
+
+static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
+			    int *index)
+{
+	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
+	struct snd_soc_dai_link_component *cpu;
+	int ret;
+
+	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
+	if (!cpu)
+		return -ENOMEM;
+
+	dai_link->cpus = cpu;
+	dai_link->num_cpus = 1;
+
+	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
+				   &dai_link->cpus->dai_name);
+	if (ret)
+		return ret;
+
+	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
+		ret = meson_card_set_fe_link(card, dai_link, np, true);
+	else
+		ret = meson_card_set_be_link(card, dai_link, np);
+
+	if (ret)
+		return ret;
+
+	/* Check if the cpu is the i2s encoder and parse i2s data */
+	if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		ret = gx_card_parse_i2s(card, np, index);
+
+	/* Or apply codec to codec params if necessary */
+	else if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL"))
+		dai_link->params = &codec_params;
+
+	return ret;
+}
+
+static const struct meson_card_match_data gx_card_match_data = {
+	.add_link = gx_card_add_link,
+};
+
+static const struct of_device_id gx_card_of_match[] = {
+	{
+		.compatible = "amlogic,gx-sound-card",
+		.data = &gx_card_match_data,
+	}, {}
+};
+MODULE_DEVICE_TABLE(of, gx_card_of_match);
+
+static struct platform_driver gx_card_pdrv = {
+	.probe = meson_card_probe,
+	.remove = meson_card_remove,
+	.driver = {
+		.name = "gx-sound-card",
+		.of_match_table = gx_card_of_match,
+	},
+};
+module_platform_driver(gx_card_pdrv);
+
+MODULE_DESCRIPTION("Amlogic GX ALSA machine driver");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.24.1

