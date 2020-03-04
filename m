Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E6CC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 03:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACC0320726
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 03:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="krmkkN4V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387650AbgCDDpv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 22:45:51 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44665 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387640AbgCDDpu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 22:45:50 -0500
Received: by mail-wr1-f68.google.com with SMTP id n7so540761wrt.11
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 19:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dl4yIvdbNV8zUEZF0iJKHHNN3Cn7sHrjK08gaKgENUM=;
        b=krmkkN4V5zPIpMl1EPpZRD1webC/631MVKogbzCnK4d3YjLOrLOZDWnsNmM0IRwePB
         u5+remgX6B5Eyqy3000CS47e+Kuyh/oI4sNBIieCN5H+74G63bcAhvFyKLz5Diq/791C
         YGVGx3dST5jJ25lsJomJdOvOkADYQmUdBo5j3cDRmtGuXZZ4i8bdxBean3nmBoigyKHL
         avDmfaDxbG0Zf8KtISwZmadDC0AbpK5ft/vqa+VAqW1axj3EdTP+g7B9C8VgaOhwQvfI
         WWiwk7Y1or5Hmq42pVli4ci+9t82SN0Y5T0gz2/GbLHlS1Ao2uggNWioPKIkx/A/7OG6
         BfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dl4yIvdbNV8zUEZF0iJKHHNN3Cn7sHrjK08gaKgENUM=;
        b=G7bPOuCtbdBer4h3U6AbMvs/damPOXta2s/HR7tARvuho8PV5/tavRZLVoZ2OZNHEW
         iXa0Pz7oYIg2a6+hpfQ4FpYd4YyOOGZ5T5x1hqu877bkSyPrpxoEjVHaXETm63QiUJ1n
         4kiIjmYVHf62rv0Hlca6FEgKcbiz9Op1DAskqxIjErsr5BAVqsNndRztjb5/Q4TCxZJw
         fRPJGq1DKgPIQhMEAZ6inB2EljSUmdv9UKNW4KSSR4QeCOwOmhvYtRcekJcJ+TzfY1OX
         94J2PJh1BwPTO/e/UPCYDf5yZ3HrWD02CR+VlUvIZfvmzTdbHPMaA2YTa8NzojnhA/eI
         z0JA==
X-Gm-Message-State: ANhLgQ0dnv08I67dlc4Hf4LRD/2VoLbfaWnOHEH5C7xrLtZDWrwDcYvl
        nbxhQAUE/hmFqN/5C31VD+7VzOW2bT2WqaEr1lkVTQ==
X-Google-Smtp-Source: ADFU+vvJT3jupIF+x5Oj1qF5HLpZyr9Rp5nN4jMR5lQXgXCYyIIUg56PeBlrGlO8WTISClOKWSw3x4YkD0iH1eNa1gA=
X-Received: by 2002:adf:e90d:: with SMTP id f13mr1649750wrm.0.1583293549186;
 Tue, 03 Mar 2020 19:45:49 -0800 (PST)
MIME-Version: 1.0
References: <1582084147-24516-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1582084147-24516-1-git-send-email-yash.shah@sifive.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Wed, 4 Mar 2020 09:15:38 +0530
Message-ID: <CAAhSdy0jGQ+PZnwjb63Wpu-pyhUWCJdnspNJOwMbYyOxBTnJfQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: Add GPIO reboot method to HiFive Unleashed
 DTS file
To:     Yash Shah <yash.shah@sifive.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 19, 2020 at 9:19 AM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add the ability to reboot the HiFive Unleashed board via GPIO.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 609198c..4a2729f 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -2,6 +2,7 @@
>  /* Copyright (c) 2018-2019 SiFive, Inc */
>
>  #include "fu540-c000.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
>  #define RTCCLK_FREQ            1000000
> @@ -41,6 +42,10 @@
>                 clock-frequency = <RTCCLK_FREQ>;
>                 clock-output-names = "rtcclk";
>         };
> +       gpio-restart {
> +               compatible = "gpio-restart";
> +               gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
> +       };
>  };
>
>  &uart0 {
> --
> 2.7.4
>
