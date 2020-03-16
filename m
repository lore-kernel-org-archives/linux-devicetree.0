Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F454C18E5B
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 15:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0544620663
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 15:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="l7CAvx/c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731721AbgCPPHY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 11:07:24 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:46587 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731636AbgCPPHY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 11:07:24 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 02GF7BN2019505
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 00:07:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02GF7BN2019505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584371232;
        bh=Rw7FkoGoAr5+lj/fVdrKHLBKuXz3aq8uOxZajjwfLLY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=l7CAvx/cw+RVhDXoI99jRcJ8KFpNDVyEnrwx0fVPkqZt668YTTBEtNmbGrxyjVt9l
         cec0qAHjdnpZ2STJIhd1SDEm1cuFHAIkjhfEBIYpZ+qXggIg2H3Q+2H2zYT9kAqNRw
         RQeSSdz4iQaJZbycLBs37uTtWGc2kCG7gsUY7Vi88tyeZ4jD9GSdugaNKFI2QWy5tk
         cGilP+crfLty+nxjUFkZPsA1pxmgXLBZeT1lL98otBBgiycaegfU5Oseh4jzrKQFc1
         3xIeI1Mab2uCYHOrD8IFe4LGX8qZePQI6VR9ND828Mtv7ekfaqYBIpfUTcZMSQcqvP
         5XQP5oN0JJnhQ==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id g25so3539241vkl.2
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 08:07:12 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2VvAwPYX6iJLb5R8DFUdjwY6fJwLIUiBuJ0s4ZQFtf0taAUolR
        hcW/nFvbFpGF6mrTL47KilbQE99fD6MZN6xqHMk=
X-Google-Smtp-Source: ADFU+vvt4JvEKoc2fiG1QZUGkCfGZdrNf7msR8JwP3bm9Zl48bXtXmtuXQ4zo1fMNGt6GPj09x1shsb0dz2vw7Ad/c8=
X-Received: by 2002:a1f:2f4c:: with SMTP id v73mr402146vkv.12.1584371230992;
 Mon, 16 Mar 2020 08:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 17 Mar 2020 00:06:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQJ9aUD+SEnWwsJYAh3GPKWJzH6_SQnEvP662iLNGMrdA@mail.gmail.com>
Message-ID: <CAK7LNAQJ9aUD+SEnWwsJYAh3GPKWJzH6_SQnEvP662iLNGMrdA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add devicetree features and fixes for UniPhier SoCs
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> This series adds new features that includes XDMAC for each SoC,
> USB controller for Pro5, SPI for PXs3-ref, and thermal zone for PXs3.
>
> And more, this adds ethernet aliases to determine device name assignments
> and fixes for SCSSI clock/reset IDs and stabilization for ethernet.
>
> Kunihiko Hayashi (10):
>   ARM: dts: uniphier: Add XDMAC node
>   arm64: dts: uniphier: Add XDMAC node
>   ARM: dts: uniphier: Add USB3 controller nodes for Pro5
>   arm64: dts: uniphier: Enable spi node for PXs3 reference board
>   arm64: dts: uniphier: Add nodes of thermal monitor and thermal zone
>     for PXs3
>   ARM: dts: uniphier: Add ethernet aliases
>   arm64: dts: uniphier: Add ethernet aliases
>   ARM: dts: uniphier: Set SCSSI clock and reset IDs for each channel
>   arm64: dts: uniphier: Set SCSSI clock and reset IDs for each channel
>   arm64: dts: uniphier: Stabilize Ethernet RGMII mode of LD20 global and
>     PXs3 ref board


I applied 3, 4, 5, 8, 9.

Thanks.




>  arch/arm/boot/dts/uniphier-ld6b-ref.dts            |   1 +
>  arch/arm/boot/dts/uniphier-pro4-ace.dts            |   1 +
>  arch/arm/boot/dts/uniphier-pro4-ref.dts            |   1 +
>  arch/arm/boot/dts/uniphier-pro4-sanji.dts          |   1 +
>  arch/arm/boot/dts/uniphier-pro4.dtsi               |   8 ++
>  arch/arm/boot/dts/uniphier-pro5.dtsi               | 160 ++++++++++++++++++++-
>  arch/arm/boot/dts/uniphier-pxs2-gentil.dts         |   1 +
>  arch/arm/boot/dts/uniphier-pxs2-vodka.dts          |   1 +
>  arch/arm/boot/dts/uniphier-pxs2.dtsi               |  12 +-
>  .../boot/dts/socionext/uniphier-ld11-global.dts    |   1 +
>  .../arm64/boot/dts/socionext/uniphier-ld11-ref.dts |   1 +
>  arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi   |  12 +-
>  .../boot/dts/socionext/uniphier-ld20-global.dts    |  14 ++
>  .../arm64/boot/dts/socionext/uniphier-ld20-ref.dts |   1 +
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |  20 ++-
>  .../arm64/boot/dts/socionext/uniphier-pxs3-ref.dts |  28 ++++
>  arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   |  55 ++++++-
>  17 files changed, 304 insertions(+), 14 deletions(-)
>
> --
> 2.7.4
>

-- 
Best Regards
Masahiro Yamada
