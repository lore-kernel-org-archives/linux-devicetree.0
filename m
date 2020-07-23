Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73E2C433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 13:25:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AD9F2065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 13:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoW1bFcG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgGWNZl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 09:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgGWNZk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 09:25:40 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D49C0619E3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 06:25:39 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b25so6323042ljp.6
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jjczOP4Lu1g1g+37UpjSnjuQvuguh9yOBVIpR976oI=;
        b=BoW1bFcGpf/LlOR4kSOBJG1m7T+jcsunaRyHsL8EB/e2knW65BpxDja3LsDLvW7Qcm
         jNnz1b3vfrvntrH3tGiUXf8ZZHvGRBITtk55iELblRP0m6HLFf9OLb2RyYzt08ChugCT
         X/KDqfD8XGrLH8eWFB7OszJp1DVqVt2k3V7EUfNmgn8XSD3U0JV1uFr6cIV+dUGQNDlf
         flxfM+WKMBJhFqVj0DUj58OQ+I2Gvzoa21WgkBqkA/+IrE521qeIdQNz2on2ORONwzy+
         pwY71KYBX5V/XZsffcKvTCzrHro4la1KU1YNGt0cXf8cFUXnW8Bv6YV5s96whl1txExf
         UFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jjczOP4Lu1g1g+37UpjSnjuQvuguh9yOBVIpR976oI=;
        b=CMWko/mrt/yTeS+OXSYoEebB+5UpIX3WImnuzBso6J6Pj80oU1qRLxAD0D2DTHgEyD
         r5eOV3qo4sRzMIERAZkPeTpPLQ+Mvf4cjOvTgfscbnfX4sIbKITNZoMwRY+ROp3fNTQd
         wAHHCeT4N3XMMuFVSBw2atuni4S4A4pmMC5nXJRPeGCeY0GdK9ZBa93JdG5Gqcibv9pq
         8+k7QnPGqe01Ae4pgLzdZ54XzbkbX68Vb21+BHoM+taZZtoXAz94rLQOOhJnH0WZEZKU
         EF8Yc6Ch+OJ2hjlExdWq2vXa61S0vpGkk3Gdf86/lntoZONm2t72ctwTNNQ0ceWStXLL
         JirQ==
X-Gm-Message-State: AOAM533uoFVbtpiTBFCfMFuSwF2p9bYxC293Wr/a0pd+vhF4hmfwmiDK
        qF6wpUXLozYNrIH7qDG9bsptA7WB3iRETDQKh9BpyA==
X-Google-Smtp-Source: ABdhPJzqK3FsqJ/H+gx22NXh9P4EXchoYK6Pz+NCpDzWteC77pBDLWy2/y3svYjnTm9rqrlHC7uEUexi0eAqcq5BB6Q=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr2133642ljg.100.1595510737599;
 Thu, 23 Jul 2020 06:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 15:25:25 +0200
Message-ID: <CACRpkdYpMWHKNe_jOHJxLvLC=H_yVSJfhNp09ahy-dh9qJC+gg@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] Add basic SoC Support for Mediatek MT6779 SoC
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
        wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hanks,

I applied patched from v9 1-5 to the pinctrl tree again for test!

Yours,
Linus Walleij
