Return-Path: <SRS0=2Mri=2U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C05CC2D0D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 16:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E831120718
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 16:40:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZN7KKbIg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfL3Qkk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Dec 2019 11:40:40 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38297 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbfL3Qkk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Dec 2019 11:40:40 -0500
Received: by mail-wm1-f67.google.com with SMTP id u2so14599522wmc.3
        for <devicetree@vger.kernel.org>; Mon, 30 Dec 2019 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tDhVs6CVDINJ1HNHUEVGjWNjJ7PiR8LnUgb8ARuG2ic=;
        b=ZN7KKbIgtPp1ekgR51IoF+SME6R9Cr0LaqNEinmblhhFSXm0TRG+mKuts2PSA0XJIR
         yqkrXoYJSH8zaP4MTVeZxu8+Mfa7lDjCdUl44E/Hl98IqMyE6sJbUICApQO9voVqHht7
         41olQjXiASfh8zOCaxZm2XDH2txCBy6FOuGWoa59WPYcFi3MpWPoAUhKp3zUwejm2Jxy
         O/sz4ZT/rQL9LI/Peyt1xmHnS4QNvMbHI6/Kf15TEYbMLhiJc9iab8tZiWle96eSxrZN
         kBL2vBBIiWx0ECuTr103C35sFiqj57+zoY5d043X3pOB3mdBniNWEndn0uGkW9O9LRxm
         LTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tDhVs6CVDINJ1HNHUEVGjWNjJ7PiR8LnUgb8ARuG2ic=;
        b=bZgYUCBaCRfeXREV/8QtiV+t6Ptzrl5PfCWC7xiRNqBXX7TKjKoCoVbHeuarluompG
         pqeCdeOj/+/hHuOcAWscdMQHa6aJHG6HVxrJ5usk53ODWZbROxvWgi0sQOIPDIULheYX
         9eeMRZQStB/fCKj85mBmQrCbYor0glzuj7CpxdUoOG+sGvrn3eskVakSulazVxV6T1O9
         80XpVzxKrplFEuG8ZFODGziIUMbCq8NKv1XobMixPfPHRkYb3XGQjt88VNNXetX6qUdv
         VMd8z916KN3V7vCC4LZI6v1AGGplo/4F+E2wn/9LBBZvVAUocr9YUgpHVVjiQFthXaL/
         vY2w==
X-Gm-Message-State: APjAAAWVLOfz6eeIem7TDT/rgXYOkcCLdAcuiOTKErFksnc26sgOCQu6
        TdSbml/PZE9Z2wbIHDirA/17HQ==
X-Google-Smtp-Source: APXvYqz6xBOyY+kpXf3snSVcVhOxgaPBbkha9oou9FX8ajt2wCRfPBDbcclzEEM+xidfTGUx9oCh3A==
X-Received: by 2002:a1c:4b01:: with SMTP id y1mr33726581wma.12.1577724038134;
        Mon, 30 Dec 2019 08:40:38 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id b68sm21175605wme.6.2019.12.30.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:40:37 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 02/15] coresight: cti: Add sysfs coresight mgmt reg access.
Date:   Mon, 30 Dec 2019 16:40:35 +0000
Message-Id: <20191230164035.28013-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds sysfs access to the coresight management registers.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
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

