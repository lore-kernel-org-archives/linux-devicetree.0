Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0A0C433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 21:29:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1ECA7207DD
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 21:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xTAusJWg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgGPV3A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 17:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgGPV3A (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 17:29:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B599C061755
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 14:29:00 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m16so4433342pls.5
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 14:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=J6Y0MfVHAU4+ZgY/mepQU37GPL024rjIvlsLsAsgOa4=;
        b=xTAusJWgf6D79cQ/B0ekFnBpDtdUrtkP1aQg35prpLr1pwJx3AmVZ24SZxfwx03hqv
         hBlmCAF8HI3laFfGzMNK+NSjuhq7nxVB/D951yhkBKkdXgZk88rI2U9cuKUHL8GmYqoQ
         ANeU/oPb0Gr7BAVRxJSbDduT9d1M0cRsEH26mA2wDIetOBzZPu4OYcW7jYerqq0yunxB
         JEB02Hv8odPsmDUWkjzT8V76+iLzq5sS3LEQ0qdB3IdA8HmaM3LPjFGb3HPkKs7a/LoN
         BrelG+oZyEN2AbUqxQiUHuKWfFCYo9mpKp2rk76GJ6b6X6ECx0O/mUu8JUg0JQ7WJnRU
         9RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=J6Y0MfVHAU4+ZgY/mepQU37GPL024rjIvlsLsAsgOa4=;
        b=mK34Q4GvkaqUQypLNZ0+4IX9dAlSaqWHi5oIOxbOZTvIYBGxlItoXNytBgqS2txGZH
         7hVlIj1o0gL1UEh0dEYSW/s5X/G+EwDV/fPc3mho22cdbqm8IV2JTf88XQppLPqQRuyT
         e/WrMd3bv6s6PhAGe7VUlgDqzC7/XXSPrYNB5wMXqNv58NSYRwa7CCJr+WuPUbF0f3Rk
         qMc2Ji2p9S9CJOgs7iWq553HMYZr+KLbp3K0PWalJ/AJ1ZHoE8FJ4L8y9L9M5zj/FlOU
         9WBbox8eQIT+N9QTqMkLG9Hd2pGqrS5m4X7A5YL8BxK2P5isEZ479vu8i8g4CLQamL2+
         H1Og==
X-Gm-Message-State: AOAM531Uhh8yOrwAVEKzz+oiRfr5kVuKmR7/OWFZK41KdBI442mImI7+
        +6F2XA+482fH0dhKl9KLNUVfFw==
X-Google-Smtp-Source: ABdhPJz73I6mt0zkjhR/MvWi4S5nNWwIcspRU5QvWTWCL6CNuOkaP+j8UFV0E8pijfMGw6CBWKVlUQ==
X-Received: by 2002:a17:902:8d98:: with SMTP id v24mr5096592plo.301.1594934939634;
        Thu, 16 Jul 2020 14:28:59 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id x10sm5470069pgp.47.2020.07.16.14.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:28:58 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Anand Moon <linux.amoon@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCHv1 0/3] Enable RTC on Odroid N2
In-Reply-To: <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
References: <20200715160209.652-1-linux.amoon@gmail.com> <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com> <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com> <91fbbe36-d839-d864-7666-5483cc643a5e@baylibre.com> <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
Date:   Thu, 16 Jul 2020 14:28:58 -0700
Message-ID: <7hh7u7f8th.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi,
>
> On 16/07/2020 10:20, Neil Armstrong wrote:
>> Hi,
>> 
>> On 16/07/2020 10:14, Anand Moon wrote:
>>> Hi Neil,
>>>
>>> Thanks for your review comments.
>>>
>>> On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>>> Hi Anand,
>>>>
>>>> Only the vrtc is able to wakeup the device from suspend,
>>>> the external RTC is not capable.
>>>>
>>>> Neil
>>>
>>> Now I have two RTC driver registered
>>>
>>> $ dmesg | grep rtc
>>> [    4.737315] rtc-pcf8563 0-0051: registered as rtc0
>>> [    4.738763] rtc-pcf8563 0-0051: setting system clock to
>>> 2020-07-16T08:00:46 UTC (1594886446)
>>> [    4.790206] meson-vrtc ff8000a8.rtc: registered as rtc1
>>>
>>> And there are two nodes
>>> # ls /dev/rtc*
>>> /dev/rtc  /dev/rtc0  /dev/rtc1
>>>
>>> So it seames an issue that /dev/rtc0 is not able to handle wakeup events.
>>> How can we resolve this issue?
>>>
>>> # time rtcwake -s 30 -m mem
>>> rtcwake: /dev/rtc0 not enabled for wakeup events
>> 
>> rtcwake -d /dev/rtc1 -s 30 -m mem
>> 
>> As Christian reported off-list, it may be necessary to keep the vrtc as rtc0,
>> so you should add aliases in the odroid-n2 DT to have vrtc as rtc0 and the on-board
>> rtc as rtc1, but it may break the hwclock tools, so the reverse may be better
>> but you'll need to specify rtc1 to rtcwake.
>
> While looking closer to the Odroid-N2 schematics and U-Boot/SCP Firmware, the external on-board
> RTC can wake the device with the GPIO_AO 7, and wakeup is enabled in:
> https://github.com/hardkernel/u-boot/blob/odroidn2-v2015.01/board/hardkernel/odroidn2/firmware/scp_task/pwr_ctrl.c#L143
>
> So, something must be missing.

A couple possibilities come to mind (without looking at the specific RTC
driver):

1) pinctrl for that GPIO needs proper settings
2) DT node for the RTC needs "wakeup-source" property

Kevin
