Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAC9C33CB0
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 07:16:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDCB9222C4
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 07:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OaXWhDzn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgANHQW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 02:16:22 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40527 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgANHQV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 02:16:21 -0500
Received: by mail-pj1-f68.google.com with SMTP id bg7so5439523pjb.5
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 23:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aLfPCVSIPmuFzsEvFRWITFE6Wzi8RULGPe0z6zRKf5k=;
        b=OaXWhDznHboRO3zEjD8nrdw+NPv7XDmxHexHQ18scUseKp8UXWMnxGYaQfSFy8cFnE
         +Ubbzc9gJeDRMbc5G+6XYetc1Q0c4ODeK1pxl54x9asrntyjC6EY07Svt1G9m8ZrwPkq
         ucF48ITInsC2HX4bRf9zpq+ZC+grBF3fRwtoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aLfPCVSIPmuFzsEvFRWITFE6Wzi8RULGPe0z6zRKf5k=;
        b=jO1DNYcJJPiyr4GhU81GlKkgSbHqcPzHoraWqbAJf8a69oSLE05/OqOPo1BfjzzW16
         KYCGo1NMf/SsN9BFNqo3HXogURJpd9Fgz/uZTPFGvrpM4J7j5AZGz3vFLNN8UMMUYGb9
         d1xPJAA/wvSmlzQv1Pt5vDSGcOLMutaYYmHGuL7REczMQ5WTGY/1ewMu/2zIyvY/N/ma
         gmMuRd0da8EtBy0QvpMhVdGm8tvcGM3LikwmAeGbyL6dSulIL3fwi/xqp8GaSopUCJzI
         AHPm6KehwAk+P36yjSjJhoRm+9KUGsNMk8rKYz4iBvsE6Rmc5PLACfa1sYIAmaYEEuq1
         wELQ==
X-Gm-Message-State: APjAAAV+5upvDkThVEQbnajykVWpCorOygTc1ZlZyIwQuZ0I8OFMF75T
        KR/YSn5AKociO8ICquQjeBgViA==
X-Google-Smtp-Source: APXvYqxoaFfKjcW7VC6bDMKbEbYjDWj5GXViWzYi47SIsxZBtHqGh0p0/A6VUYpSg16lvWuN86PdnA==
X-Received: by 2002:a17:902:5a85:: with SMTP id r5mr18780643pli.222.1578986180443;
        Mon, 13 Jan 2020 23:16:20 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id b4sm17092976pfd.18.2020.01.13.23.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 23:16:19 -0800 (PST)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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
Subject: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
Date:   Tue, 14 Jan 2020 15:15:59 +0800
Message-Id: <20200114071602.47627-5-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200114071602.47627-1-drinkcat@chromium.org>
References: <20200114071602.47627-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some GPUs, namely, the bifrost/g72 part on MT8183, have a second
regulator for their SRAM, let's add support for that.

We extend the framework in a generic manner so that we could
support more than 2 regulators, if required.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

v3:
 - Make this more generic, by allowing any number of regulators
   (in practice we fix the maximum number of regulators to 2, but
   this could be increased easily).
 - We only probe the second regulator if the device tree matching
   data asks for it.
 - I couldn't find a way to detect the number of regulators in the
   device tree, if we wanted to refuse to probe the device if there
   are too many regulators, which might be required for safety, see
   the thread on v2 [1].
 - The discussion also included the idea of a separate device tree
   entry for a "soft PDC", or at least a separate driver. I'm not
   sure to understand the full picture, and how different vendors
   implement this, so I'm still integrating everything in the main
   driver. I'd be happy to try to make mt8183 fit into such a
   framework after it's created, but I don't think I'm best placed
   to implement (and again, the main purpose of this was to test
   if the binding is correct).

[1] https://patchwork.kernel.org/patch/11322839/

 drivers/gpu/drm/panfrost/panfrost_device.c | 25 ++++++++++++-------
 drivers/gpu/drm/panfrost/panfrost_device.h | 15 +++++++++++-
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 28 +++++++++++++++-------
 3 files changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 238fb6d54df4732..c30e0a3772a4f57 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -87,18 +87,26 @@ static void panfrost_clk_fini(struct panfrost_device *pfdev)
 
 static int panfrost_regulator_init(struct panfrost_device *pfdev)
 {
-	int ret;
+	int ret, i;
 
-	pfdev->regulator = devm_regulator_get(pfdev->dev, "mali");
-	if (IS_ERR(pfdev->regulator)) {
-		ret = PTR_ERR(pfdev->regulator);
-		dev_err(pfdev->dev, "failed to get regulator: %d\n", ret);
+	BUG_ON(pfdev->comp->num_supplies > ARRAY_SIZE(pfdev->regulators));
+
+	for (i = 0; i < pfdev->comp->num_supplies; i++) {
+		pfdev->regulators[i].supply = pfdev->comp->supply_names[i];
+	}
+
+	ret = devm_regulator_bulk_get(pfdev->dev,
+				      pfdev->comp->num_supplies,
+				      pfdev->regulators);
+	if (ret < 0) {
+		dev_err(pfdev->dev, "failed to get regulators: %d\n", ret);
 		return ret;
 	}
 
-	ret = regulator_enable(pfdev->regulator);
+	ret = regulator_bulk_enable(pfdev->comp->num_supplies,
+				    pfdev->regulators);
 	if (ret < 0) {
-		dev_err(pfdev->dev, "failed to enable regulator: %d\n", ret);
+		dev_err(pfdev->dev, "failed to enable regulators: %d\n", ret);
 		return ret;
 	}
 
@@ -107,7 +115,8 @@ static int panfrost_regulator_init(struct panfrost_device *pfdev)
 
 static void panfrost_regulator_fini(struct panfrost_device *pfdev)
 {
-	regulator_disable(pfdev->regulator);
+	regulator_bulk_disable(pfdev->comp->num_supplies,
+			pfdev->regulators);
 }
 
 int panfrost_device_init(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 06713811b92cdf7..021f063ffb3747f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -7,6 +7,7 @@
 
 #include <linux/atomic.h>
 #include <linux/io-pgtable.h>
+#include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
 #include <drm/drm_device.h>
 #include <drm/drm_mm.h>
@@ -19,6 +20,7 @@ struct panfrost_job;
 struct panfrost_perfcnt;
 
 #define NUM_JOB_SLOTS 3
+#define MAX_REGULATORS 2
 
 struct panfrost_features {
 	u16 id;
@@ -51,6 +53,16 @@ struct panfrost_features {
 	unsigned long hw_issues[64 / BITS_PER_LONG];
 };
 
+/*
+ * Features that cannot be automatically detected and need matching using the
+ * compatible string, typically SoC-specific.
+ */
+struct panfrost_compatible {
+	/* Supplies count and names. */
+	int num_supplies;
+	const char * const *supply_names;
+};
+
 struct panfrost_device {
 	struct device *dev;
 	struct drm_device *ddev;
@@ -59,10 +71,11 @@ struct panfrost_device {
 	void __iomem *iomem;
 	struct clk *clock;
 	struct clk *bus_clock;
-	struct regulator *regulator;
+	struct regulator_bulk_data regulators[MAX_REGULATORS];
 	struct reset_control *rstc;
 
 	struct panfrost_features features;
+	const struct panfrost_compatible* comp;
 
 	spinlock_t as_lock;
 	unsigned long as_in_use_mask;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 48e3c4165247cea..db3563b80150c9d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -510,6 +510,10 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pfdev);
 
+	pfdev->comp = of_device_get_match_data(&pdev->dev);
+	if (!pfdev->comp)
+		return -ENODEV;
+
 	/* Allocate and initialze the DRM device. */
 	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
 	if (IS_ERR(ddev))
@@ -581,16 +585,22 @@ static int panfrost_remove(struct platform_device *pdev)
 	return 0;
 }
 
+const char * const default_supplies[] = { "mali" };
+static const struct panfrost_compatible default_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies),
+	.supply_names = default_supplies,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "arm,mali-t604" },
-	{ .compatible = "arm,mali-t624" },
-	{ .compatible = "arm,mali-t628" },
-	{ .compatible = "arm,mali-t720" },
-	{ .compatible = "arm,mali-t760" },
-	{ .compatible = "arm,mali-t820" },
-	{ .compatible = "arm,mali-t830" },
-	{ .compatible = "arm,mali-t860" },
-	{ .compatible = "arm,mali-t880" },
+	{ .compatible = "arm,mali-t604", .data = &default_data, },
+	{ .compatible = "arm,mali-t624", .data = &default_data, },
+	{ .compatible = "arm,mali-t628", .data = &default_data, },
+	{ .compatible = "arm,mali-t720", .data = &default_data, },
+	{ .compatible = "arm,mali-t760", .data = &default_data, },
+	{ .compatible = "arm,mali-t820", .data = &default_data, },
+	{ .compatible = "arm,mali-t830", .data = &default_data, },
+	{ .compatible = "arm,mali-t860", .data = &default_data, },
+	{ .compatible = "arm,mali-t880", .data = &default_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.0.rc1.283.g88dfdc4193-goog

