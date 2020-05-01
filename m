Return-Path: <SRS0=mas4=6P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7F7C47253
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 18:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E8D921974
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 18:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4V/eLGR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbgEASk2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 May 2020 14:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729990AbgEASk2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 May 2020 14:40:28 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78430C061A0E
        for <devicetree@vger.kernel.org>; Fri,  1 May 2020 11:40:28 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id z25so3233266otq.13
        for <devicetree@vger.kernel.org>; Fri, 01 May 2020 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K/pyc9ZSgvlCPxWaLAF7Dj+DR/uYkULUKmz0lI2apjM=;
        b=i4V/eLGRRDB/t5gS34y6x6FmiullhpKMPXQe+E4ih2swc8cRlFluseSUU+ZBlGBsVx
         61I7Slgf9kEu2+57x9aRxp2pbshiXeln7PzqLgZ8StlqgrETFcszmRQc2uLXVEMteQ6K
         WsYkV5FgsGL/gaiLMtLVGEpi+XxrbCiGTar5uBAafBCi4QpOfA9Ni7juUOMrqIhbSw7o
         dZS3eNr/bYB9rwBwJ2jIOGXujjaVcW3kUbQSmah72Fi3rxxcPKtEKdeb09cydPN0RUkH
         fI/cGT05sjeH8Cg+EjNafozZoyY1nh057jxvYMba1UKDryTI5OjZu/ptlgnjY6feBp+0
         805A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K/pyc9ZSgvlCPxWaLAF7Dj+DR/uYkULUKmz0lI2apjM=;
        b=hqavPbX8qKK0jxcMrMt1cdHP3CiaDmnLsIkhfW8qKq3NPsnbgWzOccjUv3ZXEjS8uv
         kaW08v94YScPGGrfK4QgmB5p91N7irthKd2vBwkINkOg7FFtv80AZ2a789AowB3eHELe
         q4xtazU+v28fJdLLPYLJuFAjb2GcykpnSHD68q5cITB/CzlBOEJ0iGBXy38GWpUaliFX
         RBjGqK0/CAsCvUHdC6KrRMN/lvZRGzKh6kj7uJ0B71Y/Yqu7dUtaeKFfw0D87ZX+yPqw
         yuMbnB9yuOOln2qBzH1qK4VB1VgXTxS9dtjfVzIBObJQm9XtarYDEutWuDjQ4hL3OuWE
         AHsw==
X-Gm-Message-State: AGi0PuZzSoEuTPGyhyjyLmglaNpoiycSVeSd8A5Z1WbxeC6fKvdjfqn9
        SgrMSGe9tnyqFxqvmMMFM/id+SPLfIRXUfV0ogWojg==
X-Google-Smtp-Source: APiQypL4ruHab7XImHLBHWXSGsuiDyI+02igUD+AFcOYMG/0olXknNi2MzN7TA4/gZzBZl34o0E6oBDOCG/6nNaBtVo=
X-Received: by 2002:a05:6830:1589:: with SMTP id i9mr4941206otr.102.1588358427674;
 Fri, 01 May 2020 11:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-2-john.stultz@linaro.org> <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 1 May 2020 11:40:16 -0700
Message-ID: <CALAqxLVScV1j-zxw=cwpE0+eDoaubchXx6SJgu=1Zvh8HnE-Tg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/4] devicetree: bindings: Add linux,cma-heap tag for
 reserved memory
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

On Fri, May 1, 2020 at 3:42 AM Brian Starkey <brian.starkey@arm.com> wrote:
>
> Hi,
>
> On Fri, May 01, 2020 at 07:39:46AM +0000, John Stultz wrote:
> > This patch adds a linux,cma-heap property for CMA reserved memory
> > regions, which will be used to allow the region to be exposed via
> > the DMA-BUF Heaps interface
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Andrew F. Davis" <afd@ti.com>
> > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > Cc: Liam Mark <lmark@codeaurora.org>
> > Cc: Pratik Patel <pratikp@codeaurora.org>
> > Cc: Laura Abbott <labbott@redhat.com>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: Chenbo Feng <fengc@google.com>
> > Cc: Alistair Strachan <astrachan@google.com>
> > Cc: Sandeep Patil <sspatil@google.com>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-mm@kvack.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  .../devicetree/bindings/reserved-memory/reserved-memory.txt    | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > index bac4afa3b197..e97b6a4c3bc0 100644
> > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > @@ -68,6 +68,9 @@ Linux implementation note:
> >  - If a "linux,cma-default" property is present, then Linux will use the
> >    region for the default pool of the contiguous memory allocator.
> >
> > +- If a "linux,cma-heap" property is present, then Linux will expose the
> > +  the CMA region via the DMA-BUF Heaps interface.
> > +
>
> Would it be useful or even possible to give some indication of what
> the heap will end up being called? I'm afraid I don't remember what if
> any conclusions came out of previous discussions on UAPI for heap
> enumeration.

So the name we expose is the CMA name itself. So with dt it will be
the name of the reserved memory node that the flag property is added
to.

> I suppose CMA names haven't been relevant to userspace before, but
> they perhaps would be with this change.
>
> Alternatively, leaving it effectively undefined doesn't tie us down,
> and something like links in sysfs can be added as a richer API in the
> future.

Hrm. Mind expanding on what you're thinking here?

thanks
-john
