Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B0BC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 19:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 957A9207DE
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 19:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="a52ZRAy6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgHTTdW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 15:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgHTTdU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 15:33:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDBDC061385
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 12:33:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a79so1530415pfa.8
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=+NH/EVilIs+rc2YfZDn/KduJaW1ughyXrixoRfqTCIk=;
        b=a52ZRAy6tM+mLgU6pf1voK51zdKMcXLuFfrZMPaNRAmgY3Rc2pCWMQLyex+qSiiX7p
         O8kHKxTBNXujlNeS4jq8ONBrjXFYgfUkDIJbkunM5Gh/nsXqDNthTC3rLa1czC+qKzb+
         aNrbPhZl2whNRdYJXCONnQzIDe0rdBXyZA3p1vbIb+HATQU2AsLHELWGEtW/0j6x7Mhu
         TxUuDL2zQ4Ka1c1kSZv4r4gSE/5wzSGe1Hq6WyRGfcG9mAwogqMjpmsfBcpBaaLnb/pF
         MXwqsHYI9FmAVFjg0PR7kUHZ2l8M07otXKANO/0dhQl4OEFylr8xrPb5PErnoGddMGNJ
         v5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=+NH/EVilIs+rc2YfZDn/KduJaW1ughyXrixoRfqTCIk=;
        b=ZF33ecoqmV45in+Nidpt5SwWlzLN+VbIRjS6uK71LOh7QIlV5IpF7dvOfnzE1seR1W
         TC1cHLZXGjJWGbUGxv0VflZsWAlCUs3E+f+BO71ZFGgNhJcuKBjyLbbhowqHQdFgmaRO
         eXs3CqX7NZfyL6N5iZdmTcVh2MJx7zjehcmohqZfQlQRw/XMY+RRyoXM4plBVgUlptLb
         5Xgf8fbZsaokj97A1PGW/xmlbub9XNu8vNHP2T1itlgXCpgxnw7f4c0FeQTJ/o/HyJ0E
         ltHIk7Cl2mqpAX94KtoCyVVOVvGcQmaGxMaRxErhRXJApO++8GGTkunuqRguK6Uer/NH
         o+wA==
X-Gm-Message-State: AOAM5339qsJ0Vkt/dLp3Tixe5/gatGxXoyRarOE/djL+wgFG7qzab1Jb
        rh13z2hluahliwYFhKmytrt9sQ==
X-Google-Smtp-Source: ABdhPJwWDh+QCKjM50OxojdKZ7o5q7ckFzlrT8jwHIcJG1vtl++X4ANR5i4yapkZVKF8T+UexxbH/A==
X-Received: by 2002:a65:60c5:: with SMTP id r5mr208358pgv.283.1597951999356;
        Thu, 20 Aug 2020 12:33:19 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id w16sm3457029pjd.50.2020.08.20.12.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 12:33:18 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
In-Reply-To: <20200820121323.564-2-linux.amoon@gmail.com>
References: <20200820121323.564-1-linux.amoon@gmail.com> <20200820121323.564-2-linux.amoon@gmail.com>
Date:   Thu, 20 Aug 2020 12:33:18 -0700
Message-ID: <7hlfi9xgch.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Anand Moon <linux.amoon@gmail.com> writes:

> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> support the RTC wakealarm feature for suspend and resume.
> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> timer device to prevent it being assigned to /dev/rtc0
> which disto userspace tools assume is a clock device.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes V3
> --Drop the INI GPIOAO.BIT7 pinctrl.

Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
wakeup the system?  If so, this should be included as part of this
patch.

It probably still works because the bootloader configures this GPIO as
input, but the kernel should not rely on the booloader for that, so
please include as part of this patch.

Other than that, this is looking OK.

Curious how you're testing this?

When I tested with rtcwake (from buildroot), I'm getting this:

/ # rtcwake -d rtc0 -m mem -s4
rtcwake: RTC_RD_TIME: Invalid argument

Kevin
