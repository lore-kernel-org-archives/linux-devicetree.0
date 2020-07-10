Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8DAC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 07:57:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BE65207BC
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 07:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8i+seRD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgGJH5U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 03:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgGJH5Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 03:57:16 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEC9C08C5DC
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 00:57:15 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id h190so1039038vkh.6
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 00:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iedZoBoQDLoLatFfLaRWw9W6SY3ltFRWXMemHfukFEo=;
        b=b8i+seRD1bQu+c9MLbDpPcuq1iv5iTWV3nt28HUPXW7ZKEzcJNYaiFPabQ5KcnGL2a
         5MaUJ4ik2N13rzyS0qHvDyggBDtYdjVb0ouRC8SAHnj5mj8qmZh/4+q27itxk/0BkSBV
         Q8rSyuLEuNe+n8ZkRsCjCe/zjSRe4SRd/PNRsNgT/8HeFitO1ilEsrpwByj/lXNa8uvz
         0tjPvnTU+ZfUhZNccTxrQeqWdUQk40Y93uZuV8fb0f/0sOD1q0XFWy6qhbRa7cRonWsW
         mEVLg+nCE0uW7dJ3mYNuPl0tLbxx0uUU+sbKnd26Dxls13LodQw9Re4IKxGmnIPqVwOD
         7efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iedZoBoQDLoLatFfLaRWw9W6SY3ltFRWXMemHfukFEo=;
        b=nJuAlOXGyvFfB+Acr2N2XCkWJIQJqRXbdXvj5N9wtjCzeltXbzWC8JSc1uCY22EdQ1
         XsOtCwEPkNQYHguv+eAArVq4epJYz31rRKaLDMfE4XCpSudF1+TCzWSwYZkZvwBiEZRm
         gUNZuGiRDdBnZSKud7JK6SFejpXxFOS7cNyPwsWheCqrkb5pfNbX2ttgOCuIcmfhvIH6
         8l56VqCqtVPZWuytB80gzpP2+jYtLOCC0bQCJrwmcSfTzAW3hn4BDV+l25Jm0gtUlkg9
         Nej5ycHBKjlLnq74+dDHZArsUAar/oSWKEXvOqAN0UiddA0xXUS+RqJ/iDFTh04U6h2w
         HolA==
X-Gm-Message-State: AOAM533Aw7BcfaQQ7tFnTN2OpqTAb5jt+QYGmXVkbzXOwWN8QIRocxC/
        nZ6O0DzDisLmCCbatDag3dWSGLaVrTERG2GpssT3bw==
X-Google-Smtp-Source: ABdhPJzNsYDkox6SuPvvFRcEEl9Q8Pt/nFMpFpjPAAa4bEGFJKfY6V5jpDoRqqMtswg9jg19Mf3ZI66NM4uGLX7b+wc=
X-Received: by 2002:a1f:1889:: with SMTP id 131mr41537793vky.59.1594367834359;
 Fri, 10 Jul 2020 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 10 Jul 2020 09:56:37 +0200
Message-ID: <CAPDyKFp9mO6UkcPR+BqJFhTMhK9aWFV5H3r=zT9Aodq4O3J3ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] mmc: core: add a new property/caps2
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 7 Jul 2020 at 13:59, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Some environment (like r8a77951-salvator-xs) is possible
> to perform a full power cycle of the card in suspend via firmware
> (PSCI on arm-trusted-firmware). However, the current MMC core
> cannot issue Power Off Notification. This patch series can do it.
>
> We discussed on the v3 email thread [1].
>
> [1]
> https://lore.kernel.org/linux-renesas-soc/1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/T/#m9c25f35d7126b1c14ea431a773757652ad094341
>
>
> Changes from v4:
>  - Just add a new property/caps2 flag of MMC bindings to fix the issue.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=308795
>
> Changes from v3:
>  - Modify regulator subsytem and regulator/fixed driver.
>  - Use regulator_is_enabled() instead of firmware API.
>  - Update R-Car Gen3 related dts files for the reference.
>    But, I have only tested on r8a779{5,61}-salvaltor-xs.dts.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=306281
>
> Changes from v2:
>  - Fix typo of function name in patch2.
>  - Remove RFC.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=305523
>
> Changes from v1:
>  - Use pm_suspend_via_firmware() API instead of pm_suspend_target_state.
>  - Modify the psci driver to call pm_set_suspend_via_firmware.
>  https://patchwork.kernel.org/patch/11557505/
>
>
> *** BLURB HERE ***
>
> Yoshihiro Shimoda (2):
>   dt-bindings: mmc: Add full-pwr-cycle-in-suspend property
>   mmc: core: Add MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
>
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5 +++++
>  drivers/mmc/core/host.c                                   | 2 ++
>  drivers/mmc/core/mmc.c                                    | 3 ++-
>  include/linux/mmc/host.h                                  | 1 +
>  4 files changed, 10 insertions(+), 1 deletion(-)
>
> --
> 2.7.4
>

Applied for next, thanks!

Kind regards
Uffe
