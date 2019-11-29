Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F1DC432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 12:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACEFD217AB
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 12:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5uWqe7b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfK2Mrd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 07:47:33 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42516 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2Mrc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 07:47:32 -0500
Received: by mail-qk1-f196.google.com with SMTP id a10so2386405qko.9
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 04:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HA9o/u53YjrVdA02BiAhrhaWuLmdYlt8zQVP4Dznw6U=;
        b=l5uWqe7bpXn2UmXrf5rJxfPA/epAIbrtB3jup0WIiu5m8pWoU00aEs1tua2o2EoA8W
         +8Yw+nK4rUZFqZEuAwGmwZC55hEP898tYISz7JX6QLf/hlKh11pwKjIXI35npPPAlj4H
         Uk2Itv6CXUl6L6unhF9qRb3phRktfJIStsROI9PlzzoMhgaKR987uAch/1leF22Mvcso
         wbkcSGEtMwT6sYVIVQJeNmyZdvNUOynl88P92VcAFVYVY3ci6e5+TjDeuI51N7/Ts0TT
         cUY2iNqTDxjjIjYvvju8CsLLbJHhlJp+9LAtmGT/fLGYmiCNYlgHDiO+P0Fxseh+LseN
         T3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HA9o/u53YjrVdA02BiAhrhaWuLmdYlt8zQVP4Dznw6U=;
        b=CQTKoTyipD0o+AycKRVtb5KailvyCtCQOP+FXv/B61W9eVVgiaZZIygo9/gLFuhWTz
         C+Q9azcGiIgBcTZjiT4WfX7gtupFCPkSTiSmhycb1b0IQhqyF6e9TiHp7CmOF/VL8N11
         SsjSmjAX7qlE9WSsGrdXCBVYmS7ZDVXLPnxfKRHgscUvyakY8gxGONRhB6QJ5xjemUkY
         J9qyeQ8VkYirMZS4+YQZJXHIav9l5vyCwDNiqZaWu/c5kznOC8hLOiuKESNJB4W/rqc+
         w4o9KMqlxpTMLoiv/DI6OIGtMIPl9B5PYBF8k0zJ9RtbA4wTXxvb9JP9/YvA+jGdKpSZ
         GoLw==
X-Gm-Message-State: APjAAAW2a6Inba1ihDAjx4IuAH0VmQ0whIlcK2RRpKzM0bMivLlfa5QM
        KDYcz/pwfzUhEHzxEYFtnWvmCct4R08oJVqtEyZxCQ==
X-Google-Smtp-Source: APXvYqzmTmr6QZQFIUEGRuuXj5PXEOxF6lLfDqA6zEH/L5cP6mOIC+LfT9NMK8B0Ha75O23mZDfOLZ+HCsRM7UEbVTU=
X-Received: by 2002:a37:62d2:: with SMTP id w201mr15360336qkb.445.1575031651558;
 Fri, 29 Nov 2019 04:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-4-mike.leach@linaro.org>
 <df1f3912-4096-bc96-e65a-5db1593ad8f4@arm.com>
In-Reply-To: <df1f3912-4096-bc96-e65a-5db1593ad8f4@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 29 Nov 2019 12:47:20 +0000
Message-ID: <CAJ9a7VhV=5okV1oCW8sAUZVsUzgDWnDNgP-eWejquGx+M9Xv2w@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] coresight: cti: Add sysfs access to program
 function regs
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


On Wed, 27 Nov 2019 at 18:26, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > Adds in sysfs programming support for the CTI function register sets.
> > Allows direct manipulation of channel / trigger association registers.
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >   .../hwtracing/coresight/coresight-cti-sysfs.c | 362 ++++++++++++++++++
> >   drivers/hwtracing/coresight/coresight-cti.c   |  19 +
> >   drivers/hwtracing/coresight/coresight-cti.h   |   5 +
> >   3 files changed, 386 insertions(+)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > index 507f8eb487fe..02d3ee0c1278 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > @@ -109,6 +109,362 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
> >       NULL,
> >   };
> >
> > +/* CTI low level programming registers */
> > +
> > +/*
> > + * Show a simple 32 bit value if enabled and powered.
> > + * If inaccessible & pcached_val not NULL then show cached value.
> > + */
>
> Also I am not sure if it makes sense to mention that the value is cached.
>
> > +static ssize_t cti_reg32_show(struct device *dev, char *buf,
> > +                           u32 *pcached_val, int reg_offset)
> > +{
> > +     u32 val = 0;
>    +    char *state = "";
>
> > +     struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +     struct cti_config *config = &drvdata->config;
> > +
> > +     spin_lock(&drvdata->spinlock);
> > +     if ((reg_offset >= 0) && CTI_PWR_ENA(config)) {
>
> minor nit: Personally I don't like the naming here. This could simply
> be: cti_accessible(config) , may be defined as a static inline function
> instead of a macro:
>
> static inline bool cti_accessible(struct cti_drvdata *drvdata)
> {
>         struct cti_config *cfg = &drvdata->config;
>
>         return cfg->hw_powered && cfg->hw_enabled;
> }
>
>

Since this is a generic access function used throughout the file - the
cached pointer is an indicator used by the callee that there is a
value available if the CTI is unpowered  / disabled - so the function
can show an appropriate value which will be taken from the config
structure.

So I don't think it is relevant to show that a "cached" value is being
used to show the user. If you look at similar functions in the ETM
drivers for example, quite often a show function simple shows that
stored value from a config structure without ever looking at the
register in the device.

As to naming - the name is chosen to represent a specific state - both
powered and enabled. The sysfs interface is accessible in any state  -
powered / unpowered  , enabled /disabled - so I am being specific.
Unlike the ETM, this hardware can have registers programmed while
enabled - and for some such as apppulse this is the only time it makes
sense to use them.

I don't mind either way between macro / inline function - though it
still has to be declared in the header as it is used in multiple .c
files.
I'd be inclined to call it cti_active() if preferred to cti_pwr_ena -
active implies that the CTI is in operation.

Thanks

Mike


> > +             CS_UNLOCK(drvdata->base);
> > +             val = readl_relaxed(drvdata->base + reg_offset);
> > +             if (pcached_val)
> > +                     *pcached_val = val;
> > +             CS_LOCK(drvdata->base);
> > +     } else if (pcached_val) {
> > +             val = *pcached_val;
>
>    +            state = " (cached)";
> > +     }
> > +     spin_unlock(&drvdata->spinlock);
> > +     return scnprintf(buf, PAGE_SIZE, "%#x\n", val);
>    +    return scnprintf(buf, PAGE_SIZE, "%#x%s\n", val, state);
>
> > +}
> > +
> > +/*
> > + * Store a simple 32 bit value.
> > + * If pcached_val not NULL, then copy to here too,
> > + * if reg_offset >= 0 then write through if enabled.
> > + */
> > +static ssize_t cti_reg32_store(struct device *dev, const char *buf,
> > +                            size_t size, u32 *pcached_val, int reg_offset)
>
>
> > +static ssize_t appclear_store(struct device *dev,
> > +                           struct device_attribute *attr,
> > +                           const char *buf, size_t size)
> > +{
> > +     unsigned long val;
> > +     struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +     struct cti_config *config = &drvdata->config;
> > +
> > +     if (kstrtoul(buf, 0, &val))
> > +             return -EINVAL;
> > +
> > +     spin_lock(&drvdata->spinlock);
> > +
> > +     /* a 1'b1 in appclr clears down the same bit in appset*/
>
> nit: a 0b1 ?
>
Syntax is <bitwidth>'<radix><value> - a habit picked up from verilog.

> > +     config->ctiappset &= ~val;
> > +
> > +     /* write through if enabled */
> > +     if (CTI_PWR_ENA(config))
> > +             cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
> > +     spin_unlock(&drvdata->spinlock);
> > +     return size;
> > +}
> > +static DEVICE_ATTR_WO(appclear);
> > +
>
> Otherwise looks good to me.
>
> Suzuki



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
