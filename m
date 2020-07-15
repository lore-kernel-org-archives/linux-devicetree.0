Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DE9C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 03:46:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53A8C207DD
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 03:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PA0lyJmm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgGODqT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 23:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbgGODqT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 23:46:19 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471CCC061755
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2020 20:46:19 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id o3so744641ilo.12
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2020 20:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TsOL0cHZgNHHXdS8EKSurkqDwkh4q7dcMdF14rSf6+4=;
        b=PA0lyJmmqv3z1yng5c+bbC+Fd2sF2bB+Z0yAb13o6k76rebaVXD1D3fb41re4Ihvq+
         hivlxR8HzDkiHGmh0l8EEY9XgRAXgoQEKAMqW+d1+qsPz3YGnYvKzC5wsCQDWpkMhiX8
         pQ/KWP1oW9UejrUN609DKt62AESXiboSQaStU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TsOL0cHZgNHHXdS8EKSurkqDwkh4q7dcMdF14rSf6+4=;
        b=foBSJjQPBqX/xaiS3hfO5jazWc9zWQEqp1zvOuG2qpLKKIoZxNRLtogvpapsgyXhh4
         leIEpvthx1gf5HFmMygv7knyEwiAoZk4OYdKrTxUZOLDRRmZy58h5z/E2pxar5i5bTTv
         LufXfmaeFiuP2f49B0kvWFX1N/JNoAkgzTVcmsLkPKHQjz5g1y3ijaad9d+XxN7xrHwV
         SrXQ0ELuvnfAXR4xwIHoQuozg6lyoh2x7QsuiaIZarlu734W2NZGXpin2SZUXBjKFe3V
         lTBxC5dZoqiu3UQ5jsM2PZlyLbRKUmp6NxzrpCGj7/NuLtZ1/4UkcTOqjZ2aPr7uD1dx
         GD7A==
X-Gm-Message-State: AOAM5317fEaWrZUk2trBHUZbwEyYN6Gn+5dO+KLk2viisvPAgFCSR92K
        LKujRg6Ah5uA0Zvil49z1kzFWg8sC0s=
X-Google-Smtp-Source: ABdhPJz3tXtDrXyumTvLW5p2AUuKml/XaLEJVIb+VDRBK5LTR9aqHbzcKZA16JYiW15IlVDnIWxehA==
X-Received: by 2002:a92:840b:: with SMTP id l11mr7801310ild.129.1594784777991;
        Tue, 14 Jul 2020 20:46:17 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id s11sm483764ili.79.2020.07.14.20.46.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 20:46:17 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id k6so776891ili.6
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2020 20:46:16 -0700 (PDT)
X-Received: by 2002:a92:a196:: with SMTP id b22mr7685147ill.303.1594784776244;
 Tue, 14 Jul 2020 20:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200713091211.2183368-1-tientzu@chromium.org>
 <20200713091211.2183368-2-tientzu@chromium.org> <4a2451f9-57d8-2e83-e1d6-f144f37173c0@arm.com>
 <20200714110141.GD16178@lst.de>
In-Reply-To: <20200714110141.GD16178@lst.de>
From:   Claire Chang <tientzu@chromium.org>
Date:   Wed, 15 Jul 2020 11:46:05 +0800
X-Gmail-Original-Message-ID: <CALiNf2-9b5LMjv+KCqFJ9oz2FocT6oQ1zVY_MBaFgNG1DQxZ=Q@mail.gmail.com>
Message-ID: <CALiNf2-9b5LMjv+KCqFJ9oz2FocT6oQ1zVY_MBaFgNG1DQxZ=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-mapping: Add bounced DMA ops
To:     Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>, frowand.list@gmail.com,
        m.szyprowski@samsung.com, treding@nvidia.com,
        Greg KH <gregkh@linuxfoundation.org>, saravanak@google.com,
        suzuki.poulose@arm.com, dan.j.williams@intel.com,
        heikki.krogerus@linux.intel.com, bgolaszewski@baylibre.com,
        devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org, tfiga@chromium.org,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 14, 2020 at 7:01 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jul 13, 2020 at 12:55:43PM +0100, Robin Murphy wrote:
> > On 2020-07-13 10:12, Claire Chang wrote:
> >> The bounced DMA ops provide an implementation of DMA ops that bounce
> >> streaming DMA in and out of a specially allocated region. Only the
> >> operations relevant to streaming DMA are supported.
> >
> > I think there are too many implicit assumptions here - apparently that
> > coherent allocations will always be intercepted by
> > dma_*_from_dev_coherent(), and that calling into dma-direct won't actually
> > bounce things a second time beyond where you thought they were going,
> > manage coherency for a different address, and make it all go subtly wrong.
> > Consider "swiotlb=force", for instance...
> >
> > Again, plumbing this straight into dma-direct so that SWIOTLB can simply
> > target a different buffer and always bounce regardless of masks would seem
> > a far better option.
>
> I haven't really had time to read through the details, but I agree that
> any bouncing scheme should reuse the swiotlb code and not invent a
> parallel infrastructure.
Thanks for the feedback. I'll try to reuse SWIOTLB.
