Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E484C432C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 21:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6C8D20727
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 21:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L/8ePBkL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfKYVXC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 16:23:02 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42700 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfKYVXC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 16:23:02 -0500
Received: by mail-pg1-f193.google.com with SMTP id q17so7810799pgt.9
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 13:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MRWbzEgUDmf3m7DHTyD54EPb8B/zhp4opLc7il/4TZ0=;
        b=L/8ePBkLez3+K02qqWuXHzwk2aoe/X/csJkxSiZ9yqGB073CgKBSnV0NCVAddtYhRA
         Y50OFSl9bR9JRWyHZuQ1HQPQA5jaboTM+KdNzZs9oomThyM9ZFXL+OdGojGpwRRH3QX8
         JaNM1Su0TjHE/31LckH9YGeeTpbN5P60ANE+3XINq9ZxfnEkVW9X8XIGxd0FgM+VgxLH
         a3VDqpQMsloYUsXPX2Kj1nqH7EWHFPfJUE4a8sHJRQ8xGN0pV2DSaW/AfcODj7iLAlBm
         lh7bXb6bZUXcsbi7IiO6LIYM3FHbf8pZNAzFDfW90SYsAvLrviPYQgU8A2fRdybWGgBT
         Q2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MRWbzEgUDmf3m7DHTyD54EPb8B/zhp4opLc7il/4TZ0=;
        b=EK0xAG9qMBGSPikwZNiGuCSykbCde3wuKqpDoJnLUrjGzXSZg/ECnZZGELIDWmvugJ
         fAM0ZBepqRH4505K6odAOBtCfKB5we0vVUHUM9ZjAf5HImjuxMRpnB2vSm3EH1qJDsAC
         vRF3hGZT1aTSFOfAcnD0UFo8KiCnoersPgUrWzPKtWhMONnXmzNY78sMUWzEnGOmOvV4
         SqHdacLYSwOpieI8WSjeUruzR+e8lmqONB4zwTfJyrt1ygm6osKFmlDebwMXwq+8oWT3
         IfYaJiSh0prEmz/H806aYeiA38Hh4q9dgi6dHXyGhs+glD8szWtX1IXOnHfiwHfJmgaH
         ISew==
X-Gm-Message-State: APjAAAWIE9tLcIXXthxP5zd6FabsgAkZV2cAHz1IesLzde8lag3roVhV
        KDgz9w52TKt2S1RUOzM8dj5fTQ==
X-Google-Smtp-Source: APXvYqzXRkrduILON+fC++84B2cdz7oCejyphDRUULYpI5GMxiVkhrcykpwAmPM/u71w01QGoLxnDQ==
X-Received: by 2002:a63:354e:: with SMTP id c75mr35774576pga.325.1574716980757;
        Mon, 25 Nov 2019 13:23:00 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d139sm10304228pfd.162.2019.11.25.13.22.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2019 13:23:00 -0800 (PST)
Date:   Mon, 25 Nov 2019 14:22:58 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com
Subject: Re: [PATCH v5 07/14] coresight: cti: Add device tree support for
 custom CTI.
Message-ID: <20191125212258.GB18542@xps15>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-8-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119231912.12768-8-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 19, 2019 at 11:19:05PM +0000, Mike Leach wrote:
> Adds support for CTIs whose connections are implementation defined at
> hardware design time, and not constrained by v8 architecture.
> 
> These CTIs have no standard connection setup, all the settings have to
> be defined in the device tree files. The patch creates a set of connections
> and trigger signals based on the information provided.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../coresight/coresight-cti-platform.c        | 250 +++++++++++++++++-
>  .../hwtracing/coresight/coresight-cti-sysfs.c |  11 +
>  2 files changed, 257 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index 790dd30b85f5..9c1ff432b487 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -13,9 +13,19 @@
>  #define NR_V8PE_OUT_SIGS	3
>  #define NR_V8ETM_INOUT_SIGS	4
>  
> +/* CTI device tree trigger connection node keyword */
> +#define CTI_DT_CONNS		"trig-conns"
> +
>  /* CTI device tree connection property keywords */
>  #define CTI_DT_V8ARCH		"arm,cti-v8-arch"
>  #define CTI_DT_CSDEV_ASSOC	"arm,cs-dev-assoc"
> +#define CTI_DT_TRIGIN_SIGS	"arm,trig-in-sigs"
> +#define CTI_DT_TRIGOUT_SIGS	"arm,trig-out-sigs"
> +#define CTI_DT_TRIGIN_TYPES	"arm,trig-in-types"
> +#define CTI_DT_TRIGOUT_TYPES	"arm,trig-out-types"
> +#define CTI_DT_FILTER_OUT_SIGS	"arm,trig-filters"
> +#define CTI_DT_CONN_NAME	"arm,trig-conn-name"
> +#define CTI_DT_CTM_ID		"arm,cti-ctm-id"
>  
>  /*
>   * Find a registered coresight device from a device fwnode.
> @@ -68,6 +78,12 @@ static const char *of_cti_get_node_name(const struct device_node *node)
>  		return node->full_name;
>  	return "unknown";
>  }
> +
> +static bool of_cti_node_name_eq(const struct device_node *node,
> +				const char *name)
> +{
> +	return of_node_name_eq(node, name);
> +}
>  #else
>  static int of_cti_get_cpu_at_node(const struct device_node *node)
>  {
> @@ -78,6 +94,12 @@ static const char *of_cti_get_node_name(const struct device_node *node)
>  {
>  	return "unknown";
>  }
> +
> +static bool of_cti_node_name_eq(const struct device_node *node,
> +				const char *name)
> +{
> +	return false;
> +}
>  #endif
>  
>  static int cti_plat_get_cpu_at_node(struct fwnode_handle *fwnode)
> @@ -94,6 +116,14 @@ static const char *cti_plat_get_node_name(struct fwnode_handle *fwnode)
>  	return "unknown";
>  }
>  
> +static bool cti_plat_node_name_eq(struct fwnode_handle *fwnode,
> +				  const char *name)
> +{
> +	if (is_of_node(fwnode))
> +		return of_cti_node_name_eq(to_of_node(fwnode), name);
> +	return false;
> +}
> +
>  static int cti_plat_create_v8_etm_connection(struct device *dev,
>  					     struct cti_drvdata *drvdata)
>  {
> @@ -205,6 +235,214 @@ static int cti_plat_create_v8_connections(struct device *dev,
>  	return ret;
>  }
>  
> +static int cti_plat_count_sig_elements(const struct fwnode_handle *fwnode,
> +				       const char *name)
> +{
> +	int nr_elem = fwnode_property_count_u32(fwnode, name);
> +
> +	return (nr_elem < 0 ? 0 : nr_elem);
> +}
> +
> +static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
> +				    const struct fwnode_handle *fwnode,
> +				    const char *grp_name)
> +{
> +	int idx, err = 0;
> +	u32 *values;
> +
> +	if (!tgrp->nr_sigs)
> +		return 0;
> +
> +	values = kcalloc(tgrp->nr_sigs, sizeof(u32), GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
> +	err = fwnode_property_read_u32_array(fwnode, grp_name,
> +					     values, tgrp->nr_sigs);
> +
> +	if (!err) {
> +		/* set the signal usage mask */
> +		for (idx = 0; idx < tgrp->nr_sigs; idx++)
> +			tgrp->used_mask |= BIT(values[idx]);
> +	}
> +
> +	kfree(values);
> +	return err;
> +}
> +
> +static int cti_plat_read_trig_types(struct cti_trig_grp *tgrp,
> +				    const struct fwnode_handle *fwnode,
> +				    const char *type_name)
> +{
> +	int items, used = 0, err = 0, nr_sigs;
> +	u32 *values = NULL, i;
> +
> +	/* allocate an array according to number of signals in connection */
> +	nr_sigs = tgrp->nr_sigs;
> +	if (!nr_sigs)
> +		return 0;
> +
> +	/* see if any types have been included in the device description */
> +	items = cti_plat_count_sig_elements(fwnode, type_name);
> +	if (items > nr_sigs)
> +		return -EINVAL;
> +
> +	/* need an array to store the values iff there are any */
> +	if (items) {
> +		values = kcalloc(items, sizeof(u32), GFP_KERNEL);
> +		if (!values)
> +			return -ENOMEM;
> +
> +		err = fwnode_property_read_u32_array(fwnode, type_name,
> +						     values, items);
> +		if (err)
> +			goto read_trig_types_out;
> +	}
> +
> +	/*
> +	 * Match type id to signal index, 1st type to 1st index etc.
> +	 * If fewer types than signals default remainder to GEN_IO.
> +	 */
> +	for (i = 0; i < nr_sigs; i++) {
> +		if (used < items) {
> +			tgrp->sig_types[i] =
> +				values[i] < CTI_TRIG_MAX ? values[i] : GEN_IO;
> +			used++;
> +		} else {
> +			tgrp->sig_types[i] = GEN_IO;
> +		}
> +	}
> +
> +read_trig_types_out:
> +	kfree(values);
> +	return err;
> +}
> +
> +static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
> +					const struct fwnode_handle *fwnode)
> +{
> +	struct cti_trig_grp *tg = NULL;
> +	int err = 0, nr_filter_sigs;
> +
> +	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
> +						     CTI_DT_FILTER_OUT_SIGS);
> +	if (nr_filter_sigs == 0)
> +		return 0;
> +
> +	if (nr_filter_sigs > drvdata->config.nr_trig_max)
> +		return -EINVAL;
> +
> +	tg = kzalloc(sizeof(*tg), GFP_KERNEL);
> +	if (!tg)
> +		return -ENOMEM;
> +
> +	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
> +	if (!err)
> +		drvdata->config.trig_out_filter |= tg->used_mask;
> +
> +	kfree(tg);
> +	return err;
> +}
> +
> +static int cti_plat_create_connection(struct device *dev,
> +				      struct cti_drvdata *drvdata,
> +				      struct fwnode_handle *fwnode)
> +{
> +	struct cti_trig_con *tc = NULL;
> +	int cpuid = -1, err = 0;
> +	struct fwnode_handle *cs_fwnode = NULL;
> +	struct coresight_device *csdev = NULL;
> +	const char *assoc_name = "unknown";
> +	char cpu_name_str[16];
> +	int nr_sigs_in, nr_sigs_out;
> +
> +	/* look to see how many in and out signals we have */
> +	nr_sigs_in = cti_plat_count_sig_elements(fwnode, CTI_DT_TRIGIN_SIGS);
> +	nr_sigs_out = cti_plat_count_sig_elements(fwnode, CTI_DT_TRIGOUT_SIGS);
> +
> +	if ((nr_sigs_in > drvdata->config.nr_trig_max) ||
> +	    (nr_sigs_out > drvdata->config.nr_trig_max))
> +		return -EINVAL;
> +
> +	tc = cti_allocate_trig_con(dev, nr_sigs_in, nr_sigs_out);
> +	if (!tc)
> +		return -ENOMEM;
> +
> +	/* look for the signals properties. */
> +	err = cti_plat_read_trig_group(tc->con_in, fwnode,
> +				       CTI_DT_TRIGIN_SIGS);
> +	if (err)
> +		goto create_con_err;
> +
> +	err = cti_plat_read_trig_types(tc->con_in, fwnode,
> +				       CTI_DT_TRIGIN_TYPES);
> +	if (err)
> +		goto create_con_err;
> +
> +	err = cti_plat_read_trig_group(tc->con_out, fwnode,
> +				       CTI_DT_TRIGOUT_SIGS);
> +	if (err)
> +		goto create_con_err;
> +
> +	err = cti_plat_read_trig_types(tc->con_out, fwnode,
> +				       CTI_DT_TRIGOUT_TYPES);
> +	if (err)
> +		goto create_con_err;
> +
> +	err = cti_plat_process_filter_sigs(drvdata, fwnode);
> +	if (err)
> +		goto create_con_err;
> +
> +	/* read the connection name if set - may be overridden by later */
> +	fwnode_property_read_string(fwnode, CTI_DT_CONN_NAME, &assoc_name);
> +
> +	/* associated cpu ? */
> +	cpuid = cti_plat_get_cpu_at_node(fwnode);
> +	if (cpuid >= 0) {
> +		drvdata->ctidev.cpu = cpuid;
> +		scnprintf(cpu_name_str, sizeof(cpu_name_str), "cpu%d", cpuid);
> +		assoc_name = cpu_name_str;
> +	} else {
> +		/* associated device ? */
> +		cs_fwnode = fwnode_find_reference(fwnode,
> +						  CTI_DT_CSDEV_ASSOC, 0);
> +		if (!IS_ERR_OR_NULL(cs_fwnode)) {
> +			csdev = cti_get_assoc_csdev_by_fwnode(cs_fwnode);
> +			if (csdev) /* use device name if csdev found */
> +				assoc_name = dev_name(&csdev->dev);
> +			else  /* otherwise node name for later association */
> +				assoc_name = cti_plat_get_node_name(cs_fwnode);
> +			fwnode_handle_put(cs_fwnode);
> +		}
> +	}
> +	/* set up a connection */
> +	err = cti_add_connection_entry(dev, drvdata, tc, csdev, assoc_name);
> +
> +create_con_err:
> +	return err;
> +}
> +
> +static int cti_plat_create_impdef_connections(struct device *dev,
> +					      struct cti_drvdata *drvdata)
> +{
> +	int rc = 0;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct fwnode_handle *child = NULL;
> +
> +	if (IS_ERR_OR_NULL(fwnode))
> +		return -EINVAL;
> +
> +	fwnode_for_each_child_node(fwnode, child) {
> +		if (cti_plat_node_name_eq(child, CTI_DT_CONNS))
> +			rc = cti_plat_create_connection(dev, drvdata, child);
> +		if (rc != 0)
> +			break;
> +	}
> +	fwnode_handle_put(child);

As far as I can tell we don't need to call fwnode_handle_put()?

With the above:
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +
> +	return rc;
> +}
> +
>  /* get the hardware configuration & connection data. */
>  int cti_plat_get_hw_data(struct device *dev,
>  			 struct cti_drvdata *drvdata)
> @@ -212,12 +450,16 @@ int cti_plat_get_hw_data(struct device *dev,
>  	int rc = 0;
>  	struct cti_device *cti_dev = &drvdata->ctidev;
>  
> +	/* get any CTM ID - defaults to 0 */
> +	device_property_read_u32(dev, CTI_DT_CTM_ID, &cti_dev->ctm_id);
> +
>  	/* check for a v8 architectural CTI device */
> -	if (device_property_read_bool(dev, CTI_DT_V8ARCH)) {
> +	if (device_property_read_bool(dev, CTI_DT_V8ARCH))
>  		rc = cti_plat_create_v8_connections(dev, drvdata);
> -		if (rc)
> -			return rc;
> -	}
> +	else
> +		rc = cti_plat_create_impdef_connections(dev, drvdata);
> +	if (rc)
> +		return rc;
>  
>  	/* if no connections, just add a single default based on max IN-OUT */
>  	if (cti_dev->nr_trig_con == 0)
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 98de8a4768fc..f800402f73da 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -56,9 +56,20 @@ static ssize_t enable_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(enable);
>  
> +static ssize_t ctmid_show(struct device *dev,
> +			  struct device_attribute *attr,
> +			  char *buf)
> +{
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", drvdata->ctidev.ctm_id);
> +}
> +static DEVICE_ATTR_RO(ctmid);
> +
>  /* attribute and group sysfs tables. */
>  static struct attribute *coresight_cti_attrs[] = {
>  	&dev_attr_enable.attr,
> +	&dev_attr_ctmid.attr,
>  	NULL,
>  };
>  
> -- 
> 2.17.1
> 
