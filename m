Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326FBC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 14:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 080B22064B
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 14:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLLccylq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgGUOEq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 10:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgGUOEq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 10:04:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF776C0619DB
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 07:04:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q6so3189947ljp.4
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 07:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UtktXB94UoE1zwpGw4L7DaOAMB9VthZKcyfMWewtchM=;
        b=yLLccylqygcGxLogT7uDUU7Zoo5Gf+rgoWnJxkrvtrNuUUC2Rm99zffl7dgXLUcsxV
         JUsR4Mi/ot+fvK33v6Uu9vN0B0j5hKnXMEescl1VOpltOAT9W+Gc7AkhEo0n8b2nQ3N9
         d/+3tCKJOzeU0p9NOt2e8P3KvgBHGGWOMJu6pZa/vhd+Kz+Aay2PlVhVJ3TIu9jZxoPC
         r0KQv2Q360/8fCEcxHhs7RkvZv/6qZQ6+getRlZ//wMfZEIDwVEjPXekSUXa5CcHoapM
         VtDgPKHLENtTXQEZU/5R51RZaY8KybsI0FcI9GKc9mCGpjhucIPruaTfi5edb2oyHwpN
         f/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UtktXB94UoE1zwpGw4L7DaOAMB9VthZKcyfMWewtchM=;
        b=AwG20y4iOs3o5Rj5daNuUp3wa5TnzG0pNXB+w/shqjAB7juGvB9U8Uv77HoKo7eKTP
         /4LMmb2xZTFS9gb4op+lORT3K1AiL21qOkaIquEIVdWebZ79p0D0PoWChLMjqTn5UkyH
         e1XVslsYjVaKi8oFUWEITMt9RddU0Ol+6g9XK5nTvXqDA/In9Obm3e90v1ux8ZupdRNg
         trvlO279QnT69vtWT93zglx3O4PEXNpKntpxqXlTgZ497N5layx8VQiiDRW8fg/ZwwAu
         25lQ4Kw25RRardH6b2msjOJ12bZEcTcfNdBhesylykFsCGMEoTAE7LQXdtQxA1E6hj5v
         jNuQ==
X-Gm-Message-State: AOAM533797EH8L3LQqcLGAJkhcEqP3BibrFPG+XDK3PByZCbdxFn+DFo
        xGFztbbvIZ6ehAbhhp+9innJZDatg5WTOkd/nPhl9A==
X-Google-Smtp-Source: ABdhPJypCfBIap1qfVyDPf9GKnF6IcierHr4eIXAb39wsTOTb1+XEiOppOE1PPcvOhD3UUXSdtIpISL/xoX/eMJE4Q8=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr13595138ljg.100.1595340284205;
 Tue, 21 Jul 2020 07:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200720154548.12453-1-paul@crapouillou.net>
In-Reply-To: <20200720154548.12453-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Jul 2020 16:04:33 +0200
Message-ID: <CACRpkdaqOFgjNkD0m0A3XTXYfh10YuAVYKxd-8cFk0WDsC0mZQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: ingenic,pinctrl: Support pinmux/pinconf nodes
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 20, 2020 at 5:45 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Add YAML to describe the pinmux/pinconf sub-nodes of the pinctrl IP on
> Ingenic SoCs.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied.

Yours,
Linus Walleij
