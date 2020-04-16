Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF727C2BB55
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 00:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC302208E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 00:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zxz39exV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391959AbgDPA51 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 20:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405912AbgDPA4x (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 20:56:53 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CEAC061A10
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 17:56:52 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id y17so19222218iow.9
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 17:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0pi57Yw1CcnU/t5xDRYzAtYW33asqFUBaWgZbJ3tOfE=;
        b=Zxz39exVNPQUoC5oC7KxutI6O9HlznMuRYa653fUmfYsyaTRiTIZKuc9pujiaQLdn/
         6CTSitD7ypenyMARA3xWa1qvKF/8ZZRmHFyZAj3U7hHkFWoLTv1Vjvem8/AWPxPWGYRd
         9YsDvAZ0l32UROX6xPE8XcQ0FNYxiVvtWNDvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0pi57Yw1CcnU/t5xDRYzAtYW33asqFUBaWgZbJ3tOfE=;
        b=bzD8DJ6vXzYRjssZfa0If8e90MNHEm7jIDyWqKt90thNGbqrE9gufMJ7pCY2AvU8gL
         3YIotiRN8zKiwmyX7S8O4Y9mVGNWTE9OujnY5JVxYFy4ojJMdAkE0G/NXzrpnXxG0qRb
         uSXRrigoFXsO4+rzfGkC/TFHjbVxnAhhuiFwzyaNMBfRz+EF+lk2r5xAWaLXnjhGFLqJ
         6irX/B4BDmGtA8SQI6tvRVc5h4aBHr6QlYZCfChWOR11NULV7iRM043HFCXFq/34mXF+
         8d/q6U3MMRtlEDpFViDXMPGufqjtCB15GOZux03x1vSouH34yxg1xzIYDNEskaP0Grjq
         Y1WQ==
X-Gm-Message-State: AGi0PuYZ5z7tIGuWVrvKZPgOmYWyYKX2ctLm5Ul2F7u33EXqmQYfl90S
        H0uZKd7Ui13dM4ngqTzj4ude5heSnXSztK3BOCewLw==
X-Google-Smtp-Source: APiQypLaV14jW6zqGw/DJyeFplem0IPQuVzPs6SMj5UQP5j6yl5Y9t8lEAsFhz+mS6nRLGgdHeSVWyjl3NF1UNgldr0=
X-Received: by 2002:a6b:491a:: with SMTP id u26mr28900283iob.30.1586998611518;
 Wed, 15 Apr 2020 17:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com> <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
 <20200415231215.GA182398@roeck-us.net> <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
In-Reply-To: <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 15 Apr 2020 17:56:39 -0700
Message-ID: <CAODwPW9Vt7TcWfKYDmRgLndb2-+5HoNvA6XMJJznXCudQDngqw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
To:     Evan Benn <evanbenn@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Julius Werner <jwerner@chromium.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Can anyone provide advice about making SMCWD_FUNC_ID a device tree
> param directly, vs using the compatible to select from a table.

Sounds like most people prefer the way with using different compatible
strings? (Personally I don't really care either way.)
