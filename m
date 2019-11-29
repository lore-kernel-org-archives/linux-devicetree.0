Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87238C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 13:01:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DF1B217AB
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 13:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="An+4zXCF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfK2NBu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 08:01:50 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38415 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfK2NBt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 08:01:49 -0500
Received: by mail-qt1-f195.google.com with SMTP id 14so32395330qtf.5
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xn54XTvcNkal14NNHB7+Vzm9BZs6YXQQ3RAQ8lYr/oc=;
        b=An+4zXCFdte8eMvcqUEG3vfTxzYHLztNUyO+dIju42gILkNWJLODGcoxqgrQR7mqsl
         OfYl8RSMNw0xmz5Bgz11IFl+yVb5ur2ssG+rt2UWWkK3GXNcN5i0+6XzLBwaYkxROqrK
         hf05akothfHLjS+dc3IJ2nmpGRpB4rtw7hvhHxMw/wuCu0I+T8j69hAB5WrJ0UhCECxf
         RMt3xTOTWuVlOuPignDWsj0EBINdiInOto4yDYiZ/CqeuULQuwnS4TQ7ua9n3EYQ1Opt
         cF4tfnfdW0s1OqfNGbRi1bC6J2MgQcaHGhBWzpy10bkEgFRVncoZ+2BQibA0Id+qjfm/
         kEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xn54XTvcNkal14NNHB7+Vzm9BZs6YXQQ3RAQ8lYr/oc=;
        b=PgbjL9jLAW1Aaye6zuP5VSiM4fAhWe9Jxes7LnmL/cPlW+zNi61hwcxxcLtm2kAOwI
         w6chQZP6fQRr2uqq3RhLX0f//1hwiuvWQBBHnAG5FfDvrOXHa3jw64rFUL3PDp9x7MJG
         cECOLsPkza/SC+aWdirszYiS1TltAbEJs03GIfygw/LgBtS4UGR5Zw8LBv284DWJbJnq
         v9TxvWwJwe5vShpxjWNwWTINsS3UJTkerYMuHyop+FTr2dyq24lb1+7GC4B0fuoh3M4b
         q85V9+5+VgZozJVlpFXu6AF17rRGKIDtftWexybZm5BaqTnzIp58xfn6859O+tBdLk+y
         8iHg==
X-Gm-Message-State: APjAAAWANCnZFNbzif9VJ3iDseahhm5lcrF4RobbwXEvtd4a1Jr2Lvhl
        sIrY6JINglXpbd8THAEYFEBiHX+0sXNHDGauhy31cQ==
X-Google-Smtp-Source: APXvYqxnCMUzN7K5F96FwviGs9debEPUho46vDAcIfSuTnPxYu+XchM5mkJV2q7pXMOhaWj2Um8cNDKqRVhiHyGh8zE=
X-Received: by 2002:ac8:41c3:: with SMTP id o3mr35156316qtm.88.1575032508294;
 Fri, 29 Nov 2019 05:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-5-mike.leach@linaro.org>
 <ce6d3334-2baf-0528-33a1-0157a8ad0c57@arm.com>
In-Reply-To: <ce6d3334-2baf-0528-33a1-0157a8ad0c57@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 29 Nov 2019 13:01:37 +0000
Message-ID: <CAJ9a7Vj0fL4bkA+k-ip-NBwJ4nU3B+sCmPQZH1j9PdXnR66Veg@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] coresight: cti: Add sysfs trigger / channel
 programming API
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


On Wed, 27 Nov 2019 at 18:40, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > Adds a user API to allow programming of CTI by trigger ID and
> > channel number. This will take the channel and trigger ID supplied
> > by the user and program the appropriate register values.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
>
> > +
> > +static ssize_t chan_xtrigs_view_show(struct device *dev,
> > +                                  struct device_attribute *attr,
> > +                                  char *buf)
> > +{
> > +     struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +     struct cti_config *cfg = &drvdata->config;
> > +     int used = 0, reg_idx;
> > +     int buf_sz = PAGE_SIZE;
> > +     u32 chan_mask = BIT(cfg->xtrig_rchan_sel);
> > +
> > +     used += scnprintf(buf, buf_sz, "[%d] IN: ", cfg->xtrig_rchan_sel);
> > +     for (reg_idx = 0;
> > +          reg_idx < drvdata->config.nr_trig_max;
> > +          reg_idx++) {
> > +             if (chan_mask & cfg->ctiinen[reg_idx]) {
> > +                     used += scnprintf(buf + used, buf_sz - used, "%d ",
> > +                                       reg_idx);
> > +             }
> > +     }
>
> As a security measure, we must make sure that we have space left in the
> buffer. We could end up passing "negative" numbers for the size
> argument, in the worst case.
>

The return value from scnprintf() is always the _actual_ number of
characters added to the buffer, not as per snprintf() which returns
the number that could have been printed if there were sufficient
space.
Thus used can never exceed the buffer size.

Regards

Mike


> > +
> > +     used += scnprintf(buf + used, buf_sz - used, "OUT: ");
> > +     for (reg_idx = 0;
> > +          reg_idx < drvdata->config.nr_trig_max;
> > +          reg_idx++) {
> > +             if (chan_mask & cfg->ctiouten[reg_idx]) {
> > +                     used += scnprintf(buf + used, buf_sz - used, "%d ",
> > +                                       reg_idx);
> > +             }
> > +     }
> > +     used += scnprintf(buf + used, buf_sz - used, "\n");
> > +     return used;
> > +}
> > +static DEVICE_ATTR_RW(chan_xtrigs_view);
>
>
> The rest looks fine to me.
>
> Suzuki



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
