Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847CFC00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 09:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5564A2051A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 09:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mWqduuy/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbgAHJ0A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 04:26:00 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36126 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbgAHJZ7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 04:25:59 -0500
Received: by mail-qk1-f194.google.com with SMTP id a203so2033580qkc.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 01:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9itra/1hP66y5Vh1A/apsI7vVNMDV9CQI60fYE2iNo=;
        b=mWqduuy/+k1H4CJ3RmxwE369OYZjbQ91El877rL/H+x8wlktANqK8kcC4voHl2Sj9F
         BWPxcXnJgz1F9WIFJwkli10BS+NHOKcP6tM0yyKGvdBw2htSyoe13BdbGf7XPQMCdUhk
         KKAC3xbCwpVV74ByShIV2AhcfQ7oHmaS+egzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9itra/1hP66y5Vh1A/apsI7vVNMDV9CQI60fYE2iNo=;
        b=G5TteKyxmh43v7wQTCZJpZaZmlpgn+Hwc8bCwuZW8ExdkwyMjWVpdymrmtm3i30jem
         5dnVUFMwQ0cX+FBA4kW2Oe4EgjMtApvKARcB9jHaG9wPkSXAp3AiJ2ZCyl5pYLSJiGEg
         1aA1aV9qhGX8q59Uiewri8+aUZRCdNnXK9hvWpkyxE9grq22wu1Ox15fnRgE1yJjNnug
         DZFSagvj/NLEwzAvO6DBQ/hI/tYNRdIJiUHiyogLX7VjfqiLXO2siRYCZDKEAlFCLU0H
         Gn4viHwd6NzEys7sfKCjvoxa6JUNSkadHGOLrBliWLvLdlyLJ+x6UTbXISm5qd8EBcaP
         I87g==
X-Gm-Message-State: APjAAAXi2c16/tY05rq92/0qsdm+nYSd5im4UdMCJNbNS0tkd9TqCn4z
        bpH6BWQrCu3PVHqb03VBe1gsdzGmdeoL5IxBfBKjFQ==
X-Google-Smtp-Source: APXvYqxUSfxCpOfPQeb5k2dIYC6xmY0+WG2Ufqb4kkw22kn9ZUvrNzcvtQ2APhviNZ1LTVVT4U0dZLh1RLVsQUCsLdo=
X-Received: by 2002:a37:6551:: with SMTP id z78mr3581807qkb.144.1578475558723;
 Wed, 08 Jan 2020 01:25:58 -0800 (PST)
MIME-Version: 1.0
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com> <1578280296-18946-3-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1578280296-18946-3-git-send-email-jiaxin.yu@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 8 Jan 2020 17:25:48 +0800
Message-ID: <CANMq1KD3n5r1ACy2acKgXTfTLHMsONzT-NscL=AoY1Jr-eqdww@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] watchdog: mtk_wdt: mt8183: Add reset controller
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     Yong Liang <yong.liang@mediatek.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        Stephen Boyd <sboyd@kernel.org>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 6, 2020 at 11:11 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add reset controller API in watchdog driver.
> Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.

You add support for reset controller on both 8183 and 2712, do you
want to say that in the commit title and message?

>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/watchdog/mtk_wdt.c | 105 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
