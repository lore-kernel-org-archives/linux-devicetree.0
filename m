Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C4AC33CAA
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:19:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 621072245C
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyGP9Zo0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfKSXTc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 18:19:32 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:53087 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfKSXTc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 18:19:32 -0500
Received: by mail-wm1-f49.google.com with SMTP id l1so5070851wme.2
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 15:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gASq40kKk+k+/zlsS50kf8DC90xUISoOvv0MhM++p/Y=;
        b=EyGP9Zo00ALyjS7aO6RLiwmiwRRr0iqrCH3KujyXSwq4ae7oKcCW1URtOrwFYeJHQw
         JvPx2/ba3O+WAfNqwfGICdtX21UhQnR9Lc2s2HzYQp8a1iRjXKD18CCBpDbQ27U9XOb3
         Hu3Y14DFYpQ7A6o0RLoyPwaFI/56LViiHFep7mwXH2BgiAdzsPVwJn39rY1L/gq7XMnf
         o3pHaBiIufhKrUiwhfqLgkmw1TipGklYahEl/5unHlBQmoZcIT6+5QPgw0TGfP5/xh7C
         rP60JsfsamyVzI/1j3OhJ6ROEAIehlGRXtRcKC2FuCZLSidSIGUC8OetQJZrdkL0X1Vf
         vlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gASq40kKk+k+/zlsS50kf8DC90xUISoOvv0MhM++p/Y=;
        b=R4MTL0PAHqlXPq7JB2AgD5RLdTh6heFF+FfFRA2NIHehqkCY2q0mOF/pVhqb3otaBW
         +Brz8yrTUbES5arUfmiNBeEtC+nf6f7qJmSk9DyOq9HP5xEyRQdYjmFTrKzI3+IfjqWk
         d74OgpxR5QztYRcO27gewrzpk8raOnqxwUWoNWCYAiVuk3yZkck3iqy0E+r7bgawxzP7
         fzxRrUO+LGdAGDxOgbsnN3y3sqNqRZgn+aOx/wO38YnYxSxA4k2/FTNY5/TE2/W5iGN1
         QDQuG55JpnonGnY9szq9DYStXTPDM6CRtHtlBN4YPwL5dS+jHhYA1lTPiXlLvapTrAzV
         sUFg==
X-Gm-Message-State: APjAAAXasDygiHHZvdnRyg3HZsCyIxMQvMIN5NHw1YOtPDkQ/6sxUleY
        vhXx+TogUphlX8Ps/l6aM7QG+Q==
X-Google-Smtp-Source: APXvYqxFlUbL9W+GsGI1X7t7YRISTPmF7qHeSSe0YaNF2jBHPKbKQfiqWpyKwNCZQJeOSktKQY8LMQ==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr340271wmo.147.1574205568910;
        Tue, 19 Nov 2019 15:19:28 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a19d:4139:292b:19a0])
        by smtp.gmail.com with ESMTPSA id m15sm15746717wrj.52.2019.11.19.15.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:19:28 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com
Subject: [PATCH v5 09/14] coresight: cti: Add connection information to sysfs
Date:   Tue, 19 Nov 2019 23:19:07 +0000
Message-Id: <20191119231912.12768-10-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119231912.12768-1-mike.leach@linaro.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Dynamically adds sysfs attributes for all connections defined in the CTI.

Each connection has a triggers<N> sub-directory with name, in_signals,
in_types, out_signals and out_types as read-only parameters in the
directory. in_ or out_ parameters may be omitted if there are no in or
out signals for the connection.

Additionally each device has a nr_cons in the connections sub-directory.

This allows clients to explore the connection and trigger signal details
without needing to refer to device tree or specification of the device.

Standardised type information is provided for certain common functions -
e.g. snk_full for a trigger from a sink indicating full. Otherwise type
defaults to genio.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-cti-sysfs.c | 376 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-cti.c   |  13 +-
 drivers/hwtracing/coresight/coresight-cti.h   |  11 +-
 3 files changed, 396 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index f800402f73da..91986732506f 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -8,6 +8,67 @@
 
 #include "coresight-cti.h"
 
+/*
+ * Declare the number of static declared attribute groups
+ * Value includes groups + NULL value at end of table.
+ */
+#define CORESIGHT_CTI_STATIC_GROUPS_MAX 5
+
+/*
+ * List of trigger signal type names. Match the constants declared in
+ * include\dt-bindings\arm\coresight-cti-dt.h
+ */
+static const char * const sig_type_names[] = {
+	"genio",	/* GEN_IO */
+	"intreq",	/* GEN_INTREQ */
+	"intack",	/* GEN_INTACK */
+	"haltreq",	/* GEN_HALTREQ */
+	"restartreq",	/* GEN_RESTARTREQ */
+	"pe_edbgreq",	/* PE_EDBGREQ */
+	"pe_dbgrestart",/* PE_DBGRESTART */
+	"pe_ctiirq",	/* PE_CTIIRQ */
+	"pe_pmuirq",	/* PE_PMUIRQ */
+	"pe_dbgtrigger",/* PE_DBGTRIGGER */
+	"etm_extout",	/* ETM_EXTOUT */
+	"etm_extin",	/* ETM_EXTIN */
+	"snk_full",	/* SNK_FULL */
+	"snk_acqcomp",	/* SNK_ACQCOMP */
+	"snk_flushcomp",/* SNK_FLUSHCOMP */
+	"snk_flushin",	/* SNK_FLUSHIN */
+	"snk_trigin",	/* SNK_TRIGIN */
+	"stm_asyncout",	/* STM_ASYNCOUT */
+	"stm_tout_spte",/* STM_TOUT_SPTE */
+	"stm_tout_sw",	/* STM_TOUT_SW */
+	"stm_tout_hete",/* STM_TOUT_HETE */
+	"stm_hwevent",	/* STM_HWEVENT */
+	"ela_tstart",	/* ELA_TSTART */
+	"ela_tstop",	/* ELA_TSTOP */
+	"ela_dbgreq",	/* ELA_DBGREQ */
+};
+
+/* Show function pointer used in the connections dynamic declared attributes*/
+typedef ssize_t (*p_show_fn)(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+
+/* Connection attribute types */
+enum cti_conn_attr_type {
+	CTI_CON_ATTR_NAME,
+	CTI_CON_ATTR_TRIGIN_SIG,
+	CTI_CON_ATTR_TRIGOUT_SIG,
+	CTI_CON_ATTR_TRIGIN_TYPES,
+	CTI_CON_ATTR_TRIGOUT_TYPES,
+	CTI_CON_ATTR_MAX,
+};
+
+/* Names for the connection attributes */
+static const char * const con_attr_names[CTI_CON_ATTR_MAX] = {
+	"name",
+	"in_signals",
+	"out_signals",
+	"in_types",
+	"out_types",
+};
+
 /* basic attributes */
 static ssize_t enable_show(struct device *dev,
 			   struct device_attribute *attr,
@@ -66,10 +127,21 @@ static ssize_t ctmid_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(ctmid);
 
+static ssize_t nr_trigger_cons_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", drvdata->ctidev.nr_trig_con);
+}
+static DEVICE_ATTR_RO(nr_trigger_cons);
+
 /* attribute and group sysfs tables. */
 static struct attribute *coresight_cti_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_ctmid.attr,
+	&dev_attr_nr_trigger_cons.attr,
 	NULL,
 };
 
@@ -818,7 +890,306 @@ static struct attribute *coresight_cti_channel_attrs[] = {
 	NULL,
 };
 
-/* sysfs groups */
+/* Create the connections trigger groups and attrs dynamically */
+/*
+ * Each connection has dynamic group triggers<N> + name, trigin/out sigs/types
+ * attributes, + each device has static nr_trigger_cons giving the number
+ * of groups. e.g. in sysfs:-
+ * /cti_<name>/triggers0
+ * /cti_<name>/triggers1
+ * /cti_<name>/nr_trigger_cons
+ * where nr_trigger_cons = 2
+ */
+static ssize_t con_name_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct dev_ext_attribute *ext_attr =
+		container_of(attr, struct dev_ext_attribute, attr);
+	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", con->con_dev_name);
+}
+
+static ssize_t trigin_sig_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct dev_ext_attribute *ext_attr =
+		container_of(attr, struct dev_ext_attribute, attr);
+	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *cfg = &drvdata->config;
+	unsigned long mask = con->con_in->used_mask;
+
+	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+}
+
+static ssize_t trigout_sig_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct dev_ext_attribute *ext_attr =
+		container_of(attr, struct dev_ext_attribute, attr);
+	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *cfg = &drvdata->config;
+	unsigned long mask = con->con_out->used_mask;
+
+	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+}
+
+/* convert a sig type id to a name */
+static const char *
+cti_sig_type_name(struct cti_trig_con *con, int used_count, bool in)
+{
+	int idx = 0;
+	struct cti_trig_grp *grp = in ? con->con_in : con->con_out;
+
+	if (grp->sig_types) {
+		if (used_count < grp->nr_sigs)
+			idx = grp->sig_types[used_count];
+	}
+	return sig_type_names[idx];
+}
+
+static ssize_t trigin_type_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct dev_ext_attribute *ext_attr =
+		container_of(attr, struct dev_ext_attribute, attr);
+	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
+	int sig_idx, used = 0, b_sz = PAGE_SIZE;
+	const char *name;
+
+	for (sig_idx = 0; sig_idx < con->con_in->nr_sigs; sig_idx++) {
+		name = cti_sig_type_name(con, sig_idx, true);
+		used += scnprintf(buf + used, b_sz - used, "%s ", name);
+	}
+	used += scnprintf(buf + used, b_sz - used, "\n");
+	return used;
+}
+
+static ssize_t trigout_type_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct dev_ext_attribute *ext_attr =
+		container_of(attr, struct dev_ext_attribute, attr);
+	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
+	int sig_idx, used = 0, b_sz = PAGE_SIZE;
+	const char *name;
+
+	for (sig_idx = 0; sig_idx < con->con_out->nr_sigs; sig_idx++) {
+		name = cti_sig_type_name(con, sig_idx, false);
+		used += scnprintf(buf + used, b_sz - used, "%s ", name);
+	}
+	used += scnprintf(buf + used, b_sz - used, "\n");
+	return used;
+}
+
+/*
+ * Array of show function names declared above to allow selection
+ * for the connection attributes
+ */
+static p_show_fn show_fns[CTI_CON_ATTR_MAX] = {
+	con_name_show,
+	trigin_sig_show,
+	trigout_sig_show,
+	trigin_type_show,
+	trigout_type_show,
+};
+
+static int cti_create_con_sysfs_attr(struct cti_trig_con *con,
+				     enum cti_conn_attr_type attr_type,
+				     int attr_idx)
+{
+	struct dev_ext_attribute *dev_ext_attr = 0;
+	char *name = 0;
+
+	dev_ext_attr = kzalloc(sizeof(struct dev_ext_attribute), GFP_KERNEL);
+	if (dev_ext_attr) {
+		name = kstrdup(con_attr_names[attr_type], GFP_KERNEL);
+		if (name) {
+			/* fill out the underlying attribute struct */
+			dev_ext_attr->attr.attr.name = name;
+			dev_ext_attr->attr.attr.mode = 0444;
+
+			/* now the device_attribute struct */
+			dev_ext_attr->attr.show = show_fns[attr_type];
+		} else {
+			kfree(dev_ext_attr);
+			return -ENOMEM;
+		}
+	} else {
+		return -ENOMEM;
+	}
+	dev_ext_attr->var = con;
+	con->con_attrs[attr_idx] = &dev_ext_attr->attr.attr;
+	return 0;
+}
+
+static struct attribute_group *
+cti_create_con_sysfs_group(struct cti_device *ctidev, int con_idx,
+			   struct cti_trig_con *con)
+{
+	struct attribute_group *group = NULL;
+
+	group = kzalloc(sizeof(struct attribute_group), GFP_KERNEL);
+	if (!group)
+		return NULL;
+
+	group->name = kasprintf(GFP_KERNEL, "triggers%d", con_idx);
+	if (!group->name) {
+		kfree(group);
+		return NULL;
+	}
+
+	ctidev->con_groups[con_idx + CORESIGHT_CTI_STATIC_GROUPS_MAX - 1]
+		= group;
+	con->attr_group = group;
+	return group;
+}
+
+/* create a triggers connection group and the attributes for that group */
+static int cti_create_con_attr_set(int con_idx, struct cti_device *ctidev,
+				   struct cti_trig_con *con)
+{
+	struct attribute_group *attr_group = NULL;
+	int attr_idx = 0;
+	int err = -ENOMEM;
+
+	attr_group = cti_create_con_sysfs_group(ctidev, con_idx, con);
+	if (!attr_group)
+		return -ENOMEM;
+
+	/* allocate NULL terminated array of attributes */
+	con->con_attrs = kcalloc(CTI_CON_ATTR_MAX + 1,
+				 sizeof(struct attribute *),
+				 GFP_KERNEL);
+	if (!con->con_attrs)
+		return -ENOMEM;
+
+	err = cti_create_con_sysfs_attr(con, CTI_CON_ATTR_NAME, attr_idx++);
+	if (err)
+		return err;
+
+	if (con->con_in->nr_sigs > 0) {
+		err = cti_create_con_sysfs_attr(con, CTI_CON_ATTR_TRIGIN_SIG,
+						attr_idx++);
+		if (err)
+			return err;
+
+		err = cti_create_con_sysfs_attr(con, CTI_CON_ATTR_TRIGIN_TYPES,
+						attr_idx++);
+		if (err)
+			return err;
+	}
+
+	if (con->con_in->nr_sigs > 0) {
+		err = cti_create_con_sysfs_attr(con, CTI_CON_ATTR_TRIGOUT_SIG,
+						attr_idx++);
+		if (err)
+			return err;
+
+		err = cti_create_con_sysfs_attr(con, CTI_CON_ATTR_TRIGOUT_TYPES,
+						attr_idx++);
+		if (err)
+			return err;
+	}
+	attr_group->attrs = con->con_attrs;
+	return 0;
+}
+
+/* create the array of group pointers for the CTI sysfs groups */
+int cti_create_cons_groups(struct cti_device *ctidev)
+{
+	int i, nr_groups;
+
+	/* nr groups - dynamic + static + NULL terminator */
+	nr_groups = ctidev->nr_trig_con + CORESIGHT_CTI_STATIC_GROUPS_MAX;
+	ctidev->con_groups = kcalloc(nr_groups,
+				     sizeof(struct attribute_group *),
+				     GFP_KERNEL);
+	if (!ctidev->con_groups)
+		return -ENOMEM;
+
+	/* populate first locations with the static set of groups */
+	for (i = 0; i < (CORESIGHT_CTI_STATIC_GROUPS_MAX - 1); i++)
+		ctidev->con_groups[i] = coresight_cti_groups[i];
+
+	return 0;
+}
+
+int cti_create_cons_sysfs(struct cti_drvdata *drvdata)
+{
+	struct cti_device *ctidev = &drvdata->ctidev;
+	int err, con_idx = 0;
+	struct cti_trig_con *tc = NULL;
+
+	err = cti_create_cons_groups(ctidev);
+	if (err)
+		return err;
+
+	/* add dynamic set for each connection */
+	list_for_each_entry(tc, &ctidev->trig_cons, node) {
+		err = cti_create_con_attr_set(con_idx++, ctidev, tc);
+		if (err)
+			goto cons_sysfs_err;
+	}
+	return 0;
+
+cons_sysfs_err:
+	cti_destroy_cons_sysfs(ctidev);
+	return err;
+}
+
+void cti_free_con_attr(struct attribute *con_attr)
+{
+	struct device_attribute *dattr =
+		container_of(con_attr, struct device_attribute, attr);
+	struct dev_ext_attribute *dev_ext_attr =
+		container_of(dattr, struct dev_ext_attribute, attr);
+	kfree(con_attr->name);
+	kfree(dev_ext_attr);
+}
+
+void cti_free_con_group(struct attribute_group *attr_group)
+{
+	if (attr_group) {
+		kfree(attr_group->name);
+		kfree(attr_group);
+	}
+}
+
+void cti_destroy_cons_attr_set(int con_idx, struct cti_device *ctidev,
+			       struct cti_trig_con *con)
+{
+	int i;
+
+	if (con->con_attrs) {
+		for (i = 0; i < CTI_CON_ATTR_MAX; i++) {
+			if (con->con_attrs[i])
+				cti_free_con_attr(con->con_attrs[i]);
+		}
+		kfree(con->con_attrs);
+	}
+	cti_free_con_group(con->attr_group);
+}
+
+void cti_destroy_cons_sysfs(struct cti_device *ctidev)
+{
+	struct cti_trig_con *tc;
+	int con_idx = 0;
+
+	list_for_each_entry(tc, &ctidev->trig_cons, node) {
+		cti_destroy_cons_attr_set(con_idx++, ctidev, tc);
+	}
+	kfree(ctidev->con_groups);
+}
+
+/* attribute and group sysfs tables. */
 static const struct attribute_group coresight_cti_group = {
 	.attrs = coresight_cti_attrs,
 };
@@ -838,7 +1209,8 @@ static const struct attribute_group coresight_cti_channels_group = {
 	.name = "channels",
 };
 
-const struct attribute_group *coresight_cti_groups[] = {
+const struct attribute_group *
+coresight_cti_groups[CORESIGHT_CTI_STATIC_GROUPS_MAX] = {
 	&coresight_cti_group,
 	&coresight_cti_mgmt_group,
 	&coresight_cti_regs_group,
diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
index cf116463149a..c3d63cc53bdd 100644
--- a/drivers/hwtracing/coresight/coresight-cti.c
+++ b/drivers/hwtracing/coresight/coresight-cti.c
@@ -561,6 +561,9 @@ static void cti_device_release(struct device *dev)
 
 	mutex_lock(&ect_mutex);
 
+	/* clear the dynamic sysfs associate with connections */
+	cti_destroy_cons_sysfs(&drvdata->ctidev);
+
 	/* remove from the list */
 	list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
 		if (ect_item == drvdata) {
@@ -636,12 +639,20 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 		goto err_out;
 	}
 
+	/* create dynamic attributes for connections */
+	ret = cti_create_cons_sysfs(drvdata);
+	if (ret) {
+		pr_err("%s: create dynamic sysfs entries failed\n",
+		       cti_desc.name);
+		goto err_out;
+	}
+
 	/* set up coresight component description */
 	cti_desc.pdata = pdata;
 	cti_desc.type = CORESIGHT_DEV_TYPE_ECT;
 	cti_desc.subtype.ect_subtype = CORESIGHT_DEV_SUBTYPE_ECT_CTI;
 	cti_desc.ops = &cti_ops;
-	cti_desc.groups = coresight_cti_groups;
+	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
 	drvdata->csdev = coresight_register(&cti_desc);
 	if (IS_ERR(drvdata->csdev)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 9a22f6fcad65..dc5b265acf5e 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -74,6 +74,8 @@ struct cti_trig_grp {
  * @con_dev: coresight device connected to the CTI, NULL if not CS device
  * @con_dev_name: name of connected device (CS or CPU)
  * @node: entry node in list of connections.
+ * @con_attrs: Dynamic sysfs attributes specific to this connection.
+ * @attr_group: Dynamic attribute group created for this connection.
  */
 struct cti_trig_con {
 	struct cti_trig_grp *con_in;
@@ -81,6 +83,8 @@ struct cti_trig_con {
 	struct coresight_device *con_dev;
 	char *con_dev_name;
 	struct list_head node;
+	struct attribute **con_attrs;
+	struct attribute_group *attr_group;
 };
 
 /**
@@ -91,12 +95,15 @@ struct cti_trig_con {
  *          assumed there is a single CTM per SoC, ID 0).
  * @trig_cons: list of connections to this device.
  * @cpu: CPU ID if associated with CPU, -1 otherwise.
+ * @con_groups: combined static and dynamic sysfs groups for trigger
+ *		connections.
  */
 struct cti_device {
 	int nr_trig_con;
 	u32 ctm_id;
 	struct list_head trig_cons;
 	int cpu;
+	const struct attribute_group **con_groups;
 };
 
 /**
@@ -111,7 +118,7 @@ struct cti_device {
  * @trig_in_use: bitfield of in triggers registered as in use.
  * @trig_out_use: bitfield of out triggers registered as in use.
  * @trig_out_filter: bitfield of out triggers that are blocked if filter
- *	             enabled. Typically this would be dbgreq / restart on
+ *		     enabled. Typically this would be dbgreq / restart on
  *		     a core CTI.
  * @trig_filter_enable: 1 if filtering enabled.
  * @xtrig_rchan_sel: channel selection for xtrigger connection show.
@@ -214,6 +221,8 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
 			u32 channel_idx);
 int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 		      u32 channel_idx);
+int cti_create_cons_sysfs(struct cti_drvdata *drvdata);
+void cti_destroy_cons_sysfs(struct cti_device *ctidev);
 struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 
-- 
2.17.1

