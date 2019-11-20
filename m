Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5580DC43215
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 14:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 224062230E
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 14:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mCQd+sjf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730960AbfKTOVV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 09:21:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37394 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730436AbfKTOVU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 09:21:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id b17so8029197wmj.2
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 06:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UVgEzZUqj/rGeV0gpV6EMnUQLA1qOOwWUDV3PGhj9Ac=;
        b=mCQd+sjfE7wtBK6zJsJfF4TEClmFlV2uwcVjpSnEwxKCPKqyNnxS5rF0SWrBKnKPFU
         vHy/w/b9NSo8D3A5OZEfyQObyxMRCdIkhrP0n89BXzZlJ8I4AQ2+ETF1AuXEEZGTb5fQ
         Pvrqi0rGzqzV5busfH2snALRRbNZT7smyUtaV4gDLzfHy6OxFyDBzNz7xwbPWLzD+mM8
         ZTH89EH4oP54C03BvVCusf/LKlspnfgTdij+a1w4Y4a0unaSRgIW+4khs5igJDxfhZXv
         l+iCQt8tJHt32aZpNyt/e1ECi+aK1OWelqL1gUMGEK2qh1WYtwIFBmPq4Qyk/fc1k2Z+
         RsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UVgEzZUqj/rGeV0gpV6EMnUQLA1qOOwWUDV3PGhj9Ac=;
        b=Hxy4lYBQrs+WRwSgWqrBO4HSXJb4OroKTtkXRtwjBlbV2FGVDiPYmz7Pw4u2tGLRXi
         GfH5fdtEwBVdmIi+NMbRlGhnSc0kt0qteOD6VerVtp+XfZClg28MFywMc8l06SI3j81x
         OhefYjXq/bRycpGinhAeXX445jq82Nr3MPbzPp+UlTIoQEi1w9NkATD5LAk8uBQQYnYE
         U26HQJD3vFTLG7E1mLUEdbEZeDHoA1sG9PvKpcVQUiGGS+nA/wOuQMFrqmDF2QYQG3Cw
         +Sb4O9DVF0OSlTGBIMShV9h0BNYoJNggDQYQ9XIill001YVjtkxW/PvZeNGWatpSSXaQ
         61vQ==
X-Gm-Message-State: APjAAAV4nmlaO62Us1bsS01EoKvtqmYHVQVczOEQsYcN4zaGTnwRSfFH
        RpJDYpLR/O7tCr8hp+0SykKmow==
X-Google-Smtp-Source: APXvYqwk+4VcPPuDXyBelcKuyBaFoMOPtFBDyG6NboDng6OOBsXXRFXQydRCyo8MLY0z7qDjd3Pr7w==
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr3439984wml.174.1574259676358;
        Wed, 20 Nov 2019 06:21:16 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a6sm34544352wrh.69.2019.11.20.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:21:15 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH 2/4] nvmem: add support for the write-protect pin
Date:   Wed, 20 Nov 2019 15:20:36 +0100
Message-Id: <20191120142038.30746-3-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120142038.30746-1-ktouil@baylibre.com>
References: <20191120142038.30746-1-ktouil@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The write-protect pin handling looks like a standard property that
could benefit other users if available in the core nvmem framework.

Instead of modifying all the memory drivers to check this pin, make
the NVMEM subsystem check if the write-protect GPIO being passed
through the nvmem_config or defined in the device tree and pull it
low whenever writing to the memory.

There was a suggestion for introducing the gpiodesc from pdata, but
as pdata is already removed it could be replaced by adding it to
nvmem_config.

Reference: https://lists.96boards.org/pipermail/dev/2018-August/001056.html

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
---
 drivers/nvmem/core.c           | 20 ++++++++++++++++++--
 drivers/nvmem/nvmem.h          |  2 ++
 include/linux/nvmem-provider.h |  3 +++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 057d1ff87d5d..ae6c3455eb11 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/slab.h>
 #include "nvmem.h"
@@ -54,8 +55,14 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
-	if (nvmem->reg_write)
-		return nvmem->reg_write(nvmem->priv, offset, val, bytes);
+	int ret;
+
+	if (nvmem->reg_write) {
+		gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
+		ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
+		gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
+		return ret;
+	}
 
 	return -EINVAL;
 }
@@ -365,6 +372,15 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		kfree(nvmem);
 		return ERR_PTR(rval);
 	}
+	if (config->wp_gpio)
+		nvmem->wp_gpio = config->wp_gpio;
+	else
+		nvmem->wp_gpio = gpiod_get_optional(config->dev,
+						    "wp",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(nvmem->wp_gpio))
+		return PTR_ERR(nvmem->wp_gpio);
+
 
 	kref_init(&nvmem->refcnt);
 	INIT_LIST_HEAD(&nvmem->cells);
diff --git a/drivers/nvmem/nvmem.h b/drivers/nvmem/nvmem.h
index eb8ed7121fa3..be0d66d75c8a 100644
--- a/drivers/nvmem/nvmem.h
+++ b/drivers/nvmem/nvmem.h
@@ -9,6 +9,7 @@
 #include <linux/list.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
+#include <linux/gpio/consumer.h>
 
 struct nvmem_device {
 	struct module		*owner;
@@ -26,6 +27,7 @@ struct nvmem_device {
 	struct list_head	cells;
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	struct gpio_desc	*wp_gpio;
 	void *priv;
 };
 
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index fe051323be0a..6d6f8e5d24c9 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -11,6 +11,7 @@
 
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 
 struct nvmem_device;
 struct nvmem_cell_info;
@@ -45,6 +46,7 @@ enum nvmem_type {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
+ * @wp-gpio:   Write protect pin
  *
  * Note: A default "nvmem<id>" name will be assigned to the device if
  * no name is specified in its configuration. In such case "<id>" is
@@ -58,6 +60,7 @@ struct nvmem_config {
 	const char		*name;
 	int			id;
 	struct module		*owner;
+	struct gpio_desc	*wp_gpio;
 	const struct nvmem_cell_info	*cells;
 	int			ncells;
 	enum nvmem_type		type;
-- 
2.17.1

