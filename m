Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E892AC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 02:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7D1C20657
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 02:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gF+uWURR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgFDC3d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 22:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgFDC3c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 22:29:32 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58576C08C5C0
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 19:29:32 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id n188so983797vkc.11
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GiZwMzoPS09yzBU7S2hJ7r+gRIFX95ple22IuWgCNw4=;
        b=gF+uWURRh8uwv2hzNLJPZDege+6/RxAKTa99l8IPtuMOxNN3gLY9hIZiknH3Fkeaar
         cvBMdieSIb+hccNBsqfqKdjKbGDy19j8gffbEb5p9RQpriNR8VSJwJB2NL9Ukxk0KgxX
         RUd+vKOB/CvPR0X5Es5srwyCY/HvUcznw45jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GiZwMzoPS09yzBU7S2hJ7r+gRIFX95ple22IuWgCNw4=;
        b=kNNkKpHIe91xCxOqE9+ZeKYe5zBjHW3HcJTZXHSXYQdnids2jzOYaLtFgJu8yqojbC
         5HZJnswPGTfAkF710ukUBSZc+ODQKQnMNWPTuOKEI0dYCIBr1nElPtF6dC/qdiZQpTiY
         41kIKhg2rig+umoJz8ztMBWUiOkhOj6cYbuY1Gh0PLmUeHM2KClWt/GhMRugndICxE3r
         I7KZl0ffRmczfBKkEaMAbGWzR7NhHnUcvCinLnrv7QrtvXJURV8Dmhf+D7hNQaDlPKDn
         DaZFtFWdxQB+PV726ijsFH6lwKIbjPzDTefRWP9JtzrNNjlGsauKzY+aHwTPs/aHxtWR
         mqJw==
X-Gm-Message-State: AOAM532cJZl/biy9NPRqne8XSvOPDrVDS98/+eXhXqg8DPCOweDhDWw6
        293/qe9HrE1nOaeyjnVi7G1d3G7LxOJQ07iwvb3nEQ==
X-Google-Smtp-Source: ABdhPJyOkMxi3kmXQuLdkLG0TI4YGq6+Fj1A2qCxPvej1w2D2dixQYceehb742uQ5rO3puyZGIjvnIKc79wo0ALTZ+8=
X-Received: by 2002:a1f:8d0a:: with SMTP id p10mr1986031vkd.33.1591237770303;
 Wed, 03 Jun 2020 19:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <1590051985-29149-1-git-send-email-weiyi.lu@mediatek.com> <1590051985-29149-7-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1590051985-29149-7-git-send-email-weiyi.lu@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 4 Jun 2020 10:29:19 +0800
Message-ID: <CANMq1KBRe81Sa4A6sCM2egOVRWCJbUNPsXHpfzkT33XGVZXBhg@mail.gmail.com>
Subject: Re: [PATCH v15 06/11] soc: mediatek: Add subsys clock control for bus protection
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 21, 2020 at 5:06 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> For the bus protection operations, some subsys clocks need to be enabled
> before releasing the protection, and vice versa.
> But those subsys clocks could only be controlled once its corresponding
> power domain is turned on first.
> In this patch, we add the subsys clock control into its relevant steps.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 62 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 59a525a..ef2c668 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> [snip]
>         val |= PWR_ISO_BIT;
> @@ -498,6 +511,39 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>         return ret;
>  }
>
> +static int init_subsys_clks(struct platform_device *pdev,
> +               const char *prefix, struct clk **clk)
> +{
> +       struct device_node *node = pdev->dev.of_node;
> +       u32 prefix_len, sub_clk_cnt = 0;
> +       struct property *prop;
> +       const char *clk_name;
> +
> +       prefix_len = strlen(prefix);
> +
> +       of_property_for_each_string(node, "clock-names", prop, clk_name) {
> +               if (!strncmp(clk_name, prefix, prefix_len) &&
> +                               (clk_name[prefix_len] == '-')) {
> +                       if (sub_clk_cnt >= MAX_SUBSYS_CLKS) {
> +                               dev_err(&pdev->dev,
> +                                       "subsys clk out of range %d\n",
> +                                       sub_clk_cnt);
> +                               return -EINVAL;
> +                       }
> +
> +                       clk[sub_clk_cnt] = devm_clk_get(&pdev->dev,
> +                                               clk_name);
> +
> +                       if (IS_ERR(clk[sub_clk_cnt]))
> +                               return PTR_ERR(clk[sub_clk_cnt]);
> +
> +                       sub_clk_cnt++;
> +               }
> +       }
> +
> +       return sub_clk_cnt;
> +}
> +
>  static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
>                         const char * const *name)
>  {
> @@ -596,6 +642,18 @@ static struct scp *init_scp(struct platform_device *pdev,
>                 if (ret)
>                         return ERR_PTR(ret);
>
> +               if (data->subsys_clk_prefix) {
> +                       ret = init_subsys_clks(pdev,
> +                                       data->subsys_clk_prefix,
> +                                       scpd->subsys_clk);
> +                       if (ret < 0) {
> +                               dev_err(&pdev->dev,
> +                                       "%s: subsys clk unavailable\n",
> +                                       data->name);

init_subsys_clks should already have printed an error (directly or
indirectly), so this is not needed.

> +                               return ERR_PTR(ret);
> +                       }
> +               }
> +
>                 genpd->name = data->name;
>                 genpd->power_off = scpsys_power_off;
>                 genpd->power_on = scpsys_power_on;
> --
> 1.8.1.1.dirty
