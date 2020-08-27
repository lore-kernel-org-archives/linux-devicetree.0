Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253A6C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:34:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBD9422B47
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPhEtjhj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgH0IeO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 04:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgH0IeN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 04:34:13 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11535C06121A
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2020 01:34:13 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t6so5452457ljk.9
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2020 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IVXJtBnlq4f+oi1C+LRjN7t2FITJvG/QxPzZBfVFMC0=;
        b=wPhEtjhjJPq4O2MS0GsFTGAFA8KQNoAwS9zSpIQt5Bb0KvihNOrBw8hy5K1kA4k/Xb
         av26xBzzN30E5OplMzhE0l4pt5G1Yu9EoaMOZQ/X6OHxmf1IjMw1hH/5+UHwpLcSsydK
         sG4p4Gsj+zGOveSXX6pR1yFsLoTqsxz6UyJ+Yz+pA0WETTh93UenltoQ+rOwuefP8Ijv
         JNrrwRtFlfR7Dnh5mjTGUFv/RQ6Xue8cBTjh0VZblam3402C3Ex7B5e7s8LhcLbS3/hL
         1It6f047goH80p/PINGVK5pI6MXiBHioLJIOHCY59/8kU9gyCWnSXysMZBq/raX1ethZ
         EXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IVXJtBnlq4f+oi1C+LRjN7t2FITJvG/QxPzZBfVFMC0=;
        b=amT3yC/eVrNsAf/R3A9Pr3TljSL1X4Isaw+7/WXzW9Q4BnuZLHAVWFLO06hYiK6UWJ
         QUKwf4/GueIIqbVfMn+NOwu4hfBrfIaZwfr9goPeBGuHQsXLs47Rnk8inACiC1/h0LLi
         OtAUshmLHxA7ZARHm9E659jUuzIHMjtyOxYl7lE2KiA/qNdPWnWXZ1uCugsK8dAiBlcY
         7tTmpjFG4I/IaEXremg74mGRjOOvmX32q896cyZP+Er40DmaBqV4R3YVL4lyO6KAXtIN
         g9U4X/VDafoK5w4NfydVY/C3euGmvmppMGNnNJGJ0tAmEcIaOytXK0IAmG+s+jjssMAs
         qgUw==
X-Gm-Message-State: AOAM530yvdtZGpe59FgsEwvfAXwlAK8FSTe+WMhKq2myb8apWkPPk8a4
        hAmc4tim7YlmVyAaL6OHVTOPVC296OEgkyvgkp3EdA==
X-Google-Smtp-Source: ABdhPJxiZEt8ym49Kerv5QJe7yLxzNhaO9niJClhqyqXzkuNFIDTBDJMCL1u/6yeXUawHLNQday421PVg4TGsw6c8b0=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr9505001ljb.283.1598517251455;
 Thu, 27 Aug 2020 01:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200730152808.2955-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200730152808.2955-1-Sergey.Semin@baikalelectronics.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Aug 2020 10:34:00 +0200
Message-ID: <CACRpkdbMLEoeuyBe9h2DPKDzL8YKYbp-8r_NO1fFE5cvZjomHw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: dwapb: Refactor GPIO resources initialization
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 30, 2020 at 5:28 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:

> This series is about the DW APB GPIO device initialization procedure
> cleaning up. First of all it has been discovered that having a
> vendor-specific "snps,nr-gpios" property isn't only redundant but also
> might be dangerous (see the commit log for details). Instead we suggest to
> use the generic "ngpios" property to define a number of GPIOs each DW APB
> GPIO controller port supports. Secondly seeing a tendency of the other
> GPIO drivers getting converted to using the GPIO-lib-based IRQ-chip
> interface this series provides a patch, which replaces the DW APB GPIO
> driver Generic IRQ-chip implementation with the GPIO-lib IRQ-chip one.
> Finally the DW APB GPIO device probe procedure is simplified by
> converting the code to be using the device managed resources for the
> reference clocks initialization, reset control assertion/de-assertion
> and GPIO-chip registration.
>
> Some additional cleanups like replacing a number of GPIOs literal with a
> corresponding macro and grouping the IRQ handlers up in a single place of
> the driver are also introduced in this patchset.

Sorry for the delay. Merge window and stress.

All 10 patches applied for v5.10!

Yours,
Linus Walleij
