Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34820C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 04:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B3D520870
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 04:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FtRQUH5O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgCFEOK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 23:14:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42416 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCFEOJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 23:14:09 -0500
Received: by mail-pg1-f193.google.com with SMTP id h8so453218pgs.9
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 20:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HBQjB4ox8U6+jb9VTlZJwNfTVSaeefy9+hgMvIEjQ6A=;
        b=FtRQUH5OUYVpJqGJFw4pf9BDWO86UmyPSwW6T6ArUmvKy+L8NZMKS69Zd8g6fgHCW6
         0mPP31u/78DXkPHUWk58NTxqvEUigQ2ZUzi57fYwL3Tw0W46bVVBAmEoPQdIec+ubGsw
         uDgYe71S/MAZJ9YwsWGuUpRN4MnSZ34NbGypE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HBQjB4ox8U6+jb9VTlZJwNfTVSaeefy9+hgMvIEjQ6A=;
        b=mj8Wj9kb0ixstp6MwfXqMEtRETc66mPZRPX/UFg5Q8xROupPlm9PTufNwXdTMB+kNl
         1nT0MA0hQ341+rSh1XBdmO5QiMpipdtLOCO6gh8F4WqmIvWJDKhdPY+p9lyGiKhDQWiq
         GVjK3xwjvPZpQTP0ApooWa4vHRe/OpTbvt1fJ5l5sfV4PY7CpO5HKuCjEGMk7HG0DLSZ
         iydDgiOVwKJU9aHtyQG+LPHPr4Zhh7c3nOB653NQtRYlqHjlXEa0qLgwNE4svhPOfqgs
         YgNMOmR26A5kp157FR+wJ+znSXofgcbt4TzXx9M/7QfPjtzhl13s5dIjGNpMzNoGhXE1
         unNg==
X-Gm-Message-State: ANhLgQ3tM3aHUMWNOv9Ujj5OSVGXOWd+BgXqKL7mBG5VarqRA6UBh3CK
        /6o2m/FbH+61KbLbo7Bm+G9+ow==
X-Google-Smtp-Source: ADFU+vsHo4JJ0N0WFqJ3nS6YhRMnj4RG/U8gRhcWvtDaY/ZipOvv4uxKm2K74UZgakBp4IYhT3R3Uw==
X-Received: by 2002:a63:d0b:: with SMTP id c11mr1383026pgl.296.1583468048577;
        Thu, 05 Mar 2020 20:14:08 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id q97sm6295025pja.9.2020.03.05.20.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 20:14:07 -0800 (PST)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Nick Fan <nick.fan@mediatek.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org
Subject: [PATCH v5 4/4] RFC: drm/panfrost: devfreq: Add support for 2 regulators
Date:   Fri,  6 Mar 2020 12:13:45 +0800
Message-Id: <20200306041345.259332-5-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306041345.259332-1-drinkcat@chromium.org>
References: <20200306041345.259332-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
devfreq, and provides OPP table with 2 sets of voltages.

TODO: This is incomplete as we'll need add support for setting
a pair of voltages as well. I also realized that the out-of-tree
driver has complex logic to ensure voltage delta between the
regulators stays within a specific range, so we'd need to port
that as well.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 17 +++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 413987038fbfccb..9c0987a3d71c597 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -79,6 +79,21 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 
+	/* If we have 2 regulator, we need an OPP table with 2 voltages. */
+	if (pfdev->comp->num_supplies > 1) {
+		pfdev->devfreq.dev_opp_table =
+			dev_pm_opp_set_regulators(dev,
+					pfdev->comp->supply_names,
+					pfdev->comp->num_supplies);
+		if (IS_ERR(pfdev->devfreq.dev_opp_table)) {
+			ret = PTR_ERR(pfdev->devfreq.dev_opp_table);
+			pfdev->devfreq.dev_opp_table = NULL;
+			dev_err(dev,
+				"Failed to init devfreq opp table: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = dev_pm_opp_of_add_table(dev);
 	if (ret == -ENODEV) /* Optional, continue without devfreq */
 		return 0;
@@ -119,6 +134,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 	if (pfdev->devfreq.cooling)
 		devfreq_cooling_unregister(pfdev->devfreq.cooling);
 	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
+	if (pfdev->devfreq.dev_opp_table)
+		dev_pm_opp_put_regulators(pfdev->devfreq.dev_opp_table);
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index c30c719a805940a..5009a8b7c853ea1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -110,6 +110,7 @@ struct panfrost_device {
 	struct {
 		struct devfreq *devfreq;
 		struct thermal_cooling_device *cooling;
+		struct opp_table *dev_opp_table;
 		ktime_t busy_time;
 		ktime_t idle_time;
 		ktime_t time_last_update;
-- 
2.25.1.481.gfbce0eb801-goog

