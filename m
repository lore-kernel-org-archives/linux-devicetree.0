Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98041C43141
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 05:30:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F46F20707
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 05:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bm7hmo71"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfKVFaZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 00:30:25 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41150 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbfKVFaY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 00:30:24 -0500
Received: by mail-ot1-f65.google.com with SMTP id 94so5151820oty.8
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 21:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kx1yQ2ubEiohF95o6dJ/xu7jQhtpeqgqKSgECbFNwQM=;
        b=Bm7hmo71iYwmnJK1S95rLm/DlUT2s5zRbjXugto1xyu21uN6cEztDamJ1W4uxy7EJN
         7p5IsY0HFCXR+mCEfjTjwAGy3Wb8EArljOPhx3rZrxx/2kuz8dgWwOcAiNaLZQM/iVIG
         JV9V735o1BNC+4JWknKAgGyPfvOpTFZ56Xdk7k3TgDSjVyzgqOvMTdp0VUSE+mZfnwLV
         dqtjF/RYzEJVIlYV2tQvEA2Sy0Jh91Vnec0PALPc1F8rK3FGNE65Du6HtheDWI/C0ibQ
         DmjIbaqMICw3mVfvPY3i/PKF7A3lA3CDEl3FImxJKzggG9dRQe7zKtrlCrYo6nK2k3Sq
         NMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kx1yQ2ubEiohF95o6dJ/xu7jQhtpeqgqKSgECbFNwQM=;
        b=Rimew1F7+EBMViZovqQPRS/eBC7OK4vXxI1B3KtwcDobUr+jwCwl/F52goWu8Zk2sv
         7XvYhbqz+9X7Ot4tPEnNGond9feqb6xfXvQ/s9bUxtAfz3yrL4cmAWPFhWr6GiNn5Pm1
         9oTrqdy3kx+bFkHm2NywgmS4kSPy4IH6MSK4vg4ImWOnkS7GqalWSD7r2JP1qfc87vmr
         Mdzk1jzsZZQtqDESCA5EFUhihRxcjIa51wMbis1EUSxaTRXxFPAvQVE9jolOdMLUUiaG
         Dt1ITogQ1HPsq0vcyoSqe5q3sR+8PjyvbpM+kZeXF9n2Wpo9BDZvVId/nd8og1zSrNCp
         +ktA==
X-Gm-Message-State: APjAAAXUg9dcfsT50Yme6iPgNv+kjOJBQonwuPHOuGI8m7PFth+tg1Tr
        2645AiZi49s46mMqYEbUamoncKTyvy8OTzWYDumufw==
X-Google-Smtp-Source: APXvYqx6q9oWnlWD1uY/CpDpWnp4391UeWY5xQCBv1zgj50yTa5h+EB0wqoeFL6KWA4G6ysM9K4vNZXTuW5bka/SzUI=
X-Received: by 2002:a9d:5d1a:: with SMTP id b26mr9518420oti.139.1574400623580;
 Thu, 21 Nov 2019 21:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20191120071302.227777-1-saravanak@google.com>
In-Reply-To: <20191120071302.227777-1-saravanak@google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 21 Nov 2019 21:29:47 -0800
Message-ID: <CAGETcx8cRnWuye_paUhHGu_rmWcLnFxN=kW7WJ-_0D2Q0KtDmg@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add device link support for
 interrupt-parent, dmas and -gpio(s)
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 19, 2019 at 11:13 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Add support for creating device links out of more DT properties.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/of/property.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 0fa04692e3cc..dedbf82da838 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1188,7 +1188,11 @@ DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
>  DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
>  DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")
>  DEFINE_SIMPLE_PROP(io_channels, "io-channel", "#io-channel-cells")
> +DEFINE_SIMPLE_PROP(interrupt_parent, "interrupt-parent", NULL)
> +DEFINE_SIMPLE_PROP(dmas, "dmas", "#dma-cells")
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> +DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> +DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
>
>  static const struct supplier_bindings of_supplier_bindings[] = {
>         { .parse_prop = parse_clocks, },
> @@ -1196,7 +1200,11 @@ static const struct supplier_bindings of_supplier_bindings[] = {
>         { .parse_prop = parse_iommus, },
>         { .parse_prop = parse_mboxes, },
>         { .parse_prop = parse_io_channels, },
> +       { .parse_prop = parse_interrupt_parent, },
> +       { .parse_prop = parse_dmas, },
>         { .parse_prop = parse_regulators, },
> +       { .parse_prop = parse_gpio, },
> +       { .parse_prop = parse_gpios, },
>         {}
>  };
>

Rob,

Any chance I get an Ack/Review please?

-Saravana
