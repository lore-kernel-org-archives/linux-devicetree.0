Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFDEC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:03:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48D0620787
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VAFOtuQz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437594AbgDPHDx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437145AbgDPHDw (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 03:03:52 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A8BC061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:03:51 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x4so3389740wmj.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AruXxjr9GHlZ2Z9Tv42XPGLrf7MP2PtB4f9OTEBH4MM=;
        b=VAFOtuQzGjjh1BpnjdwrBb8ATOf9hLIQMepMrNF2THjStFG8m/qucMONexKM/Ibh0E
         XnkPy+lPDXG4ZLFC0CUaOGOAsEj1n4I0cqOGjjq2UtVhoTGbcvAy14ISFMKTzA6o7JZB
         erM05v8TzGUWzuAZDgeE6K0dy3boHLEmcgO8mqrTXpiSO+J/eJ2v4+FPMkRt4eAvIUvn
         wEL/CDEmrhNzU/AhUYaUhPQK+gwDwngk88DYkCqM+/uO8cyxAE/LzNoRMnuA9Pr5u5KL
         r5cFfhRBHKjkgpMV9vagPW6RZY70RwX0WgU2wxq3vBZPk9De1qT0f9Og4VBs/JWNT5hu
         rmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AruXxjr9GHlZ2Z9Tv42XPGLrf7MP2PtB4f9OTEBH4MM=;
        b=GKZYBFs4FV+z0rX/D3tvQiYkr6e5CCf8AwQC+psGaSxWCX2TS800jhYO6nUnZ2NxMk
         CGvxBVIjYu6vMUBQeMi1jqg4Guu688ikkuzAVoPNFwzE/FKBA6OrN3MGneLvNjsFhQhW
         wDLLt/o+huG7/SVPCibNJaTKewcinWR89va6THnG9H6xRvKCifZiQ0gsKNIGZltsT7wl
         T7q0LqxJzaZGLPni+CBp2qpojkR1uMaZ5P9JEbOV7IYvQgjaNRhMX6/tfb4cMjYhQV9Z
         jw3tL2/8wSLnfbCn11tM1zUnAeV9ZtVpi5NXt99Y8p5pJyi0ZIJiRubLA/TLOE8VRYAH
         aDmg==
X-Gm-Message-State: AGi0PuY3mNIyOgVbOgxj9s+Xr6kFg/uYKQkdTAFGbEzIXzbsl5q5gyM4
        pOk204g+d7ehD3vAeyroi6xkuQ==
X-Google-Smtp-Source: APiQypK1dMnBZLZOHx8PctsABj5RlziysLlkiXO8f0byNomGW94UpABYhu4MUL2N+fcrhwskc4rKnw==
X-Received: by 2002:a1c:9a96:: with SMTP id c144mr3289606wme.84.1587020630466;
        Thu, 16 Apr 2020 00:03:50 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id w18sm25908396wrn.55.2020.04.16.00.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 00:03:49 -0700 (PDT)
Date:   Thu, 16 Apr 2020 08:04:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     fabrice.gasnier@st.com, robh+dt@kernel.org, mark.rutland@arm.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] clockevent: add low power STM32 timer
Message-ID: <20200416070441.GP2167633@dell>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200401083909.18886-1-benjamin.gaignard@st.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 01 Apr 2020, Benjamin Gaignard wrote:

> This series add low power timer as boadcast clockevent device.
> Low power timer could runs even when CPUs are in idle mode and 
> could wakeup them.
> 
> version 6:
> - simplify binding, DT and code to use only one interrupt
> 
> version 5:
> - document interrupts and interrupt-names bindings
> - use a different wake up interrupt
> - add device-tree patch
> - make STM32MP157 select low power timer configuration flag
> - enable fast_io in regmap configuration
> 
> version 4:
> - move defines in mfd/stm32-lptimer.h
> - change compatible and subnode names
> - document wakeup-source property
> - reword commit message
> - make driver Kconfig depends of MFD_STM32_LPTIMER
> - remove useless include
> - remove rate and clk fields from the private structure
> - to add comments about the registers sequence in stm32_clkevent_lp_set_timer
> - rework probe function and use devm_request_irq()
> - do not allow module to be removed
> 
> version 3:
> - fix timer set sequence
> - don't forget to free irq on remove function
> - use devm_kzalloc to simplify errors handling in probe function
> 
> version 2:
> - stm32 clkevent driver is now a child of the stm32 lp timer node
> - add a probe function and adpat the driver to use regmap provide
>   by it parent
> - stop using timer_of helpers
> 
> 
> Benjamin Gaignard (6):
>   dt-bindings: mfd: Document STM32 low power timer bindings
>   ARM: dts: stm32: Add timer subnodes on stm32mp15 SoCs
>   mfd: stm32: Add defines to be used for clkevent purpose
>   mfd: stm32: enable regmap fast_io for stm32-lptimer
>   clocksource: Add Low Power STM32 timers driver
>   ARM: mach-stm32: select low power timer for STM32MP157
> 
>  .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  |  21 ++
>  arch/arm/boot/dts/stm32mp151.dtsi                  |  35 ++++
>  arch/arm/mach-stm32/Kconfig                        |   1 +
>  drivers/clocksource/Kconfig                        |   4 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/timer-stm32-lp.c               | 221 +++++++++++++++++++++
>  drivers/mfd/stm32-lptimer.c                        |   1 +
>  include/linux/mfd/stm32-lptimer.h                  |   5 +

I'd be happy to take this set, but you need Acks from the other
subsystem Maintainers before I can do so.

>  8 files changed, 289 insertions(+)
>  create mode 100644 drivers/clocksource/timer-stm32-lp.c
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
