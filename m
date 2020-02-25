Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74222C35DE1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 13:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 485DE20658
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 13:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZudqYNc9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgBYN3d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 08:29:33 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:33146 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgBYN3c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 08:29:32 -0500
Received: by mail-il1-f194.google.com with SMTP id s18so10806865iln.0
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 05:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5lF3WK73j83uTzBWoCX+piYUTJ8gjsoXLtNVHKHOJEo=;
        b=ZudqYNc9t8VwUeyXbtkRxh8lHGluXfeSSnakCvOJToZqfk4qvsQlCH5HWcFuWFaSJY
         QB0PCG/XOyXPyQzeJHM6qIGzZi2oGpf+T97sLBaopJqBANRWwXaPjcIp/Fh94UXWk4DZ
         sshe0t0+EG3dY58wRPsK1EuCjFaqqHhU0tt7iB5CsWLuOQ49+uOjOskk4sjR4OxMIur/
         MKWF9WdCxtizbtfQDGIcdnMbfhkt8mdYuUEmEUNYxpNc7LYbHwwN5tNm4e9xGy3CYiAy
         ajPAYcgwY/Yqa3nYUAUYEPRogUsvKrTaTjbCNmdLs39GyxALyDALM/WWMTelf0psha2Z
         EnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5lF3WK73j83uTzBWoCX+piYUTJ8gjsoXLtNVHKHOJEo=;
        b=Nt2GKPYXgDq6NueMx2Aazwn7bAhoTgY/w5DKmiZK5zmigRwnZK9C7joIhpj1rzosU2
         /X0POgMvfEkL4VIe9DUGKRtwbLLTZ+9loiIsGvY+e8RyjESYChnREvzf8aIq+Wm32Ee2
         jzG8tfJCovgh+90Mj75kJ6O8hKch/6wwPRCwlKMVy9GB1eTI2OHOVtqTKH6zWCsFz65m
         ZULngevRVR/YfNDYsHNPUYlwfo3cWQYG9xqCrXUb6LXGUMpjPnUAdzijZ6cjEePrWh17
         /fW8jqdhrry7b6MBT/QGOn2kfXJv97h0P/Bxnb82t9UbcuovgNTxNeh6RAOUUTVYJ2lt
         r4EQ==
X-Gm-Message-State: APjAAAW+lnJCCfEolYnkozmO5ia6L8Fb7pAvXmMYEUlQ9zsJXky/mfcc
        M0r+6OptpctGaiU6e6nKpyERFBACxaY5z1au8sSFUTq8
X-Google-Smtp-Source: APXvYqxRLwQApYXLXAJc3nFCmhsetmCMQtqeunUdez14f4lqjAVrvxj3k8VFZFvSyQxmInPtjkQ93a/MwESfN08c7uk=
X-Received: by 2002:a92:9cc6:: with SMTP id x67mr68531411ill.31.1582637370664;
 Tue, 25 Feb 2020 05:29:30 -0800 (PST)
MIME-Version: 1.0
References: <1582480985-6773-1-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1582480985-6773-1-git-send-email-stefan.wahren@i2se.com>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Tue, 25 Feb 2020 13:29:19 +0000
Message-ID: <CALeDE9P3ksuvLeiki5HSnAjQTs4tM_bhspB-ktMWiy85SZocSg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bcm283x: Add missing properties to the PWR LED
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> This adds the missing properties to the PWR LED for the RPi 3 & 4 boards,
> which are already set for the other boards. Without them we will lose
> the LED state after suspend.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com>

Tested on a 3B+ and a 4B. On a related note it seems that the original
RPi3B is missing the pwr led entry altogether, is that expected given
that at least the 2, other 3 models have the entry?

Peter

> ---
>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts      | 2 ++
>  arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts | 2 ++
>  arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> index cb33852..f242834 100644
> --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> @@ -31,6 +31,8 @@
>                 pwr {
>                         label = "PWR";
>                         gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
> +                       linux,default-trigger = "default-on";
>                 };
>         };
>
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
> index 66ab35e..28be033 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
> @@ -26,6 +26,8 @@
>                 pwr {
>                         label = "PWR";
>                         gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
> +                       linux,default-trigger = "default-on";
>                 };
>         };
>  };
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> index 74ed6d0..3734314 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> @@ -27,6 +27,8 @@
>                 pwr {
>                         label = "PWR";
>                         gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
> +                       linux,default-trigger = "default-on";
>                 };
>         };
>
> --
> 2.7.4
>
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
