Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8B1C35242
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 20:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1C3B20848
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 20:09:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iKL3T3KT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbgBKUJW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 15:09:22 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46018 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728537AbgBKUJW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Feb 2020 15:09:22 -0500
Received: by mail-oi1-f194.google.com with SMTP id v19so14029172oic.12
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 12:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d79/juOKGQ3xhEKgN8cqkrkeeX6KR3FsfafPiPWnTjk=;
        b=iKL3T3KT/E0Iwsb3fnUfmhLupejJLrt0Xw5IOfw8B/SqKyHuAmgD6b5kRaiIeb6uQi
         4hqOAy9ePuT7GdoTUwr87pkUzlBm0LRqEEFiWmTJS7vLwJwDvOy2UWIrGEpnJS5HNg6L
         UJ3OcYCcXDup4hmac0c8ZAtTXuIBB4C4CC3djbwDvtd6WU9keMA7joMyqQ4WttYi8EBN
         vrOINTqg3CqyMUDW8SXtRJMA5A2vJY60W9spolclj6hO3pOdiey4rg0CUIfOnXDULfGo
         s6RA3SPhR9ow2ObUxJ9XLAnHJ3VD73fdhMjBf6otQbBS3osn2sT48zUHMkQ908wokOCL
         r57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d79/juOKGQ3xhEKgN8cqkrkeeX6KR3FsfafPiPWnTjk=;
        b=RZqi4LHrQJRAO25PNZPbYN6baye97JKfRHlFqGcIfpvapwE6yoiNoC1k7cyoAyHLhb
         4TIar4nuwHkicMoCBapLQcMt3gaGy4mYYGnUfO5mZMjnBqNASkh5hmSmGLiVGUGNLSmk
         HpINDk3WUwTXGMJhz5lhfzKN+Tc7KXcXeEZeWpcz/MvDjYK+cDnyWzAygjdWNtwadfnK
         8PyE90PRPgLvE6BWY9uSE5FvDfmTDwXaorG9yjO3s/T/KLwJCsrmi3PTAakB4r0BFuge
         lKwzhWSoRBju3N+xO8FoyNwIu2I9KJOc50/xTOlMoQPiSQwn9UYm1TQP29kwRj9MiUsK
         aRBQ==
X-Gm-Message-State: APjAAAW2YyejW28/w65oP8w6MUdkWgdDBkvpk7priIMrCh6TJaLe42k7
        6hufHAXbJbXWdq8h3HHvDN4Qvi726/Ks2JvneiHF0Q==
X-Google-Smtp-Source: APXvYqzxjGO2mFbbESSI+X8wqwDLJmq3XqFdPvI31wvyICH6y7/2J3dCeN49E5XfR2n7WblRYhIvydxmmpi6MKoWH0c=
X-Received: by 2002:aca:ea43:: with SMTP id i64mr4107524oih.30.1581451761048;
 Tue, 11 Feb 2020 12:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org> <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
In-Reply-To: <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 11 Feb 2020 12:08:44 -0800
Message-ID: <CAGETcx_3-ZoVAf+Uf0Yo86pUU1nL4S4-jrS0eZi50yvhCO985g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power domains
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 11, 2020 at 11:44 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> +Saravana
>
> On Thu, Feb 6, 2020 at 11:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > When there is a single power domain per device, the core will
> > ensure the power domain is switched on (so it is technically
> > equivalent to having not power domain specified at all).
> >
> > However, when there are multiple domains, as in MT8183 Bifrost
> > GPU, we need to handle them in driver code.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > ---
> >
> > The downstream driver we use on chromeos-4.19 currently uses 2
> > additional devices in device tree to accomodate for this [1], but
> > I believe this solution is cleaner.
> >
> > [1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#31
> >
> > v4:
> >  - Match the exact power domain names as specified in the compatible
> >    struct, instead of just matching the number of power domains.
> >    [Review: Ulf Hansson]
> >  - Dropped print and reordered function [Review: Steven Price]
> >  - nits: Run through latest version of checkpatch:
> >    - Use WARN instead of BUG_ON.
> >    - Drop braces for single expression if block.
> > v3:
> >  - Use the compatible matching data to specify the number of power
> >    domains. Note that setting 0 or 1 in num_pm_domains is equivalent
> >    as the core will handle these 2 cases in the exact same way
> >    (automatically, without driver intervention), and there should
> >    be no adverse consequence in this case (the concern is about
> >    switching on only some power domains and not others).
> >
> >  drivers/gpu/drm/panfrost/panfrost_device.c | 97 ++++++++++++++++++++--
> >  drivers/gpu/drm/panfrost/panfrost_device.h | 11 +++
> >  drivers/gpu/drm/panfrost/panfrost_drv.c    |  2 +
> >  3 files changed, 102 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> > index 3720d50f6d9f965..8136babd3ba9935 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/reset.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/regulator/consumer.h>
> >
> >  #include "panfrost_device.h"
> > @@ -120,6 +121,79 @@ static void panfrost_regulator_fini(struct panfrost_device *pfdev)
> >                         pfdev->regulators);
> >  }
> >
> > +static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
> > +               if (!pfdev->pm_domain_devs[i])
> > +                       break;
> > +
> > +               if (pfdev->pm_domain_links[i])
> > +                       device_link_del(pfdev->pm_domain_links[i]);
> > +
> > +               dev_pm_domain_detach(pfdev->pm_domain_devs[i], true);
> > +       }
> > +}
> > +
> > +static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
> > +{
> > +       int err;
> > +       int i, num_domains;
> > +
> > +       num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
> > +                                                "power-domains",
> > +                                                "#power-domain-cells");
> > +
> > +       /*
> > +        * Single domain is handled by the core, and, if only a single power
> > +        * the power domain is requested, the property is optional.
> > +        */
> > +       if (num_domains < 2 && pfdev->comp->num_pm_domains < 2)
> > +               return 0;
> > +
> > +       if (num_domains != pfdev->comp->num_pm_domains) {
> > +               dev_err(pfdev->dev,
> > +                       "Incorrect number of power domains: %d provided, %d needed\n",
> > +                       num_domains, pfdev->comp->num_pm_domains);
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
> > +                       "Too many supplies in compatible structure.\n"))
> > +               return -EINVAL;
> > +
> > +       for (i = 0; i < num_domains; i++) {
> > +               pfdev->pm_domain_devs[i] =
> > +                       dev_pm_domain_attach_by_name(pfdev->dev,
> > +                                       pfdev->comp->pm_domain_names[i]);
> > +               if (IS_ERR_OR_NULL(pfdev->pm_domain_devs[i])) {
> > +                       err = PTR_ERR(pfdev->pm_domain_devs[i]) ? : -ENODATA;
> > +                       pfdev->pm_domain_devs[i] = NULL;
> > +                       dev_err(pfdev->dev,
> > +                               "failed to get pm-domain %s(%d): %d\n",
> > +                               pfdev->comp->pm_domain_names[i], i, err);
> > +                       goto err;
> > +               }
> > +
> > +               pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
> > +                               pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
> > +                               DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
>
> We're in the process of adding device links based on DT properties.
> Shouldn't we add power domains to that? See drivers/of/property.c for
> what's handled.

Rob,

drivers/of/property.c doesn't enable the RPM_ACTIVE AND PM_RUNTIME
flags. Wanted to start off conservative. But adding command line ops
to change the default flags shouldn't be difficult. But before I do
that, I want to change of_devlink to
fw_devlink=<disabled|permissive|enabled>. May be I can extend that to
"disabled, permissive, suspend, runtime".

Nicholas,

And the adding and removing of device links for power domains will be
a 2 line change. I've been meaning to add a few more bindings like
hwspinlocks and pinctrl. I can roll power domains support into that if
you want.

-Saravana
