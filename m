Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B9AC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 17:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B054F22B48
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 17:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MCD49OCi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgCBRkj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 12:40:39 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54172 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbgCBRkj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 12:40:39 -0500
Received: by mail-wm1-f66.google.com with SMTP id f15so194533wml.3
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 09:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=K5oqHdhYQsbfwq1JYk39e1I9fjT9r5f+6YhvHb0bQI8=;
        b=MCD49OCiX7UTc2zw7TI6NhGlqWX7Y9VHIk0EDfdExeozCcgciVDPFIH0fd/R1lvBv1
         47evh82+1UHr89jfexA+0pUGgrrkrcWozvZL3nbDc/HB4oXlYJZg4IMGjBw4cQOxf8yH
         vRtckG3qJipaBRkTbNJsxz9XaG9Hazisn3fEh/2BUikhnxMx3Wyp9YMxm/YfCCvP8a1l
         H4IRAUwogSyWctz59D0VCd1sI2lu6JdXgwM3TOk1lQ8BPfTgvMmsZhAD1y1XEcrVSYJ8
         FTkEtknCxWWByrppNDuALB5r+pwuIPmMaHxHgsNGpNRwx/nN4tW5IlNPEN8FZfP26OVv
         zDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=K5oqHdhYQsbfwq1JYk39e1I9fjT9r5f+6YhvHb0bQI8=;
        b=JnT02+urlEHAAytJ7vZdSUQyumxC5P5cR5ygZxXbTbLm6obkuzHmT+Y9jyjqi7I8hw
         37mt3q/exZbVJ6txuqoUQI6DsiM3AW2k485m/euCdscmWtBeHMmRKyXyeCVm/lD8bMcw
         6EujC+XeMxwZUJ1Szg+iQ7FVH0lchzUDQH2fxU5ZKPlIxSYBOihBwvKTJ7lloUyt10JP
         sKdy4XSYeEjcBUCIaulHEh5+46/RANBn5rLY2mJp5VVvBV7Nh8YMjt8qTMElIIYyQcrT
         WOf2nnkOp93obRSkRMLCXoWLE2IYVuBmU7fkJPRkUxqOWTPu9ybwvzLonTqVgiPU9pFm
         WIUQ==
X-Gm-Message-State: ANhLgQ34LaL61a1JB4ZAe5iIbKXRmZApV+fxiYbsRksKs4F/11ZSWpUc
        ZV3BZiozDsX/lyi++LKkX1tiXA==
X-Google-Smtp-Source: ADFU+vu4eyZf264stx6XXEuonL5I+rb48iCgNQ3uaj7b59BY/gStshUsUmb52p8X8SoOhZlTgoxJpg==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr155939wmf.109.1583170835939;
        Mon, 02 Mar 2020 09:40:35 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u20sm150314wmj.14.2020.03.02.09.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:40:34 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Hanjie Lin <hanjie.lin@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v9 0/3] arm64: meson: Add support for USB on Amlogic A1
In-Reply-To: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
References: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
Date:   Mon, 02 Mar 2020 18:40:34 +0100
Message-ID: <7hblper6y5.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Kishon,

Hanjie Lin <hanjie.lin@amlogic.com> writes:

> This patchset adds support for USB on Amlogic A1 SoCs.
>
> Because of my mistake I fogot to add PHY maintainer(Kishon) to mail list in
> before versions, so I have to send this v8(and lateres) version again(only with dwc3
> bindings and driver patch removed).
>
> This patchset is composed with :
> - bindings of the PHY
> - bindings of the USB Control Glue(already accepted in v7)
> - PHY Driver
> - USB Control Glue driver(already accepted in v7)
> - dts of the PHY and USB Controller
>
> The Amlogic A1 USB Complex is composed of :
> - 1 DWC3 USB controller for USB2 Host functionality
> - 1 USB2 PHY for USB2 Host functionality
>
> The USB Control Glue setups the clocks and the reset about DWC3 USB
> controller, and binds to the USB2 PHY. It also configures the 8bit
> UTMI interfaces for the USB2 PHY, including setting USB2 phy mode.
>
> The USB2 PHY driver initializes the phy analog settings, phy PLL 
> setup and phy tuning.
>
> This patchset is based on A1 clock/power domain/reset series at [0].

Gentle reminder ping.

Once you pick up the bindings and driver (patches 1-2) I'll pick up the
DT patch.

Kevin
