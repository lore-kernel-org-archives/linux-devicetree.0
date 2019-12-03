Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4436BC432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:06:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B57B206DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p5GbzIue"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfLCOGF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 09:06:05 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:32918 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfLCOGF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 09:06:05 -0500
Received: by mail-qk1-f196.google.com with SMTP id c124so3544088qkg.0
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 06:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QaWxqji1GXZS9GZ3miZ+5GcYvk93y478ZbMk70sfhJM=;
        b=p5GbzIueeumLsEspv2SKXcoyF7RxHmPtcSVqOfigV2fvKLYWHdJnyEIjKhw1IBWGUE
         eabQ4mUXcUhOfcaRMxwE4w+Bp3NZ1YxehMXUovOit0fvyLjPQd7L+BWkmWoE6F7BROkf
         ALQ2vkMt4QH+fmL4foHDFWnb4/KcMFiX17V5u4qp4QGVOnH320a3X95zFX6GL3kxWC17
         wCbqKmHk8kAK0mJ/OXmnd5IGN3VX2xHBPkZWO7ZLmhVRWHHZ72gVKf6Kuqf6kzBG/7LO
         7AtjDGRPOA0Yq3a3RH4ma27KIvc8+BQqqpxpAJnTro8crQLmZRXXHf5M+9B1Gp5khhtU
         ofvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QaWxqji1GXZS9GZ3miZ+5GcYvk93y478ZbMk70sfhJM=;
        b=P76f6Xn+jQTtnz3usufwsVXkX0o3c3NT6J7blolNIOYrmPDuBpMnl4+cJFgGd+xkPa
         rVvt/XbbjmoEvebFLMtlKsG/8c2Ie5fs8RnjVd7/feIz7cIXOcFC8mkOxbc+3p3Kad7J
         9qr5xYT1Hx0bEMg9ncYw8Em6N0SmuHuagNDjbQpEXarNgpvoZbG6nhn2IERsGV3IF2is
         OYXBPpn5+SUCLwOTyyM6u0ojyhaQaeQRfyYcn74Chrc4vA44KEhZB9q4QkWzpQiOiAao
         LAkK5zXfj/A2P6bF9sGJm4v48gEIONsAYDlttCYMqDYV3uYHxanY74LsRAKKq+gcsYYu
         UJlw==
X-Gm-Message-State: APjAAAVhPZFEdu0I15heJ5Ag97Ms0rJKHsYfVlWoHZbKtC2DIwZTiGIb
        aJr9nZV/cQ8BMUyYsR5QG9BF5N+ajNB4NHTaCTPtTg==
X-Google-Smtp-Source: APXvYqz/H7RC/nEfD6JKV0UGDVVlpVw/rWzy+1BmBZtfC4k4BG3FwjwScrHcBjA+QLJpnpYSwDn/Wnn5aAS9swJTQQM=
X-Received: by 2002:a37:62d2:: with SMTP id w201mr4993044qkb.445.1575381963784;
 Tue, 03 Dec 2019 06:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-8-mike.leach@linaro.org>
 <efac03bc-4a38-8f5c-46d5-9ffc58b2d2bb@arm.com>
In-Reply-To: <efac03bc-4a38-8f5c-46d5-9ffc58b2d2bb@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 3 Dec 2019 14:05:52 +0000
Message-ID: <CAJ9a7Vgce=i9JEV2JRThj74wKYRNcR24RBu5qKqnspcVcqhwiQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] coresight: cti: Add device tree support for
 custom CTI.
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

On Fri, 29 Nov 2019 at 14:18, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > Adds support for CTIs whose connections are implementation defined at
> > hardware design time, and not constrained by v8 architecture.
> >
> > These CTIs have no standard connection setup, all the settings have to
> > be defined in the device tree files. The patch creates a set of connections
> > and trigger signals based on the information provided.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >   .../coresight/coresight-cti-platform.c        | 250 +++++++++++++++++-
> >   .../hwtracing/coresight/coresight-cti-sysfs.c |  11 +
> >   2 files changed, 257 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> > index 790dd30b85f5..9c1ff432b487 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> > @@ -13,9 +13,19 @@
> >   #define NR_V8PE_OUT_SIGS    3
> >   #define NR_V8ETM_INOUT_SIGS 4
> >
> > +/* CTI device tree trigger connection node keyword */
> > +#define CTI_DT_CONNS         "trig-conns"
> > +
> >   /* CTI device tree connection property keywords */
> >   #define CTI_DT_V8ARCH               "arm,cti-v8-arch"
> >   #define CTI_DT_CSDEV_ASSOC  "arm,cs-dev-assoc"
> > +#define CTI_DT_TRIGIN_SIGS   "arm,trig-in-sigs"
> > +#define CTI_DT_TRIGOUT_SIGS  "arm,trig-out-sigs"
> > +#define CTI_DT_TRIGIN_TYPES  "arm,trig-in-types"
> > +#define CTI_DT_TRIGOUT_TYPES "arm,trig-out-types"
> > +#define CTI_DT_FILTER_OUT_SIGS       "arm,trig-filters"
> > +#define CTI_DT_CONN_NAME     "arm,trig-conn-name"
> > +#define CTI_DT_CTM_ID                "arm,cti-ctm-id"
> >
> >   /*
> >    * Find a registered coresight device from a device fwnode.
> > @@ -68,6 +78,12 @@ static const char *of_cti_get_node_name(const struct device_node *node)
> >               return node->full_name;
> >       return "unknown";
> >   }
> > +
> > +static bool of_cti_node_name_eq(const struct device_node *node,
> > +                             const char *name)
> > +{
> > +     return of_node_name_eq(node, name);
> > +}
> >   #else
> >   static int of_cti_get_cpu_at_node(const struct device_node *node)
> >   {
> > @@ -78,6 +94,12 @@ static const char *of_cti_get_node_name(const struct device_node *node)
> >   {
> >       return "unknown";
> >   }
> > +
> > +static bool of_cti_node_name_eq(const struct device_node *node,
> > +                             const char *name)
> > +{
> > +     return false;
> > +}
> >   #endif
>
> nit: You don't need this wrapper of_node_name_eq() is already defined to
> return false for !CONFIG_OF.
>
>

OK.

> >
> >   static int cti_plat_get_cpu_at_node(struct fwnode_handle *fwnode)
> > @@ -94,6 +116,14 @@ static const char *cti_plat_get_node_name(struct fwnode_handle *fwnode)
> >       return "unknown";
> >   }
> >
> > +static bool cti_plat_node_name_eq(struct fwnode_handle *fwnode,
> > +                               const char *name)
> > +{
> > +     if (is_of_node(fwnode))
> > +             return of_cti_node_name_eq(to_of_node(fwnode), name);
>
> As mentioned above you could simply use of_node_name_eq() here.
>
> > +     return false;
> > +}
> > +
> >   static int cti_plat_create_v8_etm_connection(struct device *dev,
> >                                            struct cti_drvdata *drvdata)
> >   {
> > @@ -205,6 +235,214 @@ static int cti_plat_create_v8_connections(struct device *dev,
> >       return ret;
> >   }
> >
> > +static int cti_plat_count_sig_elements(const struct fwnode_handle *fwnode,
> > +                                    const char *name)
> > +{
> > +     int nr_elem = fwnode_property_count_u32(fwnode, name);
> > +
> > +     return (nr_elem < 0 ? 0 : nr_elem);
> > +}
> > +
> > +static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
> > +                                 const struct fwnode_handle *fwnode,
> > +                                 const char *grp_name)
> > +{
> > +     int idx, err = 0;
> > +     u32 *values;
> > +
> > +     if (!tgrp->nr_sigs)
> > +             return 0;
> > +
> > +     values = kcalloc(tgrp->nr_sigs, sizeof(u32), GFP_KERNEL);
> > +     if (!values)
> > +             return -ENOMEM;
> > +
> > +     err = fwnode_property_read_u32_array(fwnode, grp_name,
> > +                                          values, tgrp->nr_sigs);
> > +
> > +     if (!err) {
> > +             /* set the signal usage mask */
> > +             for (idx = 0; idx < tgrp->nr_sigs; idx++)
> > +                     tgrp->used_mask |= BIT(values[idx]);
> > +     }
> > +
> > +     kfree(values);
> > +     return err;
> > +}
> > +
> > +static int cti_plat_read_trig_types(struct cti_trig_grp *tgrp,
> > +                                 const struct fwnode_handle *fwnode,
> > +                                 const char *type_name)
> > +{
> > +     int items, used = 0, err = 0, nr_sigs;
> > +     u32 *values = NULL, i;
> > +
> > +     /* allocate an array according to number of signals in connection */
> > +     nr_sigs = tgrp->nr_sigs;
> > +     if (!nr_sigs)
> > +             return 0;
> > +
> > +     /* see if any types have been included in the device description */
> > +     items = cti_plat_count_sig_elements(fwnode, type_name);
> > +     if (items > nr_sigs)
> > +             return -EINVAL;
> > +
> > +     /* need an array to store the values iff there are any */
> > +     if (items) {
> > +             values = kcalloc(items, sizeof(u32), GFP_KERNEL);
> > +             if (!values)
> > +                     return -ENOMEM;
> > +
> > +             err = fwnode_property_read_u32_array(fwnode, type_name,
> > +                                                  values, items);
> > +             if (err)
> > +                     goto read_trig_types_out;
> > +     }
> > +
> > +     /*
> > +      * Match type id to signal index, 1st type to 1st index etc.
> > +      * If fewer types than signals default remainder to GEN_IO.
> > +      */
> > +     for (i = 0; i < nr_sigs; i++) {
> > +             if (used < items) {
> > +                     tgrp->sig_types[i] =
> > +                             values[i] < CTI_TRIG_MAX ? values[i] : GEN_IO;
> > +                     used++;
>
> Do we really need "used" here ? Couldn't this be :
>
No we don't - I'll fix it.

>                 if (i < items) {
>
>                 }
>
> > +             } else {
>
>    +                    /* Mark the undefined connections as GEN_IO */ ?
>
> > +                     tgrp->sig_types[i] = GEN_IO;
> > +             }
> > +     }
>
> ...
>
> > +
> > +     /* read the connection name if set - may be overridden by later */
> > +     fwnode_property_read_string(fwnode, CTI_DT_CONN_NAME, &assoc_name);
> > +
> > +     /* associated cpu ? */
> > +     cpuid = cti_plat_get_cpu_at_node(fwnode);
> > +     if (cpuid >= 0) {
> > +             drvdata->ctidev.cpu = cpuid;
> > +             scnprintf(cpu_name_str, sizeof(cpu_name_str), "cpu%d", cpuid);
> > +             assoc_name = cpu_name_str;
> > +     } else {
> > +             /* associated device ? */
> > +             cs_fwnode = fwnode_find_reference(fwnode,
> > +                                               CTI_DT_CSDEV_ASSOC, 0);
>
> > +             if (!IS_ERR_OR_NULL(cs_fwnode)) {
>
> --- Cut - here --
> > +                     csdev = cti_get_assoc_csdev_by_fwnode(cs_fwnode);
> > +                     if (csdev) /* use device name if csdev found */
> > +                             assoc_name = dev_name(&csdev->dev);
> > +                     else  /* otherwise node name for later association */
> > +                             assoc_name = cti_plat_get_node_name(cs_fwnode);
>
> --- end - here --
>
> I believe we do this for arm_v8 architected connections too. May be make
> this a helper ?
>
OK

> > +                     fwnode_handle_put(cs_fwnode);
> > +             }
> > +     }
> > +     /* set up a connection */
> > +     err = cti_add_connection_entry(dev, drvdata, tc, csdev, assoc_name);
> > +
> > +create_con_err:
> > +     return err;
> > +}
> > +
> > +static int cti_plat_create_impdef_connections(struct device *dev,
> > +                                           struct cti_drvdata *drvdata)
> > +{
> > +     int rc = 0;
> > +     struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +     struct fwnode_handle *child = NULL;
> > +
> > +     if (IS_ERR_OR_NULL(fwnode))
> > +             return -EINVAL;
> > +
> > +     fwnode_for_each_child_node(fwnode, child) {
> > +             if (cti_plat_node_name_eq(child, CTI_DT_CONNS))
> > +                     rc = cti_plat_create_connection(dev, drvdata, child);
> > +             if (rc != 0)
> > +                     break;
>
> minor nit: To make it more obvious :
>
>                 if (cti_plat_node_name_eq(child, CTI_DT_CONNS)) {
>                         rc = cti_plat_create_connection(dev, drvdata,
>                                                         child);
>                         if (rc)
>                                 break;
>                 }
>
> Suzuki

Thanks


Mike

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
