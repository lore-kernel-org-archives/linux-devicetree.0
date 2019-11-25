Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98870C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 09:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FCC620823
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 09:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n0qMAxe/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbfKYJeG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 04:34:06 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34407 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfKYJeF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 04:34:05 -0500
Received: by mail-ed1-f67.google.com with SMTP id cx19so4307181edb.1
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 01:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hxAPhYLgkjAC0glPWrMWh5sNJUjuPwkk/Zd+BYl4dA=;
        b=n0qMAxe/w0ZeKERleFOBgcA9JrLOVHkheN7cFtom/PmRGQrdhoib8QphXajnbHidBh
         D3TTGA10ICGPuYSWRn+Nx6shOwHUJo4Xsr4kKkihn9TRCO6mk4UKTDY61uMzh8rBHaB1
         ZAU1sCWOo6enIe29Pcnf4VAkh4QO7aAQBoaHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hxAPhYLgkjAC0glPWrMWh5sNJUjuPwkk/Zd+BYl4dA=;
        b=MLOB/L88b6iOTXjLne4WKAJdS45bqDR0VJ2RjtYmJ8HbOYU/Q9jsFTqicm+tQCNP+I
         FYEh7/38yMFVwI9ddDi+cnHtHG4efyTKZiqyL41PHVD+n3e+kmnRrymt2SiNstILsYne
         KsmuEIAZNH87prVE4xHApD6e6lqevjqHrgwhl8/K9rHpUq+gzfITkSIBdVkZjOVRrbJ5
         qElpv/3XzXVI4n1ePFAEUSuKV78e33PzSnfsH3+QTTsfQ5SOpidAp61vKcWa3zisRKVa
         oIN8oRQRUu5lobgz244WM5Ihy6VNDnLF/I1YO+38x9sjLgBXC6MybrXY9pCQk+7drzES
         o45Q==
X-Gm-Message-State: APjAAAWD0jEav/bNpmIbQiEtAL4C3Uu6HZvpoS69jdgajO7bweqlQZQj
        99Mpco4tEkkI0nNoAeri0GHA9NH7zpkmAXV555h8EQ==
X-Google-Smtp-Source: APXvYqydDtp531AXtenv6mp5/TxUBdNXj0kZcXkFGGkNCV1naYHb2inz8WFVHVtUMbwv+kaqLxCZMeg6SBUFhIxhDSU=
X-Received: by 2002:a17:906:b856:: with SMTP id ga22mr17027902ejb.199.1574674444048;
 Mon, 25 Nov 2019 01:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20191031090213.27727-1-dongchun.zhu@mediatek.com> <20191031090213.27727-3-dongchun.zhu@mediatek.com>
In-Reply-To: <20191031090213.27727-3-dongchun.zhu@mediatek.com>
From:   Pi-Hsun Shih <pihsun@chromium.org>
Date:   Mon, 25 Nov 2019 17:33:28 +0800
Message-ID: <CANdKZ0cMCWKmFcF44M0LBgwa6a3rvD0JdqFgkcjHqVHwMUS6yg@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: ov8856: Add support for more sensor modes
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        andriy.shevchenko@linux.intel.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        sakari.ailus@linux.intel.com,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        bingbu.cao@intel.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
        shengnan.wang@mediatek.com,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, louis.kuo@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Dongchun,

On Thu, Oct 31, 2019 at 5:12 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> This adds two more sensor modes for Omnivision ov8856 image sensor,
> including the resolution of 1632*1224 and 3264*2448, both with the
> Bayer Order of BGGR.
>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  drivers/media/i2c/ov8856.c | 661 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 652 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 8655842..4815c26 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -3,10 +3,13 @@
> [...]
> @@ -1189,6 +1768,42 @@ static int ov8856_probe(struct i2c_client *client)
>                 return -ENOMEM;
>
>         v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> +       ov8856->fmt.code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +
> +       ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> +       if (IS_ERR(ov8856->xvclk)) {
> +               dev_err(&client->dev, "failed to get xvclk\n");
> +               return -EINVAL;
> +       }
> +
> +       ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
> +               return ret;
> +       }
> +       if (clk_get_rate(ov8856->xvclk) != OV8856_XVCLK_24)
> +               dev_warn(&client->dev,
> +                        "xvclk mismatched, modes are based on 24MHz\n");
> +
> +       ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
> +                                              GPIOD_OUT_LOW);
> +       if (IS_ERR(ov8856->n_shutdn_gpio)) {
> +               dev_err(&client->dev, "failed to get reset-gpios\n");
> +               return -EINVAL;
> +       }
> +
> +       for (i = 0; i < OV8856_NUM_SUPPLIES; i++)
> +               ov8856->supplies[i].supply = ov8856_supply_names[i];
> +
> +       ret = devm_regulator_bulk_get(&client->dev, OV8856_NUM_SUPPLIES,
> +                                     ov8856->supplies);
> +       if (ret)
> +               dev_warn(&client->dev, "failed to get regulators\n");
> +
> +       ret = __ov8856_power_on(ov8856);
> +       if (ret)
> +               dev_warn(&client->dev, "failed to power on\n");
> +

__ov8856_power_off is missing on the error path after the __ov8856_power_on.

>         ret = ov8856_identify_module(ov8856);
>         if (ret) {
>                 dev_err(&client->dev, "failed to find sensor: %d", ret);
> @@ -1241,8 +1856,29 @@ static int ov8856_probe(struct i2c_client *client)
>         return ret;
>  }
>
> [...]
