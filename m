Return-Path: <SRS0=mas4=6P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB66C47253
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 18:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CAA12192A
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 18:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sqk3ZNvO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbgEASmm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 May 2020 14:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729721AbgEASml (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 May 2020 14:42:41 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5B4C061A0E
        for <devicetree@vger.kernel.org>; Fri,  1 May 2020 11:42:40 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id j4so3262957otr.11
        for <devicetree@vger.kernel.org>; Fri, 01 May 2020 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yq7Ibs47iQ7Lo5VGMp7gRZ6yUxyqVA2i9kts0jwiLrg=;
        b=Sqk3ZNvO90q24WbyfeYjeqHXxER0SZRc5xSI5RM5Nuv9B3ZrYEi33jQuT1hGlipWhW
         hvfe10Z7MjuWVqIgFIGCh1vX61lDdIWshuPxlhpxYvSGgIykaDH4wYq9CcG9PYvJCxnG
         Qod+n3wh9PZsgmkcNsHVm4KLG8FyyBIFO8o+o+M0pbZrNFM0eWtfAF6okflgipvcQ1k0
         ZpKOab+w3go1VnlFI2C/NWHJFgBePuy+8oTNmaHzdoaXKkj+5vcaptuIxg4ethg4nCCg
         oe12HiqThde5msD1xr4IG5FgmGjSqY+lbxjSPwdLZoqN9ONczywqxt+3yssPl4cyaexa
         9RFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yq7Ibs47iQ7Lo5VGMp7gRZ6yUxyqVA2i9kts0jwiLrg=;
        b=NbFDQHbkBGNcd1vu68gTn13WyX8tG2vZemEP+FHwESuSaPejNdQ5PCDC6DR4V0A/m4
         RbKHcyhsT6odz7np9jqpRoU+5Nn8+caqvdt4c1P4MO7xBZFaeioUZ4117QtV6tgLqcFn
         HfFw5BFXR+RRuBRxJbhLdrbrQhrZ5+1e1bZzyWCtQe8CPKhQykuDIHzGHsFrbCaRh58Z
         Gr1FhECdZYgfrvyOtskOq1grLo5A2PpTwPtfpWP/4WYJmgy5c+kQTjBUL8OWeinfyngs
         10Dqk7Ee6ovya6DOZ5tNNytJW2Yb/KjwjOhCcGG6k2/HxkSLKTShQQV8sKl1MwzSHvRu
         60bA==
X-Gm-Message-State: AGi0Pubbf8iQ4UpFn8B+DZVC+GCCnMXShPYjzjVeHP6RaAmrtXKBSooW
        dsk4ggiZ4FyM9XEA0WGA18tvrkIuFh8+12E1ebQ4qA==
X-Google-Smtp-Source: APiQypL+VkyGnMilOhi+kaL79AKLY56zEToU7HIKl+3eFaVpJsUVoYecvtEHrqDQsSqZiNr1DTrBBFivrPw2tyNZtok=
X-Received: by 2002:a05:6830:1589:: with SMTP id i9mr4948265otr.102.1588358559590;
 Fri, 01 May 2020 11:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-3-john.stultz@linaro.org> <20200501104810.v6oa2yhawr4iki67@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200501104810.v6oa2yhawr4iki67@DESKTOP-E1NTVVP.localdomain>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 1 May 2020 11:42:28 -0700
Message-ID: <CALAqxLVt0HJH5_2BvO7fRGZ_Vp9kKzj+j2=BZu_cbw=75dNoYQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/4] mm: cma: Add dma_heap flag to cma structure
To:     Brian Starkey <brian.starkey@arm.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F. Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Chenbo Feng <fengc@google.com>,
        Alistair Strachan <astrachan@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-mm <linux-mm@kvack.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 1, 2020 at 3:48 AM Brian Starkey <brian.starkey@arm.com> wrote:
> On Fri, May 01, 2020 at 07:39:47AM +0000, John Stultz wrote:
> > +bool cma_dma_heap_enabled(struct cma *cma)
> > +{
> > +     return !!cma->dma_heap;
>
> Stylistic thing, but I don't think the !! is really necessary. It's
> already a bool anyway.

Yea, I was using a bit field earlier and then moved to a bool for
simplicity and left this. I saw it as soon as I sent the patch, so
it's already fixed up.

> > @@ -157,6 +167,7 @@ static int __init cma_init_reserved_areas(void)
> >  }
> >  core_initcall(cma_init_reserved_areas);
> >
> > +
>
> nit: spurious newline

Yep. Same. The things you only see once the mail is sent. :)

Thanks so much for the review though!
-john
