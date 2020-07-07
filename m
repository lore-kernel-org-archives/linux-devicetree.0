Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80B7C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95AC2206CD
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ur+VVUqE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgGGLbe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 07:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgGGLbe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jul 2020 07:31:34 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF77C08C5DF
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 04:31:34 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b25so45875317ljp.6
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B2KdhuMT6KQW+/r9swGRwgIp0M+oChkiV6W0CrMAxNg=;
        b=Ur+VVUqE3bYZZ9r2VMSQL6CBGFMzXAgsMnDYz/2TV0WzlNWb6WMQtSDMbYtLt4kWdf
         KiV/QoHYbRbKQDF5piV/CJ7dFU6096XxgZZDUeHaMgBdMjFAyHfNmaE1ISmW60e2S8Xj
         iT86k/aJIumKjx4rg82kWTWdOHiU1xy5RfnFqpoCRflyaOSryvLH9xHc09NuOPM+ZR38
         I/rpqIeTSmDwls3IAWeT8WpfajixmQYegnjgV0YD6OHt4OOQbr2/JI4wEC/SjqgDvqsX
         jTnuWRX7FK5vJTpjpTZ5ISeljGbMF5o6B+IxKdKLadDv8if+mNZ8g/Amcf4H2jQyw+2n
         FOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B2KdhuMT6KQW+/r9swGRwgIp0M+oChkiV6W0CrMAxNg=;
        b=gjk88z8Ny8OTStyjnDc3LVbkQT7P3/o1sPJXfRNQXmPq5Q30yFVIfLxECv+xd97yqj
         +OM/qXBVxTOl2I2Q6xho3Wgf46DY+FRcRGZhYyJCPbJOCY1c4q/ypVf+keTmN9hs43wx
         FDpTtPxC+Me9I6efxVIjWERLMOggyA3JWU1AmpyKFtii2f5/E7t+fR2wLGD7Xrhud9gW
         AIMRGPmLdYrjz7dJN3EV4/GW84UFC8ZHkJi+elCZT9vKGQeuu2p5rUt4efOK+H0+j3Cg
         lraBwVpvdLK3ckab0aDpK7H5TF0xmWvaEpaGoZ8CnsH5PED8+XX8TCMQHETo2h59xUD5
         um3A==
X-Gm-Message-State: AOAM532h6qccSpf8134bSidw6tKluWjzP+V05GOKDiHEJWkPzHrV04u5
        4XpjK9/oxSubnyhbSmCbtd0nHrfruq7JyAWp6AHZPQ==
X-Google-Smtp-Source: ABdhPJxwu8LPZEcE6xITo3PK+ibXfZvzirfjgqwItXPsC33ipJdTwUPc3z5pWyDOFbMFJ/yL2oznPfkMolkPAi63JMM=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr15925694ljg.100.1594121492164;
 Tue, 07 Jul 2020 04:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com> <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:31:21 +0200
Message-ID: <CACRpkdavqjcma8A1y9Sh=WWLu-n0+mQOhyNw2dHenA8ZnQkvgg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Sean Wang <sean.wang@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
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

> for virtual gpios, they should not do reg setting and
> should behave as expected for eint function.
>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

Sean if you're OK with this patch I can just apply it separately.

Yours,
Linus Walleij
