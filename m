Return-Path: <SRS0=gY8B=4F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB854C7619F
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 09:20:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B310A20801
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 09:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jRUI4paO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgBQJUc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Feb 2020 04:20:32 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36483 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbgBQJUc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Feb 2020 04:20:32 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so17555284wma.1
        for <devicetree@vger.kernel.org>; Mon, 17 Feb 2020 01:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eUz2G04Bb89tsKE0msFkZ9blTmeu3DgvQbssg5zQwVU=;
        b=jRUI4paOxqTsdkPUlKyQza5/FpjH5wFiT0l/DFu9r7BUgb5pGXIndS5vpdCLOkBORf
         Iw+TAURuUy2azNJ5jTx10V/NAz11y/TrDoYRIxoeYulS/whZYSte8nrQQIQ4M4tljIlR
         pY+9l2bv/3db1tfrEDEwqJTo83NafxBBIqp/n5hD70GxBtSbrgc42/kigzd3koASPoWg
         lo6X9DGrQnQTFf936OV0/inNqQ9bMc9UApXK58C//1tqFBjEmbRBjWcmPxEZGOy8auim
         MwgHdRDNZmNQ1gq8FfvGBfXsZxE7f8Rdswb4B5H9Gl7VpXYwXcQtG/ZjnOPJB/MzlxPW
         CAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eUz2G04Bb89tsKE0msFkZ9blTmeu3DgvQbssg5zQwVU=;
        b=ASkhZob7xvT9tzox4CMWR33QGgEP6ad5iMED7nW+xPsE+OOKtC7oOK5lO2YzzvtWJ4
         wGSwoXDJMgsH2tyUpwDk5RDaUSneSziem3QRancfqI1WK2ldWwqIXaK75258jzHNQcLf
         H6SdefBhXjT/D7Ds9ribep48PwE1zq4ohWbhHRhCkw1/SC/c+TJyn/sgbyLW+KEaWytt
         dQC4IZHkE9CimXBEzDpRhFnvJJVDSTF1VH6iVpnpzq6eRooyfZ4ES+BkiHY4FMGLq1WE
         v4814ZNfSIHSkSf1WTvgp5iCKd8aKuaBqQ3EhkdUvveiD0PNTAdbCOYr5WrXTM4gXMgF
         43TQ==
X-Gm-Message-State: APjAAAXMOjDmA5Vr0d2yaJxfePo1xFRPvL2t8jMaEqMzI0D7R7oj0Od2
        29s258FeyJQOD6NYXvrr9PYQcw==
X-Google-Smtp-Source: APXvYqzW2Cgw9zR9wxV2rpAUJf7+def0ERox9GI5jHN5hfn2bae9qIgwbWg171C1Ty1FYR9HcduUeQ==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr22297831wmg.13.1581931229174;
        Mon, 17 Feb 2020 01:20:29 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v14sm67373wrm.28.2020.02.17.01.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 01:20:28 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] ASoC: meson: aiu: simplify component addition
Date:   Mon, 17 Feb 2020 10:20:19 +0100
Message-Id: <20200217092019.433402-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Now that the component name is unique within ASoC, there is no need to
hack the debugfs prefix to add more than one ASoC component to a linux
device. Remove the unnecessary function and use
snd_soc_register_component() directly.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c |  7 +++----
 sound/soc/meson/aiu-codec-ctrl.c  |  7 +++----
 sound/soc/meson/aiu.c             | 20 --------------------
 sound/soc/meson/aiu.h             |  8 --------
 4 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index b8e88b1a4fc8..7078197e0cc5 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -197,8 +197,7 @@ static const struct snd_soc_component_driver aiu_acodec_ctrl_component = {
 
 int aiu_acodec_ctrl_register_component(struct device *dev)
 {
-	return aiu_add_component(dev, &aiu_acodec_ctrl_component,
-				 aiu_acodec_ctrl_dai_drv,
-				 ARRAY_SIZE(aiu_acodec_ctrl_dai_drv),
-				 "acodec");
+	return snd_soc_register_component(dev, &aiu_acodec_ctrl_component,
+					  aiu_acodec_ctrl_dai_drv,
+					  ARRAY_SIZE(aiu_acodec_ctrl_dai_drv));
 }
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 8646a953e3b3..4b773d3e8b07 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -144,9 +144,8 @@ static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
 
 int aiu_hdmi_ctrl_register_component(struct device *dev)
 {
-	return aiu_add_component(dev, &aiu_hdmi_ctrl_component,
-				 aiu_hdmi_ctrl_dai_drv,
-				 ARRAY_SIZE(aiu_hdmi_ctrl_dai_drv),
-				 "hdmi");
+	return snd_soc_register_component(dev, &aiu_hdmi_ctrl_component,
+					  aiu_hdmi_ctrl_dai_drv,
+					  ARRAY_SIZE(aiu_hdmi_ctrl_dai_drv));
 }
 
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 34b40b8b8299..d3e2d40e9562 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -71,26 +71,6 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 	return 0;
 }
 
-int aiu_add_component(struct device *dev,
-		      const struct snd_soc_component_driver *component_driver,
-		      struct snd_soc_dai_driver *dai_drv,
-		      int num_dai,
-		      const char *debugfs_prefix)
-{
-	struct snd_soc_component *component;
-
-	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-
-#ifdef CONFIG_DEBUG_FS
-	component->debugfs_prefix = debugfs_prefix;
-#endif
-
-	return snd_soc_add_component(dev, component, component_driver,
-				     dai_drv, num_dai);
-}
-
 static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,
 				     struct of_phandle_args *args,
 				     const char **dai_name)
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 097c26de7b7c..06a968c55728 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -11,9 +11,7 @@ struct clk;
 struct clk_bulk_data;
 struct device;
 struct of_phandle_args;
-struct snd_soc_component_driver;
 struct snd_soc_dai;
-struct snd_soc_dai_driver;
 struct snd_soc_dai_ops;
 
 enum aiu_clk_ids {
@@ -45,12 +43,6 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 			  const char **dai_name,
 			  unsigned int component_id);
 
-int aiu_add_component(struct device *dev,
-		      const struct snd_soc_component_driver *component_driver,
-		      struct snd_soc_dai_driver *dai_drv,
-		      int num_dai,
-		      const char *debugfs_prefix);
-
 int aiu_hdmi_ctrl_register_component(struct device *dev);
 int aiu_acodec_ctrl_register_component(struct device *dev);
 
-- 
2.24.1

