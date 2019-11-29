Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD5AC43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 14:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80A53215A5
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 14:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfK2OS2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 09:18:28 -0500
Received: from foss.arm.com ([217.140.110.172]:48326 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbfK2OS1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 29 Nov 2019 09:18:27 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C536C1FB;
        Fri, 29 Nov 2019 06:18:26 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 052C43F52E;
        Fri, 29 Nov 2019 06:18:25 -0800 (PST)
Subject: Re: [PATCH v5 07/14] coresight: cti: Add device tree support for
 custom CTI.
To:     Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-8-mike.leach@linaro.org>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <efac03bc-4a38-8f5c-46d5-9ffc58b2d2bb@arm.com>
Date:   Fri, 29 Nov 2019 14:18:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191119231912.12768-8-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/2019 23:19, Mike Leach wrote:
> Adds support for CTIs whose connections are implementation defined at
> hardware design time, and not constrained by v8 architecture.
> 
> These CTIs have no standard connection setup, all the settings have to
> be defined in the device tree files. The patch creates a set of connections
> and trigger signals based on the information provided.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>   .../coresight/coresight-cti-platform.c        | 250 +++++++++++++++++-
>   .../hwtracing/coresight/coresight-cti-sysfs.c |  11 +
>   2 files changed, 257 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index 790dd30b85f5..9c1ff432b487 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -13,9 +13,19 @@
>   #define NR_V8PE_OUT_SIGS	3
>   #define NR_V8ETM_INOUT_SIGS	4
>   
> +/* CTI device tree trigger connection node keyword */
> +#define CTI_DT_CONNS		"trig-conns"
> +
>   /* CTI device tree connection property keywords */
>   #define CTI_DT_V8ARCH		"arm,cti-v8-arch"
>   #define CTI_DT_CSDEV_ASSOC	"arm,cs-dev-assoc"
> +#define CTI_DT_TRIGIN_SIGS	"arm,trig-in-sigs"
> +#define CTI_DT_TRIGOUT_SIGS	"arm,trig-out-sigs"
> +#define CTI_DT_TRIGIN_TYPES	"arm,trig-in-types"
> +#define CTI_DT_TRIGOUT_TYPES	"arm,trig-out-types"
> +#define CTI_DT_FILTER_OUT_SIGS	"arm,trig-filters"
> +#define CTI_DT_CONN_NAME	"arm,trig-conn-name"
> +#define CTI_DT_CTM_ID		"arm,cti-ctm-id"
>   
>   /*
>    * Find a registered coresight device from a device fwnode.
> @@ -68,6 +78,12 @@ static const char *of_cti_get_node_name(const struct device_node *node)
>   		return node->full_name;
>   	return "unknown";
>   }
> +
> +static bool of_cti_node_name_eq(const struct device_node *node,
> +				const char *name)
> +{
> +	return of_node_name_eq(node, name);
> +}
>   #else
>   static int of_cti_get_cpu_at_node(const struct device_node *node)
>   {
> @@ -78,6 +94,12 @@ static const char *of_cti_get_node_name(const struct device_node *node)
>   {
>   	return "unknown";
>   }
> +
> +static bool of_cti_node_name_eq(const struct device_node *node,
> +				const char *name)
> +{
> +	return false;
> +}
>   #endif

nit: You don't need this wrapper of_node_name_eq() is already defined to
return false for !CONFIG_OF.


>   
>   static int cti_plat_get_cpu_at_node(struct fwnode_handle *fwnode)
> @@ -94,6 +116,14 @@ static const char *cti_plat_get_node_name(struct fwnode_handle *fwnode)
>   	return "unknown";
>   }
>   
> +static bool cti_plat_node_name_eq(struct fwnode_handle *fwnode,
> +				  const char *name)
> +{
> +	if (is_of_node(fwnode))
> +		return of_cti_node_name_eq(to_of_node(fwnode), name);

As mentioned above you could simply use of_node_name_eq() here.

> +	return false;
> +}
> +
>   static int cti_plat_create_v8_etm_connection(struct device *dev,
>   					     struct cti_drvdata *drvdata)
>   {
> @@ -205,6 +235,214 @@ static int cti_plat_create_v8_connections(struct device *dev,
>   	return ret;
>   }
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

Do we really need "used" here ? Couldn't this be :

		if (i < items) {

		}

> +		} else {

   + 	 		/* Mark the undefined connections as GEN_IO */ ?

> +			tgrp->sig_types[i] = GEN_IO;
> +		}
> +	}

...

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

--- Cut - here --
> +			csdev = cti_get_assoc_csdev_by_fwnode(cs_fwnode);
> +			if (csdev) /* use device name if csdev found */
> +				assoc_name = dev_name(&csdev->dev);
> +			else  /* otherwise node name for later association */
> +				assoc_name = cti_plat_get_node_name(cs_fwnode);

--- end - here --

I believe we do this for arm_v8 architected connections too. May be make
this a helper ?

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

minor nit: To make it more obvious :

		if (cti_plat_node_name_eq(child, CTI_DT_CONNS)) {
			rc = cti_plat_create_connection(dev, drvdata,
							child);
			if (rc)
				break;
		}

Suzuki
