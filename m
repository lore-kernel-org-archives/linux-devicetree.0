Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0F2C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 11:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AB55206F0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 11:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eb/s68g8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbfLCLAD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 06:00:03 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41786 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfLCLAD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 06:00:03 -0500
Received: by mail-qk1-f194.google.com with SMTP id g15so2942741qka.8
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 03:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EWBAJXc6VmZPvFymEbCvvEBg7Re43Tz8rygktUPmfdM=;
        b=eb/s68g8l1nh3EpPuEraD4O6BvxqhO2mnWdCufdUjvqarr7qmrzIfwfvJRilR5MYjz
         ombe1QuZB118EeQfnfozS+2PJrIVncbTR2Qr4xUfYu5KYaCRE9uo7rNMYbwIzjY8Dgw2
         ujCp/cEdGCeNXb+E9Od+amzwP9mQdXwCXStUpmaSNY5X7qTAij+LOUqqLUYdHSTil6xL
         vIA8ri6fPUIMOvbW2jNfWMKztnoHp1zm/OhYdse6bGg5nniJ2NDYEE/SrtPzTYg/+MtX
         MXFWrcpz8nCYYIQRhf8JpK9mHOwjV+VT3mKb2Vz9wdSFoeQkJWSiNFnB/piAfZCXD/ka
         YCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWBAJXc6VmZPvFymEbCvvEBg7Re43Tz8rygktUPmfdM=;
        b=EUpgcsWaX0tPMXKI1rOaw/KbXiiahPyXEi6tI+lbo++nFq3C4PpvVS+s+UwQ7V6kkP
         B/Rcrx9OzZySVDbzomOkE8R1AySoiwkI7vmQkpOA0rMf1bFlvQddb5dm4rO61CmEfxCK
         gyabzj/RQY/Xjd6+83VCVCix3OFENg8Z+UtMirgLz1gQyQzom3nBTSuAaZcj7EXrOYIA
         of497IwIG/RIIRZJcx2PvTJMX9DJsdLjre/z8YISjgCXa1RHo+OSMHSshJbV3xvmTqKW
         APnh8Os5dEj98zNgJNuqzilWuD6Awo0deNojLzzVqGhav8U6gTe22sCaS3Cd5pZcKynk
         L+lA==
X-Gm-Message-State: APjAAAVLXETM7cGXUKMx4blXCIJl3H7hW51Kho88GL+gA/I5Wk9cWPcm
        SPg+WU4CxoeeDsOnemnw2XTjkSndqj7SiE5mpA6YmQ==
X-Google-Smtp-Source: APXvYqxR967AtFzYAEY6ZcCvVfk7QLyQym15XW4NBQgMNFk+lFWlDM/XbYy0dFgW3j695MmmUZrbnOCqex+sL9U68fo=
X-Received: by 2002:a37:62d2:: with SMTP id w201mr4181845qkb.445.1575370802100;
 Tue, 03 Dec 2019 03:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-7-mike.leach@linaro.org>
 <b2f640d3-c320-82d4-7399-172846820589@arm.com>
In-Reply-To: <b2f640d3-c320-82d4-7399-172846820589@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 3 Dec 2019 10:59:49 +0000
Message-ID: <CAJ9a7VgkgoUTL0+_3kj53go_CKtAH3fO5xF9UNDPPz1se1SKSw@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] coresight: cti: Add device tree support for v8
 arch CTI
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Suzuki,

On Fri, 29 Nov 2019 at 11:33, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > The v8 architecture defines the relationship between a PE, its optional ETM
> > and a CTI. Unlike non-architectural CTIs which are implementation defined,
> > this has a fixed set of connections which can therefore be represented as a
> > simple tag in the device tree.
> >
> > This patch defines the tags needed to create an entry for this PE/ETM/CTI
> > relationship, and provides functionality to implement the connection model
> > in the CTI driver.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >   .../coresight/coresight-cti-platform.c        | 205 ++++++++++++++++++
> >   1 file changed, 205 insertions(+)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> > index 665be86c585d..790dd30b85f5 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> > @@ -3,10 +3,208 @@
> >    * Copyright (c) 2019, The Linaro Limited. All rights reserved.
> >    */
> >
> > +#include <dt-bindings/arm/coresight-cti-dt.h>
> >   #include <linux/of.h>
> >
> >   #include "coresight-cti.h"
> >
> > +/* Number of CTI signals in the v8 architecturally defined connection */
> > +#define NR_V8PE_IN_SIGS              2
> > +#define NR_V8PE_OUT_SIGS     3
> > +#define NR_V8ETM_INOUT_SIGS  4
> > +
> > +/* CTI device tree connection property keywords */
> > +#define CTI_DT_V8ARCH                "arm,cti-v8-arch"
> > +#define CTI_DT_CSDEV_ASSOC   "arm,cs-dev-assoc"
> > +
> > +/*
> > + * Find a registered coresight device from a device fwnode.
> > + * The node info is associated with the AMBA parent, but the
> > + * csdev keeps a copy so iterate round the coresight bus to
> > + * find the device.
> > + */
> > +static struct coresight_device *
> > +cti_get_assoc_csdev_by_fwnode(struct fwnode_handle *r_fwnode)
>
> To be frank this has nothing to do with the CTI and is in a way
> a good candidate for a CoreSight generic function. We do similar
> stuff in coresight_fixup_device_conns(). So this could be :
>
> struct coresight_device *
> coresight_find_device_by_fwnode(const struct fwnode_handle *fwnode)
>
> > +{
> > +     struct device *dev;
> > +     struct coresight_device *csdev = NULL;
> > +
> > +     dev = bus_find_device_by_fwnode(&coresight_bustype, r_fwnode);
> > +     if (dev) {
> > +             csdev = to_coresight_device(dev);
> > +             put_device(dev);
> > +     }
> > +     return csdev;
> > +}
> > +
>
> And used in coresight_fixup_conns().
>

OK - I'll look at that.

> > +#ifdef CONFIG_OF
> > +/*
> > + * CTI can be bound to a CPU, or a system device.
> > + * CPU can be declared at the device top level or in a connections node
> > + * so need to check relative to node not device.
> > + */
> > +static int of_cti_get_cpu_at_node(const struct device_node *node)
> > +{
> > +     int cpu;
> > +     struct device_node *dn;
> > +
> > +     if (node == NULL)
> > +             return -1;
> > +
> > +     dn = of_parse_phandle(node, "cpu", 0);
> > +     /* CTI affinity defaults to no cpu */
> > +     if (!dn)
> > +             return -1;
> > +     cpu = of_cpu_node_to_id(dn);
> > +     of_node_put(dn);
> > +
> > +     /* No Affinity  if no cpu nodes are found */
> > +     return (cpu < 0) ? -1 : cpu;
> > +}
> > +
> > +static const char *of_cti_get_node_name(const struct device_node *node)
> > +{
> > +     if (node)
> > +             return node->full_name;
> > +     return "unknown";
> > +}
> > +#else
> > +static int of_cti_get_cpu_at_node(const struct device_node *node)
> > +{
> > +     return -1;
> > +}
> > +
> > +static const char *of_cti_get_node_name(const struct device_node *node)
> > +{
> > +     return "unknown";
> > +}
> > +#endif
> > +
> > +static int cti_plat_get_cpu_at_node(struct fwnode_handle *fwnode)
> > +{
>
> You may simply reuse coresight_get_cpu() below, instead of adding this
> duplicate set of functions. See below.
>
>

No we can't. coresight_get_cpu gets the 'cpu' entry relative to the
device node, this gets the 'cpu' relative to the supplied node.
This is very important for the case where a none v8 architected PE is
attached to a CTI. This will use the devicetree form:-

cti@<addr> {
    [ some stuff  ]
   trig_conns@1 {
          cpu = <&CPU0>
          [trigger signal  connection info for this cpu]
   }
}

trig_conns is a child node and we must look for 'cpu' relative to it.


> > +static int cti_plat_create_v8_etm_connection(struct device *dev,
> > +                                          struct cti_drvdata *drvdata)
> > +{
> > +     int ret = -ENOMEM, i;
> > +     struct fwnode_handle *root_fwnode, *cs_fwnode;
> > +     const char *assoc_name = NULL;
> > +     struct coresight_device *csdev;
> > +     struct cti_trig_con *tc = NULL;
> > +
> > +     root_fwnode = dev_fwnode(dev);
> > +     if (IS_ERR_OR_NULL(root_fwnode))
> > +             return -EINVAL;
> > +
> > +     /* Can optionally have an etm node - return if not  */
> > +     cs_fwnode = fwnode_find_reference(root_fwnode, CTI_DT_CSDEV_ASSOC, 0);
> > +     if (IS_ERR_OR_NULL(cs_fwnode))
> > +             return 0;
> > +
> > +     /* allocate memory */
> > +     tc = cti_allocate_trig_con(dev, NR_V8ETM_INOUT_SIGS,
> > +                                NR_V8ETM_INOUT_SIGS);
> > +     if (!tc)
> > +             goto create_v8_etm_out;
> > +
> > +     /* build connection data */
> > +     tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
> > +     tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
> > +
> > +     /*
> > +      * The EXTOUT type signals from the ETM are connected to a set of input
> > +      * triggers on the CTI, the EXTIN being connected to output triggers.
> > +      */
> > +     for (i = 0; i < NR_V8ETM_INOUT_SIGS; i++) {
> > +             tc->con_in->sig_types[i] = ETM_EXTOUT;
> > +             tc->con_out->sig_types[i] = ETM_EXTIN;
> > +     }
> > +
> > +     /*
> > +      * We look to see if the ETM coresight device associated with this
> > +      * handle has been registered with the system - i.e. probed before
> > +      * this CTI. If so csdev will be non NULL and we can use the device
> > +      * name and pass the csdev to the connection entry function where
> > +      * the association will be recorded.
> > +      * If not, then simply record the name in the connection data, the
> > +      * probing of the ETM will call into the CTI driver API to update the
> > +      * association then.
> > +      */
> > +     csdev = cti_get_assoc_csdev_by_fwnode(cs_fwnode);
> > +     if (csdev)
> > +             assoc_name = dev_name(&csdev->dev);
>
> Does it make sense to defer the probing until the ETM device  turn up ?
> Its fine either way.
>

Not really as the ETM is optional but the PE still has a CTI.

> > +     else
> > +             assoc_name = cti_plat_get_node_name(cs_fwnode);
> > +     ret = cti_add_connection_entry(dev, drvdata, tc, csdev, assoc_name);
> > +
> > +create_v8_etm_out:
> > +     fwnode_handle_put(cs_fwnode);
> > +     return ret;
> > +}
> > +
> > +/*
> > + * Create an architecturally defined v8 connection
> > + * must have a cpu, can have an ETM.
> > + */
> > +static int cti_plat_create_v8_connections(struct device *dev,
> > +                                       struct cti_drvdata *drvdata)
> > +{
> > +     struct cti_device *cti_dev = &drvdata->ctidev;
> > +     struct cti_trig_con *tc = NULL;
> > +     int cpuid = 0;
> > +     char cpu_name_str[16];
> > +     int ret = -ENOMEM;
> > +
> > +     /* Must have a cpu node */
> > +     cpuid = cti_plat_get_cpu_at_node(dev_fwnode(dev));
>
> Could we reuse coresight_get_cpu(dev) instead ? I understand that the
> ACPI bindings have not been defined and it may be slightly different
> from what we have now for the ETMs (i.e, ETM node as child of the CPU
> node). But I don't see why we can't force it for the CTIs either.
> In the worst case, you could still reuse the of_coresgith_get_cpu(dev)
> instead of writing your own for the OF case.
>

See comments above - in theory here we could use coresight_get_cpu(),
but for consistency it is better to use that same function throughout
in case someone decided to "fix" it later.
I probably need to beef up the comments around
cti_plat_get_cpu_at_node / of_cti_get_cpu_at_node.

>
> > +     if (cpuid < 0) {
> > +             dev_warn(dev, "CTI v8 DT binding no cpu\n");
>
> This may be better off without mentioning the DT. e.g,
>
> "CTI Arm v8 architected connection: missing CPU\n"
>
OK
>
> > +             return -EINVAL;
> > +     }
> > +     cti_dev->cpu = cpuid;
> > +
> > +     /* Allocate the v8 cpu connection memory */
> > +     tc = cti_allocate_trig_con(dev, NR_V8PE_IN_SIGS, NR_V8PE_OUT_SIGS);
> > +     if (!tc)
> > +             goto of_create_v8_out;
> > +
> > +     /* Set the v8 PE CTI connection data */
> > +     tc->con_in->used_mask = 0x3; /* sigs <0 1> */
> > +     tc->con_in->sig_types[0] = PE_DBGTRIGGER;
> > +     tc->con_in->sig_types[1] = PE_PMUIRQ;
> > +     tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
> > +     tc->con_out->sig_types[0] = PE_EDBGREQ;
> > +     tc->con_out->sig_types[1] = PE_DBGRESTART;
> > +     tc->con_out->sig_types[2] = PE_CTIIRQ;
> > +     scnprintf(cpu_name_str, sizeof(cpu_name_str), "cpu%d", cpuid);
> > +
> > +     ret = cti_add_connection_entry(dev, drvdata, tc, NULL, cpu_name_str);
> > +     if (ret)
> > +             goto of_create_v8_out;
> > +
> > +     /* Create the v8 ETM associated connection */
> > +     ret = cti_plat_create_v8_etm_connection(dev, drvdata);
> > +     if (ret)
> > +             goto of_create_v8_out;
> > +
> > +     /* filter pe_edbgreq - PE trigout sig <0> */
> > +     drvdata->config.trig_out_filter |= 0x1;
> > +
> > +of_create_v8_out:
> > +     return ret;
> > +}
> > +
> >   /* get the hardware configuration & connection data. */
> >   int cti_plat_get_hw_data(struct device *dev,
> >                        struct cti_drvdata *drvdata)
> > @@ -14,6 +212,13 @@ int cti_plat_get_hw_data(struct device *dev,
> >       int rc = 0;
> >       struct cti_device *cti_dev = &drvdata->ctidev;
> >
> > +     /* check for a v8 architectural CTI device */
> minor nit: Check for Arm v8 architected CTI connection ?
>
> > +     if (device_property_read_bool(dev, CTI_DT_V8ARCH)) {
> > +             rc = cti_plat_create_v8_connections(dev, drvdata);
> > +             if (rc)
> > +                     return rc;
> > +     }
> > +
> >       /* if no connections, just add a single default based on max IN-OUT */
> >       if (cti_dev->nr_trig_con == 0)
> >               rc = cti_add_default_connection(dev, drvdata);
> >
>
>
> Suzuki

Thanks


Mike

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
