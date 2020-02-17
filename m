Return-Path: <SRS0=gY8B=4F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F626C2BA83
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 08:02:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68D9B20718
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 08:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dqjt/y5q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgBQIC1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Feb 2020 03:02:27 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40434 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbgBQIC0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Feb 2020 03:02:26 -0500
Received: by mail-wm1-f66.google.com with SMTP id t14so17271335wmi.5
        for <devicetree@vger.kernel.org>; Mon, 17 Feb 2020 00:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=l3DKox+qqztb4asvNOVtIBlg1suTqH8KA57WcRUyDeo=;
        b=Dqjt/y5qO0gWAFA+/BwiQiNhQnAs5jTW/fatxUCIn40u9KvZm+xZrPas0dS2viq7bb
         jgSlXwD9Suu+XUxmUNuKB+d41jrMD77xnjTrLbSIqa4rpt4hTuG1Vg6Z4PZf7vfR1y6M
         PZ7Bpfk3t0Ys/yTJcz2WswnxPbn+B1ZTgALvyA457dZ3sb0WFxc3i2SkN30NVfhEsrKn
         yjwGuobhZJuIsBjIXOX9C/RFy5ppYs4HMjiUY1y0tl983Am6BGddtiyrE5ozmCY/CSRh
         f8d7UZvXyRjgawetaECG7ERoPthoDmHd7MBqGqypHgUVhTfvROhg73+BQ+lZcKll+QrN
         JRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=l3DKox+qqztb4asvNOVtIBlg1suTqH8KA57WcRUyDeo=;
        b=MxhP/V/k1fNB0deLnS/NwrZDUyie+A1jeBDA9LoMr2XEetm6xKQyCXZfKobbRPSDAr
         LVFEwHrS9Tv7vPmndoN2eXa7xkCipc0e1MSqUQJrGS4lY+WaCtsr9nbPMc8me9R700Mt
         ltBwHPpdTucHvgi/XwVs9wKE8kuF6NQkIILr1HxNcQ5jWIGv/GzD3bWf66A9T8grN3pc
         zmPWb2GNnr7VuqDNTgYs5dKrYUkRFJZauNfm5luZoxeRoXS363scYcW3WCBpZaRMdrKS
         3s8GX+aA1BT73c+s13/TZpLXzLp2gUyqPab7shfbrtpHtNC7CVTsRv/4WIUmiuogz5EK
         BZ/w==
X-Gm-Message-State: APjAAAXsHAjs9lXTjR2TAhf+fHOtV9kqBYFyGEUmPhm8WHTkmIXtvQtb
        oGbktX0BdK6d5ESgOGSElmYc4A==
X-Google-Smtp-Source: APXvYqx9LI03PNOr2Q02TPi4B2aVKc1GmmsYFLd4WBERnUA2AA8pCg4ZZaiDAl6iYjkK/uI2Jjh6JA==
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr21757452wmf.189.1581926543185;
        Mon, 17 Feb 2020 00:02:23 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id f11sm18834522wml.3.2020.02.17.00.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 00:02:22 -0800 (PST)
References: <20200216173446.1823-1-linux.amoon@gmail.com> <20200216173446.1823-4-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCHv1 3/3] clk: meson: g12a: set cpu clock divider flags too CLK_IS_CRITICAL
In-reply-to: <20200216173446.1823-4-linux.amoon@gmail.com>
Date:   Mon, 17 Feb 2020 09:02:21 +0100
Message-ID: <1jmu9hzlo2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Sun 16 Feb 2020 at 18:34, Anand Moon <linux.amoon@gmail.com> wrote:

> Odroid N2 would fail to boot using microSD unless we set
> cpu freq clk divider flags to CLK_IS_CRITICAL to avoid stalling of
> cpu when booting, most likely because of PWM module linked to

Where did you see a PWM ?

> the CPU for DVFS is getting disabled in between the late_init call,

between the late_init call and what ?

> so gaiting the clock source shuts down the power to the codes.

what code ?

> Setting clk divider flags to CLK_IS_CRITICAL help resolve the issue.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>
> Following Neil's suggestion, I have prepared this patch.
> https://patchwork.kernel.org/patch/11177441/#22964889
> ---
>  drivers/clk/meson/g12a.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d2760a021301..accae3695fe5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -283,6 +283,7 @@ static struct clk_fixed_factor g12a_fclk_div2_div = {
>  		.ops = &clk_fixed_factor_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
>  		.num_parents = 1,
> +		.flags = CLK_IS_CRITICAL,

This makes no sense for because:
* This clock cannot gate and none of its parents can either. IOW, the
output of this clock is never disabled.
* I cannot guess the relation between fdiv2 and the commit description

>  	},
>  };
>  
> @@ -681,7 +682,7 @@ static struct clk_regmap g12b_cpub_clk = {
>  			&g12a_sys_pll.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Why not. Neil what do you think of this ?
If nothing is claiming this clock and enabling it then I suppose it
could make sense.


>  	},
>  };

