Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9726BC43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 12:06:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60E8C217AB
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 12:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTTULPKi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfK2MGT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 07:06:19 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45402 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2MGT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 07:06:19 -0500
Received: by mail-qk1-f194.google.com with SMTP id x1so10561195qkl.12
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 04:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sRsq1H79H3SLbpinKw5zokLUT+GaLK3RwOVX6nt73FY=;
        b=OTTULPKiIQOT+vyZGHWZPmxqkih3Hh6RRORnIy6dpyCx2NoPUYCznp7t7uXcWvJfFB
         2xjnAJn955SfGxBDm4idJ2fUnOQ3/nbVCzdJl3nGl8VLihxxM1d+85B9uYx7QCwr6gOO
         uLxdP2hkHpQENBpqPTrgkhsC8zdf7cBhzUeg6Qbf2Qg+xfjO+uALwWv7Uk/4FjHUN0Ok
         aIsJ1cVO26NpNxpxZT9HWUA/tfSrzApnwXRRbolfVG+wzUQhvSkRqLBrI/aVQeSYh8TL
         oZmjnqC1gKI2mOlwSnTrsCXD+fKRT5RaCLS3y6sroU/J4FwA9apiFwht11ruyRlOhZhk
         Mf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sRsq1H79H3SLbpinKw5zokLUT+GaLK3RwOVX6nt73FY=;
        b=KNWTOPP5iDXzIY6VtechIElcY75mD2icJi0PcbvUdTUo/LU2/wysr8K7nXjZ0kciOw
         0iej2rqdccIrh69oFFVFtnNMOvYqwPmAlHpLvRCRg4Qji0K2SwBxjD3lAt9uU0O4AcSS
         wdROmtTnp2VfvhkpUrdpOJVDO3V+rA5gZRRUK/Oi7vEXzpaH4CSvjLkYsG7T6rKziWAF
         SvoKUOR2RTl6WqXGqva2Y1gPF4pTtmE83mYVsXdmUIo60qEUdFe7k+Ki+3OgDSCMT9Vh
         aU6DUKhAIetHbTr4IBRIap4RJavouyISKmgzbB1fesXEbX5aLBF2mYHQRgo9eYqipUMr
         3Mqg==
X-Gm-Message-State: APjAAAUAhdQvNEtCKpsNK9uytxcTzsyoHx3LbPiDxUSWmCyJKr0BOEyY
        qIL8OwmoHiupmhDYxYYoaZ50ehUEyqigA5mNP24QIg==
X-Google-Smtp-Source: APXvYqxYJ/XTnVV2D0O5LIR8DcwEy685N4d9CsfVW42yMIEOsMvK04m5AOEIGODr+J13K/33Putoa+yrlFztG507vlo=
X-Received: by 2002:a37:4ccb:: with SMTP id z194mr15433686qka.128.1575029178058;
 Fri, 29 Nov 2019 04:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-2-mike.leach@linaro.org>
 <fce270a6-03a7-f620-9ebf-5117c5dd7cc6@arm.com>
In-Reply-To: <fce270a6-03a7-f620-9ebf-5117c5dd7cc6@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 29 Nov 2019 12:06:06 +0000
Message-ID: <CAJ9a7ViVpUq7OCR2=QKDBX=YXpuKdm8hGGBkhjyttr3+L=v5qQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] coresight: cti: Initial CoreSight CTI Driver
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

Will be re-spinning due to later patches - so will fixup as requested

Thanks

Mike

On Mon, 25 Nov 2019 at 19:03, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:18, Mike Leach wrote:
> > This introduces a baseline CTI driver and associated configuration files.
> >
> > Uses the platform agnostic naming standard for CoreSight devices, along
> > with a generic platform probing method that currently supports device
> > tree descriptions, but allows for the ACPI bindings to be added once these
> > have been defined for the CTI devices.
> >
> > Driver will probe for the device on the AMBA bus, and load the CTI driver
> > on CoreSight ID match to CTI IDs in tables.
> >
> > Initial sysfs support for enable / disable provided.
> >
> > Default CTI interconnection data is generated based on hardware
> > register signal counts, with no additional connection information.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
>
> Looks good to me.  Some very minor nits, feel free to ignore if you are
> not respinning the series.
>
> > +/*
> > + * Look at the HW DEVID register for some of the HW settings.
> > + * DEVID[15:8] - max number of in / out triggers.
> > + */
> > +#define CTI_DEVID_MAXTRIGS(devid_val) (int)((devid_val & 0xFF00) >> 8)
>
> BMVAL(devid_val, 15, 8)
>
> > +
> > +/* DEVID[19:16] - number of CTM channels */
> > +#define CTI_DEVID_CTMCHANNELS(devid_val) (int)((devid_val & 0xF0000) >> 16)
>
> BMVAL(devid_val, 19, 16)
>
> > +
> > +static void cti_set_default_config(struct device *dev,
> > +                                struct cti_drvdata *drvdata)
> > +{
> > +     struct cti_config *config = &drvdata->config;
> > +     u32 devid;
> > +
> > +     devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
> > +     config->nr_trig_max = CTI_DEVID_MAXTRIGS(devid);
> > +
> > +     /*
> > +      * no current hardware should exceed this, but protect the driver
> > +      * in case of fault / out of spec hw
> > +      */
> > +     if (config->nr_trig_max > CTIINOUTEN_MAX) {
> > +             dev_warn_once(dev,
> > +                     "Limiting HW MaxTrig value(%d) to driver max(%d)\n",
> > +                     config->nr_trig_max, CTIINOUTEN_MAX);
> > +             config->nr_trig_max = CTIINOUTEN_MAX;
> > +     }
> > +
> > +     config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
> > +
> > +     /* Most regs default to 0 as zalloc'ed except...*/
> > +     config->trig_filter_enable = true;
> > +     config->ctigate = GENMASK(config->nr_ctm_channels - 1, 0);
> > +     atomic_set(&config->enable_req_count, 0);
> > +}
> > +
> > +/*
> > + * Add a connection entry to the list of connections for this
> > + * CTI device.
> > + */
> > +int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
> > +                          struct cti_trig_con *tc,
> > +                          struct coresight_device *csdev,
> > +                          const char *assoc_dev_name)
> > +{
> > +     struct cti_device *cti_dev = &drvdata->ctidev;
> > +
> > +     tc->con_dev = csdev;
> > +     /*
> > +      * Prefer actual associated CS device dev name to supplied value -
> > +      * which is likely to be node name / other conn name.
> > +      */
> > +     if (csdev)
> > +             tc->con_dev_name = devm_kstrdup(dev,
> > +                                             dev_name(&csdev->dev),
> > +                                             GFP_KERNEL);
> > +     else if (assoc_dev_name != NULL)
> > +             tc->con_dev_name = devm_kstrdup(dev,
> > +                                             assoc_dev_name, GFP_KERNEL);
> > +     list_add_tail(&tc->node, &cti_dev->trig_cons);
> > +     cti_dev->nr_trig_con++;
> > +
> > +     /* add connection usage bit info to overall info */
> > +     drvdata->config.trig_in_use |= tc->con_in->used_mask;
> > +     drvdata->config.trig_out_use |= tc->con_out->used_mask;
>
> Do we need to make sure that they are exclusive ?
>
>   WARN_ON(drvdata->config.trig_in_use ^ ~(tc->con_in->used_mask));
>   WARN_ON(drvdata->config.trig_out_use ^ ~(tc->con_out->used_mask));
>
> > +/** cti ect operations **/
> > +int cti_enable(struct coresight_device *csdev)
> > +{
> > +     struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
> > +
> > +     /* enable hardware with refcount */
>
> nit: left over comment from previous revision ?
>
> > +     return cti_enable_hw(drvdata);
> > +}
> > +
> > +int cti_disable(struct coresight_device *csdev)
> > +{
> > +     struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
> > +
> > +     /* disable hardware with refcount */
>
> same here ?
>
> > +     return cti_disable_hw(drvdata);
> > +}
> > +
>
> > +
> > +static int cti_probe(struct amba_device *adev, const struct amba_id *id)
> > +{
> > +     int ret = 0;
> > +     void __iomem *base;
> > +     struct device *dev = &adev->dev;
> > +     struct cti_drvdata *drvdata = NULL;
> > +     struct coresight_desc cti_desc;
> > +     struct coresight_platform_data *pdata = NULL;
> > +     struct resource *res = &adev->res;
> > +
> > +     /* driver data*/
> > +     drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> > +     if (!drvdata) {
> > +             ret = -ENOMEM;
> > +             dev_info(dev, "%s, mem err\n", __func__);
>
> dev_err() ? As they may have higher priority than "info" and will get
> displayed in the rare chance of them getting hit.
>
> > +             goto err_out;
> > +     }
> > +
> > +     /* Validity for the resource is already checked by the AMBA core */
> > +     base = devm_ioremap_resource(dev, res);
> > +     if (IS_ERR(base)) {
> > +             ret = PTR_ERR(base);
> > +             dev_info(dev, "%s, remap err\n", __func__);
>
> same here, dev_err()
>
> > +             goto err_out;
> > +     }
> > +     drvdata->base = base;
> > +
> > +     dev_set_drvdata(dev, drvdata);
> > +
> > +     /* default CTI device info  */
> > +     drvdata->ctidev.cpu = -1;
> > +     drvdata->ctidev.nr_trig_con = 0;
> > +     drvdata->ctidev.ctm_id = 0;
> > +     INIT_LIST_HEAD(&drvdata->ctidev.trig_cons);
> > +
> > +     spin_lock_init(&drvdata->spinlock);
> > +
> > +     /* initialise CTI driver config values */
> > +     cti_set_default_config(dev, drvdata);
> > +
> > +     /* Parse the .dts for connections and signals */
>
> minor nit: I would not mention about ".dts" here. The function name is
> implicit. You could actually remove that comment.
>
> As mentioned above, the comments are minor nits. So you may add
> with/without addressing them:
>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
