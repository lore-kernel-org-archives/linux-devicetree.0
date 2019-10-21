Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2C5CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A69E21906
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pn/BCboT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbfJUOO5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 10:14:57 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:38133 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbfJUOO5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 10:14:57 -0400
Received: by mail-vs1-f66.google.com with SMTP id b123so8955333vsb.5
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yS8qs3B3YGG+1CaBCs+yd01gHNPGrQOZoSsD0Kk0Jog=;
        b=Pn/BCboTlYXueWFu2lYYLoFGnsbCRWYun52IGpqPIDYrwc2DK/4wSWIlEIAwadC3Ou
         dg7eBJiJxRYXrT6Ya9KUrMlTMR6vzqKpazwDroPYbKI7s/J1NEL0Rsc4GYU+P1Md7r7A
         N0PZnApDTKbbzf9lUyHu+zTbPUaEPLIFUwUG+qiArKuGJgSBDB93WbhnHvQ55Bfly0Bg
         xR0pyZRVdDcRVZVnGK1lHKMSaKowQU4IO4OApws7zDX3vYlltsiAQXfFTgIxakyKHFIt
         cyeEQvT12qW/TlJhRySJdqZaFqyCWalutZWBk3pTWyqlu9Q7ejExawnfBfc4+yN2KrGm
         52ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yS8qs3B3YGG+1CaBCs+yd01gHNPGrQOZoSsD0Kk0Jog=;
        b=rOwcU82FTXW3/xaMqBMA6KT8DCYKJs9BZWKG3vq5MKewjuoR09dLWKqBrGfgwoVkE0
         6DgK5CTR6Cc91UGjqXcewVVqvW07r/yOGpHHIuloObHj25aP5JAcLp7Pzyw8OpylsIoM
         xeak/zjHTuu9Lh4xem/Eg5IdbcgcBrNckCetZvUnDkJccf44gvujfKKoyK/4og3JBbkW
         RgJYnpUFEqv+uWdiP0QSit7er0uFHcft7vqlOGQXi+4jyigP+C82mBrHfE1BSkrrr6KL
         0x6E1x9V0y4BoN3PSBnx49SeoFs36jTPIP7Hz8Kg3T1vE1CuEQo9iCCwwJl+cYFM4RrS
         tzbQ==
X-Gm-Message-State: APjAAAUv6B63L06clxcIgVMcOA7aoijxFVKkibQ8QGysL2QIcQv/ne9U
        eFiRihBU/UZdfIFnt7yBixN6HIBpHyijcjzGlZHV0Q==
X-Google-Smtp-Source: APXvYqz9r09sX0s75qmyPEEUmSKArK+VJBphmNsHF6I2eD5KN0VEOGXWfbqgNE20Ygtof4lmLqC1eZzCLfMc1loRLkI=
X-Received: by 2002:a05:6102:104d:: with SMTP id h13mr13907823vsq.165.1571667296086;
 Mon, 21 Oct 2019 07:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <1571293310-92563-1-git-send-email-manish.narani@xilinx.com>
In-Reply-To: <1571293310-92563-1-git-send-email-manish.narani@xilinx.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 21 Oct 2019 16:14:20 +0200
Message-ID: <CAPDyKFo-8=crHZd9X7JpGJHdEwFs4Pz8rzEtVg6e7QZqE8N8nw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Arasan SDHCI enhancements and ZynqMP Tap Delays Handling
To:     Manish Narani <manish.narani@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michal Simek <michal.simek@xilinx.com>, jolly.shah@xilinx.com,
        rajan.vaja@xilinx.com, nava.manne@xilinx.com,
        Moritz Fischer <mdf@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 17 Oct 2019 at 08:22, Manish Narani <manish.narani@xilinx.com> wrote:
>
> This patch series does the following:
>  - Reorganize the Clock Handling in Arasan SD driver
>  - Adds new sampling clock in Arasan SD driver
>  - Adds support to set Clock Delays in SD Arasan Driver
>  - Add SDIO Tap Delay handling in ZynqMP firmware driver
>  - Add support for ZynqMP Tap Delays setting in Arasan SD driver
>
> Changes in v2:
>         - Replaced the deprecated calls to clock framework APIs
>         - Added support for dev_clk_get() call to work for SD card clock
>         - Separated the clock data struct
>         - Fragmented the patch series in smaller patches to make it more
>           readable
>
> Changes in v3:
>         - Reverted "Replaced the deprecated calls to clock framework APIs"
>         - Removed devm_clk_get() call which was added in v2
>
> Manish Narani (8):
>   mmc: sdhci-of-arasan: Separate out clk related data to another
>     structure
>   dt-bindings: mmc: arasan: Update Documentation for the input clock
>   mmc: sdhci-of-arasan: Add sampling clock for a phy to use
>   dt-bindings: mmc: arasan: Add optional properties for Arasan SDHCI
>   mmc: sdhci-of-arasan: Add support to set clock phase delays for SD
>   firmware: xilinx: Add SDIO Tap Delay nodes
>   dt-bindings: mmc: arasan: Document 'xlnx,zynqmp-8.9a' controller
>   mmc: sdhci-of-arasan: Add support for ZynqMP Platform Tap Delays Setup
>
>  .../devicetree/bindings/mmc/arasan,sdhci.txt  |  40 +-
>  drivers/mmc/host/sdhci-of-arasan.c            | 477 +++++++++++++++++-
>  include/linux/firmware/xlnx-zynqmp.h          |  13 +-
>  3 files changed, 498 insertions(+), 32 deletions(-)
>
> --
> 2.17.1
>

Manish, the series looks good to me. However, I expect you to post a
re-spin, to move some of the new DT bindings into common mmc DT
bindings, as Rob suggested.

So waiting for another version, before I apply it.

Kind regards
Uffe
