Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11218C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 09:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0DBF20706
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 09:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PNHRCbBH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbgHYJjD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 05:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729520AbgHYJjB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 05:39:01 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A523C0613ED
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 02:39:01 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id h19so2026712ual.10
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GRCPvvkD3DNNctf3RoNCERPOL0qUeUuvx/q+40LlnM4=;
        b=PNHRCbBHBeNz0jPjwR1OVPyaqN6fv3xIQuIswRVb/4kD0fOjuqU1fvrZ5xtHUL1Ib0
         vm6HA7ncP0OCSmWplLJ+dfxFloRBi9lC3wC/Pck1Bvn1hOUmXAV2V9mJUUZfn79/LMSl
         hLfgk6QQuPi7IeB5DXIi08hwmDoLGRUs0TTkPt/fADESW6V12+1g6LYDV05ifZuOIOiQ
         f3Cy0lBxmjUONoqPxY9euolW/EfTMN4mRRcUoE0jtTaKNJvuOC5lQ2TEvMKdPE8qhf/G
         QG6auxd1+wD7AK0KmMQSpzbLyBOY+uANXbkpE2Adcv0klfZOJlj4DKUXLVdYOenuJiFG
         6CIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GRCPvvkD3DNNctf3RoNCERPOL0qUeUuvx/q+40LlnM4=;
        b=twyoC0yKRsWfeSV0w2vzhWZs2jdVNNuNxBs3rQUuoDaolb2WJgOkR1RbEi6YC1/sQ2
         rMdGwX6rdihh9Hu6UySIemJ6KO7iCDGJJesLLMv4UbYPeHMD3HjDW1dGCgmHkQpkxGj5
         0BQdyYrdFSm4Ctk5GGL3crSOswzv1sEpUG/n7/wBMB7brNZZRnjTbgtWDdyDddJP2jzG
         autIlTS5QxZdnA0K+57WgGJ6zIWQl9upYQGhV63pNmCN14g+0R9U5sX/iaZ9R3FJLOe/
         soFrpMPL1Syg1j3YLJvF2XXVl4APk3aISNzUtVp0K+rLu1h+snlyVz0xWbGrjTN/fgQt
         /qAw==
X-Gm-Message-State: AOAM5308My4t4XNyn2oK40s71eMggP+3+69Fnt/n/ckgum/YS81BlQHD
        1sQvsvLhQjJTBp9Qre5lqBCyM7GvFGh7QWPI/GEJJQ==
X-Google-Smtp-Source: ABdhPJw8Qer3hMMoOxTE6yeDTh8VDWMJr82m9f7kGUNVgXNGF8KAhmZIOcyAdOVJd49ANRvATn9YWpz0AxB9BwwpCGs=
X-Received: by 2002:ab0:64c3:: with SMTP id j3mr4711708uaq.129.1598348340769;
 Tue, 25 Aug 2020 02:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200825081357.32354-1-lars.povlsen@microchip.com>
In-Reply-To: <20200825081357.32354-1-lars.povlsen@microchip.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 25 Aug 2020 11:38:24 +0200
Message-ID: <CAPDyKFq+eJgGZVxLqY3WP8DAtCMGGtc1LNGvTmCPTy7siSDddA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] mmc: Adding support for Microchip Sparx5 SoC
To:     Lars Povlsen <lars.povlsen@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>, SoC Team <soc@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Aug 2020 at 10:14, Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> The patch adds eMMC support for Sparx5, by adding a driver for the SoC
> SDHCI controller, DT configuration and DT binding documentation.
>
> Changes in v5:
> - DT+yaml: Change (mmc|sdhci)@600800000 to mmc0@600800000
> - Add missing "static" attribute to probe function
> - Drop MMC_SDHCI_IO_ACCESSORS, as it is not required (anymore)
>
> Changes in v4:
> - Disable clock if sdhci_add_host() fails
> - Remove dev_err if sdhci_add_host() fails
>
> Changes in v3:
> - Add dt-bindings for property "microchip,clock-delay"
> - Enforce "microchip,clock-delay" valid range in driver
> - Removed a noisy pr_debug() in sdhci_sparx5_adma_write_desc()
>
> Changes in v2:
> - Changes in driver as per review comments
>  - Drop debug code
>  - Drop sysfs code
>  - use usleep_range()
>  - use mmc_hostname() in pr_debug()
>  - Remove deactivated code
>  - Minor cosmetics
>
> Lars Povlsen (3):
>   dt-bindings: mmc: Add Sparx5 SDHCI controller bindings
>   sdhci: sparx5: Add Sparx5 SoC eMMC driver
>   arm64: dts: sparx5: Add Sparx5 eMMC support
>
>  .../mmc/microchip,dw-sparx5-sdhci.yaml        |  65 +++++
>  arch/arm64/boot/dts/microchip/sparx5.dtsi     |  24 ++
>  .../boot/dts/microchip/sparx5_pcb125.dts      |  23 ++
>  .../boot/dts/microchip/sparx5_pcb134_emmc.dts |  23 ++
>  .../boot/dts/microchip/sparx5_pcb135_emmc.dts |  23 ++
>  drivers/mmc/host/Kconfig                      |  12 +
>  drivers/mmc/host/Makefile                     |   1 +
>  drivers/mmc/host/sdhci-of-sparx5.c            | 269 ++++++++++++++++++
>  8 files changed, 440 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/microchip,dw-sparx5-sdhci.yaml
>  create mode 100644 drivers/mmc/host/sdhci-of-sparx5.c
>

For some reason, patchwork doesn't seem to accept your patches. Can
you please have a look to figure it out, at least until next time.

In this case, I picked them from the emails, so patch 1 and patch2
applied for next, thanks!

Kind regards
Uffe
