Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0566AC35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 12:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0F2C24672
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 12:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CS/oR3AB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgBUMMC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 07:12:02 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39196 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbgBUMMB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 07:12:01 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so1781770wrt.6
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 04:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hS96wgt/ER0zqCa5SCOVpu61bVnBbfmDRQTyUX2IrAg=;
        b=CS/oR3ABVm90GOGwxlesbU5UaRDqDi4937vJIZTYLNgqFuONm21aZHfScF1yfn5sAO
         xdxwA0HkcqUqTryI/sndrYYXkvoPVOAFhEEC3AzBENzt3TA3GfZ5pbXcjskloGHkCTpZ
         a77kpInQpoS3R/nE1wh7iy1tE7R+PB8uZsyNSP/TNDZLndcmcCGV83fW63VZdCSbFDkb
         dGQ/VBQeP6CBnmYAGuZN5H+5VLNTKx9sdLzMAjP/uMS0dgHQej5Z7MhJVnrhhgiIJJ78
         QTReeJZnSZTQJRREy+l5X1Q9RwN4MNBQQw37iC78fTKYq6khyXtgU9FsErbddnK5PQ2+
         ZUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hS96wgt/ER0zqCa5SCOVpu61bVnBbfmDRQTyUX2IrAg=;
        b=mUAQE+pVjDU7s5t9REod3RiF2vfhjbqggEFEk9KcGEzjxFYveq1Z28EEKogvWa7bD6
         oqSDmiSHZJod95FalQgrmpDfw1RuVjYQ9Xcc+9UG4UPFUWTcOSXdVZu58J+Gyoeo8qHg
         KUm5Ar1rHO/JsarM+VHRQgGr8NGrxG3I+aWxe9vsc79gNdcTc6lmfI0ltHgNNp5u9xpm
         whbRosvPfjxV9vxD3lPdcQheMjr3qoYc1oOqrxWDu4T+2qSXp4s735+150exMJVGTwnZ
         c+8Izz13rxbLqjwVCD1zn2p3eVQxFwAE6QoPM3rBgD2p/stZa+Hs26997FjEy+hSxN2i
         nQkA==
X-Gm-Message-State: APjAAAVKPIIYeCSnlPoIwUat+sHbbOuL2I4gxk2X4BKMifPUAbhhrPeu
        cQ3eAtUIsQE9qOgbjjfS/1h5+g==
X-Google-Smtp-Source: APXvYqwYh4N7wz2XscGcCwMNShVzzwC6C2HoeJjKHoDg8DxmO/DkVmrmpDieYviHEdy0nbFzFz8hSg==
X-Received: by 2002:a05:6000:108b:: with SMTP id y11mr49634195wrw.187.1582287119261;
        Fri, 21 Feb 2020 04:11:59 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w22sm3553127wmk.34.2020.02.21.04.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 04:11:58 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] ASoC: meson: g12a: add tohdmitx reset
Date:   Fri, 21 Feb 2020 13:11:46 +0100
Message-Id: <20200221121146.1498427-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Reset the g12a hdmi codec glue on probe. This ensure a sane startup state.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/g12a-tohdmitx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index f8853f2fba08..9b2b59536ced 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <sound/pcm_params.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 
@@ -245,6 +246,11 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	void __iomem *regs;
 	struct regmap *map;
+	int ret;
+
+	ret = device_reset(dev);
+	if (ret)
+		return ret;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
-- 
2.24.1

