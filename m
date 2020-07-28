Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30EEC433EC
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 11:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83692206F5
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 11:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dKxVLScN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbgG1L72 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 07:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729305AbgG1L71 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 07:59:27 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ABBC0619D2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 04:59:26 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id e64so20384264iof.12
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tl/xK5nksFGek4I0hJhjtnSKtWmsm7mD8uEP3H8tAJc=;
        b=dKxVLScNmH+IxfLYOJHi2FyLa1HeUI2rsPJTmMupKBaQWimNey/qP3/d62lN/wRW/l
         eQ4lrfidDx/qDiuCsBs8jqw6PRXawqwMoVVC3s9ak2gMfUMN+L9SwWpIE/lgtTa/OWao
         ZE7kRtmQ9VEQjfKvpIUMjvlPOFlq1JqJQiEEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tl/xK5nksFGek4I0hJhjtnSKtWmsm7mD8uEP3H8tAJc=;
        b=KHxUqoeJPnNL1Lmiq3Vh2p1LSHpe/1LD6aX00qE/eclrInuB+nkgTvyf2cqu63FEvq
         d6Tl65UgscHvWdqW1CRt5CkWeIjXDiehQlixX0wWUbJdva9LNBPKlgD8ucvhL0SkBEWe
         N1uRlWzqo26/KehM9gmhYm7ZJ6lOiTjFgYbod3tJOzXdHfVaWlGFj0ste+QUIHK6/cIu
         hNkxgvY1jN9v+HJHVxBEDlZGZnL7Rr+BGr+G2YwqTyOYF3leK1QUNEJQHhSSS+FQSWwL
         +nbyuSKu7NAz4If+rvoAk2tbxDOMGTQf3jEOIlyn5Mf3YbjYfrM5wGZy6YU7NGNap/Qj
         9x4A==
X-Gm-Message-State: AOAM530xFRn4Ttk399aSkQ1pIxyVxJwdj0RVyPo7ykgbROUPGQ/i8iNI
        gqbcCEnFuNEz/+RzbqVN/qTBdSJVjvo=
X-Google-Smtp-Source: ABdhPJyJDFeQiKptaFRp+JdF+oc8rUDWts3NK922YVm4gr3OZ46ZbU4iKjxXTtbRi0ho6gj6V8yU2Q==
X-Received: by 2002:a6b:e009:: with SMTP id z9mr17986291iog.124.1595937565289;
        Tue, 28 Jul 2020 04:59:25 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id j81sm9008424iof.13.2020.07.28.04.59.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:59:24 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id w12so6804402iom.4
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 04:59:23 -0700 (PDT)
X-Received: by 2002:a02:6947:: with SMTP id e68mr17279172jac.3.1595937563294;
 Tue, 28 Jul 2020 04:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200728050140.996974-1-tientzu@chromium.org>
In-Reply-To: <20200728050140.996974-1-tientzu@chromium.org>
From:   Claire Chang <tientzu@chromium.org>
Date:   Tue, 28 Jul 2020 19:59:12 +0800
X-Gmail-Original-Message-ID: <CALiNf28XXGpJ=hV-S3dLyq1U18_trr4e4rr6OPr5W5DxHD9XcA@mail.gmail.com>
Message-ID: <CALiNf28XXGpJ=hV-S3dLyq1U18_trr4e4rr6OPr5W5DxHD9XcA@mail.gmail.com>
Subject: Re: [RFC v2 0/5] Restricted DMA
To:     Rob Herring <robh+dt@kernel.org>, frowand.list@gmail.com,
        Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com,
        Robin Murphy <robin.murphy@arm.com>
Cc:     treding@nvidia.com, Greg KH <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>, suzuki.poulose@arm.com,
        dan.j.williams@intel.com, heikki.krogerus@linux.intel.com,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Nicolas Boichat <drinkcat@chromium.org>, tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

It seems that I didn't rebase the patchset properly. There are some
build test errors.
Sorry about that. Please kindly ignore those rebase issues. I'll fix
them in the next version.


On Tue, Jul 28, 2020 at 1:01 PM Claire Chang <tientzu@chromium.org> wrote:
>
> This series implements mitigations for lack of DMA access control on
> systems without an IOMMU, which could result in the DMA accessing the
> system memory at unexpected times and/or unexpected addresses, possibly
> leading to data leakage or corruption.
>
> For example, we plan to use the PCI-e bus for Wi-Fi on one MTK platform and
> that PCI-e bus is not behind an IOMMU. As PCI-e, by design, gives the
> device full access to system memory, a vulnerability in the Wi-Fi firmware
> could easily escalate to a full system exploit (remote wifi exploits: [1a],
> [1b] that shows a full chain of exploits; [2], [3]).
>
> To mitigate the security concerns, we introduce restricted DMA. The
> restricted DMA is implemented by per-device swiotlb and coherent memory
> pools. The feature on its own provides a basic level of protection against
> the DMA overwriting buffer contents at unexpected times. However, to
> protect against general data leakage and system memory corruption, the
> system needs to provide a way to restrict the DMA to a predefined memory
> region (this is usually done at firmware level, e.g. in ATF on some ARM
> platforms).
>
> [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> [2] https://blade.tencent.com/en/advisories/qualpwn/
> [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
>
>
> Claire Chang (5):
>   swiotlb: Add io_tlb_mem struct
>   swiotlb: Add device swiotlb pool
>   swiotlb: Use device swiotlb pool if available
>   dt-bindings: of: Add plumbing for restricted DMA pool
>   of: Add plumbing for restricted DMA pool
>
>  .../reserved-memory/reserved-memory.txt       |  35 ++
>  drivers/iommu/intel/iommu.c                   |   8 +-
>  drivers/of/address.c                          |  39 ++
>  drivers/of/device.c                           |   3 +
>  drivers/of/of_private.h                       |   6 +
>  drivers/xen/swiotlb-xen.c                     |   4 +-
>  include/linux/device.h                        |   4 +
>  include/linux/dma-direct.h                    |   8 +-
>  include/linux/swiotlb.h                       |  49 +-
>  kernel/dma/direct.c                           |   8 +-
>  kernel/dma/swiotlb.c                          | 418 +++++++++++-------
>  11 files changed, 393 insertions(+), 189 deletions(-)
>
> --
> v1: https://lore.kernel.org/patchwork/cover/1271660/
> Changes in v2:
> - build on top of swiotlb
>
> 2.28.0.rc0.142.g3c755180ce-goog
>
