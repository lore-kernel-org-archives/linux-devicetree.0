Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B760C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 23:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1004C2073D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 23:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFe3VPy0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfLKXIj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 18:08:39 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35989 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLKXIj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 18:08:39 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so537104wru.3
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 15:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=NWvg2plk8dLdSHAWazpvsxc1joMZq3uJRjtKChLL7eE=;
        b=iFe3VPy0seYgsGsne4ESkhWzoPtqtA/IQ8rs48miCnAMoU4iWPbDu/BvyWh0ovyjbP
         nqNP1wAHeABD189mI7f2/gkXYnMLhKdWkyjmxUukVdfHslYutc63/sEPBaDy/s4KGevU
         X3AH8S/BageTg2f7vCog3GiS1s8Ec4gFXAWdYNwoBtlwdTot0MMp4JM2d7+Fu1b6GRa7
         oaDqBRdalb7LfA3LP1kdGWY0AXw8QJ6IlYreOSOD6qbIM83ZUVVhrKtVScsHeqmMHiZR
         Ey5K/QSIWmr+vhkuX0wWWvT2Irl5t0cWnWeuCcPMRc2yiBfo/UrM/xPTNQ9BPZjOC1Ic
         TpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NWvg2plk8dLdSHAWazpvsxc1joMZq3uJRjtKChLL7eE=;
        b=Mi9/rnSEhct5NWBb23poUu4G9G/X8+yXnj1Tz3CJQBJXV9SJcc3vvSeW+HWRK1pzld
         +oMnFxtUqdG360UEdxrMMDKe47CqCSkthegRXsk8GFtWvWQe9I+/K3lY301mcLxdax6Y
         D1WSXRWBH9hiHKbMrekCaWmix1gUZ+A+DdydY8Sz1u0Vp5h9a5IjAxCI/NuD0z5PJJSB
         9wF9hPMhmblfxIo6m+F5DKnsnyNI2aKYq4oV0xhT5ExeTwaEyfU5qavkfnIJ0G8SHZgJ
         wMOgrHp+syHvt3RBxVFT7nwEdnX6wOheex4pp3HP1ITWYmwdt5MnTddeGQDv3NZJz5uU
         tiyg==
X-Gm-Message-State: APjAAAWWiyP63tD7YMgWLIIL8mrCSWsllFw8Th/ipKM+cP6CKS1ZaTpf
        S4Ismk+dWbb+TUeoGX9/VxijsQ==
X-Google-Smtp-Source: APXvYqy9h2elDbbjSyyiy1x7XhOsrJyfGdumh3/eizKcYN+MA+tBcIa+LXunykyhVU16BY2JfqEZGw==
X-Received: by 2002:a05:6000:118d:: with SMTP id g13mr2597682wrx.141.1576105716043;
        Wed, 11 Dec 2019 15:08:36 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:140f:3f8d:647c:49b0])
        by smtp.gmail.com with ESMTPSA id y139sm4215238wmd.24.2019.12.11.15.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 15:08:35 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org
Subject: [PATCH v6 07/15] coresight: cti: Add device tree support for custom CTI.
Date:   Wed, 11 Dec 2019 23:08:31 +0000
Message-Id: <20191211230831.5250-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds support for CTIs whose connections are implementation defined at
hardware design time, and not constrained by v8 architecture.

These CTIs have no standard connection setup, all the settings have to
be defined in the device tree files. The patch creates a set of connections
and trigger signals based on the information provided.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-cti-platform.c        | 235 +++++++++++++++++-
 .../hwtracing/coresight/coresight-cti-sysfs.c |  11 +
 2 files changed, 242 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index 36a276eda50a..b44d83142b62 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -13,9 +13,19 @@
 #define NR_V8PE_OUT_SIGS	3
 #define NR_V8ETM_INOUT_SIGS	4
 
+/* CTI device tree trigger connection node keyword */
+#define CTI_DT_CONNS		"trig-conns"
+
 /* CTI device tree connection property keywords */
 #define CTI_DT_V8ARCH_COMPAT	"arm,coresight-cti-v8-arch"
 #define CTI_DT_CSDEV_ASSOC	"arm,cs-dev-assoc"
+#define CTI_DT_TRIGIN_SIGS	"arm,trig-in-sigs"
+#define CTI_DT_TRIGOUT_SIGS	"arm,trig-out-sigs"
+#define CTI_DT_TRIGIN_TYPES	"arm,trig-in-types"
+#define CTI_DT_TRIGOUT_TYPES	"arm,trig-out-types"
+#define CTI_DT_FILTER_OUT_SIGS	"arm,trig-filters"
+#define CTI_DT_CONN_NAME	"arm,trig-conn-name"
+#define CTI_DT_CTM_ID		"arm,cti-ctm-id"
 
 #ifdef CONFIG_OF
 /*
@@ -87,6 +97,14 @@ cti_plat_get_csdev_or_node_name(struct fwnode_handle *fwnode,
 	return name;
 }
 
+static bool cti_plat_node_name_eq(struct fwnode_handle *fwnode,
+				  const char *name)
+{
+	if (is_of_node(fwnode))
+		return of_node_name_eq(to_of_node(fwnode), name);
+	return false;
+}
+
 static int cti_plat_create_v8_etm_connection(struct device *dev,
 					     struct cti_drvdata *drvdata)
 {
@@ -205,6 +223,211 @@ static int cti_plat_check_v8_arch_compatible(struct device *dev)
 	return 0;
 }
 
+static int cti_plat_count_sig_elements(const struct fwnode_handle *fwnode,
+				       const char *name)
+{
+	int nr_elem = fwnode_property_count_u32(fwnode, name);
+
+	return (nr_elem < 0 ? 0 : nr_elem);
+}
+
+static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
+				    const struct fwnode_handle *fwnode,
+				    const char *grp_name)
+{
+	int idx, err = 0;
+	u32 *values;
+
+	if (!tgrp->nr_sigs)
+		return 0;
+
+	values = kcalloc(tgrp->nr_sigs, sizeof(u32), GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	err = fwnode_property_read_u32_array(fwnode, grp_name,
+					     values, tgrp->nr_sigs);
+
+	if (!err) {
+		/* set the signal usage mask */
+		for (idx = 0; idx < tgrp->nr_sigs; idx++)
+			tgrp->used_mask |= BIT(values[idx]);
+	}
+
+	kfree(values);
+	return err;
+}
+
+static int cti_plat_read_trig_types(struct cti_trig_grp *tgrp,
+				    const struct fwnode_handle *fwnode,
+				    const char *type_name)
+{
+	int items, err = 0, nr_sigs;
+	u32 *values = NULL, i;
+
+	/* allocate an array according to number of signals in connection */
+	nr_sigs = tgrp->nr_sigs;
+	if (!nr_sigs)
+		return 0;
+
+	/* see if any types have been included in the device description */
+	items = cti_plat_count_sig_elements(fwnode, type_name);
+	if (items > nr_sigs)
+		return -EINVAL;
+
+	/* need an array to store the values iff there are any */
+	if (items) {
+		values = kcalloc(items, sizeof(u32), GFP_KERNEL);
+		if (!values)
+			return -ENOMEM;
+
+		err = fwnode_property_read_u32_array(fwnode, type_name,
+						     values, items);
+		if (err)
+			goto read_trig_types_out;
+	}
+
+	/*
+	 * Match type id to signal index, 1st type to 1st index etc.
+	 * If fewer types than signals default remainder to GEN_IO.
+	 */
+	for (i = 0; i < nr_sigs; i++) {
+		if (i < items) {
+			tgrp->sig_types[i] =
+				values[i] < CTI_TRIG_MAX ? values[i] : GEN_IO;
+		} else {
+			tgrp->sig_types[i] = GEN_IO;
+		}
+	}
+
+read_trig_types_out:
+	kfree(values);
+	return err;
+}
+
+static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
+					const struct fwnode_handle *fwnode)
+{
+	struct cti_trig_grp *tg = NULL;
+	int err = 0, nr_filter_sigs;
+
+	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
+						     CTI_DT_FILTER_OUT_SIGS);
+	if (nr_filter_sigs == 0)
+		return 0;
+
+	if (nr_filter_sigs > drvdata->config.nr_trig_max)
+		return -EINVAL;
+
+	tg = kzalloc(sizeof(*tg), GFP_KERNEL);
+	if (!tg)
+		return -ENOMEM;
+
+	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
+	if (!err)
+		drvdata->config.trig_out_filter |= tg->used_mask;
+
+	kfree(tg);
+	return err;
+}
+
+static int cti_plat_create_connection(struct device *dev,
+				      struct cti_drvdata *drvdata,
+				      struct fwnode_handle *fwnode)
+{
+	struct cti_trig_con *tc = NULL;
+	int cpuid = -1, err = 0;
+	struct fwnode_handle *cs_fwnode = NULL;
+	struct coresight_device *csdev = NULL;
+	const char *assoc_name = "unknown";
+	char cpu_name_str[16];
+	int nr_sigs_in, nr_sigs_out;
+
+	/* look to see how many in and out signals we have */
+	nr_sigs_in = cti_plat_count_sig_elements(fwnode, CTI_DT_TRIGIN_SIGS);
+	nr_sigs_out = cti_plat_count_sig_elements(fwnode, CTI_DT_TRIGOUT_SIGS);
+
+	if ((nr_sigs_in > drvdata->config.nr_trig_max) ||
+	    (nr_sigs_out > drvdata->config.nr_trig_max))
+		return -EINVAL;
+
+	tc = cti_allocate_trig_con(dev, nr_sigs_in, nr_sigs_out);
+	if (!tc)
+		return -ENOMEM;
+
+	/* look for the signals properties. */
+	err = cti_plat_read_trig_group(tc->con_in, fwnode,
+				       CTI_DT_TRIGIN_SIGS);
+	if (err)
+		goto create_con_err;
+
+	err = cti_plat_read_trig_types(tc->con_in, fwnode,
+				       CTI_DT_TRIGIN_TYPES);
+	if (err)
+		goto create_con_err;
+
+	err = cti_plat_read_trig_group(tc->con_out, fwnode,
+				       CTI_DT_TRIGOUT_SIGS);
+	if (err)
+		goto create_con_err;
+
+	err = cti_plat_read_trig_types(tc->con_out, fwnode,
+				       CTI_DT_TRIGOUT_TYPES);
+	if (err)
+		goto create_con_err;
+
+	err = cti_plat_process_filter_sigs(drvdata, fwnode);
+	if (err)
+		goto create_con_err;
+
+	/* read the connection name if set - may be overridden by later */
+	fwnode_property_read_string(fwnode, CTI_DT_CONN_NAME, &assoc_name);
+
+	/* associated cpu ? */
+	cpuid = cti_plat_get_cpu_at_node(fwnode);
+	if (cpuid >= 0) {
+		drvdata->ctidev.cpu = cpuid;
+		scnprintf(cpu_name_str, sizeof(cpu_name_str), "cpu%d", cpuid);
+		assoc_name = cpu_name_str;
+	} else {
+		/* associated device ? */
+		cs_fwnode = fwnode_find_reference(fwnode,
+						  CTI_DT_CSDEV_ASSOC, 0);
+		if (!IS_ERR_OR_NULL(cs_fwnode)) {
+			assoc_name = cti_plat_get_csdev_or_node_name(cs_fwnode,
+								     &csdev);
+			fwnode_handle_put(cs_fwnode);
+		}
+	}
+	/* set up a connection */
+	err = cti_add_connection_entry(dev, drvdata, tc, csdev, assoc_name);
+
+create_con_err:
+	return err;
+}
+
+static int cti_plat_create_impdef_connections(struct device *dev,
+					      struct cti_drvdata *drvdata)
+{
+	int rc = 0;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct fwnode_handle *child = NULL;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -EINVAL;
+
+	fwnode_for_each_child_node(fwnode, child) {
+		if (cti_plat_node_name_eq(child, CTI_DT_CONNS))
+			rc = cti_plat_create_connection(dev, drvdata,
+							child);
+		if (rc != 0)
+			break;
+	}
+	fwnode_handle_put(child);
+
+	return rc;
+}
+
 /* get the hardware configuration & connection data. */
 int cti_plat_get_hw_data(struct device *dev,
 			 struct cti_drvdata *drvdata)
@@ -212,12 +435,16 @@ int cti_plat_get_hw_data(struct device *dev,
 	int rc = 0;
 	struct cti_device *cti_dev = &drvdata->ctidev;
 
+	/* get any CTM ID - defaults to 0 */
+	device_property_read_u32(dev, CTI_DT_CTM_ID, &cti_dev->ctm_id);
+
 	/* check for a v8 architectural CTI device */
-	if (cti_plat_check_v8_arch_compatible(dev)) {
+	if (cti_plat_check_v8_arch_compatible(dev))
 		rc = cti_plat_create_v8_connections(dev, drvdata);
-		if (rc)
-			return rc;
-	}
+	else
+		rc = cti_plat_create_impdef_connections(dev, drvdata);
+	if (rc)
+		return rc;
 
 	/* if no connections, just add a single default based on max IN-OUT */
 	if (cti_dev->nr_trig_con == 0)
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 37e71724b67b..8af1986ed69f 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -56,9 +56,20 @@ static ssize_t enable_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t ctmid_show(struct device *dev,
+			  struct device_attribute *attr,
+			  char *buf)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", drvdata->ctidev.ctm_id);
+}
+static DEVICE_ATTR_RO(ctmid);
+
 /* attribute and group sysfs tables. */
 static struct attribute *coresight_cti_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_ctmid.attr,
 	NULL,
 };
 
-- 
2.17.1

