Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDC2C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 14:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BB0A2083B
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 14:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="prFOwogC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgGFOtg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 10:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729392AbgGFOtf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jul 2020 10:49:35 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6919EC061794
        for <devicetree@vger.kernel.org>; Mon,  6 Jul 2020 07:49:35 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id q15so9982980vso.9
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2020 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HyMqFb7tzBuwiN7KkfvbwKvQf9DKp/quj/oeR7HiAvA=;
        b=prFOwogC8BpJ+Dwcz5Rx7XOchM4UmKtnLdv+riLgr4pBLN1VKufGmD+KSXpdMSy23H
         AmVR0x9sQwVq/9mb9dCKhJcrVAXdoaE7jTI6PgO9Iowgq3o1+Eon7aM43Byp9jF5mUUT
         opFprijxueAsN99Oh0q1nbhcO+41DmBj1ovyuPKl7vEWz6nt77FClZ/xJ6xOSDPIiZSt
         UTXETn85MQi171A/ipDu6HZnmnlBNxHxevl+oiXhkh/S/w7mQV1sKJ+TCxFiC9wfCqWa
         PQoJUgk7fZY9GxcFmV72Je9UNcZxehw/Aqqo342szVSyk6whKUNnXIq+iB8dEN1Dqele
         rF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HyMqFb7tzBuwiN7KkfvbwKvQf9DKp/quj/oeR7HiAvA=;
        b=KG8k9GkrflVIQcaeykl7y188hLpDewoQCY2cm7YEL4AXIwXKSJ32DvrpsVYKQfzu3d
         2k7zFd67pqAcYzdygUvkub6bdlUIdSE5tCaIZo0TGdW4VvoMpnaqto8kf6buqgOqFMsG
         VQuxr8LPu+zEKo35xdBD37lSxd8nnqpxecc6vMSHmKUddPg1LBbFDFfbSs9UyF3pTT8Z
         0mje0DEEdbaJ1aAxnfSu3tFbPNpbysPAD6MbU4VJYgYZqmnlUDAT9/N0+OEX6Cg2kKHL
         CzQhn2L4oJbjT8GyskqxOE3tJY7WCKt0+z+6DngrCNvROWY766PicnRHBaTv+wiVJ3dt
         39gg==
X-Gm-Message-State: AOAM532Esqx4a3tK2HMteEHbgYUKKkCdbnad+jekBwvVORKyF1BvhbtU
        H6UztrowTtjR6nXkhI96wk1SDnDOG1H8ZawIR+GvNQ==
X-Google-Smtp-Source: ABdhPJyRXkNySVdhTSpyDekSoW0nF2LRzTf/2mQXstc8RpWalN5j4CARY/ALlPCDhFkYl3FouP2gH8j7N6FaQBSom1Q=
X-Received: by 2002:a67:ca03:: with SMTP id z3mr29170488vsk.34.1594046974669;
 Mon, 06 Jul 2020 07:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200619125801.9530-1-faiz_abbas@ti.com>
In-Reply-To: <20200619125801.9530-1-faiz_abbas@ti.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 6 Jul 2020 16:48:57 +0200
Message-ID: <CAPDyKFq0M6fORAxawY4K6CYjEEjtGvdR+t8sicjWDKxnuwFxoQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add support for SD card in AM654x-evm
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 19 Jun 2020 at 14:58, Faiz Abbas <faiz_abbas@ti.com> wrote:
>
> The following patches add driver support for SD card on the
> am654x-evm. It only enables high speed mode with UHS mode
> support coming in a future series.
>
> DTS support will be added in another series as well.
>
> Faiz Abbas (7):
>   dt-bindings: mmc: sdhci-am654: Add ti,clkbuf-sel binding
>   mmc: sdhci_am654: Add flag for PHY calibration
>   mmc: sdhci_am654: Add Support for SR2.0
>   mmc: sdhci_am654: Fix conditions for enabling dll
>   mmc: sdhci_am654: Update delay chain configuration
>   mmc: sdhci_am654: Add support for clkbuf_sel property
>   arm64: defconfig: Enable AM654x SDHCI controller
>
>  .../devicetree/bindings/mmc/sdhci-am654.txt   |  1 +
>  arch/arm64/configs/defconfig                  |  1 +
>  drivers/mmc/host/sdhci_am654.c                | 86 ++++++++++++++-----
>  3 files changed, 65 insertions(+), 23 deletions(-)
>
> --
> 2.17.1
>

Patch 1 to 6, applied for next, thanks!

Kind regards
Uffe
