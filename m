Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7342EC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 07:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4718520720
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 07:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jWUuOlL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgGPHFb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 03:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgGPHFa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 03:05:30 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6D4C061755
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 00:05:30 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id o11so5834192wrv.9
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 00:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xnwEWTM3KmMKzqmUNcrqIITY6Tr4tpmN5RT2gCTfYes=;
        b=jWUuOlL7mK4Ll5vcGcwYTVTo72RRBKMBcl8zRntFxXiSjrGJTdftTdl0JoXRthWbqI
         BpyqN5LJkuTV+A8UztBmHrsmY0VHx53332qUbFH1Lp1tMc7LEok3ImVhOrlEsdxfkXKM
         ED9DyP7NPsQaRYLjYAiDQJFRCmKEj6PfEKtHff6Vc8p7pzhdp8VdNeFak4GppE9FIxjM
         Fmw+bo4dwISK7gPw18R6WvbCVglEKfZUbdhKd+fM+vqqIGhcMcJzbqJKcmvA/vc6fm+C
         /SyyFIp3i6rdjIQrDiJ5JgnJDRWg2wW0h6H+835IfKJQyDsWleRaQ3CuLOr5MEOHK1WI
         87uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xnwEWTM3KmMKzqmUNcrqIITY6Tr4tpmN5RT2gCTfYes=;
        b=BBs2f/XfH8/5S8phnLY/8jUItyMO5ZCtsj6lzdj8cHyVmi8pFoGKkpYSESIKgTh3po
         EnppgaI3BStgVAmvtjyc8g8z2bWH+NvXu1r5q3qbiQw2T9cloQnVBL3pANiTNh1CAj/Z
         pRTUyoA5RMfmb1h6g6RJHGBUE6QTgFhXkl8Yqkpi6AsrgJroBrKxpHH7SxoZknXvmzWT
         JmYJvs5MJGQXwFewTQsoKl8qvpNfVxy2aJva8NXeDzowOojcUI+NXH6zuMV4heq7tFSj
         xefPCGZM1ltOP6g30OHtLM/eaSHkI5hTagrY/pSICo88MCv0n2MoK4/7otreVwbDXQDq
         9Q6A==
X-Gm-Message-State: AOAM532SLjcspdfQr3SR0k9Bvzj0gcgyWTzaWMfmy8p5w18qBPCwGBwB
        CcZiyJydBs6kjBZnvzzHz638zQ==
X-Google-Smtp-Source: ABdhPJxX9m0eCJg2dgiB0XA53Is9GKO68rzLt1HUsaNVWlJ/MKPZJoxcmSK1ac6Q0XBipXD3Iasb7w==
X-Received: by 2002:adf:dc90:: with SMTP id r16mr3600408wrj.264.1594883129111;
        Thu, 16 Jul 2020 00:05:29 -0700 (PDT)
Received: from [10.1.3.173] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a15sm7929400wrh.54.2020.07.16.00.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 00:05:28 -0700 (PDT)
Subject: Re: [PATCHv1 0/3] Enable RTC on Odroid N2
To:     Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <20200715160209.652-1-linux.amoon@gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
Date:   Thu, 16 Jul 2020 09:05:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715160209.652-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Anand,

Only the vrtc is able to wakeup the device from suspend,
the external RTC is not capable.

Neil

On 15/07/2020 18:02, Anand Moon wrote:
> Inoder for test suspend resume feature on Odroid N2
> we need to enable RTC module on this device.
> 
> Following patches enable rtc on Odroid N2
> but sill rtcwakeup is not working se bellow.
> Any inputs are welcome.
> 
> # sudo hwclock -r && date
> 2020-07-15 15:53:27.706883+00:00
> Wed Jul 15 15:53:27 UTC 2020
> 
> # echo 1 > /sys/power/pm_debug_messages
> bash: /sys/power/pm_debug_messages: Permission denied
> # time rtcwake -s 30 -m mem
> rtcwake: /dev/rtc0 not enabled for wakeup events
> 
> real    0m0.003s
> user    0m0.003s
> sys     0m0.000s
> #
> 
> -Anand
> 
> Anand Moon (3):
>   arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
>   arm64: dts: meson-g12b-odroid-n2: Disable virtual wake RTC
>   arm64: defconfig: Enable RTC devices for Amlogic boards
> 
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts  | 18 ++++++++++++++++++
>  arch/arm64/configs/defconfig                   |  1 +
>  2 files changed, 19 insertions(+)
> 

