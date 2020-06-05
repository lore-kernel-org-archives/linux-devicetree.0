Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517A6C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 17:57:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EB35207ED
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 17:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=anholt-net.20150623.gappssmtp.com header.i=@anholt-net.20150623.gappssmtp.com header.b="HWlIvo8G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgFER5L (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 13:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgFER5L (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 13:57:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB20DC08C5C2
        for <devicetree@vger.kernel.org>; Fri,  5 Jun 2020 10:57:10 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c11so12841353ljn.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2020 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYnGgbB/yUYHLwRnIgeOB2yfvVDg5PB29KwRpcC2gN4=;
        b=HWlIvo8Gx/GfSgNGX7LbvmwrB8R2/UprUCF6ZpGdTm5eFaUvsIhs/YyhRxIi6C0Bgu
         eKvjCs9vk7Z007hp+pg8+29RTakK0BG4LfZ6KfTBUENIJULV/m/bqBnWIrwsUs1JUM8/
         1/NGt2NwWfaMLuXqDXVe3Io4BwZBxhMbAeR1RevZ7FRe6WgNb1P0/6bzp39+eac5SSI0
         IJ2t/onuc/NeLjFksiSRP+9/3pOoJpsXpFqF1xvY2lFz/Ngtj3zgOT8AEn6f/pRSyZwx
         xSg9J8jx/18GSu+o8jK2uEzV4XTjjcqiZW53KhDmRBA/9Xatc7A9DzNlyF1ysAUOFHM0
         xEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYnGgbB/yUYHLwRnIgeOB2yfvVDg5PB29KwRpcC2gN4=;
        b=FCyDOP5hKibCB7r8aYgjElGbHpW4xL78W2uqA/ZgTNqw+bTVt71bcKBsMe0mGn/3Nn
         2S1btGbUOpOso1OIWTKEInOzOrGTpau5CBAaOsjGvjA+qN4Nyka3Kdx+L3r0xG4mvQZP
         2wfqItusBmQjRYyVlvGHXM3HsGzXubuk9qXlAgtFND4J/ScYOhyf1d+jeVO6CfIaOsuc
         RQmgxWS1McdMmHUdoJwdqL9uAZUh10rFSnUz8ml9kC/LsHstXgS9YLzd50kHsKBpIe1t
         TVAVKyDQ9Zv60deVbV6a57F+j9dTqM/+YckGgBfk7xhmLigY2tJ0pOMK/O5K5eHWpBPP
         1a3Q==
X-Gm-Message-State: AOAM530Psxrq7iw73lBwFaz6lQK2wiI3bYowYFAt/fZ7kgn664AZt+Tn
        HFLHM3qfQiq7/0lzTZ5BkzbzuoBoDi3V0WilcH+Hqg==
X-Google-Smtp-Source: ABdhPJz1QchXGicuq/e4UbyBXjj2+Lh2IaK3OLii9lagU/34toEvTJek1PSUAitdFBhMHfD0XxPR6jfp824v8PIIWqE=
X-Received: by 2002:a2e:8705:: with SMTP id m5mr5176522lji.269.1591379829143;
 Fri, 05 Jun 2020 10:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
From:   Eric Anholt <eric@anholt.net>
Date:   Fri, 5 Jun 2020 10:56:58 -0700
Message-ID: <CADaigPUOJMwR0y6CjVpu5+nPAvejbCvEQNLEC+EKq9haBaQynw@mail.gmail.com>
Subject: Re: [PATCH v3 004/105] clk: bcm: Add BCM2711 DVP driver
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 27, 2020 at 8:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI block has a block that controls clocks and reset signals to the
> HDMI0 and HDMI1 controllers.
>
> Let's expose that through a clock driver implementing a clock and reset
> provider.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/bcm/Kconfig           |  11 +++-
>  drivers/clk/bcm/Makefile          |   1 +-
>  drivers/clk/bcm/clk-bcm2711-dvp.c | 127 +++++++++++++++++++++++++++++++-
>  3 files changed, 139 insertions(+)
>  create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c
>
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index 8c83977a7dc4..784f12c72365 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -1,4 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +config CLK_BCM2711_DVP
> +       tristate "Broadcom BCM2711 DVP support"
> +       depends on ARCH_BCM2835 ||COMPILE_TEST
> +       depends on COMMON_CLK
> +       default ARCH_BCM2835
> +       select RESET_SIMPLE
> +       help
> +         Enable common clock framework support for the Broadcom BCM2711
> +         DVP Controller.
> +
>  config CLK_BCM2835
>         bool "Broadcom BCM2835 clock support"
>         depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
> diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> index 0070ddf6cdd2..2c1349062147 100644
> --- a/drivers/clk/bcm/Makefile
> +++ b/drivers/clk/bcm/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_CLK_BCM_KONA)      += clk-kona-setup.o
>  obj-$(CONFIG_CLK_BCM_KONA)     += clk-bcm281xx.o
>  obj-$(CONFIG_CLK_BCM_KONA)     += clk-bcm21664.o
>  obj-$(CONFIG_COMMON_CLK_IPROC) += clk-iproc-armpll.o clk-iproc-pll.o clk-iproc-asiu.o
> +obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2711-dvp.o
>  obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2835.o
>  obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2835-aux.o
>  obj-$(CONFIG_CLK_RASPBERRYPI)  += clk-raspberrypi.o

I do think that single driver is the right model here, but I noticed
that you're not using your new CONFIG_ symbol.  With that fixed, r-b
from me.

(though I'd also recommend devm_platform_get_and_ioremap_resource and
devm_reset_controller_register())
