Return-Path: <SRS0=SgxY=BN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4E4C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 14:33:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36455206D4
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 14:33:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G901bH1u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgHCOdT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 10:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbgHCOdS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 10:33:18 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5D6C06174A
        for <devicetree@vger.kernel.org>; Mon,  3 Aug 2020 07:33:18 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id b14so33566460qkn.4
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2020 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qBYoXUErLdg1XxwofpDGcU6L+k/lh9jilEvaXMRcAXc=;
        b=G901bH1uartSYnMZf8E4nRq9+71hJJZGAK3/aI2Rg1yPpayiz5rCEYt/3cGtWR/r6v
         asX3fM23eTN7nHbcTHCug9Y70kr7oBZi+7gsEjvZkMLZEh0wwKbP0Z7Dl7skRtGE/PT5
         2fuf5ePHkxBk1tIAiC0Um/3dzIIFYrLJlXmjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBYoXUErLdg1XxwofpDGcU6L+k/lh9jilEvaXMRcAXc=;
        b=mdPEsnbFGT58N2u9UMR9cRnVp0JQhZ69p67xQ+iYqfpHMiwOeCaRtBXz+9y1ZgoLGg
         UizBKdTxk3qQXWh8qVzCPqcQSB/S+jTh0dcgzp2rrU9ykg47edev4vIcNBcMEYFX1sqL
         uo61bHnNVLnz2tPh64R8PeHlc95Nz2j6CynA83xcvkouveDwuk9qOKVqI/Y+st5P02dm
         MTysFobymy2j3zff6iBXRbQV6LLpEQW15+QA2kIXfI48MoZ8VemOKU5LSEFytG/eawBL
         TsJpRmKVyDjx+fFBDI7/F4wSA1Vna5UT4nVHxhAgXW2mcOCjOp8RR9Bkr0UWtyJs5X+q
         QI3Q==
X-Gm-Message-State: AOAM532NdYoPPiqeiM1qPQO7pX1USi5bXe4qeRVnIvnBES7I9+QkXLMx
        1iDjM7TKlcoEb84mUhYx1CdSJXDhFfY=
X-Google-Smtp-Source: ABdhPJxoxLPjs8j2h/aBw/rScMtrWfS4dBUTNDnYvrknanNQ9MlJMPvELknKZF5e2gnJvQH7AzgHsg==
X-Received: by 2002:a05:620a:9d0:: with SMTP id y16mr16824265qky.353.1596465197405;
        Mon, 03 Aug 2020 07:33:17 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id w32sm21472677qtw.66.2020.08.03.07.33.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 07:33:17 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id 77so2977185qkm.5
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2020 07:33:17 -0700 (PDT)
X-Received: by 2002:a05:6638:305:: with SMTP id w5mr21375421jap.10.1596464812761;
 Mon, 03 Aug 2020 07:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200728050140.996974-1-tientzu@chromium.org> <20200728050140.996974-5-tientzu@chromium.org>
 <20200731205804.GB756942@bogus>
In-Reply-To: <20200731205804.GB756942@bogus>
From:   Claire Chang <tientzu@chromium.org>
Date:   Mon, 3 Aug 2020 22:26:41 +0800
X-Gmail-Original-Message-ID: <CALiNf2-BGQ+8Lm6A61oM6v+6N1zRTJYvod7LQLsCmK-ADsrMaw@mail.gmail.com>
Message-ID: <CALiNf2-BGQ+8Lm6A61oM6v+6N1zRTJYvod7LQLsCmK-ADsrMaw@mail.gmail.com>
Subject: Re: [RFC v2 4/5] dt-bindings: of: Add plumbing for restricted DMA pool
To:     Rob Herring <robh@kernel.org>
Cc:     frowand.list@gmail.com, Christoph Hellwig <hch@lst.de>,
        m.szyprowski@samsung.com, Robin Murphy <robin.murphy@arm.com>,
        treding@nvidia.com, Greg KH <gregkh@linuxfoundation.org>,
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

On Sat, Aug 1, 2020 at 4:58 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 28, 2020 at 01:01:39PM +0800, Claire Chang wrote:
> > Introduce the new compatible string, device-swiotlb-pool, for restricted
> > DMA. One can specify the address and length of the device swiotlb memory
> > region by device-swiotlb-pool in the device tree.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >  .../reserved-memory/reserved-memory.txt       | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > index 4dd20de6977f..78850896e1d0 100644
> > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > @@ -51,6 +51,24 @@ compatible (optional) - standard definition
> >            used as a shared pool of DMA buffers for a set of devices. It can
> >            be used by an operating system to instantiate the necessary pool
> >            management subsystem if necessary.
> > +        - device-swiotlb-pool: This indicates a region of memory meant to be
>
> swiotlb is a Linux thing. The binding should be independent.
Got it. Thanks for pointing this out.

>
> > +          used as a pool of device swiotlb buffers for a given device. When
> > +          using this, the no-map and reusable properties must not be set, so the
> > +          operating system can create a virtual mapping that will be used for
> > +          synchronization. Also, there must be a restricted-dma property in the
> > +          device node to specify the indexes of reserved-memory nodes. One can
> > +          specify two reserved-memory nodes in the device tree. One with
> > +          shared-dma-pool to handle the coherent DMA buffer allocation, and
> > +          another one with device-swiotlb-pool for regular DMA to/from system
> > +          memory, which would be subject to bouncing. The main purpose for
> > +          restricted DMA is to mitigate the lack of DMA access control on
> > +          systems without an IOMMU, which could result in the DMA accessing the
> > +          system memory at unexpected times and/or unexpected addresses,
> > +          possibly leading to data leakage or corruption. The feature on its own
> > +          provides a basic level of protection against the DMA overwriting buffer
> > +          contents at unexpected times. However, to protect against general data
> > +          leakage and system memory corruption, the system needs to provide a
> > +          way to restrict the DMA to a predefined memory region.
>
> I'm pretty sure we already support per device carveouts and I don't
> understand how this is different.
We use this to bounce streaming DMA in and out of a specially allocated region.
I'll try to merge this with the existing one (i.e., shared-dma-pool)
to see if that
makes things clearer.

>
> What is the last sentence supposed to imply? You need an IOMMU?
The main purpose is to mitigate the lack of DMA access control on
systems without an IOMMU.
For example, we plan to use this plus a MPU for our PCIe WiFi which is
not behind an IOMMU.

>
> >          - vendor specific string in the form <vendor>,[<device>-]<usage>
> >  no-map (optional) - empty property
> >      - Indicates the operating system must not create a virtual mapping
> > @@ -117,6 +135,16 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> >                       compatible = "acme,multimedia-memory";
> >                       reg = <0x77000000 0x4000000>;
> >               };
> > +
> > +             wifi_coherent_mem_region: wifi_coherent_mem_region {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x50000000 0x400000>;
> > +             };
> > +
> > +             wifi_device_swiotlb_region: wifi_device_swiotlb_region {
> > +                     compatible = "device-swiotlb-pool";
> > +                     reg = <0x50400000 0x4000000>;
> > +             };
> >       };
> >
> >       /* ... */
> > @@ -135,4 +163,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> >               memory-region = <&multimedia_reserved>;
> >               /* ... */
> >       };
> > +
> > +     pcie_wifi: pcie_wifi@0,0 {
> > +             memory-region = <&wifi_coherent_mem_region>,
> > +                      <&wifi_device_swiotlb_region>;
> > +             restricted-dma = <0>, <1>;
> > +             /* ... */
> > +     };
> >  };
> > --
> > 2.28.0.rc0.142.g3c755180ce-goog
> >
