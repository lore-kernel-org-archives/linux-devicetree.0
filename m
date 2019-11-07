Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4113AC5DF60
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 04:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1771D218AE
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 04:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KeT43MVj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733101AbfKGEYz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 23:24:55 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:35606 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733038AbfKGEYz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 23:24:55 -0500
Received: by mail-il1-f193.google.com with SMTP id z12so579923ilp.2
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 20:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NkSeoMnuWg5T7g24I3SC9PrtQXIiA61Z2VNxVdt/qfE=;
        b=KeT43MVjU2B4DpAy2SYkA6NIhlp0NXSIvrPo/xsJrBm01MgR7r5J7gwjL6ER2SKvvu
         6zZI/iChBctFpUxgVnyp2K9HXsspnceqjcg0uSaOkMkVpQYDzb35q4B4mpiwWuV4v6yj
         34iZRafJSCVKeLd8feC04XhdnMKrH3chAmGDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NkSeoMnuWg5T7g24I3SC9PrtQXIiA61Z2VNxVdt/qfE=;
        b=R5O6ORhijUifZLmi5Fz2HX5TyGqSw8mGCSxu3IHbhj89MbZKKI46K8VKXvaXanH8mw
         ITTiPUFA0vPhDz0kD9MAepfQkjG7QUtkpqibLHPgjTo3AQUFmeWz+Jf9fQLfcZTG21Zt
         ylrrVZgKhMojbVO+T5NORDxzYJEOiOilA0bta7CafrLhI9C+h7FV50rONqNDYssvNpmA
         RIvCayxVM07uM4Xh3ihec7Mgsreg/O9GpDzCDPKV6pfn6EQ6xcJeMhBe6+4nQnZMNmER
         XZ/hJwrQ8GmNdDh/Mwo7zfrKeLDOjmHttAdzXpyXsjnMRml/6LcauCjaa6ElVy7ES2EX
         WMqw==
X-Gm-Message-State: APjAAAUFt7I3KQRSzxv3BmOq22ZMOUmQIxXHL/reFUj+VasUNekjrkDV
        E4EG+c5z946k/TVgCbBKUyTlWsO/UJI=
X-Google-Smtp-Source: APXvYqxDmQBDO7hqVZEssxc0vqXEwEoto7MXa3IxsaypY+lfzSxN1FB5X1Dc0ITZlvzbbOXtCnASHw==
X-Received: by 2002:a92:8dd9:: with SMTP id w86mr1665642ill.93.1573100694560;
        Wed, 06 Nov 2019 20:24:54 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id c83sm77690iof.48.2019.11.06.20.24.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 20:24:53 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id z10so556108ilo.8
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 20:24:53 -0800 (PST)
X-Received: by 2002:a92:109c:: with SMTP id 28mr1827293ilq.142.1573100692855;
 Wed, 06 Nov 2019 20:24:52 -0800 (PST)
MIME-Version: 1.0
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Nov 2019 20:24:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UjwO25HeVtYvzqEdUxyA4ED18ZxcwEaYVzBGRFTa2FTw@mail.gmail.com>
Message-ID: <CAD=FV=UjwO25HeVtYvzqEdUxyA4ED18ZxcwEaYVzBGRFTa2FTw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] clk: qcom: clk-alpha-pll: Add support for Fabia
 PLL calibration
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

On Thu, Oct 31, 2019 at 5:21 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> @@ -1141,15 +1160,11 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
>                                                 unsigned long prate)
>  {
>         struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> -       u32 val, l, alpha_width = pll_alpha_width(pll);
> +       u32 l, alpha_width = pll_alpha_width(pll);
>         u64 a;
>         unsigned long rrate;
>         int ret = 0;
>
> -       ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> -       if (ret)
> -               return ret;

My compiler happened to notice that with the change to this function:

drivers/clk/qcom/clk-alpha-pll.c:1166:6: error: unused variable 'ret'
[-Werror,-Wunused-variable]
        int ret = 0;

-Doug
