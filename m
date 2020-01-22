Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0095C33CAF
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 21:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8069424673
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 21:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U+oDtBN2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbgAVV3W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 16:29:22 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44346 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729351AbgAVV3U (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 16:29:20 -0500
Received: by mail-vs1-f66.google.com with SMTP id p6so374263vsj.11
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 13:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vTz0lK4MWaaIUm1zOO05D9tP3L8z6e5/rjhy199CFHA=;
        b=U+oDtBN20djYD2BA6vTb8zmhw0901lDwsc+HsVWuPXXCQLBVtJR/ejKZ8cNJ3WMe4Z
         /CN4krHpVSEHOfAhc3Jk9LW1RRz3N4rTwDvEh+yEa4T56iundLwEjbRdtG2cdSBVC303
         v595x/352B+y2PS70/UoqhIh1JCRGHYwWJfd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vTz0lK4MWaaIUm1zOO05D9tP3L8z6e5/rjhy199CFHA=;
        b=RF/2Wq4Y/mV6mjAnbXXY6Ax5IKCbyiqfoq87WYs1s16dgQVaXkBlPTxusWyicNmTYq
         bBtX0s7jqgDySCwOCxCVslIFYVQcde4vjj5V25q21p+9EjcIT1XvMg+IAdwzo8ZOYrxp
         CBh4BK9eWIRgZz41z5udhIInjeLMl2zDYRt71gue+M6SIh0vJQnW8fzMfHOntdAWIAkM
         PpXzKTcsw19iOSctNBUA4yA3lBebecgokekcYHyu96oJ920tXN9MMgWXcxoX28FN3xlK
         20nD3ac2wUwbFxwyLsRqPqkteErjbbpwrkSGTfmNGgW6LACHS/XRgF4R6DnNMu7wM7GL
         ++Qw==
X-Gm-Message-State: APjAAAUG/L5oTbLgRlLP2FxBtKidf/3SDwLzxMw+qjp+fYfERiunJTMl
        YoKzQJCZsgWA8n3rsRcq7GJW3UThX/g=
X-Google-Smtp-Source: APXvYqzkW31i5aR8dEFb+DWnfC0u/plcAVb5sF3qVZmw1IfUXXxZeeW+GZ5zbmKJ6KNsd36Gq+2cSg==
X-Received: by 2002:a67:f81a:: with SMTP id l26mr4022917vso.194.1579728559033;
        Wed, 22 Jan 2020 13:29:19 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id v68sm28263vkf.20.2020.01.22.13.29.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 13:29:17 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id g23so393122vsr.7
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 13:29:17 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr4193371vsd.106.1579728557149;
 Wed, 22 Jan 2020 13:29:17 -0800 (PST)
MIME-Version: 1.0
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org> <1577421760-1174-4-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1577421760-1174-4-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Jan 2020 13:29:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UxTDkwr8Z43TGXjpU6bKRN3ns2BdShKehAga4gkLUpLQ@mail.gmail.com>
Message-ID: <CAD=FV=UxTDkwr8Z43TGXjpU6bKRN3ns2BdShKehAga4gkLUpLQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: Add modem clock controller driver for SC7180
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Dec 26, 2019 at 8:43 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Add support for the modem clock controller found on SC7180
> based devices. This would allow modem drivers to probe and
> control their clocks.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig      |  9 +++++
>  drivers/clk/qcom/Makefile     |  1 +
>  drivers/clk/qcom/gcc-sc7180.c | 70 ++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/mss-sc7180.c | 94 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 174 insertions(+)
>  create mode 100644 drivers/clk/qcom/mss-sc7180.c
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 3b33ef1..5d4b6e5 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -245,6 +245,15 @@ config SC_GCC_7180
>           Say Y if you want to use peripheral devices such as UART, SPI,
>           I2C, USB, UFS, SDCC, etc.
>
> +config SC_MSS_7180
> +       tristate "SC7180 MSS Clock Controller"
> +       select SC_GCC_7180
> +       help
> +         Support for the MSS clock controller on Qualcomm Technologies, Inc
> +         SC7180 devices.
> +         Say Y if you want to use the MSS branch clocks of the MSS clock
> +         controller to reset the MSS subsystem.

I didn't review your whole patch, but I was skimming through things
and trying to figure out what the heck a "MSS" clock was for a while
before I finally thought to look at the commit message and figured out
that it probably means "modem subsystem".  I assume you're going to
spin this patch somewhat soon.  When you do, can you please expand the
"MSS" acronym somewhere in your KConfig description?

Thanks!

-Doug
