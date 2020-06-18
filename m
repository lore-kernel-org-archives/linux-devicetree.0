Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6E0C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 10:21:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2910A21707
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 10:21:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QPX3pcoU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgFRKV6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 06:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgFRKV5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 06:21:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048D1C0613ED
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 03:21:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x6so5431981wrm.13
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lc5UhnoSRIFlDb4bTQaq1FSaNFdyYRNankkKgGtxJsM=;
        b=QPX3pcoULeRgdl8S5TEBqcc2VmR03uompZGl6g1kKu/NL/Em080sZdrASGWlK2EQRg
         iUYJsnXXUuP2l5H7lghNfhm6e7DfDZB8JWnUn/tbYdwvBsdWpJxLgaxEnYJHjgnzgMpw
         3mFqngduzWwpciQJbBRQ6kl7j45e0UBKM1hAa1EJYMHfJvlYzWJ//F47grKwJm5rybRQ
         CCUxDrkozG6yAeZhvuCKl0HwzlLaxg+lYcM2Su9Ry8rFRDbWNCkQQcs5sjzzUtuat/iC
         sbbBUI9tpgXk8vu/WmvuTSBlogl7qf38y/XHzRnS5x0dXCCEbTe/9v2vRKE8Acmh3sOQ
         PRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lc5UhnoSRIFlDb4bTQaq1FSaNFdyYRNankkKgGtxJsM=;
        b=mh2U0R1hvRo1exDMd75t1z2krq5yFtlB7F6ebQk+4EELFQAt4nlmOUdXCBik7/z8oJ
         pSYLFo/T3QbfKHJnNRq3ulmmSseBS843za8jl1B6qqjG0351O3md9hTa36wGkO1jBG+n
         PiwjnhoMYFmxr45f55ULwN8o6rrCGwrHzxqW/1Dr19dOtsHjhyowwd9C+gDYCVcnRLXI
         ETmY9XLWJ8OgxTNV6KoN+O8YM7HgUUOLqTWU7iTPNrHg0WjKe69ClvEhJpoMR54jbQlO
         ytQdDd0gxkAIFrgjV47O8Pf0P6HsygBWOcJ1JQ4pL1GtBmM/tVBJx8Sbk9UAYHZcadSe
         gxAw==
X-Gm-Message-State: AOAM532l8MuUOCcI4W9mcCERKBsfbhEG2D9aeVquJHp5G2jPb1VrLP/j
        WfgDRq7T8l1kR/MtnWfcP8UMXyQl95k=
X-Google-Smtp-Source: ABdhPJz5DhYnsCs3A52DCuEOd991w1DHFP+dRXEye2MKbtUEcRSXIjOpqlaA34AoVsAb5kpvszgzgA==
X-Received: by 2002:adf:e588:: with SMTP id l8mr4057736wrm.255.1592475715609;
        Thu, 18 Jun 2020 03:21:55 -0700 (PDT)
Received: from dell ([95.149.164.118])
        by smtp.gmail.com with ESMTPSA id h188sm3145127wmh.2.2020.06.18.03.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 03:21:54 -0700 (PDT)
Date:   Thu, 18 Jun 2020 11:21:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     fabrice.gasnier@st.com, robh+dt@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux@armlinux.org.uk, daniel.lezcano@linaro.org,
        tglx@linutronix.de, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and Clocksource due for the
 v5.9 merge window
Message-ID: <20200618102153.GF954398@dell>
References: <20200603125439.23275-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200603125439.23275-1-benjamin.gaignard@st.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

All but the ARM patches, which should be routed via Arm-SoC.

Enjoy!

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-clocksource-v5.9

for you to fetch changes up to 48b41c5e2de6c52c90efa99cfa122a5da7a7f0cd:

  clocksource: Add Low Power STM32 timers driver (2020-06-18 11:19:58 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Clocksource due for the v5.9 merge window

----------------------------------------------------------------
Benjamin Gaignard (4):
      dt-bindings: mfd: Document STM32 low power timer bindings
      mfd: stm32: Add defines to be used for clkevent purpose
      mfd: stm32: Enable regmap fast_io for stm32-lptimer
      clocksource: Add Low Power STM32 timers driver

 .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  |   5 +
 drivers/clocksource/Kconfig                        |   4 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-stm32-lp.c               | 221 +++++++++++++++++++++
 drivers/mfd/stm32-lptimer.c                        |   1 +
 include/linux/mfd/stm32-lptimer.h                  |   5 +
 6 files changed, 237 insertions(+)
 create mode 100644 drivers/clocksource/timer-stm32-lp.c

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
