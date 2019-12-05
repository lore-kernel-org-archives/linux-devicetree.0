Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02417C43603
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 16:34:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD01920801
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 16:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NVViQjT9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbfLEQeG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 11:34:06 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38939 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbfLEQeG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 11:34:06 -0500
Received: by mail-qt1-f193.google.com with SMTP id g1so4092042qtj.6
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 08:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+knii9niLVRXZjC2hcSfBNmEpJE10+YTiHDmaEVtKw=;
        b=NVViQjT9DUCjCAD4Y5ibToIeTULFTi46oeymK5d2jdBJi1Jj0vur6kwgAcZ2jaU7dQ
         xNJFxUZzUHbEUBdYpyVqvJqQeIGnPvuJJL7jdSC2EztXSuF/vQKj6x2mbICsXclsJ2e8
         vhoeVABY0zWvkqrQz0nmzxaP6mqtfl21wkcPXa9eAvYAp2UDpo+gVm6OS8QvQyQIomK3
         8U5hq16l3yf1RzchX8DneJ+JzCO2JsYc1RcMWGv4k3Iegp8C2Ytb3dwj8R5m6aIc0dZs
         Sp+pXIQO96tywSQCbUwQp5cID3Z+LC/t8RgHGSk1NvnDdnwOA8bDDeVAvZbRqueasp39
         7X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+knii9niLVRXZjC2hcSfBNmEpJE10+YTiHDmaEVtKw=;
        b=jJAI9F1EjJWhDRuOfsU51hoTPygPGLLDwGeBv/K0wHUnQne2I7k3zU8hhmAA3j8DfK
         n7kUQMmRiMMFFG1MeVtpHqcOF3V6g4MSnmtjhYU2tzSNKopJ5R+5+h6uZ9JMC8hx0Aqv
         KJPoQS6Sphf0WGWlv+pnD9IDC55dg20RE1DTqkEDCgkmRKw4hYHY5ZzYTd1HEOHDvXYj
         4X/PtBj76nIDp5QZLIqLTCBUmeOgb45WFBnEEdg/BiHT8uT/AQrANoiFT+/mNyv9VMKM
         7d47vfRkn7MKc131jGOVDVFdYNsOJOfDgACMWfvGHJrwlKuL/oGumwcwNhLu1J0fL/8W
         hwbQ==
X-Gm-Message-State: APjAAAXERc3LlDZ92DfO1Wv0+cUPt9Q3KadLhHSjW5HAfjmg/NQCNaPv
        lWwsBb8PhYYK/fkcXHhl/n9A2nxBV+pK3PbZlV4BHQ==
X-Google-Smtp-Source: APXvYqyg/GBbqCPGTuv1yuEjNAYZn6kHXxHeajaeasrjDrwVNb5YMBZSJSOjckBcFNjQO8wmCPpE+jGrvjsYEC+Hz3E=
X-Received: by 2002:aed:3b14:: with SMTP id p20mr8542191qte.176.1575563644356;
 Thu, 05 Dec 2019 08:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-9-mike.leach@linaro.org>
 <20191125224521.GC18542@xps15>
In-Reply-To: <20191125224521.GC18542@xps15>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 5 Dec 2019 16:33:53 +0000
Message-ID: <CAJ9a7Vi1pwmJX+mF7C9wGcceeyzF2CWbsQaDBohBCU=ZWNM2qQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] coresight: cti: Enable CTI associated with devices.
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

HI Mathieu,

Will fix as requested.

Thanks

Mike


On Mon, 25 Nov 2019 at 22:45, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Nov 19, 2019 at 11:19:06PM +0000, Mike Leach wrote:
> > The CoreSight subsystem enables a path of devices from source to sink.
> > Any CTI devices associated with the path devices must be enabled at the
> > same time.
> >
> > This patch adds an associated coresight_device element to the main
> > coresight device structure, and uses this to create associations between
> > the CTI and other devices based on the device tree data. The associated
> > device element is used to enable CTI in conjunction with the path elements.
> >
> > CTI devices are reference counted so where a single CTI is associated with
> > multiple elements on the path, it will be enabled on the first associated
> > device enable, and disabled with the last associated device disable.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  drivers/hwtracing/coresight/coresight-cti.c   | 87 +++++++++++++++++++
> >  .../hwtracing/coresight/coresight-platform.c  | 23 +++++
> >  drivers/hwtracing/coresight/coresight-priv.h  |  6 ++
> >  drivers/hwtracing/coresight/coresight.c       | 58 +++++++++++--
> >  include/linux/coresight.h                     |  5 ++
> >  5 files changed, 173 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> > index 369488dd7b8e..cf116463149a 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti.c
> > @@ -440,6 +440,90 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
> >       return err;
> >  }
> >
> > +/*
> > + * Look for a matching connection device name in the list of
> > + * connections. If found then swap in the csdev name and return
> > + * found.
> > + */
> > +static bool
> > +cti_match_con_name(struct cti_device *ctidev, const char *node_name,
> > +                const char *csdev_name)
> > +{
> > +     struct cti_trig_con *trig_con;
> > +
> > +     list_for_each_entry(trig_con, &ctidev->trig_cons, node) {
> > +             if (trig_con->con_dev_name) {
> > +                     if (!strcmp(node_name, trig_con->con_dev_name)) {
> > +                             /* match: so swap in csdev name */
> > +                             kfree(trig_con->con_dev_name);
> > +                             trig_con->con_dev_name =
> > +                                     kstrdup(csdev_name, GFP_KERNEL);
> > +                             return true;
> > +                     }
> > +             }
> > +     }
> > +     return false;
> > +}
> > +
> > +/*
> > + * Search the cti list to add an associated CTI into the supplied CS device
> > + * This will set the association if CTI declared before the CS device
> > + */
> > +void cti_add_assoc_to_csdev(struct coresight_device *csdev)
> > +{
> > +     struct cti_drvdata *ect_item;
> > +     struct cti_device *ctidev;
> > +     const char *node_name = NULL, *csdev_name;
> > +
> > +     /* protect the list */
> > +     mutex_lock(&ect_mutex);
> > +
> > +     /* exit if current is an ECT device.*/
> > +     if ((csdev->type == CORESIGHT_DEV_TYPE_ECT) || list_empty(&ect_net))
> > +             goto cti_add_done;
> > +
> > +     /* if we didn't find the csdev previously we used the fwnode name */
> > +     node_name = coresight_get_fwnode_name(csdev->dev.parent);
> > +
> > +     if (!node_name)
> > +             goto cti_add_done;
> > +
> > +     /* this is the name we want to use for the association */
> > +     csdev_name = dev_name(&csdev->dev);
> > +
> > +     /* for each CTI in list... */
> > +     list_for_each_entry(ect_item, &ect_net, node) {
> > +             ctidev = &ect_item->ctidev;
> > +             if (cti_match_con_name(ctidev, node_name, csdev_name)) {
> > +                     /*
> > +                      * if we found a matching name then update the
> > +                      * association pointers.
> > +                      */
> > +                     csdev->ect_dev = ect_item->csdev;
> > +                     goto cti_add_done;
> > +             }
> > +     }
> > +cti_add_done:
> > +     mutex_unlock(&ect_mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(cti_add_assoc_to_csdev);
> > +
> > +/*
> > + * Update the cross references where the associated device was found
> > + * while we were building the connection info. This will occur if the
> > + * assoc device was registered before the CTI.
> > + */
> > +static void cti_update_conn_xrefs(struct cti_drvdata *drvdata)
> > +{
> > +     struct cti_trig_con *tc;
> > +     struct cti_device *ctidev = &drvdata->ctidev;
> > +
> > +     list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > +             if (tc->con_dev)
> > +                     tc->con_dev->ect_dev = drvdata->csdev;
> > +     }
> > +}
> > +
> >  /** cti ect operations **/
> >  int cti_enable(struct coresight_device *csdev)
> >  {
> > @@ -574,6 +658,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
> >       drvdata->csdev_release = drvdata->csdev->dev.release;
> >       drvdata->csdev->dev.release = cti_device_release;
> >
> > +     /* set any cross references */
> > +     cti_update_conn_xrefs(drvdata);
> > +
> >       /* all done - dec pm refcount */
> >       pm_runtime_put(&adev->dev);
> >       dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> > diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> > index 3c5bee429105..6721cb1af5fe 100644
> > --- a/drivers/hwtracing/coresight/coresight-platform.c
> > +++ b/drivers/hwtracing/coresight/coresight-platform.c
> > @@ -293,6 +293,12 @@ static int of_get_coresight_platform_data(struct device *dev,
> >
> >       return 0;
> >  }
> > +
> > +static inline const char *of_coresight_get_node_name(struct device *dev)
> > +{
> > +     return dev->of_node->full_name;
> > +}
> > +
> >  #else
> >  static inline int
> >  of_get_coresight_platform_data(struct device *dev,
> > @@ -305,6 +311,11 @@ static inline int of_coresight_get_cpu(struct device *dev)
> >  {
> >       return -ENODEV;
> >  }
> > +
> > +static inline const char *of_coresight_get_node_name(struct device *dev)
> > +{
> > +     return NULL;
> > +}
> >  #endif
> >
> >  #ifdef CONFIG_ACPI
> > @@ -766,6 +777,18 @@ static inline int acpi_coresight_get_cpu(struct device *dev)
> >  }
> >  #endif
> >
> > +const char *coresight_get_fwnode_name(struct device *dev)
> > +{
> > +     const char *node_name = NULL;
> > +     struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +
> > +     if (is_of_node(fwnode))
> > +             node_name = of_coresight_get_node_name(dev);
> > +
> > +     return node_name;
> > +}
> > +EXPORT_SYMBOL_GPL(coresight_get_fwnode_name);
> > +
> >  int coresight_get_cpu(struct device *dev)
> >  {
> >       if (is_of_node(dev->fwnode))
> > diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> > index aba6b789c969..484e5ec593bb 100644
> > --- a/drivers/hwtracing/coresight/coresight-priv.h
> > +++ b/drivers/hwtracing/coresight/coresight-priv.h
> > @@ -162,6 +162,12 @@ static inline int etm_readl_cp14(u32 off, unsigned int *val) { return 0; }
> >  static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
> >  #endif
> >
> > +#ifdef CONFIG_CORESIGHT_CTI
> > +extern void cti_add_assoc_to_csdev(struct coresight_device *csdev);
> > +#else
> > +static inline void cti_add_assoc_to_csdev(struct coresight_device *csdev) {}
> > +#endif
> > +
> >  /*
> >   * Macros and inline functions to handle CoreSight UCI data and driver
> >   * private data in AMBA ID table entries, and extract data values.
> > diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
> > index 1a5fdf2710ff..7657be009246 100644
> > --- a/drivers/hwtracing/coresight/coresight.c
> > +++ b/drivers/hwtracing/coresight/coresight.c
> > @@ -216,6 +216,31 @@ void coresight_disclaim_device(void __iomem *base)
> >       CS_LOCK(base);
> >  }
> >
> > +/* enable or disable an associated CTI device of the supplied CS device */
> > +static int
> > +coresight_control_assoc_ectdev(struct coresight_device *csdev, bool enable)
> > +{
> > +     int ect_ret = 0;
> > +     struct coresight_device *ect_csdev = csdev->ect_dev;
> > +
> > +     if (!ect_csdev)
> > +             return 0;
> > +
> > +     if (enable) {
> > +             if (ect_ops(ect_csdev)->enable)
> > +                     ect_ret = ect_ops(ect_csdev)->enable(ect_csdev);
> > +     } else {
> > +             if (ect_ops(ect_csdev)->disable)
> > +                     ect_ret = ect_ops(ect_csdev)->disable(ect_csdev);
> > +     }
> > +
> > +     /* output warning if ECT enable is preventing trace operation */
> > +     if (ect_ret)
> > +             dev_info(&csdev->dev, "Associated ECT device (%s) %s failed\n",
> > +              dev_name(&ect_csdev->dev), enable ? "enable" : "disable");
>
> Indentation problem - please replace with:
>
>                 dev_info(&csdev->dev, "Associated ECT device (%s) %s failed\n",
>                          dev_name(&ect_csdev->dev),
>                          enable ? "enable" : "disable");
>
> > +     return ect_ret;
> > +}
> > +
> >  static int coresight_enable_sink(struct coresight_device *csdev,
> >                                u32 mode, void *data)
> >  {
> > @@ -228,11 +253,15 @@ static int coresight_enable_sink(struct coresight_device *csdev,
> >       if (!sink_ops(csdev)->enable)
> >               return -EINVAL;
> >
> > -     ret = sink_ops(csdev)->enable(csdev, mode, data);
> > +     ret = coresight_control_assoc_ectdev(csdev, true);
> >       if (ret)
> >               return ret;
> > +     ret = sink_ops(csdev)->enable(csdev, mode, data);
> > +     if (ret) {
> > +             coresight_control_assoc_ectdev(csdev, false);
> > +             return ret;
> > +     }
> >       csdev->enable = true;
> > -
>
> Unneeded modification.
>
> With the above changes:
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> >       return 0;
> >  }
> >
> > @@ -246,6 +275,7 @@ static void coresight_disable_sink(struct coresight_device *csdev)
> >       ret = sink_ops(csdev)->disable(csdev);
> >       if (ret)
> >               return;
> > +     coresight_control_assoc_ectdev(csdev, false);
> >       csdev->enable = false;
> >  }
> >
> > @@ -269,8 +299,15 @@ static int coresight_enable_link(struct coresight_device *csdev,
> >       if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && outport < 0)
> >               return outport;
> >
> > -     if (link_ops(csdev)->enable)
> > -             ret = link_ops(csdev)->enable(csdev, inport, outport);
> > +     if (link_ops(csdev)->enable) {
> > +             ret = coresight_control_assoc_ectdev(csdev, true);
> > +             if (!ret) {
> > +                     ret = link_ops(csdev)->enable(csdev, inport, outport);
> > +                     if (ret)
> > +                             coresight_control_assoc_ectdev(csdev, false);
> > +             }
> > +     }
> > +
> >       if (!ret)
> >               csdev->enable = true;
> >
> > @@ -300,8 +337,10 @@ static void coresight_disable_link(struct coresight_device *csdev,
> >               nr_conns = 1;
> >       }
> >
> > -     if (link_ops(csdev)->disable)
> > +     if (link_ops(csdev)->disable) {
> >               link_ops(csdev)->disable(csdev, inport, outport);
> > +             coresight_control_assoc_ectdev(csdev, false);
> > +     }
> >
> >       for (i = 0; i < nr_conns; i++)
> >               if (atomic_read(&csdev->refcnt[i]) != 0)
> > @@ -322,9 +361,14 @@ static int coresight_enable_source(struct coresight_device *csdev, u32 mode)
> >
> >       if (!csdev->enable) {
> >               if (source_ops(csdev)->enable) {
> > -                     ret = source_ops(csdev)->enable(csdev, NULL, mode);
> > +                     ret = coresight_control_assoc_ectdev(csdev, true);
> >                       if (ret)
> >                               return ret;
> > +                     ret = source_ops(csdev)->enable(csdev, NULL, mode);
> > +                     if (ret) {
> > +                             coresight_control_assoc_ectdev(csdev, false);
> > +                             return ret;
> > +                     };
> >               }
> >               csdev->enable = true;
> >       }
> > @@ -347,6 +391,7 @@ static bool coresight_disable_source(struct coresight_device *csdev)
> >       if (atomic_dec_return(csdev->refcnt) == 0) {
> >               if (source_ops(csdev)->disable)
> >                       source_ops(csdev)->disable(csdev, NULL);
> > +             coresight_control_assoc_ectdev(csdev, false);
> >               csdev->enable = false;
> >       }
> >       return !csdev->enable;
> > @@ -1252,6 +1297,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
> >
> >       coresight_fixup_device_conns(csdev);
> >       coresight_fixup_orphan_conns(csdev);
> > +     cti_add_assoc_to_csdev(csdev);
> >
> >       mutex_unlock(&coresight_mutex);
> >
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index b3e582d96a34..b5dc9baf0c58 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -163,6 +163,8 @@ struct coresight_connection {
> >   *           activated but not yet enabled.  Enabling for a _sink_
> >   *           appens when a source has been selected for that it.
> >   * @ea:              Device attribute for sink representation under PMU directory.
> > + * @ect_dev: Associated cross trigger device. Not part of the trace data
> > + *           path or connections.
> >   */
> >  struct coresight_device {
> >       struct coresight_platform_data *pdata;
> > @@ -176,6 +178,8 @@ struct coresight_device {
> >       /* sink specific fields */
> >       bool activated; /* true only if a sink is part of a path */
> >       struct dev_ext_attribute *ea;
> > +     /* cross trigger handling */
> > +     struct coresight_device *ect_dev;
> >  };
> >
> >  /*
> > @@ -341,5 +345,6 @@ static inline bool coresight_loses_context_with_cpu(struct device *dev)
> >  extern int coresight_get_cpu(struct device *dev);
> >
> >  struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
> > +extern const char *coresight_get_fwnode_name(struct device *dev);
> >
> >  #endif
> > --
> > 2.17.1
> >



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
