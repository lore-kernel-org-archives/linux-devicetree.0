Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106DDC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 03:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E09A220758
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 03:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgzmgDHq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgERDGk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 May 2020 23:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbgERDGk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 17 May 2020 23:06:40 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D590C061A0C
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 20:06:40 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id bs4so7227656edb.6
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 20:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qNLTrI2ktdnZR+XFpipulQqy84fxpmvLOZOiLyTI6UE=;
        b=jgzmgDHqUiwNnY3CNyYM96F24BdVx0GZpmKETl49TjRSF/B/NvdytgZioDW53AlpMy
         JCrsc7TxARWXvesb5i4pDkZy9iVgs6akUlk9MMGKjUwxv7konk/XAClUjVkNF7eJSYnl
         MN+PnV+RPz0U68T70ydY3Mlbmh/nM/cvc9r5U3k+/SnzZM1cZnKWTqJpPYKxXoDtbZuT
         fG3DuWTyHYMsQIgCAuCBt6JIf/7wHkFE+1L41dH0jzjLw+Uk1xxnEz7z8yCWKZd+HjuZ
         hTI8Ys3gG79mdbLHS9R47KmSn1y2xcxkJ/2jVK8DXXNg/VaoDdKJzaxaUzfwefqD3nrf
         4liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qNLTrI2ktdnZR+XFpipulQqy84fxpmvLOZOiLyTI6UE=;
        b=IFwK5OZbsoutFDlGFq9/ZN5Zl5hGm7E/GR5vikEcSf9KQzEVRcjHgXaIiK8rs4QpbA
         m2Tgs17aNNxL8j7YJhnBkrGZVrElECSqh988eueVkyH8pEt4REWyy8hKOnlNTBbEvJqn
         auFSJ2ZPP7ZLJgB04WdUqmsu7Du4xUkRU7PArei33B9j1QEOwKPGk3/52HxtUYygadxv
         zTQepq3KLN0B1JbbsIAnrldXdcy1pi4ca1QM0XQvRtJ8BdADB5zYNDxC8iVysgkENZC1
         OJnQKWlzG4W2moYLpchHE4mcJOsL18N5tpoOWhIGlqb4W6w6jPQ2h1HuioWjtBOsIH9T
         FupA==
X-Gm-Message-State: AOAM533AtSjfS2ntYBYpqzGFQVOj5Tb2KQWpijTSenX/L+dA+/qWUeSF
        YT0NIVoK/m3pV5k08cfuM7KjWHFvXwR1zGL1ri0=
X-Google-Smtp-Source: ABdhPJwNl4SDNDW8cU/QKe2r13hrlZ0nbYymMMWQ1H5rJUFeU/sE9HG+VNCaIRt4Wk6kogQrjLx0YiVfLdsJszFlpis=
X-Received: by 2002:a05:6402:129a:: with SMTP id w26mr11227671edv.254.1589771198670;
 Sun, 17 May 2020 20:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
 <1589472657-3930-9-git-send-email-amittomer25@gmail.com> <b2ad8a81-619f-5f35-9596-c2061ae15e4c@arm.com>
 <CABHD4K9yjUGuo0w-RfhdZQJm3Wtj6bU2H4DXcp4Jjp=e0fFeyA@mail.gmail.com>
 <2cd3cdaf-826e-9d12-9fd4-9f7e2a517ecd@arm.com> <CABHD4K-OaQ4Vf_+dg9FMR97ocLeUkDswyEnChPV=H=VcbyUhkg@mail.gmail.com>
 <abbef32c-84d2-7dac-c667-49610d014710@arm.com>
In-Reply-To: <abbef32c-84d2-7dac-c667-49610d014710@arm.com>
From:   Amit Tomer <amittomer25@gmail.com>
Date:   Mon, 18 May 2020 08:36:01 +0530
Message-ID: <CABHD4K-MHs4jhL_9otJJ_xjC1uv1N20mnHqT39b2kob7WjZcVQ@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] arm64: dts: actions: Add MMC controller support
 for S700
To:     =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, cristian.ciocaltea@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

> I recommend reading the DT spec, chapter 2.3.1 "compatible":
> https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

My point is more about, DT validation is not happy about this situation.
For instance when I run dt-validate, do see following:

/home/amit/work/kernel_work/linux/arch/arm64/boot/dts/actions/s700-cubieboard7.dt.yaml:
mmc@e0210000: compatible: Additional items are not allowed
('actions,s700-mmc' was unexpected)

and I am not sure if this is because DT and driver has different
number of compatible strings.

Thanks
Amit
