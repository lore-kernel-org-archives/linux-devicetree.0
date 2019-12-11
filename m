Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A902EC00454
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 23:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D040214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 23:07:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hMHdSkoz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfLKXHp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 18:07:45 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45279 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLKXHp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 18:07:45 -0500
Received: by mail-wr1-f67.google.com with SMTP id j42so475705wrj.12
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 15:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tDhVs6CVDINJ1HNHUEVGjWNjJ7PiR8LnUgb8ARuG2ic=;
        b=hMHdSkoz5BDyQw6TwtXyVxNCqua6AMy+cyKJc0JAy9qVqtgz6j9CyRrqxazjYZu1eA
         rTgNe1t8WcbjnarG27SQGbKFpHC0mjEZ0czht4ajELdmUO6aNzMfMBi8FPR3QwRlax5s
         GPc1ZHEVJG77stG+XKIcJ7ngDfsNi940u78geK7Z04TSLX+Sxwu9EpbRFPo3cRnV2krM
         shh5n4GU0D50R+j5s1ho9nc+hr+OFUkqKXcrMRSAfWIfai1tF60y7gcV74kRbVesYSr3
         EpdHql/D1HSW/Eb+4/tYGkNCXi7eDH0jm6KYXlufdbowkjaBfLVFS2M9BDiPZSA2Jlxo
         7/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tDhVs6CVDINJ1HNHUEVGjWNjJ7PiR8LnUgb8ARuG2ic=;
        b=kD3+FawIUr//S7ZIbmUAkA38aol+oC1SdgvkI9w/MP2W0l/oHSyd6AKxoVIeIJ67tG
         qMRSGZGHXO0G0e6ZidXw+iZF1kV1CKr7NpgXdU0WrJKBT6h5BsicBWCBEIRPB+KfsRUs
         zi00L5OEVx9CPvsHxaEJxKmX7pHOuG29yk/NJQIp8f+6gcGhNkUQf5INxT6f4y3fiIxz
         yfcc8QgexD7ngQK8vMwvg4BAg2R2yiwnlvG1ccxR22lnafWKLK9u3Bzg9Kg26GZ5C4tT
         097d7Vl9jpI5Ack4TLUM0AZO1HHZal/ALGMIfsCqSwCIO0yF37tGOBDnTQqDdeW2hGCe
         pArQ==
X-Gm-Message-State: APjAAAVheS+/LyUAxjyvI2RwDyEIF54/wuYqKXeqsSYum/rerOx6FgoZ
        do7FxfiYqAKidgBR/Vc/eIy/BQ==
X-Google-Smtp-Source: APXvYqxgauY45ibf73wi3p0hoxAqkU6DHS4QVjTpkjVPNK80DXm1njA6F3ttGXMyOm9J4P8w66euFA==
X-Received: by 2002:adf:d183:: with SMTP id v3mr2504773wrc.180.1576105662868;
        Wed, 11 Dec 2019 15:07:42 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:140f:3f8d:647c:49b0])
        by smtp.gmail.com with ESMTPSA id n16sm3925655wro.88.2019.12.11.15.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 15:07:42 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org
Subject: [PATCH v6 02/15] coresight: cti: Add sysfs coresight mgmt reg access.
Date:   Wed, 11 Dec 2019 23:07:39 +0000
Message-Id: <20191211230739.4985-1-mike.leach@linaro.org>
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

