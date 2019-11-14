Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766AEC43141
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 10:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52FA02070E
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 10:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hvzFvQO7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKNKxj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 05:53:39 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:35373 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbfKNKxj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 05:53:39 -0500
Received: by mail-io1-f67.google.com with SMTP id x21so6312306ior.2
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 02:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kc1/vTjFDnJ6RXRT1JfBA3hLPFiKVT3unzuRtbwelRQ=;
        b=hvzFvQO7iwFtVGzpjj/Maiqd069dCHHQRZr66u+oC+RQ1n+onzGFN2lFQyU7+ki5Nt
         X3c3lwpx/09gSFw9oZsytsBMgFMLyLarOOpIMbLhDHkbmObM/6ddkY6niO8e8pzoCygg
         W1A2GlQSLF6PLnckXx2TGtGPdwFGkV1r33rkH0iS+Uaz+oaA7VOiSv/Il/7bUKFTm4lQ
         zlPQAs4GXxa+7MuK+3lU09La6r2BEWna8dDKT+hvmDm9LbPT8b/fRUFwyDs6meFARJTr
         2ZTknw4Rw8HFpc2I50vVO08psCbJDF4v3rIgHWmmPQaJgB+3u/wElMqGnLfiUdpaUaIQ
         4eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kc1/vTjFDnJ6RXRT1JfBA3hLPFiKVT3unzuRtbwelRQ=;
        b=UshFplPRFl/jETjAX43Xqm6GFOonthssFOklnMaRNlNeRuLceNvm0NkPOMwaGxk+Ru
         f2Whv8J5v8S/1cyyyrDOwSO5ZlOAehMVoQDYjxd8ymwo+V8bVbt4kWezfhuxBHkAsdhi
         wbjjMnnM4eNDgzjOhgFehiG4c7YweshZ4cOQbqZY+nC8ow4gAszUuvomKiX50Ba0Awe/
         JRx/9YWX+Sx0KcQKh5YDGwd39Fx/lqUhZEetwOzolLektyEyj16fDFrqaGaJF0xCt9Wk
         1ACdSmN1j3Onnix8nUfTdJblP5XaUqdhdqObnPJrH/dYXZUKv4+I15y11pQl/+Ru5fSK
         wg4g==
X-Gm-Message-State: APjAAAXap35GSZwhutrsQBe8cNS3eRCQZtewjnGVCWNSd/FBLRkAyEBM
        WZULdPtgH20BP9t3rEOWuAwU1rIXAt+7MF63jhKBnw==
X-Google-Smtp-Source: APXvYqwAEZUqjQiKuLs/wQ808KcqyDjY/QSLEFXpvnVRqBTItldaB74gt5LHaetoQeAUw00tv7D7uTNxdb8HFM/8Dxk=
X-Received: by 2002:a6b:5f0e:: with SMTP id t14mr8298204iob.228.1573728818553;
 Thu, 14 Nov 2019 02:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20191107084955.7580-1-green.wan@sifive.com> <20191114071551.GQ952516@vkoul-mobl>
In-Reply-To: <20191114071551.GQ952516@vkoul-mobl>
From:   Green Wan <green.wan@sifive.com>
Date:   Thu, 14 Nov 2019 18:53:28 +0800
Message-ID: <CAJivOr6=7+vYUe1tmgEkOAbtoT6=0-6zzTGzfamycjHqqneWRw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] dmaengine: sf-pdma: Add platform dma driver
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Dan Williams <dan.j.williams@intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Bin Meng <bmeng.cn@gmail.com>,
        Yash Shah <yash.shah@sifive.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Thanks, Vinod,

I found there are "/**" in the beginning of files but not for
commenting function purpose. Those comments cause kernel-doc W=1
warning. I've fixed them and rebased to latest source. will send the
patch after running regression tests soon.

--
Green

On Thu, Nov 14, 2019 at 3:15 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 07-11-19, 16:49, Green Wan wrote:
> > Add PDMA driver support for SiFive HiFive Unleashed RevA00 board. Mainly follows
> > DMAengine controller doc[1] to implement and take other DMA drivers as reference.
> > Such as
> >
> >   - drivers/dma/fsl-edma.c
> >   - drivers/dma/dw-edma/
> >   - drivers/dma/pxa-dma.c
> >
> > Using DMA test client[2] to test. Detailed datasheet is doc[3]. Driver supports:
> >
> >  - 4 physical DMA channels, share same DONE and error interrupt handler.
> >  - Support MEM_TO_MEM
> >  - Tested by DMA test client
> >  - patches include DT Bindgins document and dts for fu450-c000 SoC. Separate dts
> >    patch for easier review and apply to different branch or SoC platform.
> >  - retry 1 time if DMA error occurs.
>
> I have applied this expect dt change. I see some warns due to missing
> kernel-doc style comments with W=1, please fix that and send update on
> top of these
>
> Thanks
> --
> ~Vinod
