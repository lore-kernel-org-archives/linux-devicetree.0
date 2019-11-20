Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1363C43215
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 12:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A1662251D
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 12:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCoovsna"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfKTM7t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 07:59:49 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:37772 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbfKTM7t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 07:59:49 -0500
Received: by mail-ua1-f66.google.com with SMTP id l38so7727447uad.4
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 04:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6UQf89xygZl5APXVlJ8BVg5S3Zma4VRojTMP4pFeE48=;
        b=jCoovsnalMMyh4DFH4VjJ0KELkHUZ6EsPjGPIJZwX2/Mh2nEdpGzEsfpRs0DbJqCE2
         neHXNcrUGxBuxtxNh3RLIqmNJq1tkldyoQYd5CzYerEgn+y0Lod+X1d3oApyD3f/8R7B
         DHpf9NsP1n2lq4kSJ8qOShRgOYCyINmlxMm6+ph7TWaBpVLstmBgAhMZYY1UonsbyrYM
         bBInnY9KCd2xnEh520jKhAYKwVXBUfs11xGVQV6nIuTzTGk4CCvrYlL+573ftnEyesnw
         82JoOJHQW4MA2LLSnKMJkB432xfIM3IRqtnXFaQny31xs5LDzelR/OBd0IE4S56DGLJ9
         6UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6UQf89xygZl5APXVlJ8BVg5S3Zma4VRojTMP4pFeE48=;
        b=ZuY042nfZ0Dl/pyuzm16ZwdY5dlZpfjjlYn/XYZBIfBpHB8TECIAa8Yy8gT0+n4Tbo
         zUxRnqkyA8o2w48/0WM24GNXW897PQ1Hl03QepSumxik3QleHEBGsCZUBj9m9KtSC//+
         N9PcDBXSbPtI6/d42vF3eFkV2uPi3hDgwVQJ9azqlF7lNtImjpw0T4F/sBtuhMYvN3ne
         htAuVuIEy/U/QOEFRE4r6MaiLBsIr/LqmOBl4Z7JesZxetk1kenh7LHfKKJ60CX+rPll
         S881P97/BCldCEwmTkarNuCbsbvgZVlXF67CugVhE/cbydYcUPD6VFEG0nTeVuoo0SZv
         mfSg==
X-Gm-Message-State: APjAAAUokBjJMxQOv8HnmDTTRyZ47nIDVf6X63O7sAN0MBhVYYxa1cKO
        hnqoyyNVxZPvZcriD6TD7rxBKupKNwV/xOpkYlw7pjDT
X-Google-Smtp-Source: APXvYqxEyipp0d6e/DBwHVmq3a7VxidQ0hGF9/sAXkVICJv6ReLgBcaUXbQEwIhCLBiNae9zSsMEfT5AcLWi0/Kwg6o=
X-Received: by 2002:ab0:74cd:: with SMTP id f13mr1520153uaq.104.1574254787837;
 Wed, 20 Nov 2019 04:59:47 -0800 (PST)
MIME-Version: 1.0
References: <1574232449-13570-1-git-send-email-manish.narani@xilinx.com>
In-Reply-To: <1574232449-13570-1-git-send-email-manish.narani@xilinx.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 Nov 2019 13:59:12 +0100
Message-ID: <CAPDyKFprcjgrcbT3jpT7pyM+FFWL8RAm5AtFAjVLcPMDiDzUvA@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Arasan SDHCI enhancements and ZynqMP Tap Delays Handling
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

On Wed, 20 Nov 2019 at 07:47, Manish Narani <manish.narani@xilinx.com> wrote:
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
> Changes in v4:
>         - Made the Phase Delay properties Arasan specific
>
> Changes in v5:
>         - Made Clock Phase Delay properties common
>         - Moved documentation of them to the common mmc documentation.
>
> Changes in v6:
>         - Clubbed all Clk Phase Delay properties' into a pattern
>           Property
>
> Manish Narani (8):
>   mmc: sdhci-of-arasan: Separate out clk related data to another
>     structure
>   dt-bindings: mmc: arasan: Update Documentation for the input clock
>   mmc: sdhci-of-arasan: Add sampling clock for a phy to use
>   dt-bindings: mmc: Add optional generic properties for mmc
>   mmc: sdhci-of-arasan: Add support to set clock phase delays for SD
>   firmware: xilinx: Add SDIO Tap Delay nodes
>   dt-bindings: mmc: arasan: Document 'xlnx,zynqmp-8.9a' controller
>   mmc: sdhci-of-arasan: Add support for ZynqMP Platform Tap Delays Setup
>
>  .../devicetree/bindings/mmc/arasan,sdhci.txt  |  25 +-
>  .../bindings/mmc/mmc-controller.yaml          |  13 +
>  drivers/mmc/host/sdhci-of-arasan.c            | 478 +++++++++++++++++-
>  include/linux/firmware/xlnx-zynqmp.h          |  13 +-
>  4 files changed, 497 insertions(+), 32 deletions(-)
>
> --
> 2.17.1
>

Applied for next, assuming Rob is okay with patch4, otherwise you need
to send a fix on top, thanks!

Kind regards
Uffe
