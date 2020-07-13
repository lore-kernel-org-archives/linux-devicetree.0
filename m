Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EB0C433E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 00:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E04F2072D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 00:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KB727iWE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgGMAig (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Jul 2020 20:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgGMAig (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Jul 2020 20:38:36 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4003C061794
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 17:38:35 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id d11so3252445vsq.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 17:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g0AyRgeo4BEr9j6w4Przg7qSFRU4h688XiJcnxouhyk=;
        b=KB727iWE6w5PGxDvHa2wMRrbthwrun9FRgyTC4B4X7EbxLxG6FdFeC67YzVOR4lsHJ
         zyacQjO2mMSGubdbACm0TfaMStvb+6H3WogGdpeeIJm1xd8Iw2CS0a0Ob1BjenJom+xI
         dcKKYQB/EsxLk/eyTmJPjelq7Zl1iRYhjVfw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g0AyRgeo4BEr9j6w4Przg7qSFRU4h688XiJcnxouhyk=;
        b=UAizrpDbJLzXujNz3SxeVZGZZG1HXH8gQntW7Aif5L2M9yUHOxy6iOgl5BbpmpjqZw
         6niWevX1vYazS9VmBmblRwKBr+fFVAxfXpex9pLvETjNBZN2yAK0GA1bqShSXq6e69nc
         UFEStbcUd60zBYoUCoghgzlBh5Vgw7UvsKras4yrBTv6kLvZZtsXlAdI+yiHxoq6o4gh
         s/EQeYxUNVvFmzzPRZavm11VZlLesNC68sTIjNuw0bEwyDtX7043DTDWcWOf+Ni3+zkl
         rAsIH528gE5oO08MrkSl466ieJJQLkpy6/PRiFyaFbkCmlkmHWDE62ti2tKxHX7gNDdE
         FwWQ==
X-Gm-Message-State: AOAM530TdaB5dwhfB4lDwwaC3H+twV6TcPQhT7wx8PgJ4SQ7LpsC52su
        H+JfTAauaxJJVmbLf4c0YrsAvUCZkZyiSV0wu2jyVw==
X-Google-Smtp-Source: ABdhPJyT1J4v4BmuydEm21M0iODeO7rG9nBCEHI+CqgAFKtghpRKBPQRwE/iexbiZAAoAgeSe+cmOhjfU0b5xXQV/no=
X-Received: by 2002:a67:f5c6:: with SMTP id t6mr13334091vso.14.1594600715022;
 Sun, 12 Jul 2020 17:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200711064846.16007-1-yong.wu@mediatek.com> <20200711064846.16007-7-yong.wu@mediatek.com>
In-Reply-To: <20200711064846.16007-7-yong.wu@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 13 Jul 2020 08:38:24 +0800
Message-ID: <CANMq1KAhFCWfywV=OiHgW00pof8K8TdwC6Hzgyj=QWSiWBf1ag@mail.gmail.com>
Subject: Re: [PATCH 06/21] iommu/io-pgtable-arm-v7s: Use ias to check the
 valid iova in unmap
To:     Yong Wu <yong.wu@mediatek.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Tomasz Figa <tfiga@google.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
        anan.sun@mediatek.com, cui.zhang@mediatek.com,
        chao.hao@mediatek.com, ming-fan.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jul 11, 2020 at 2:50 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> As title.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 4272fe4e17f4..01f2a8876808 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -717,7 +717,7 @@ static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>  {
>         struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
>
> -       if (WARN_ON(upper_32_bits(iova)))
> +       if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))

This is a little odd as iova is unsigned long and 1ULL is unsigned long long.

Would it be better to keep the spirit of the previous test and do
something like:
 if (WARN_ON(iova >> data->iop.cfg.ias)) ?

>                 return 0;
>
>         return __arm_v7s_unmap(data, gather, iova, size, 1, data->pgd);
> --
> 2.18.0
