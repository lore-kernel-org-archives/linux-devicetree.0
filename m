Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE42C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 17:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7286E2071E
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 17:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwusNk8H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729907AbgAWRBh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 12:01:37 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:33037 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729547AbgAWRBg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 12:01:36 -0500
Received: by mail-il1-f195.google.com with SMTP id v15so2644398iln.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jan 2020 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3T3XW9ObtDvH41u0oiLPng2xqMLffjeMRdO/UO5hcQk=;
        b=jwusNk8HEBf+lYTXTSZF87RSARfaLlueWxX9AWHVr+fInNo8lx+kEnxvm10B3mp7hR
         vUmGtD4Nu51ZyA2PrM9jMUSuEnmAO4Cu1vlkmQ15MLVSLyTmGbrWYbzkbQIIP9LYuLX7
         MgmxJx31rM/0zu5f60oPXpCNtAVYWAMqzaE2mVSZrsO2F/gszaSGMFEx53EIKKvi1vWW
         9vdWkWnVCIO2vxYmdS4TTWk5UouMAR1ac887GoDD+dCRCVz/WCRW5m3w5/MUdPNuPBwf
         09jkEQck1tOIq8uiMTfsrXDhMC2gejddhzHIw8umyFvJgMLsR5mCD5D1/mcm64fHp9pk
         LBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3T3XW9ObtDvH41u0oiLPng2xqMLffjeMRdO/UO5hcQk=;
        b=GfQ7PYMOBf5K2NlDJ/uyYqWvkl1fnFlW7xW4Wy9iUTtFhSy4C/I4ZFKu+NJv7XqttB
         /d8ACDstXxN6Cg/w9rlODYZ24CGyTOGIZ4UqfZZB4KjVv2WHmDYXzAX7H6mFii4nbjHk
         Q6QynBhkLcGd++CTuxblV/I1kpXXgtcsX/Xv1B9ci/B3V+dFlNpvGQqsYGddYsSjV87u
         J/wmngBNwCMoVlaFcd86s92OPOg1ZOefn7qdn27detdOLGWNR+w5mqeOB3yDXvSZ4vzm
         HEIi3j0aqMRwP9thPoDFs0AV7Ij69Q0HTD6U+4mXQSn8XRtoepN8gUjAv+F9PgOqZ9wj
         qNKQ==
X-Gm-Message-State: APjAAAXxKBsb6cFJe1xy1oQmBl6rsdk4qsB9CNQLqkfvqgV3XJd90+aF
        +6BnPomxG40Kl9GzEBbVan64pG8Ag6YHmhWjK8RSnQ==
X-Google-Smtp-Source: APXvYqyLZKjrRp/IwFBeBXBlZTKic2w21A8Xn1g75ixmc/1tXdRf9Sgawmhq/Dpa/23MCm3mSMWjDmbH4maJ1mfiRZY=
X-Received: by 2002:a92:2907:: with SMTP id l7mr13319443ilg.140.1579798895648;
 Thu, 23 Jan 2020 09:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-8-bjorn.andersson@linaro.org> <20200110212806.GD11555@xps15>
 <20200122193936.GB3261042@ripper>
In-Reply-To: <20200122193936.GB3261042@ripper>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 23 Jan 2020 10:01:24 -0700
Message-ID: <CANLsYkx-C9U4W3R3Xo6t3BJBM4UK_i3zuwzhnXMMEQ0-ur+8Kg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] remoteproc: qcom: q6v5: Add common panic handler
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 22 Jan 2020 at 12:40, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 10 Jan 13:28 PST 2020, Mathieu Poirier wrote:
>
> > On Thu, Dec 26, 2019 at 09:32:14PM -0800, Bjorn Andersson wrote:
> > > Add a common panic handler that invokes a stop request and sleep enough
> > > to let the remoteproc flush it's caches etc in order to aid post mortem
> > > debugging.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >
> > > Changes since v1:
> > > - None
> > >
> > >  drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
> > >  drivers/remoteproc/qcom_q6v5.h |  1 +
> > >  2 files changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> > > index cb0f4a0be032..17167c980e02 100644
> > > --- a/drivers/remoteproc/qcom_q6v5.c
> > > +++ b/drivers/remoteproc/qcom_q6v5.c
> > > @@ -6,6 +6,7 @@
> > >   * Copyright (C) 2014 Sony Mobile Communications AB
> > >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> > >   */
> > > +#include <linux/delay.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/interrupt.h>
> > > @@ -15,6 +16,8 @@
> > >  #include <linux/remoteproc.h>
> > >  #include "qcom_q6v5.h"
> > >
> > > +#define Q6V5_PANIC_DELAY_MS        200
> > > +
> > >  /**
> > >   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
> > >   * @q6v5:  reference to qcom_q6v5 context to be reinitialized
> > > @@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
> > >  }
> > >  EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
> > >
> > > +/**
> > > + * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
> > > + * @q6v5:  reference to qcom_q6v5 context
> > > + *
> > > + * Set the stop bit and sleep in order to allow the remote processor to flush
> > > + * its caches etc for post mortem debugging.
> > > + */
> > > +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
> > > +{
> > > +   qcom_smem_state_update_bits(q6v5->state,
> > > +                               BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
> > > +
> > > +   mdelay(Q6V5_PANIC_DELAY_MS);
> >
> > I really wonder if the delay should be part of the remoteproc core and
> > configurable via device tree.  Wanting the remote processor to flush its caches
> > is likely something other vendors will want when dealing with a kernel panic.
> > It would be nice to see if other people have an opinion on this topic.  If not
> > then we can keep the delay here and move it to the core if need be.
> >
>
> I gave this some more thought and what we're trying to achieve is to
> signal the remote processors about the panic and then give them time to
> react, but per the proposal (and Qualcomm downstream iirc) we will do
> this for each remote processor, one by one.
>
> So in the typical case of a Qualcomm platform with 4-5 remoteprocs we'll
> end up giving the first one a whole second to react and the last one
> "only" 200ms.
>
> Moving the delay to the core by iterating over rproc_list calling
> panic() and then delaying would be cleaner imo.

I agree.

>
> It might be nice to make this configurable in DT, but I agree that it
> would be nice to hear from others if this would be useful.

I think the delay has to be configurable via DT if we move this to the
core.  The binding can be optional and default to 200ms if not
present.

>
> Regards,
> Bjorn
>
> > Thanks,
> > Mathieu
> >
> > > +}
> > > +EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
> > > +
> > >  /**
> > >   * qcom_q6v5_init() - initializer of the q6v5 common struct
> > >   * @q6v5:  handle to be initialized
> > > diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> > > index 7ac92c1e0f49..c37e6fd063e4 100644
> > > --- a/drivers/remoteproc/qcom_q6v5.h
> > > +++ b/drivers/remoteproc/qcom_q6v5.h
> > > @@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
> > >  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
> > >  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
> > >  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
> > > +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> > >
> > >  #endif
> > > --
> > > 2.24.0
> > >
