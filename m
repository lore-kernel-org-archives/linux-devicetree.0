Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F589C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 11:33:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60DA421774
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 11:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfK2Ldh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 06:33:37 -0500
Received: from foss.arm.com ([217.140.110.172]:46458 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbfK2Ldg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 29 Nov 2019 06:33:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6C051FB;
        Fri, 29 Nov 2019 03:33:35 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E902D3F52E;
        Fri, 29 Nov 2019 03:33:34 -0800 (PST)
Subject: Re: [PATCH v5 06/14] coresight: cti: Add device tree support for v8
 arch CTI
To:     Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-7-mike.leach@linaro.org>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <b2f640d3-c320-82d4-7399-172846820589@arm.com>
Date:   Fri, 29 Nov 2019 11:33:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191119231912.12768-7-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/2019 23:19, Mike Leach wrote:
> The v8 architecture defines the relationship between a PE, its optional ETM
> and a CTI. Unlike non-architectural CTIs which are implementation defined,
> this has a fixed set of connections which can therefore be represented as a
> simple tag in the device tree.
> 
> This patch defines the tags needed to create an entry for this PE/ETM/CTI
> relationship, and provides functionality to implement the connection model
> in the CTI driver.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>   .../coresight/coresight-cti-platform.c        | 205 ++++++++++++++++++
>   1 file changed, 205 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index 665be86c585d..790dd30b85f5 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -3,10 +3,208 @@
>    * Copyright (c) 2019, The Linaro Limited. All rights reserved.
>    */
>   
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>   #include <linux/of.h>
>   
>   #include "coresight-cti.h"
>   
> +/* Number of CTI signals in the v8 architecturally defined connection */
> +#define NR_V8PE_IN_SIGS		2
> +#define NR_V8PE_OUT_SIGS	3
> +#define NR_V8ETM_INOUT_SIGS	4
> +
> +/* CTI device tree connection property keywords */
> +#define CTI_DT_V8ARCH		"arm,cti-v8-arch"
> +#define CTI_DT_CSDEV_ASSOC	"arm,cs-dev-assoc"
> +
> +/*
> + * Find a registered coresight device from a device fwnode.
> + * The node info is associated with the AMBA parent, but the
> + * csdev keeps a copy so iterate round the coresight bus to
> + * find the device.
> + */
> +static struct coresight_device *
> +cti_get_assoc_csdev_by_fwnode(struct fwnode_handle *r_fwnode)

To be frank this has nothing to do with the CTI and is in a way
a good candidate for a CoreSight generic function. We do similar
stuff in coresight_fixup_device_conns(). So this could be :

struct coresight_device *
coresight_find_device_by_fwnode(const struct fwnode_handle *fwnode)

> +{
> +	struct device *dev;
> +	struct coresight_device *csdev = NULL;
> +
> +	dev = bus_find_device_by_fwnode(&coresight_bustype, r_fwnode);
> +	if (dev) {
> +		csdev = to_coresight_device(dev);
> +		put_device(dev);
> +	}
> +	return csdev;
> +}
> +

And used in coresight_fixup_conns().

> +#ifdef CONFIG_OF
> +/*
> + * CTI can be bound to a CPU, or a system device.
> + * CPU can be declared at the device top level or in a connections node
> + * so need to check relative to node not device.
> + */
> +static int of_cti_get_cpu_at_node(const struct device_node *node)
> +{
> +	int cpu;
> +	struct device_node *dn;
> +
> +	if (node == NULL)
> +		return -1;
> +
> +	dn = of_parse_phandle(node, "cpu", 0);
> +	/* CTI affinity defaults to no cpu */
> +	if (!dn)
> +		return -1;
> +	cpu = of_cpu_node_to_id(dn);
> +	of_node_put(dn);
> +
> +	/* No Affinity  if no cpu nodes are found */
> +	return (cpu < 0) ? -1 : cpu;
> +}
> +
> +static const char *of_cti_get_node_name(const struct device_node *node)
> +{
> +	if (node)
> +		return node->full_name;
> +	return "unknown";
> +}
> +#else
> +static int of_cti_get_cpu_at_node(const struct device_node *node)
> +{
> +	return -1;
> +}
> +
> +static const char *of_cti_get_node_name(const struct device_node *node)
> +{
> +	return "unknown";
> +}
> +#endif
> +
> +static int cti_plat_get_cpu_at_node(struct fwnode_handle *fwnode)
> +{

You may simply reuse coresight_get_cpu() below, instead of adding this
duplicate set of functions. See below.


> +static int cti_plat_create_v8_etm_connection(struct device *dev,
> +					     struct cti_drvdata *drvdata)
> +{
> +	int ret = -ENOMEM, i;
> +	struct fwnode_handle *root_fwnode, *cs_fwnode;
> +	const char *assoc_name = NULL;
> +	struct coresight_device *csdev;
> +	struct cti_trig_con *tc = NULL;
> +
> +	root_fwnode = dev_fwnode(dev);
> +	if (IS_ERR_OR_NULL(root_fwnode))
> +		return -EINVAL;
> +
> +	/* Can optionally have an etm node - return if not  */
> +	cs_fwnode = fwnode_find_reference(root_fwnode, CTI_DT_CSDEV_ASSOC, 0);
> +	if (IS_ERR_OR_NULL(cs_fwnode))
> +		return 0;
> +
> +	/* allocate memory */
> +	tc = cti_allocate_trig_con(dev, NR_V8ETM_INOUT_SIGS,
> +				   NR_V8ETM_INOUT_SIGS);
> +	if (!tc)
> +		goto create_v8_etm_out;
> +
> +	/* build connection data */
> +	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
> +	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
> +
> +	/*
> +	 * The EXTOUT type signals from the ETM are connected to a set of input
> +	 * triggers on the CTI, the EXTIN being connected to output triggers.
> +	 */
> +	for (i = 0; i < NR_V8ETM_INOUT_SIGS; i++) {
> +		tc->con_in->sig_types[i] = ETM_EXTOUT;
> +		tc->con_out->sig_types[i] = ETM_EXTIN;
> +	}
> +
> +	/*
> +	 * We look to see if the ETM coresight device associated with this
> +	 * handle has been registered with the system - i.e. probed before
> +	 * this CTI. If so csdev will be non NULL and we can use the device
> +	 * name and pass the csdev to the connection entry function where
> +	 * the association will be recorded.
> +	 * If not, then simply record the name in the connection data, the
> +	 * probing of the ETM will call into the CTI driver API to update the
> +	 * association then.
> +	 */
> +	csdev = cti_get_assoc_csdev_by_fwnode(cs_fwnode);
> +	if (csdev)
> +		assoc_name = dev_name(&csdev->dev);

Does it make sense to defer the probing until the ETM device  turn up ?
Its fine either way.

> +	else
> +		assoc_name = cti_plat_get_node_name(cs_fwnode);
> +	ret = cti_add_connection_entry(dev, drvdata, tc, csdev, assoc_name);
> +
> +create_v8_etm_out:
> +	fwnode_handle_put(cs_fwnode);
> +	return ret;
> +}
> +
> +/*
> + * Create an architecturally defined v8 connection
> + * must have a cpu, can have an ETM.
> + */
> +static int cti_plat_create_v8_connections(struct device *dev,
> +					  struct cti_drvdata *drvdata)
> +{
> +	struct cti_device *cti_dev = &drvdata->ctidev;
> +	struct cti_trig_con *tc = NULL;
> +	int cpuid = 0;
> +	char cpu_name_str[16];
> +	int ret = -ENOMEM;
> +
> +	/* Must have a cpu node */
> +	cpuid = cti_plat_get_cpu_at_node(dev_fwnode(dev));

Could we reuse coresight_get_cpu(dev) instead ? I understand that the
ACPI bindings have not been defined and it may be slightly different
from what we have now for the ETMs (i.e, ETM node as child of the CPU
node). But I don't see why we can't force it for the CTIs either.
In the worst case, you could still reuse the of_coresgith_get_cpu(dev)
instead of writing your own for the OF case.


> +	if (cpuid < 0) {
> +		dev_warn(dev, "CTI v8 DT binding no cpu\n");

This may be better off without mentioning the DT. e.g,

"CTI Arm v8 architected connection: missing CPU\n"

	
> +		return -EINVAL;
> +	}
> +	cti_dev->cpu = cpuid;
> +
> +	/* Allocate the v8 cpu connection memory */
> +	tc = cti_allocate_trig_con(dev, NR_V8PE_IN_SIGS, NR_V8PE_OUT_SIGS);
> +	if (!tc)
> +		goto of_create_v8_out;
> +
> +	/* Set the v8 PE CTI connection data */
> +	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
> +	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
> +	tc->con_in->sig_types[1] = PE_PMUIRQ;
> +	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
> +	tc->con_out->sig_types[0] = PE_EDBGREQ;
> +	tc->con_out->sig_types[1] = PE_DBGRESTART;
> +	tc->con_out->sig_types[2] = PE_CTIIRQ;
> +	scnprintf(cpu_name_str, sizeof(cpu_name_str), "cpu%d", cpuid);
> +
> +	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, cpu_name_str);
> +	if (ret)
> +		goto of_create_v8_out;
> +
> +	/* Create the v8 ETM associated connection */
> +	ret = cti_plat_create_v8_etm_connection(dev, drvdata);
> +	if (ret)
> +		goto of_create_v8_out;
> +
> +	/* filter pe_edbgreq - PE trigout sig <0> */
> +	drvdata->config.trig_out_filter |= 0x1;
> +
> +of_create_v8_out:
> +	return ret;
> +}
> +
>   /* get the hardware configuration & connection data. */
>   int cti_plat_get_hw_data(struct device *dev,
>   			 struct cti_drvdata *drvdata)
> @@ -14,6 +212,13 @@ int cti_plat_get_hw_data(struct device *dev,
>   	int rc = 0;
>   	struct cti_device *cti_dev = &drvdata->ctidev;
>   
> +	/* check for a v8 architectural CTI device */
minor nit: Check for Arm v8 architected CTI connection ?

> +	if (device_property_read_bool(dev, CTI_DT_V8ARCH)) {
> +		rc = cti_plat_create_v8_connections(dev, drvdata);
> +		if (rc)
> +			return rc;
> +	}
> +
>   	/* if no connections, just add a single default based on max IN-OUT */
>   	if (cti_dev->nr_trig_con == 0)
>   		rc = cti_add_default_connection(dev, drvdata);
> 


Suzuki
