Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C236DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD75206F6
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:37:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZxQBzAmi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgGGLhe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 07:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727908AbgGGLhd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jul 2020 07:37:33 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD29C061755
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 04:37:32 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z24so24594315ljn.8
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 04:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OnCd1YAPjG2Ik+wSQkHZosL6QWVa11jN4YE6zzRMrv0=;
        b=ZxQBzAmi25Zp6vi/k2z/1OssFAAw4KoH6gUCTpfVD1ZM+K879D7B1UIQA1+cYHb0vq
         JmPpN97k3pMzkijiQy9NvqBrQktnRzols67yxfeAVCMCpoKCZVaPuqgGNTTKCs3nyBQ4
         1wIgcqKPw1dt4fMUp/lBnXTMWSQEu8TbmXzDJVNfwbg3PHoGQ3CrD3qWYQZtHy6WntgD
         Evd8VHYB+ivGSvcUfOUP5nf82hsdhNVL8Xm2EnOMUWeLuDdllosFDWhirQOjR1wu+4dw
         auTq2pWgQlkzGmvldemqEllSLI1WT0Hlu4AYAGKL/MuSV4C1t7xqfCVIq1kTnb9Jb+L/
         YXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OnCd1YAPjG2Ik+wSQkHZosL6QWVa11jN4YE6zzRMrv0=;
        b=W0iEdR5bqEJzHbMjiyvDk2oPIwxxVqt4WQpxbMCrT98gJZsh8F3ZwREPjFZdd5C0AA
         WivAGFeyLEeMNoyIzM6l5pxBiAxnvHGnbB2wz9DjkG8fgwsS/1VjMsayprg1dBPGxnJY
         rbmYp+pnVXhk5+/agM88vDeqK65XO717tIuaUhl9sRizsrdU4Fif/R5ZXVJbFvI00PKk
         wEh5FRaAn+GV4Qh/TOM8GzqXEvgrGofFajbX4Y5qgKp8LZ5+bkf80cOourE7UFtJWKJw
         6VwDZpdLc2raFGnzLbLBFkSoz+BgKWPdjqGLdvAWvSdDm9LvRe3p5ZGZS3QXDzPy9Qqe
         gUFw==
X-Gm-Message-State: AOAM533k81fZx+xLgqaQtQI6U/SyjAi0yx66LsKgPypfpciT/WlVlI6w
        nQW0yYjZ7RBZNQl/HJhnawTzx/r9kkFSaiPgbnRl9w==
X-Google-Smtp-Source: ABdhPJwP9hKdzcTYu5+7+gkCXic4cOTdr0VXL+Zzwrh1whoWKZc3WZtCAHkFv6JpcmVTdMaJuMYRFm8FqSC3eqGZGt8=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr8538176ljj.283.1594121851218;
 Tue, 07 Jul 2020 04:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com> <1592480018-3340-5-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-5-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:37:20 +0200
Message-ID: <CACRpkdaDVzEjwrRbUjEPdGqVOHrLYaYSA6uVc4t_sY_A-0S-dg@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] pinctrl: mediatek: add pinctrl support for MT6779 SoC
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, wsd_upstream@mediatek.com,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> This adds MT6779 pinctrl driver based on MediaTek pinctrl-paris core.
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>

Patch applied.

Yours,
Linus Walleij
