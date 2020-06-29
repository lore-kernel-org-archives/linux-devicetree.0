Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95A9C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 19:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EADD206E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 19:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="N7mXCg2N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730972AbgF2TLR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730760AbgF2TLQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:11:16 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B92C031413
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 12:11:15 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id n2so4858199edr.5
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 12:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NroMd8DfMK868D8FL8lie3B1iaJmWDlvZoIY161nvvg=;
        b=N7mXCg2NLcNbdNNrXCuFA8Af3Lc5aqsbv3Exg4+0dUr7yL0Eq863c9MSzQtN7Ej2vw
         FnhLnser4TEh0nkGuUNgvLAl4qwmK0dQma56oE1xG4vHWnM3BWjEgd9njb06gyQkFBpu
         tssbRMkIyNWgfrbRgqa+ealIZBwtD82n5H3qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NroMd8DfMK868D8FL8lie3B1iaJmWDlvZoIY161nvvg=;
        b=CSDD01URHxqN7wseJKTiSvcYq65zAbOr25fHRdqFt93W1tBf3AaPMQ+XeZ5fW4qIGa
         GPdYwbheXGty2UvWTDyQQsebMEVIfMZIDs0GI9TTSfqKp8Pp7dgzvRSOfZwfgtC/Go4q
         Lbn0ksYnv6SA0ghy9P9ITu2PmHSTkTdxFW0OtgsEfkfifUom3siCnUni8Lmrm0Tn96w5
         W7ykwkPECnWMeiodo1hZBtTG68FJpw8gO478r8/bkt+8gcRJMJL6I9WDKC3VXBvdUii5
         HWEJDatftHYpJ1Dma766o+J6bL6kgrawDS/jyVS01wvvBXVM1OQ6tZggp3gxegd0DRLz
         GENg==
X-Gm-Message-State: AOAM531wT+ZTbe/VbEPzAafy5020Fh52Az4Ri3SXN26vqFuQnnObzFuC
        kf6W/nOabvUuHRivHrKI9OwrQnJiKcAY/3Wltrkffg==
X-Google-Smtp-Source: ABdhPJzL7uVA+dVAF1QW30vuD7NCdhEOj1gDC9CMkWqkDjC97pJ9HEtE2P1H5GL5MRzD06Y+IN1VY11+kv6zy8NRcWE=
X-Received: by 2002:a50:c90d:: with SMTP id o13mr19293199edh.338.1593457874607;
 Mon, 29 Jun 2020 12:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200602080644.11333-1-mylene.josserand@collabora.com> <20200602080644.11333-2-mylene.josserand@collabora.com>
In-Reply-To: <20200602080644.11333-2-mylene.josserand@collabora.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 30 Jun 2020 00:41:03 +0530
Message-ID: <CAMty3ZDx-_-VHEwjbV05GBb-hQbPpo21aZbCrQ+GTaoT_gxAMg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: rockchip: rk3288: Handle clock tree for rk3288w
To:     =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@collabora.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        kernel@collabora.com, linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 2, 2020 at 1:37 PM Myl=C3=A8ne Josserand
<mylene.josserand@collabora.com> wrote:
>
> The revision rk3288w has a different clock tree about "hclk_vio"
> clock, according to the BSP kernel code.
>
> This patch handles this difference by detecting which device-tree
> we are using. If it is a "rockchip,rk3288-cru", let's register
> the clock tree as it was before. If the device-tree node is
> "rockchip,rk3288w-cru", we will apply the difference with this
> version of this SoC.
>
> Noticed that this new device-tree compatible must be handled in
> bootloader such as u-boot.
>
> Signed-off-by: Myl=C3=A8ne Josserand <mylene.josserand@collabora.com>
> ---
>  drivers/clk/rockchip/clk-rk3288.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk=
-rk3288.c
> index cc2a177bbdbf..204976e2d0cb 100644
> --- a/drivers/clk/rockchip/clk-rk3288.c
> +++ b/drivers/clk/rockchip/clk-rk3288.c
> @@ -425,8 +425,6 @@ static struct rockchip_clk_branch rk3288_clk_branches=
[] __initdata =3D {
>         COMPOSITE(0, "aclk_vio0", mux_pll_src_cpll_gpll_usb480m_p, CLK_IG=
NORE_UNUSED,
>                         RK3288_CLKSEL_CON(31), 6, 2, MFLAGS, 0, 5, DFLAGS=
,
>                         RK3288_CLKGATE_CON(3), 0, GFLAGS),
> -       DIV(0, "hclk_vio", "aclk_vio0", 0,
> -                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
>         COMPOSITE(0, "aclk_vio1", mux_pll_src_cpll_gpll_usb480m_p, CLK_IG=
NORE_UNUSED,
>                         RK3288_CLKSEL_CON(31), 14, 2, MFLAGS, 8, 5, DFLAG=
S,
>                         RK3288_CLKGATE_CON(3), 2, GFLAGS),
> @@ -819,6 +817,16 @@ static struct rockchip_clk_branch rk3288_clk_branche=
s[] __initdata =3D {
>         INVERTER(0, "pclk_isp", "pclk_isp_in", RK3288_CLKSEL_CON(29), 3, =
IFLAGS),
>  };
>
> +static struct rockchip_clk_branch rk3288w_hclkvio_branch[] __initdata =
=3D {
> +       DIV(0, "hclk_vio", "aclk_vio1", 0,
> +                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
> +};
> +
> +static struct rockchip_clk_branch rk3288_hclkvio_branch[] __initdata =3D=
 {
> +       DIV(0, "hclk_vio", "aclk_vio0", 0,
> +                       RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
> +};
> +
>  static const char *const rk3288_critical_clocks[] __initconst =3D {
>         "aclk_cpu",
>         "aclk_peri",
> @@ -936,6 +944,14 @@ static void __init rk3288_clk_init(struct device_nod=
e *np)
>                                    RK3288_GRF_SOC_STATUS1);
>         rockchip_clk_register_branches(ctx, rk3288_clk_branches,
>                                   ARRAY_SIZE(rk3288_clk_branches));
> +
> +       if (of_device_is_compatible(np, "rockchip,rk3288w-cru"))
> +               rockchip_clk_register_branches(ctx, rk3288w_hclkvio_branc=
h,
> +                                              ARRAY_SIZE(rk3288w_hclkvio=
_branch));
> +       else
> +               rockchip_clk_register_branches(ctx, rk3288_hclkvio_branch=
,
> +                                              ARRAY_SIZE(rk3288_hclkvio_=
branch));
> +

Sorry for the late query on this. I am a bit unclear about this
compatible change, does Linux expect to replace rockchip,rk3288-cru
with rockchip,rk3288w-cru in bootloader if the chip is RK3288w? or
append the existing cru compatible node with rockchip,rk3288w-cru?
because replace new cru node make clock never probe since the
CLK_OF_DECLARE checking rockchip,rk3288-cru

Jagan.
