Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66922C43141
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 394AE2245C
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eovu/jQw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbfKSXTX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 18:19:23 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36278 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfKSXTX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 18:19:23 -0500
Received: by mail-wr1-f67.google.com with SMTP id r10so25931617wrx.3
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 15:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ioz5PX0oov2JaX7mQvAoC7mmHamYIvxsGoKqeikkaN8=;
        b=eovu/jQwEYr23wqulMSr5kPbxm9EnEYcMkrjA9bfPXlVjVI9xH7NvJCrSK/0A2y2tp
         s4IdgDy8z9Dh7w8U2hl+6sP2O0Z97KPgnPBfsp7uvaa9moEmJmOc0bDgZSjqs4f4LIVO
         zxt21+9EZvAZJkr9I60ayPNFbhpbz6Let/qLUOyocQJ1mB/VBW9fX8+n5fboKtJtaUKS
         7+Fuff+vIuVUeeZLJNsV0IU/9bffmRA0DegTC2Pv80x7AvgxDcgA/CUwxWDDO3bIAfVG
         Xgg2ylLsXvRuSd9rATIsQ5YZ7XL7OrHwNs83oNlsS/ok994+3rhF48H40iStyupre020
         /LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ioz5PX0oov2JaX7mQvAoC7mmHamYIvxsGoKqeikkaN8=;
        b=e37KBKF6v/t64VV/mJmIbmipK299Y6yd/Q+z6ri91i2sadhWtfrrFUyjhtG5GwIqdW
         RUUgh553mX4HoRlI2/GF1Lde3oI0m3AcFB3m8hV3sEpSoodaLdyAjCYNKCjMQjUU8UT5
         9J6Kis70ZTtcvtVjWKKTyRsd+U8Yo9O9O/VvaO5l383ODWGGiKcuw1xAIm/YUww2+GrA
         DXn8lJ3wKkqJHihEsi7EG6ROzuPPtrtRb68nkD3gV5OvqXx+FOJBI8COuYrE/X8BdAuW
         TADGpZppMchI7PiTdmv08SbV2kbH2Pd1hI9cZYTJDBJhOqiJy41o/PyxSe3+8EpBvNzN
         txYA==
X-Gm-Message-State: APjAAAUpgA89Mfxe9gwkdWxRWP+1C5lJ9HZJMlN5l/dnnVkuS5jK+0+a
        G5zwJZLOARh8wQQPSVMuIprv+Q==
X-Google-Smtp-Source: APXvYqzHeH3bQMoFavhhf+F+C3BuD8+p4Cx9GIJNkf1B751mBDR7TlHgIz+N/5Brb7BH4y5LszkLFQ==
X-Received: by 2002:adf:978c:: with SMTP id s12mr39187370wrb.47.1574205561439;
        Tue, 19 Nov 2019 15:19:21 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a19d:4139:292b:19a0])
        by smtp.gmail.com with ESMTPSA id m15sm15746717wrj.52.2019.11.19.15.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:19:20 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com
Subject: [PATCH v5 02/14] coresight: cti: Add sysfs coresight mgmt reg access.
Date:   Tue, 19 Nov 2019 23:19:00 +0000
Message-Id: <20191119231912.12768-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119231912.12768-1-mike.leach@linaro.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds sysfs access to the coresight management registers.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-cti-sysfs.c | 53 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h  |  1 +
 2 files changed, 54 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index a832b8c6b866..507f8eb487fe 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -62,11 +62,64 @@ static struct attribute *coresight_cti_attrs[] = {
 	NULL,
 };
 
+/* register based attributes */
+
+/* macro to access RO registers with power check only (no enable check). */
+#define coresight_cti_reg(name, offset)			\
+static ssize_t name##_show(struct device *dev,				\
+			   struct device_attribute *attr, char *buf)	\
+{									\
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
+	u32 val = 0;							\
+	pm_runtime_get_sync(dev->parent);				\
+	spin_lock(&drvdata->spinlock);					\
+	if (drvdata->config.hw_powered)					\
+		val = readl_relaxed(drvdata->base + offset);		\
+	spin_unlock(&drvdata->spinlock);				\
+	pm_runtime_put_sync(dev->parent);				\
+	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);		\
+}									\
+static DEVICE_ATTR_RO(name)
+
+/* coresight management registers */
+coresight_cti_reg(devaff0, CTIDEVAFF0);
+coresight_cti_reg(devaff1, CTIDEVAFF1);
+coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS);
+coresight_cti_reg(devarch, CORESIGHT_DEVARCH);
+coresight_cti_reg(devid, CORESIGHT_DEVID);
+coresight_cti_reg(devtype, CORESIGHT_DEVTYPE);
+coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0);
+coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1);
+coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2);
+coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3);
+coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4);
+
+static struct attribute *coresight_cti_mgmt_attrs[] = {
+	&dev_attr_devaff0.attr,
+	&dev_attr_devaff1.attr,
+	&dev_attr_authstatus.attr,
+	&dev_attr_devarch.attr,
+	&dev_attr_devid.attr,
+	&dev_attr_devtype.attr,
+	&dev_attr_pidr0.attr,
+	&dev_attr_pidr1.attr,
+	&dev_attr_pidr2.attr,
+	&dev_attr_pidr3.attr,
+	&dev_attr_pidr4.attr,
+	NULL,
+};
+
 static const struct attribute_group coresight_cti_group = {
 	.attrs = coresight_cti_attrs,
 };
 
+static const struct attribute_group coresight_cti_mgmt_group = {
+	.attrs = coresight_cti_mgmt_attrs,
+	.name = "mgmt",
+};
+
 const struct attribute_group *coresight_cti_groups[] = {
 	&coresight_cti_group,
+	&coresight_cti_mgmt_group,
 	NULL,
 };
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 82e563cdc879..aba6b789c969 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -22,6 +22,7 @@
 #define CORESIGHT_CLAIMCLR	0xfa4
 #define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_LSR		0xfb4
+#define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
 #define CORESIGHT_DEVID		0xfc8
 #define CORESIGHT_DEVTYPE	0xfcc
-- 
2.17.1

