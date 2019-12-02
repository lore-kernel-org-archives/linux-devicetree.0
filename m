Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31D5C432C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:48:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B93652146E
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="jzhCC5au";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="FZ64G4DL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfLBNsV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 08:48:21 -0500
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:45614
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727436AbfLBNsU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 08:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575294499;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=aUmKR1I7xGJWCJj7CxMrnRk1XrTBCNpoZ6xtTH9cpKY=;
        b=jzhCC5auxtfvijgphegfYP2sVzopXdemJJ2gV3t0NgLwBnz/50n6LDGykMO5KqYI
        tn2GdVJr7oN503q8iDnu43E6uayCfhF8DGJ5RTfGChYVfPl8+0UzvMV6FZxAH08GVkd
        ySmbN8hflMEtPhfyuIioNmvmTwqLaqhd+k6vQPtU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575294499;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=aUmKR1I7xGJWCJj7CxMrnRk1XrTBCNpoZ6xtTH9cpKY=;
        b=FZ64G4DLso8zOtw+pehulyh/GyFpAGdrhqK6psFHeiFRpE6aAfdMpcb8derSxkAr
        tWtfJdaR6hOXaPu/cn5vraz6PqHEdp2d195z0c6AtXdkMLiwNv8N6LxQTW8WpGn4VJ/
        6d0H/jy5JWmWI8g3vaaJE9tejLY7X7/49bwk9y1o=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F39AEC774B7
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=chandanu@codeaurora.org
From:   Chandan Uddaraju <chandanu@codeaurora.org>
To:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        hoegsberg@google.com, dri-devel@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: [DPU PATCH v3 5/5] drm/msm/dpu: add display port support in DPU
Date:   Mon, 2 Dec 2019 13:48:19 +0000
Message-ID: <0101016ec6de7b50-f62da335-aae8-4998-9ed5-dd7034eddfbd-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
X-SES-Outgoing: 2019.12.02-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Jeykumar Sankaran <jsanka@codeaurora.org>

Add display port support in DPU by creating hooks
for DP encoder enumeration and encoder mode
initialization.

This change is based on the SDM845 Display port
driver changes[1].

changes in v2:
	- rebase on [2] (Sean Paul)
	- remove unwanted error checks and
	  switch cases (Jordan Crouse)

[1] https://lwn.net/Articles/768265/
[2] https://lkml.org/lkml/2018/11/17/87

changes in V3:
-- Moved this change as part of the DP driver changes.
-- Addressed compilation issues on the latest code base.

Signed-off-by: Jeykumar Sankaran <jsanka@codeaurora.org>
Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  8 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 65 ++++++++++++++++++++++++-----
 2 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 29ac7d3..f82d990 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2037,7 +2037,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 {
 	int ret = 0;
 	int i = 0;
-	enum dpu_intf_type intf_type;
+	enum dpu_intf_type intf_type = INTF_NONE;
 	struct dpu_enc_phys_init_params phys_params;
 
 	if (!dpu_enc) {
@@ -2059,9 +2059,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	case DRM_MODE_ENCODER_DSI:
 		intf_type = INTF_DSI;
 		break;
-	default:
-		DPU_ERROR_ENC(dpu_enc, "unsupported display interface type\n");
-		return -EINVAL;
+	case DRM_MODE_ENCODER_TMDS:
+		intf_type = INTF_DP;
+		break;
 	}
 
 	WARN_ON(disp_info->num_of_h_tiles < 1);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 6c92f0f..d5c290c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -421,6 +421,33 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	return rc;
 }
 
+static int _dpu_kms_initialize_displayport(struct drm_device *dev,
+					    struct msm_drm_private *priv,
+					    struct dpu_kms *dpu_kms)
+{
+	struct drm_encoder *encoder = NULL;
+	int rc = 0;
+
+	if (!priv->dp)
+		return rc;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for dsi display\n");
+		return PTR_ERR(encoder);;
+	}
+
+	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
+	if (rc) {
+		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	priv->encoders[priv->num_encoders++] = encoder;
+	return rc;
+}
+
 /**
  * _dpu_kms_setup_displays - create encoders, bridges and connectors
  *                           for underlying displays
@@ -433,12 +460,21 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
 {
-	/**
-	 * Extend this function to initialize other
-	 * types of displays
-	 */
+	int rc = 0;
+
+	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize_dsi failed, rc = %d\n", rc);
+		return rc;
+	}
 
-	return _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
+	rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
+		return rc;
+	}
+
+	return rc;
 }
 
 static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
@@ -626,13 +662,20 @@ static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
 	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
 			MSM_DISPLAY_CAP_VID_MODE;
 
-	/* TODO: No support for DSI swap */
-	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-		if (priv->dsi[i]) {
-			info.h_tile_instance[info.num_of_h_tiles] = i;
-			info.num_of_h_tiles++;
+	switch (info.intf_type) {
+	case DRM_MODE_ENCODER_DSI:
+		/* TODO: No support for DSI swap */
+		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+			if (priv->dsi[i]) {
+				info.h_tile_instance[info.num_of_h_tiles] = i;
+				info.num_of_h_tiles++;
+			}
 		}
-	}
+		break;
+	case DRM_MODE_ENCODER_TMDS:
+		info.num_of_h_tiles = 1;
+		break;
+	};
 
 	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
 	if (rc)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

