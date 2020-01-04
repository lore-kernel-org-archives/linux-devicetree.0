Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEBBC32770
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0EBC24653
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJCkdJGo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgADGnD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 01:43:03 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40185 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgADGnC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 01:43:02 -0500
Received: by mail-qk1-f193.google.com with SMTP id c17so35504725qkg.7;
        Fri, 03 Jan 2020 22:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OKCx0KH4tkG9yRQceXGspszu095frq8n0bovCZ7QnE0=;
        b=QJCkdJGoeZr96+O1sG4Np/5ofJx9aIivdIeabs/KfkbZdSShLJh3lvQ5cr7I3enNBQ
         Ti8ZboAq8parJlayYLuZO9xuo6iSrqQFDQw5hDj6vVPW3pmBytv8DP0cSYjIRvGjJ0jH
         6AOa91OxSVLE/+MWsUtt7HFwQm5r9hk7I+kNhGvIaO/5zJGcvd/c6RSVgQqbsCLmijYp
         0JFSZE9Fx+9Pm99c7UDR/2hkMqy1MkVRzut9bB71lTjIYVTGACed1SHV5oUXwJqc3XOy
         ECD41HBNim5eReL+xKExV4vYLsOD58on2rOW7fT3LaVz2vGcQNEW7qc5F0eqQ74M+YWY
         Oulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OKCx0KH4tkG9yRQceXGspszu095frq8n0bovCZ7QnE0=;
        b=BBbtgESfiNdBcCFyAaW6+cDw8rN2Jk9cOnOZz/+rgnKYx4cFFjN/vJYUXN/5sXBOvu
         zpOWQN1tUyGuUA1D7oulmaJBs+OKarL+baGeynqfj4zS/y8h89F5HxURMn6EwehFgtyH
         o7ogqXQ7goCp7LE6qM9S+vr+q6F1krKYEQmLOQl+UtnOxCbDDybx3L/S6Qldb0m9Alt8
         ib/Tlo3zLjdKwa9/O6lxKRekxRafEPF8OZAq60JJz1BMaPqxT4HnnZDBTpXPYQpqyD9/
         LrUt4W6ZXTd+m8/FOS3RmqfpzNi33KPcx3c0NY50oQztYTxTZf9vn5YGOVi4zvTdc+wT
         uPag==
X-Gm-Message-State: APjAAAU7whYtmuQ+sTydldrrqx89S76hTNdhWQbY7pBiuRn+dw/Pxqn6
        ToQ88g0A+YuPwqNdSCO4jNgY7Pa+7QHUw75h5yQ=
X-Google-Smtp-Source: APXvYqzwJefkYr9GuFlkgk26uyY/jBUug2RhUE0HRAgdSsQhTaflvyrdnyLbh7KJRtUGub5s1F2SnaegFHI54btl3BQ=
X-Received: by 2002:a37:5d0:: with SMTP id 199mr72447394qkf.131.1578120181759;
 Fri, 03 Jan 2020 22:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20200104063505.219030-1-anarsoul@gmail.com> <20200104063505.219030-2-anarsoul@gmail.com>
In-Reply-To: <20200104063505.219030-2-anarsoul@gmail.com>
From:   Vasily Khoruzhick <anarsoul@gmail.com>
Date:   Fri, 3 Jan 2020 22:42:35 -0800
Message-ID: <CA+E=qVcS+bWNx6Sneg-JG4-NHQZ8e-ztszsPu8N2d8HawyDYqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: sunxi-ng: add mux and pll notifiers for A64 CPU clock
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        arm-linux <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Cc:     Icenowy Zheng <icenowy@aosc.io>,
        Vasily Khoruzhick <vasilykh@arista.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 3, 2020 at 10:35 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> From: Icenowy Zheng <icenowy@aosc.io>
>
> The A64 PLL_CPU clock has the same instability if some factor changed
> without the PLL gated like other SoCs with sun6i-style CCU, e.g. A33,
> H3.
>
> Add the mux and pll notifiers for A64 CPU clock to workaround the
> problem.
>
> Fixes: c6a0637460c2 ("clk: sunxi-ng: Add A64 clocks")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Vasily Khoruzhick <vasilykh@arista.com>

Ugh, didn't notice that email is wrong here, this patch is not related
to my daytime job. Maxime, if patchset is OK please fix it up to be
"Vasily Khoruzhick <anarsoul@gmail.com>", otherwise I'll resend v2
with correct sign off.


> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 28 ++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> index 49bd7a4c015c..5f66bf879772 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -921,11 +921,26 @@ static const struct sunxi_ccu_desc sun50i_a64_ccu_desc = {
>         .num_resets     = ARRAY_SIZE(sun50i_a64_ccu_resets),
>  };
>
> +static struct ccu_pll_nb sun50i_a64_pll_cpu_nb = {
> +       .common = &pll_cpux_clk.common,
> +       /* copy from pll_cpux_clk */
> +       .enable = BIT(31),
> +       .lock   = BIT(28),
> +};
> +
> +static struct ccu_mux_nb sun50i_a64_cpu_nb = {
> +       .common         = &cpux_clk.common,
> +       .cm             = &cpux_clk.mux,
> +       .delay_us       = 1, /* > 8 clock cycles at 24 MHz */
> +       .bypass_index   = 1, /* index of 24 MHz oscillator */
> +};
> +
>  static int sun50i_a64_ccu_probe(struct platform_device *pdev)
>  {
>         struct resource *res;
>         void __iomem *reg;
>         u32 val;
> +       int ret;
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         reg = devm_ioremap_resource(&pdev->dev, res);
> @@ -939,7 +954,18 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
>
>         writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
>
> -       return sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu_desc);
> +       ret = sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu_desc);
> +       if (ret)
> +               return ret;
> +
> +       /* Gate then ungate PLL CPU after any rate changes */
> +       ccu_pll_notifier_register(&sun50i_a64_pll_cpu_nb);
> +
> +       /* Reparent CPU during PLL CPU rate changes */
> +       ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> +                                 &sun50i_a64_cpu_nb);
> +
> +       return 0;
>  }
>
>  static const struct of_device_id sun50i_a64_ccu_ids[] = {
> --
> 2.24.1
>
