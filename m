Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF56CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:46:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D971B21872
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:46:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/XhJrE4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388631AbfJVLq4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 07:46:56 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:38212 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387977AbfJVLq4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 07:46:56 -0400
Received: by mail-vk1-f202.google.com with SMTP id s17so1694373vkb.5
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6PvO4YGcBPU7HqTKrAMBpr5jWnrEO6vhCWHVgxtCZF0=;
        b=v/XhJrE4hvhwOzEGcKs+eQoCDnnCj5mUo5POIAosRXGG9AR786k5ivdMEx0u1rAa0G
         6FwQqiAnM4B6RlupEtxMjyDNTPzx34+E+/70eATGUSkjoJ8W8GvCVILVpBm2wwS0OLtF
         FsHUuxV6o+LY4rkICqCZ2pv588XXJ85QW0p3TajaPFxkmYIuxmsJAgn01++mJD7sr8FX
         qQK7k3vaWYUeu/1UDlFrcRHs8lKDl5yseG5047lhqeRkvc7QVEOoMnskxTlBn2dviIYF
         WvDKYhDmT/6v2QcIjvBcyBFdj5zYQORvKyeT9rKwpfGTE+vQjTOHSioHV293JvSx2+5k
         jm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6PvO4YGcBPU7HqTKrAMBpr5jWnrEO6vhCWHVgxtCZF0=;
        b=oTbfiPg1QbEcSP7n55sXnguthwYw+WXxOhnbpQo7EgLPfnI56zBCz/b6KkI8ZQe08P
         cVNiZnK4haAQ08bUMiL6RNXafbC+E4JoDPsnWIVtSkvJ78BtXpeZ43+JyZ2cI8beyjIN
         x263yn21LgasI0PeRej/XzgdVQmfqHX4iPvG9Boq9zjmN+ePDAF/5QpTu3avnDwjmCKg
         Lqb3GjQO2+PJGDaP0UzVgWxO11NYpVMxYeavaxmJn+pcD9TjzVKOnSxk8YwlHeTU17xa
         o+vNaHlcsRwNO69IxX8BR949kdop/usctFZpTJD/MT+kDoHymkDMEspbC4eU0gzcKHzB
         0ttg==
X-Gm-Message-State: APjAAAVTerC+22LdrBCzqD1k+DTr9tjMKfOD0KSsXAGlQRvHBZc0T8zN
        mu4MzJOy7Gby6GMagSogbInziNP48LIX
X-Google-Smtp-Source: APXvYqwY1rlBy1N3hHiRYbjJlOMwfLIOQOq0dmz2amkEN+2rQ4+TI3BcHF+QmqbKwaRye4ZzLeXpjHYP/Bkz
X-Received: by 2002:a67:f2da:: with SMTP id a26mr1534141vsn.60.1571744814867;
 Tue, 22 Oct 2019 04:46:54 -0700 (PDT)
Date:   Tue, 22 Oct 2019 19:45:01 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.2.I66284413ef7dbbf4b6ea7735f71807ebd35bf7e8@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 2/6] drm: bridge: it6505: bridge to hdmi-codec
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net,
        dri-devel@lists.freedesktop.org, allen.chen@ite.com.tw,
        cychiang@google.com, dgreid@google.com, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Allen Chen <allen.chen@ite.com.tw>

Bridge to hdmi-codec to support audio feature.

It is observed that some DP-to-HDMI dongles will get into bad states
if sending InfoFrame without audio data.  Defer to enable it6505's
audio feature when PCM triggers START or RESUME.

Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 152 ++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 5e046f677343..1d19184d2056 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -26,6 +26,8 @@
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 
+#include <sound/hdmi-codec.h>
+
 #define AX 0
 #define BX 1
 #define AUDSEL I2S
@@ -146,6 +148,7 @@ struct it6505 {
 	struct notifier_block event_nb;
 	struct extcon_dev *extcon;
 	struct work_struct extcon_wq;
+	struct delayed_work delayed_audio;
 	enum sys_status status;
 	bool hbr;
 	u8 en_ssc;
@@ -1223,6 +1226,149 @@ static void it6505_set_audio(struct it6505 *it6505)
 	dptxset(it6505, 0xD3, 0x20, 0x00);
 }
 
+static void it6505_delayed_audio(struct work_struct *work)
+{
+	struct it6505 *it6505 = container_of(work, struct it6505,
+					     delayed_audio.work);
+
+	it6505_set_audio(it6505);
+	it6505->en_audio = 1;
+}
+
+static int it6505_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+	unsigned int channel_num = params->cea.channels;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "setting %d Hz, %d bit, %d channels\n",
+			     params->sample_rate, params->sample_width,
+			     channel_num);
+
+	if (!it6505->bridge.encoder)
+		return -ENODEV;
+
+	switch (params->sample_rate) {
+	case 24000:
+		it6505->aud_fs = AUD24K;
+		break;
+	case 32000:
+		it6505->aud_fs = AUD32K;
+		break;
+	case 44100:
+		it6505->aud_fs = AUD44P1K;
+		break;
+	case 48000:
+		it6505->aud_fs = AUD48K;
+		break;
+	case 88200:
+		it6505->aud_fs = AUD88P2K;
+		break;
+	case 96000:
+		it6505->aud_fs = AUD96K;
+		break;
+	case 176400:
+		it6505->aud_fs = AUD176P4K;
+		break;
+	case 192000:
+		it6505->aud_fs = AUD192K;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "sample rate: %d Hz not support",
+				     params->sample_rate);
+		return -EINVAL;
+	}
+
+	switch (params->sample_width) {
+	case 16:
+		it6505->audwordlength = AUD16BIT;
+		break;
+	case 18:
+		it6505->audwordlength = AUD18BIT;
+		break;
+	case 20:
+		it6505->audwordlength = AUD20BIT;
+		break;
+	case 24:
+	case 32:
+		it6505->audwordlength = AUD24BIT;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "wordlength: %d bit not support",
+				     params->sample_width);
+		return -EINVAL;
+	}
+
+	if (channel_num == 0 || channel_num % 2) {
+		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
+				     channel_num);
+		return -EINVAL;
+	}
+	it6505->aud_ch = channel_num;
+
+	return 0;
+}
+
+static int it6505_audio_trigger(struct device *dev, int event)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "event: %d", event);
+	switch (event) {
+	case HDMI_CODEC_TRIGGER_EVENT_START:
+	case HDMI_CODEC_TRIGGER_EVENT_RESUME:
+		queue_delayed_work(system_wq, &it6505->delayed_audio,
+				   msecs_to_jiffies(180));
+		break;
+	case HDMI_CODEC_TRIGGER_EVENT_STOP:
+	case HDMI_CODEC_TRIGGER_EVENT_SUSPEND:
+		cancel_delayed_work(&it6505->delayed_audio);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void it6505_audio_shutdown(struct device *dev, void *data)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	dptxset(it6505, 0xE8, 0x22, 0x00);
+	dptxset(it6505, 0x05, 0x02, 0x02);
+	it6505->en_audio = 0;
+}
+
+static const struct hdmi_codec_ops it6505_audio_codec_ops = {
+	.hw_params = it6505_audio_hw_params,
+	.trigger = it6505_audio_trigger,
+	.audio_shutdown = it6505_audio_shutdown,
+};
+
+static int it6505_register_audio_driver(struct device *dev)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &it6505_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+	};
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
+	return 0;
+}
+
 /***************************************************************************
  * DPCD Read and EDID
  ***************************************************************************/
@@ -2460,6 +2606,12 @@ static int it6505_i2c_probe(struct i2c_client *client,
 		return err;
 	}
 
+	err = it6505_register_audio_driver(dev);
+	if (err < 0) {
+		DRM_DEV_ERROR(dev, "Failed to register audio driver: %d", err);
+		return err;
+	}
+
 	/* Register aux channel */
 	it6505->aux.name = "DP-AUX";
 	it6505->aux.dev = dev;
-- 
2.23.0.866.gb869b98d4c-goog

