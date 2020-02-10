Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB30C352A5
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 17:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 285C920715
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 17:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TH0vCFNj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgBJRzg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 12:55:36 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37884 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgBJRzg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 12:55:36 -0500
Received: by mail-vs1-f65.google.com with SMTP id x18so4738216vsq.4
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=siKHOuO8wOb9sw6P22vlsxiKOGFhLZkeTDhUG0eBw1U=;
        b=TH0vCFNjQCF7itW9+Z6ZYFb493fIZyD8YVn4iSK9fy1/KDtpK9dmmj5bVy6JE2ilET
         kjwJPnFS/rOWJ7+jJzyyoiPCUJV+1GpGlAMyPz6u/zxhXBymGsTgm+bsdoWkcDBaToiZ
         7+3z8uxOlnEAnw8r3bdd1mP4fIBTimHEgdSH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=siKHOuO8wOb9sw6P22vlsxiKOGFhLZkeTDhUG0eBw1U=;
        b=FpQudc3MmQ6qY5K+vuZam98MDFUnx1zCXyfHM/j5RTipDI81GbiFfjVbQwY3/W/Lva
         274PubQ40t47LlH2/TaRNH6HccY4zGdKEfwenj1JZb4lpHyLgR6dR471YhP27Gmqrt3B
         Se41Knbp2jPKrWBAXW51OeU4WgbnmZcZC4yaSD7p4nziZUU1xHk1y9Aoh5ugDO+LdaqN
         pFphNm5sXhXVdZQsSgW3LpmxKBHqEeBJSfMDZ0y68BwZhOTeRjYs+M7zn8dJgeD0830Q
         +0oipk3d+20JhPeardguIlLQ7EO3upTFyScOh540bg6m3Ph9o+L4JkZnpPeRaRFEqILF
         FoZA==
X-Gm-Message-State: APjAAAVZ4VFMG1Vq+ZtMsYaKbMveNmWzEOP8m3vWtN3SF7vB2OKcpk69
        c0lrQ4yTAzI8JluqXpQ3dFaG37K19rU=
X-Google-Smtp-Source: APXvYqxc6Lsc7lmRQ1MmcxOku6Bo17xR4rF7JCHP9BMccs7fxYhyRexLNEw17g66DNPjtjbFt2ZEBQ==
X-Received: by 2002:a67:ed93:: with SMTP id d19mr7379896vsp.60.1581357334537;
        Mon, 10 Feb 2020 09:55:34 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id m11sm329552vkm.52.2020.02.10.09.55.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2020 09:55:33 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id y3so2816147uae.3
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 09:55:32 -0800 (PST)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr1454266uab.91.1581357332297;
 Mon, 10 Feb 2020 09:55:32 -0800 (PST)
MIME-Version: 1.0
References: <1581307266-26989-1-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1581307266-26989-1-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 10 Feb 2020 09:55:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-URWfbe8vNqtjHZPo6Rokwkede8oSagJu1KiD18a8EQ@mail.gmail.com>
Message-ID: <CAD=FV=X-URWfbe8vNqtjHZPo6Rokwkede8oSagJu1KiD18a8EQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: qcom: Add support for GPU GX GDSCR
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Sun, Feb 9, 2020 at 8:01 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> In the cases where the GPU SW requires to use the GX GDSCR add
> support for the same.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gpucc-sc7180.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I already added my tag to this exact same patch in:

https://lore.kernel.org/linux-arm-msm/CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com/

Please make sure to carry forward tags unless something major has
changed.  In any case, re-adding my tag:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
