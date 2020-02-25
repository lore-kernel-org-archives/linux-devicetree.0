Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCC6C35E04
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 15:03:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04A5520CC7
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 15:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j3YeRKuj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730795AbgBYPDb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 10:03:31 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34891 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730345AbgBYPDb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 10:03:31 -0500
Received: by mail-qk1-f194.google.com with SMTP id 145so5988385qkl.2
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 07:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wAHb7rK639CcDCtnM7iJQZElyiD2uywLhpHa6tq57/0=;
        b=j3YeRKujuPj9zGjGOLEkt6wdH3hlRbWvAzwSpsAFnd+E0Vl11Qkczyj0JZGkg6Rd/d
         OyORz2UcsIwsakv9MMRaOoz/C/BbwKMHNX+pXr3AtBb/VtQ53CsVk5jd5v340Qua6VDw
         Bedv2EeiN5pdEZFaYMTd0GQB1lnUxvpYO8pOg5bT7QO/OU9WQ8naLOVo/67Z56BjwymC
         kDH5k9Hxz+ZkY7KLoxOgPswpMct6k9BAX2ni0w86KyYaNEohu20Ed8BOJuZ8U2M5MFKj
         nacWEMMAjE6jXiWafw8SOxqrluPoCzTYzDOgvLqI2nsE5BlNorCr2l81nYX9/nayT6iB
         PMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wAHb7rK639CcDCtnM7iJQZElyiD2uywLhpHa6tq57/0=;
        b=lpMTKrvuTBLC3lvWiCjBDCn+dEU09o3ETbMTaeFpDOMXSVkBiLds3+ZsAN7GfyO6B2
         j5sePAXPITqCWJmeWXg3jsG+NKKtSJwjMjX178Xm3HI2ipW4mDCXrS3Zh5RUtiMX0r55
         jp6VNU0VHSLdIBUGV7ARDbS0RWpouPTT85Yfd1GgXW+wr6tXrruytxJbF8bgctW9HrUV
         OjhR3fmjvnX3xqHo0OpfVF/GPgFYEi8rx1GIqK1tsIDCIApzHhBsqf0lAJe5hDrFrXsF
         z5yfewsD0g0oD98cB9o/+uA2mh54bf1Bs5qmH0dC3iyXyRqpd/p2/q9ExlE4rzkYRUc9
         46dw==
X-Gm-Message-State: APjAAAWRDyW4z1NWa9lvcCcRMIU/np1Cm8D4vlxG4O6Rj8V/FCSN3Doz
        1FEP56DXobjvMnFGS95ugIW7NPn0MCvtlF3IX647Jw==
X-Google-Smtp-Source: APXvYqzigvoxgWcb3ZmCCwvHRtpN3dxkcq9+kpu7VpR9hQ20upkiH0Yza2Z8PIe6Eb+Flk9FSwpWt8uJ4z71H80aDnk=
X-Received: by 2002:a37:a9c3:: with SMTP id s186mr4972168qke.118.1582643009968;
 Tue, 25 Feb 2020 07:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20200210213924.20037-1-mike.leach@linaro.org> <20200210213924.20037-9-mike.leach@linaro.org>
 <04b739fd-7bb3-bd28-8013-918e7d4dfcb7@arm.com> <20200221165134.GA25043@xps15>
In-Reply-To: <20200221165134.GA25043@xps15>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 25 Feb 2020 15:03:18 +0000
Message-ID: <CAJ9a7VjJMtftam3t_e25ckOW_dufncbqdLkHeV3G8e7W9K5bCw@mail.gmail.com>
Subject: Re: [PATCH v9 08/15] coresight: cti: Enable CTI associated with devices.
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As using devm_... for allocation, there is no need to explicitly free
up tc->con_dev_name, also the lifetime of the connection is linked to
the lifetime of csdev, so we can drop the devm_kstrdup in the csdev
case so this becomes

/* match: so swap in csdev name & dev */
               tc->con_dev_name = dev_name(&csdev->dev);
                tc->con_dev = csdev;
                return true;

Same true for similar link in patch 1, removing 2 un-needed
allocations, leaving 1 to be fixed up with error checking

Mike


On Fri, 21 Feb 2020 at 16:51, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Fri, Feb 21, 2020 at 12:20:17AM +0000, Suzuki K Poulose wrote:
> > Hi Mike
> >
> > Sorry for the delay. one minor comment below.
> >
> > On 02/10/2020 09:39 PM, Mike Leach wrote:
> > > The CoreSight subsystem enables a path of devices from source to sink.
> > > Any CTI devices associated with the path devices must be enabled at the
> > > same time.
> > >
> > > This patch adds an associated coresight_device element to the main
> > > coresight device structure, and uses this to create associations between
> > > the CTI and other devices based on the device tree data. The associated
> > > device element is used to enable CTI in conjunction with the path elements.
> > >
> > > CTI devices are reference counted so where a single CTI is associated with
> > > multiple elements on the path, it will be enabled on the first associated
> > > device enable, and disabled with the last associated device disable.
> > >
> > > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > >   drivers/hwtracing/coresight/coresight-cti.c  | 129 +++++++++++++++++++
> > >   drivers/hwtracing/coresight/coresight-cti.h  |   1 +
> > >   drivers/hwtracing/coresight/coresight-priv.h |  12 ++
> > >   drivers/hwtracing/coresight/coresight.c      |  71 +++++++++-
> > >   include/linux/coresight.h                    |   4 +
> > >   5 files changed, 212 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> > > index 77c2af247917..c4494923d030 100644
> > > --- a/drivers/hwtracing/coresight/coresight-cti.c
> > > +++ b/drivers/hwtracing/coresight/coresight-cti.c
> > > @@ -4,6 +4,7 @@
> > >    * Author: Mike Leach <mike.leach@linaro.org>
> > >    */
> > > +#include <linux/property.h>
> > >   #include "coresight-cti.h"
> > >   /**
> > > @@ -440,6 +441,131 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
> > >     return err;
> > >   }
> > > +/*
> > > + * Look for a matching connection device name in the list of connections.
> > > + * If found then swap in the csdev name, set trig con association pointer
> > > + * and return found.
> > > + */
> > > +static bool
> > > +cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> > > +                 struct coresight_device *csdev)
> > > +{
> > > +   struct cti_trig_con *tc;
> > > +   const char *csdev_name;
> > > +
> > > +   list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > > +           if (tc->con_dev_name) {
> > > +                   if (!strcmp(node_name, tc->con_dev_name)) {
> > > +                           /* match: so swap in csdev name & dev */
> > > +                           csdev_name = dev_name(&csdev->dev);
> > > +                           tc->con_dev_name =
> > > +                                   devm_kstrdup(&csdev->dev, csdev_name,
> > > +                                                GFP_KERNEL);
> >
> > In the extreme rare case of an allocation failure, we may want to
> > check if the allocation was successful or not, rather than silently
> > ignoring it. With that fixed,
>
> Line 419 and 423 in patch 1 need the same attention.
>
> >
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
