Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF59C43331
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:17:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B5B5206E9
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DtAiTGcq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731040AbgDCGRl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 02:17:41 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46380 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730889AbgDCGRl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 02:17:41 -0400
Received: by mail-vs1-f67.google.com with SMTP id z125so4197120vsb.13
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 23:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V3yS2lItqVOfGsXBFcK1Q03oHDR0TygtC5pNqATurHQ=;
        b=DtAiTGcqQSpV/avwmNRjvHO1qDLd3tZsNHf3k+C+AgpkKHnLK0/VqwekGEJ4JQQ0uq
         wXTt47KxFzE5AetYqr4lZNkUqqQvCxPwyDnzOdlwb2XRAY3sI63HyI8fCcfwegKRCIJx
         Wr/jdxxl1E+403E/ErpRJFCWlSoK8AeJ20XUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V3yS2lItqVOfGsXBFcK1Q03oHDR0TygtC5pNqATurHQ=;
        b=mM2QtP+id7HSHstGjxtCoHyoRCTW1PAnrfxKqNf4ms8iTtfbOxa9O/EvpHTldflh7+
         1vt/U1+rtvXMd0iRBXvB41+wEkRJMWY4ZjjOUD27UZmtzxM2vZceIJPWJqARgU+mwkOQ
         V7orFmQrb/rF0tcQ2CGnBi6lTYoKbbB23JrlMipZ8GTa2/OFQN/WKwaehQ0NU9c9K5NU
         03EvIGrgEti3YbkPpJVXw+yPx/Yew5Ah8spwSgW97zBDekRTqqDSO4VeNi4E031e/SN0
         iDiQ2Bgv0siaSy5yBbQ2d/I1xvcqlTwLsVTOxSn5jpkIWL1fPX+RAjzkyH5piwa+TZB6
         QHoQ==
X-Gm-Message-State: AGi0PuYN8Q+43OxglN+byJAiYsVsPKD3ZDMcnpd1yRTydMTrtNE9PhoP
        473pmzGCBnK2EtNSGt7tNeonjijjUQk=
X-Google-Smtp-Source: APiQypIFxkNQam01wnMgADkH44LRPKifzO7Ki2crfku0hcRKr1KLXTtll9fNrM+G9cbaPqzJsefAwA==
X-Received: by 2002:a67:770f:: with SMTP id s15mr5383039vsc.199.1585894660198;
        Thu, 02 Apr 2020 23:17:40 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id r16sm1819262uam.15.2020.04.02.23.17.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 23:17:40 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id z125so4197108vsb.13
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 23:17:40 -0700 (PDT)
X-Received: by 2002:a1f:1846:: with SMTP id 67mr5194780vky.32.1585894163062;
 Thu, 02 Apr 2020 23:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
In-Reply-To: <20200403052900.258855-1-evanbenn@chromium.org>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Fri, 3 Apr 2020 17:08:52 +1100
X-Gmail-Original-Message-ID: <CAKz_xw1w=uKEV_p94cT8uL-4WN9mRkQE47N=4QdE+_NOFQ-2kg@mail.gmail.com>
Message-ID: <CAKz_xw1w=uKEV_p94cT8uL-4WN9mRkQE47N=4QdE+_NOFQ-2kg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Julius Werner <jwerner@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Apologies I forgot to add this note to my cover letter.

Xingyu do you mind seeing if you can modify your ATF firmware to match
this driver?
We can add a compatible or make other changes to suit you.

Thanks


On Fri, Apr 3, 2020 at 4:29 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> This is currently supported in firmware deployed on oak, hana and elm mt8173
> chromebook devices. The kernel driver is written to be a generic SMC
> watchdog driver.
>
> Arm Trusted Firmware upstreaming review:
>     https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405
>
> Patch to add oak, hana, elm device tree:
>     https://lore.kernel.org/linux-arm-kernel/20200110073730.213789-1-hsinyi@chromium.org/
> I would like to add the device tree support after the above patch is
> accepted.
>
> Changes in v3:
> - Change name back to arm
> - Add optional get_timeleft op
> - change name to arm_smc_wdt
>
> Changes in v2:
> - Change name arm > mt8173
> - use watchdog_stop_on_reboot
> - use watchdog_stop_on_unregister
> - use devm_watchdog_register_device
> - remove smcwd_shutdown, smcwd_remove
> - change error codes
>
> Evan Benn (1):
>   dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog
>
> Julius Werner (1):
>   watchdog: Add new arm_smd_wdt watchdog driver
>
>  .../bindings/watchdog/arm-smc-wdt.yaml        |  30 +++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/watchdog/Kconfig                      |  13 ++
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/arm_smc_wdt.c                | 181 ++++++++++++++++++
>  6 files changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
>  create mode 100644 drivers/watchdog/arm_smc_wdt.c
>
> --
> 2.26.0.292.g33ef6b2f38-goog
>
