Return-Path: <SRS0=7/vk=HA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:45732 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750780AbeDKEUs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Apr 2018 00:20:48 -0400
Received: by mail-ua0-f196.google.com with SMTP id j18so299700uae.12
        for <devicetree@vger.kernel.org>; Tue, 10 Apr 2018 21:20:48 -0700 (PDT)
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com. [209.85.217.169])
        by smtp.gmail.com with ESMTPSA id b125sm129982vkd.39.2018.04.10.21.20.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 21:20:46 -0700 (PDT)
Received: by mail-ua0-f169.google.com with SMTP id q26so308528uab.0
        for <devicetree@vger.kernel.org>; Tue, 10 Apr 2018 21:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <1521219926-15329-1-git-send-email-andy.yeh@intel.com>
 <1521219926-15329-3-git-send-email-andy.yeh@intel.com> <20180320102817.GB5372@w540>
 <8E0971CCB6EA9D41AF58191A2D3978B61D5681E4@PGSMSX111.gar.corp.intel.com>
In-Reply-To: <8E0971CCB6EA9D41AF58191A2D3978B61D5681E4@PGSMSX111.gar.corp.intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 11 Apr 2018 04:20:35 +0000
Message-ID: <CAAFQd5DZCN2f=dpaAbWGRb70zPXY3_Hc1g8ecmRcp1ty6yQDSg@mail.gmail.com>
Subject: Re: RESEND[PATCH v6 2/2] media: dw9807: Add dw9807 vcm driver
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: "Yeh, Andy" <andy.yeh@intel.com>
Cc: jacopo@jmondi.org, Alan Chiang <alanx.chiang@intel.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Andy,

On Wed, Apr 11, 2018 at 12:54 AM Yeh, Andy <andy.yeh@intel.com> wrote:

> Hi Jacopo,

> Excuse for late reply, we were busy in past weeks for major milestone.
Please kindly check the revised V7 which has been uploaded.
> https://patchwork.linuxtv.org/patch/48589/

> Responded to your comments as below.

> Cc in Tomasz for unintentionally missed.

> Regards, Andy
[snip]
> > +static int dw9807_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh
> > +*fh) {
> > +     int rval;
> > +
> > +     rval = pm_runtime_get_sync(sd->dev);
> > +     if (rval < 0) {
> > +             pm_runtime_put_noidle(sd->dev);

> > If you fail to get pm context, no need to put it back (I presume)

> According to Sakari Ailus's comment on LinuxTV.
> (pm_runtime_get() must be followed by pm_runtime_put() whether the former
> succeeds or not.)
> So it is no need to modify.

Andy is right. pm_runtime_get() always acquires a PM runtime count, even in
case of error.

[snip]
> > +static const struct of_device_id dw9807_of_table[] = {
> > +     { .compatible = "dongwoon,dw9807" },
> > +     { { 0 } }

> > { } is enough.
> According to Sakari Ailus's comment on LinuxTV.
> { } is GCC specific while { { 0 } } isn't.
> And if I remove it, compile error will occur.

Hmm, we're in the heavy nitpicking territory here, but

{ },

is the typical pattern used throughout the kernel. I personally actually
put a comment inside:

{ /* sentinel */ },

Just my opinion. I'm fine with keeping it either way, if no need to re-spin
for other changes.

Best regards,
Tomasz
