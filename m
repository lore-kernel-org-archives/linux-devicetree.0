Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A885FCA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CB2021872
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0acZyZn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388822AbfJVLrL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 07:47:11 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:54425 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387977AbfJVLrK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 07:47:10 -0400
Received: by mail-pg1-f201.google.com with SMTP id b128so789138pga.21
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=s0s8xkCRDoETkGIRm0ElT2FwVj33VJZ3cTstMqIB3IM=;
        b=I0acZyZn7Xa5n4obt1qg6joAIwyf9eiBWk/mW3Nlwg9fcmVvcxkuhvFIyFjP6M92dr
         QdJzMn7/AX2f9zcQntoB5Zkse6Pu+SHBIjb00x3UrLLdWyJg6s2YtB6Fu8qunSioqb/2
         Gycr9cOufMmEc1mn0DSCnsqeWMDvVDc+hZAs/QE9Hp5twycxtJjudehRrb6hEYsFYlXK
         b6yZtGFAEbG3wzWfdNZ4BbfoJEL6PWqgncjY6r2NSDEh+PAPI6wEZdcKJV8BsAcfVWWV
         Bup7DNuh9H23t+2obXziuAUtbntup0JtzB239+cUjg0vNJvV5MsMM7DfaO8j6ficqge6
         lF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=s0s8xkCRDoETkGIRm0ElT2FwVj33VJZ3cTstMqIB3IM=;
        b=gnFuRuo52HRjgef4wtv/g7l3mhbmtzPBiq07nnLEdmNM5IJIq5zLVdUGS9HAap+y16
         VmYRutobz3zRupycbuBFuzC6oC3ZGmks7xrEvSDBc3zxHzyfgJmBKNEMbNIQkWQIPn/k
         IBDF2h4sSyXBH0l7Q4bB/IEeAY+kdFsdj3yMhOzNMBPdryVRk8gMmDjvQTZn/jXHn1r9
         ZOfy1GUcubJGEqQUvgCwSf+ZWfn43oyMcP0crR7+Pp9hQMdSnZ8ETdclIRviJoNNoENC
         Wyf+DMMxMY1yYM3v4dIEPMfhuHZS1E9ouIdd82sPOqUBsawnZLtgyLDTCYZxbmb3Yqtn
         7KNw==
X-Gm-Message-State: APjAAAUVao8bjCFbuPMFyCvie/wK4zJQtthwlcqNRusouLYEDId4hUOV
        fWc0Hb/BivAsqagrbEPO5xTiIr0IdjSd
X-Google-Smtp-Source: APXvYqy9VizXIvEY2o6/3SHowrevaAyupW9XltTdBSGcXmWEmoUxzrtIaUakSyVtkK+jhJd4Wuu1Vf6Qx09o
X-Received: by 2002:a63:8f41:: with SMTP id r1mr3124518pgn.83.1571744829991;
 Tue, 22 Oct 2019 04:47:09 -0700 (PDT)
Date:   Tue, 22 Oct 2019 19:45:04 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.5.I8247fd099947a7a67ac86479b9972ea98272f547@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 5/6] drm: bridge: it6505: report connector status
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

When a connector connected or disconnected, report the jack status.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 39 +++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1d19184d2056..645d7947acc2 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -180,6 +180,10 @@ struct it6505 {
 	bool powered;
 	/* it6505 driver hold option */
 	unsigned int drv_hold;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
+	enum drm_connector_status last_connector_status;
 };
 
 static const struct regmap_range it6505_bridge_volatile_ranges[] = {
@@ -882,15 +886,31 @@ static const struct drm_connector_helper_funcs it6505_connector_helper_funcs = {
 	.get_modes = it6505_get_modes,
 };
 
+static void it6505_update_plugged_status(struct it6505 *it6505,
+					 enum drm_connector_status status)
+{
+	if (it6505->plugged_cb && it6505->codec_dev)
+		it6505->plugged_cb(it6505->codec_dev,
+				   status == connector_status_connected);
+}
+
 static enum drm_connector_status it6505_detect(struct drm_connector *connector,
 					       bool force)
 {
 	struct it6505 *it6505 = connector_to_it6505(connector);
+	enum drm_connector_status status;
 
 	if (gpiod_get_value(it6505->pdata.gpiod_hpd))
-		return connector_status_disconnected;
+		status = connector_status_disconnected;
+	else
+		status = connector_status_connected;
+
+	if (status != it6505->last_connector_status) {
+		it6505->last_connector_status = status;
+		it6505_update_plugged_status(it6505, status);
+	}
 
-	return connector_status_connected;
+	return status;
 }
 
 static const struct drm_connector_funcs it6505_connector_funcs = {
@@ -1341,10 +1361,23 @@ static void it6505_audio_shutdown(struct device *dev, void *data)
 	it6505->en_audio = 0;
 }
 
+static int it6505_audio_hook_plugged_cb(struct device *dev, void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
+{
+	struct it6505 *it6505 = data;
+
+	it6505->plugged_cb = fn;
+	it6505->codec_dev = codec_dev;
+	it6505_update_plugged_status(it6505, it6505->last_connector_status);
+	return 0;
+}
+
 static const struct hdmi_codec_ops it6505_audio_codec_ops = {
 	.hw_params = it6505_audio_hw_params,
 	.trigger = it6505_audio_trigger,
 	.audio_shutdown = it6505_audio_shutdown,
+	.hook_plugged_cb = it6505_audio_hook_plugged_cb,
 };
 
 static int it6505_register_audio_driver(struct device *dev)
@@ -1354,6 +1387,7 @@ static int it6505_register_audio_driver(struct device *dev)
 		.ops = &it6505_audio_codec_ops,
 		.max_i2s_channels = 8,
 		.i2s = 1,
+		.data = it6505,
 	};
 	struct platform_device *pdev;
 
@@ -1364,6 +1398,7 @@ static int it6505_register_audio_driver(struct device *dev)
 		return PTR_ERR(pdev);
 
 	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+	it6505->last_connector_status = connector_status_disconnected;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
 	return 0;
-- 
2.23.0.866.gb869b98d4c-goog

