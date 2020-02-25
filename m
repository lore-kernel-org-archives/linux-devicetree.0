Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EB7C4BA0C
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 23:46:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4ADB722464
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 23:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qqoIL+C0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbgBYXqh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 18:46:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45369 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728865AbgBYXqh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 18:46:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id g3so718179wrs.12
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 15:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OUdAny8jh6diQ7RRmD25eFqT/f0Kc7Sgdd6rbClmrPA=;
        b=qqoIL+C0oMbVDAbTF/GSvHWd55mLq+AdHVWNuZuTEHuH0agMoJvQVjNOvHfGRgIoQv
         gSjrBosTZeyXDlYFIfzgNScNM2JghYHUmnFwb1CzFm743d4ZRXbWDFbkl7c+F8Jgx8UT
         xdjmcvrqr9WreYBCo+JxN9U32Te+B9143zCozO87xFPlJemHaOdHmKiM8Zlc4c75TtlQ
         yryEcT5Gd5U//OqQZ7zWrxE7B6cH8Wav6ilpaPGUDheCDWSX2yTzTBzzW2D1GbTlBcwV
         RK0/u3+8hp1EDmNHNDkc5XwELQCr/aYH/ZlxAh3wSW9101khuXaWYMzMsCtmhvzYG0gz
         nEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OUdAny8jh6diQ7RRmD25eFqT/f0Kc7Sgdd6rbClmrPA=;
        b=J3nY4hjKG8vjBwJ2LTRTypMnK+vHijHB+YL0YJ8zrU+YM5H3UvA3tL03onCxHxGGDd
         AlwU6DXOrvuOS7+10nwTzT4tVfwe89adhvotCOIl/pujy+DTDiEHFWbZURD91uBPVP4d
         ovTzvZCw18zm99N95r4Y7ot9Gkjl6xOAMjfErchiv39YuOHTSrkZTdaSl03IOzGxs/ac
         wSE6MfSrFkUzCVgydTmWQz2jlzns0pljFUU92VjgLexh+TSPQxOk0WJe0FcPy1TKreCg
         q0tFhk8Bx04U3c6dZ1lDfumYKjFL1FwbhF9h7+5+YPBzUILf/PDdlTAzeZy3+uR/DByH
         ZhOg==
X-Gm-Message-State: APjAAAX5HQcfcWWc3ybyZUpuyzumYzrtjF3rlDMSAExbuJim+nrMgHPP
        DoRKt+yjMbDNxPU5zJYhoklX6w==
X-Google-Smtp-Source: APXvYqzzuLIh9NyQ/uPFJ4Q/CrXfOQvAApDPZCdLVWFq+79LIWESjFNseHqHIAf4QmcP9F3KbpE1ZQ==
X-Received: by 2002:a5d:460c:: with SMTP id t12mr1489377wrq.290.1582674393671;
        Tue, 25 Feb 2020 15:46:33 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:186c:5f6c:221d:5ce])
        by smtp.gmail.com with ESMTPSA id t133sm356278wmf.31.2020.02.25.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 15:46:33 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v10 03/15] coresight: cti: Add sysfs access to program function regs
Date:   Tue, 25 Feb 2020 23:45:59 +0000
Message-Id: <20200225234611.11067-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225234611.11067-1-mike.leach@linaro.org>
References: <20200225234611.11067-1-mike.leach@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds in sysfs programming support for the CTI function register sets.
Allows direct manipulation of channel / trigger association registers.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/Kconfig           |   9 +
 .../hwtracing/coresight/coresight-cti-sysfs.c | 361 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-cti.c   |  19 +
 drivers/hwtracing/coresight/coresight-cti.h   |   8 +
 4 files changed, 397 insertions(+)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 45d3822c8c8c..83e841be1081 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -122,4 +122,13 @@ config CORESIGHT_CTI
 	  halt compared to disabling sources and sinks normally in driver
 	  software.
 
+config CORESIGHT_CTI_INTEGRATION_REGS
+	bool "Access CTI CoreSight Integration Registers"
+	depends on CORESIGHT_CTI
+	help
+	  This option adds support for the CoreSight integration registers on
+	  this device. The integration registers allow the exploration of the
+	  CTI trigger connections between this and other devices.These
+	  registers are not used in normal operation and can leave devices in
+	  an inconsistent state.
 endif
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 507f8eb487fe..f687e07b68b0 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -109,6 +109,361 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
 	NULL,
 };
 
+/* CTI low level programming registers */
+
+/*
+ * Show a simple 32 bit value if enabled and powered.
+ * If inaccessible & pcached_val not NULL then show cached value.
+ */
+static ssize_t cti_reg32_show(struct device *dev, char *buf,
+			      u32 *pcached_val, int reg_offset)
+{
+	u32 val = 0;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *config = &drvdata->config;
+
+	spin_lock(&drvdata->spinlock);
+	if ((reg_offset >= 0) && cti_active(config)) {
+		CS_UNLOCK(drvdata->base);
+		val = readl_relaxed(drvdata->base + reg_offset);
+		if (pcached_val)
+			*pcached_val = val;
+		CS_LOCK(drvdata->base);
+	} else if (pcached_val) {
+		val = *pcached_val;
+	}
+	spin_unlock(&drvdata->spinlock);
+	return scnprintf(buf, PAGE_SIZE, "%#x\n", val);
+}
+
+/*
+ * Store a simple 32 bit value.
+ * If pcached_val not NULL, then copy to here too,
+ * if reg_offset >= 0 then write through if enabled.
+ */
+static ssize_t cti_reg32_store(struct device *dev, const char *buf,
+			       size_t size, u32 *pcached_val, int reg_offset)
+{
+	unsigned long val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	/* local store */
+	if (pcached_val)
+		*pcached_val = (u32)val;
+
+	/* write through if offset and enabled */
+	if ((reg_offset >= 0) && cti_active(config))
+		cti_write_single_reg(drvdata, reg_offset, val);
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+
+/* Standard macro for simple rw cti config registers */
+#define cti_config_reg32_rw(name, cfgname, offset)			\
+static ssize_t name##_show(struct device *dev,				\
+			   struct device_attribute *attr,		\
+			   char *buf)					\
+{									\
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
+	return cti_reg32_show(dev, buf,					\
+			      &drvdata->config.cfgname, offset);	\
+}									\
+									\
+static ssize_t name##_store(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    const char *buf, size_t size)		\
+{									\
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
+	return cti_reg32_store(dev, buf, size,				\
+			       &drvdata->config.cfgname, offset);	\
+}									\
+static DEVICE_ATTR_RW(name)
+
+static ssize_t inout_sel_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	u32 val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	val = (u32)drvdata->config.ctiinout_sel;
+	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+}
+
+static ssize_t inout_sel_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
+{
+	unsigned long val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+	if (val > (CTIINOUTEN_MAX - 1))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	drvdata->config.ctiinout_sel = val;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(inout_sel);
+
+static ssize_t inen_show(struct device *dev,
+			 struct device_attribute *attr,
+			 char *buf)
+{
+	unsigned long val;
+	int index;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	spin_lock(&drvdata->spinlock);
+	index = drvdata->config.ctiinout_sel;
+	val = drvdata->config.ctiinen[index];
+	spin_unlock(&drvdata->spinlock);
+	return scnprintf(buf, PAGE_SIZE, "INEN%d %#lx\n", index, val);
+}
+
+static ssize_t inen_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf, size_t size)
+{
+	unsigned long val;
+	int index;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	index = config->ctiinout_sel;
+	config->ctiinen[index] = val;
+
+	/* write through if enabled */
+	if (cti_active(config))
+		cti_write_single_reg(drvdata, CTIINEN(index), val);
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(inen);
+
+static ssize_t outen_show(struct device *dev,
+			  struct device_attribute *attr,
+			  char *buf)
+{
+	unsigned long val;
+	int index;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	spin_lock(&drvdata->spinlock);
+	index = drvdata->config.ctiinout_sel;
+	val = drvdata->config.ctiouten[index];
+	spin_unlock(&drvdata->spinlock);
+	return scnprintf(buf, PAGE_SIZE, "OUTEN%d %#lx\n", index, val);
+}
+
+static ssize_t outen_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t size)
+{
+	unsigned long val;
+	int index;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	index = config->ctiinout_sel;
+	config->ctiouten[index] = val;
+
+	/* write through if enabled */
+	if (cti_active(config))
+		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(outen);
+
+static ssize_t intack_store(struct device *dev,
+			    struct device_attribute *attr,
+			    const char *buf, size_t size)
+{
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	cti_write_intack(dev, val);
+	return size;
+}
+static DEVICE_ATTR_WO(intack);
+
+cti_config_reg32_rw(gate, ctigate, CTIGATE);
+cti_config_reg32_rw(asicctl, asicctl, ASICCTL);
+cti_config_reg32_rw(appset, ctiappset, CTIAPPSET);
+
+static ssize_t appclear_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	unsigned long val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+
+	/* a 1'b1 in appclr clears down the same bit in appset*/
+	config->ctiappset &= ~val;
+
+	/* write through if enabled */
+	if (cti_active(config))
+		cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_WO(appclear);
+
+static ssize_t apppulse_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	unsigned long val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+
+	/* write through if enabled */
+	if (cti_active(config))
+		cti_write_single_reg(drvdata, CTIAPPPULSE, val);
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_WO(apppulse);
+
+coresight_cti_reg(triginstatus, CTITRIGINSTATUS);
+coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS);
+coresight_cti_reg(chinstatus, CTICHINSTATUS);
+coresight_cti_reg(choutstatus, CTICHOUTSTATUS);
+
+/*
+ * Define CONFIG_CORESIGHT_CTI_INTEGRATION_REGS to enable the access to the
+ * integration control registers. Normally only used to investigate connection
+ * data.
+ */
+#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
+
+/* macro to access RW registers with power check only (no enable check). */
+#define coresight_cti_reg_rw(name, offset)				\
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
+									\
+static ssize_t name##_store(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    const char *buf, size_t size)		\
+{									\
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
+	unsigned long val = 0;						\
+	if (kstrtoul(buf, 0, &val))					\
+		return -EINVAL;						\
+									\
+	pm_runtime_get_sync(dev->parent);				\
+	spin_lock(&drvdata->spinlock);					\
+	if (drvdata->config.hw_powered)					\
+		cti_write_single_reg(drvdata, offset, val);		\
+	spin_unlock(&drvdata->spinlock);				\
+	pm_runtime_put_sync(dev->parent);				\
+	return size;							\
+}									\
+static DEVICE_ATTR_RW(name)
+
+/* macro to access WO registers with power check only (no enable check). */
+#define coresight_cti_reg_wo(name, offset)				\
+static ssize_t name##_store(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    const char *buf, size_t size)		\
+{									\
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
+	unsigned long val = 0;						\
+	if (kstrtoul(buf, 0, &val))					\
+		return -EINVAL;						\
+									\
+	pm_runtime_get_sync(dev->parent);				\
+	spin_lock(&drvdata->spinlock);					\
+	if (drvdata->config.hw_powered)					\
+		cti_write_single_reg(drvdata, offset, val);		\
+	spin_unlock(&drvdata->spinlock);				\
+	pm_runtime_put_sync(dev->parent);				\
+	return size;							\
+}									\
+static DEVICE_ATTR_WO(name)
+
+coresight_cti_reg_rw(itchout, ITCHOUT);
+coresight_cti_reg_rw(ittrigout, ITTRIGOUT);
+coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL);
+coresight_cti_reg_wo(itchinack, ITCHINACK);
+coresight_cti_reg_wo(ittriginack, ITTRIGINACK);
+coresight_cti_reg(ittrigin, ITTRIGIN);
+coresight_cti_reg(itchin, ITCHIN);
+coresight_cti_reg(itchoutack, ITCHOUTACK);
+coresight_cti_reg(ittrigoutack, ITTRIGOUTACK);
+
+#endif /* CORESIGHT_CTI_INTEGRATION_REGS */
+
+static struct attribute *coresight_cti_regs_attrs[] = {
+	&dev_attr_inout_sel.attr,
+	&dev_attr_inen.attr,
+	&dev_attr_outen.attr,
+	&dev_attr_gate.attr,
+	&dev_attr_asicctl.attr,
+	&dev_attr_intack.attr,
+	&dev_attr_appset.attr,
+	&dev_attr_appclear.attr,
+	&dev_attr_apppulse.attr,
+	&dev_attr_triginstatus.attr,
+	&dev_attr_trigoutstatus.attr,
+	&dev_attr_chinstatus.attr,
+	&dev_attr_choutstatus.attr,
+#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
+	&dev_attr_itctrl.attr,
+	&dev_attr_ittrigin.attr,
+	&dev_attr_itchin.attr,
+	&dev_attr_ittrigout.attr,
+	&dev_attr_itchout.attr,
+	&dev_attr_itchoutack.attr,
+	&dev_attr_ittrigoutack.attr,
+	&dev_attr_ittriginack.attr,
+	&dev_attr_itchinack.attr,
+#endif
+	NULL,
+};
+
+/* sysfs groups */
 static const struct attribute_group coresight_cti_group = {
 	.attrs = coresight_cti_attrs,
 };
@@ -118,8 +473,14 @@ static const struct attribute_group coresight_cti_mgmt_group = {
 	.name = "mgmt",
 };
 
+static const struct attribute_group coresight_cti_regs_group = {
+	.attrs = coresight_cti_regs_attrs,
+	.name = "regs",
+};
+
 const struct attribute_group *coresight_cti_groups[] = {
 	&coresight_cti_group,
 	&coresight_cti_mgmt_group,
+	&coresight_cti_regs_group,
 	NULL,
 };
diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
index c71b72d12534..e0748cc92384 100644
--- a/drivers/hwtracing/coresight/coresight-cti.c
+++ b/drivers/hwtracing/coresight/coresight-cti.c
@@ -149,6 +149,25 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	return 0;
 }
 
+void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
+{
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(value, drvdata->base + offset);
+	CS_LOCK(drvdata->base);
+}
+
+void cti_write_intack(struct device *dev, u32 ackval)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *config = &drvdata->config;
+
+	spin_lock(&drvdata->spinlock);
+	/* write if enabled */
+	if (cti_active(config))
+		cti_write_single_reg(drvdata, CTIINTACK, ackval);
+	spin_unlock(&drvdata->spinlock);
+}
+
 /*
  * Look at the HW DEVID register for some of the HW settings.
  * DEVID[15:8] - max number of in / out triggers.
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index d0ac90f49544..35eb77b276c4 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -180,7 +180,15 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 					   int out_sigs);
 int cti_enable(struct coresight_device *csdev);
 int cti_disable(struct coresight_device *csdev);
+void cti_write_intack(struct device *dev, u32 ackval);
+void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value);
 struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 
+/* cti powered and enabled */
+static inline bool cti_active(struct cti_config *cfg)
+{
+	return cfg->hw_powered && cfg->hw_enabled;
+}
+
 #endif  /* _CORESIGHT_CORESIGHT_CTI_H */
-- 
2.17.1

