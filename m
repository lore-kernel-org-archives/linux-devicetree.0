Return-Path: <SRS0=Evye=3H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614E6C32771
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jan 2020 22:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 242A4206E6
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jan 2020 22:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Hma47cnZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgARWAp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Jan 2020 17:00:45 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:32826 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgARWAp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Jan 2020 17:00:45 -0500
Received: by mail-ed1-f65.google.com with SMTP id r21so25890823edq.0;
        Sat, 18 Jan 2020 14:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hhGX1nqtyoIZtWHowHcHPTDuXomALEwGp67YDIAs05A=;
        b=Hma47cnZkW8SDZySjYMuPSLqtSqE+IGLh9ZGHEFQJ7/WvVbaeTgLg5nEdn68Vy0dCK
         GUBMZrRmAWrTo84VZE44KJpsZFWbb1YoVyTe6dCcVTbLHIJHY/7SAUFl27ZA4Kr8ZVID
         BijVsnKRqrvLW6r9pjuSbPKhlMb5Aaei7Niboxwmwr2HPBl/F2yJpy3XtSVI6Xz09G8m
         hZwYqoMwOLqnUbyrNTdQx2+v5XDeC6RmkSaUKqrMWGBja8VIZgczhZk4bYCaG4KFh3sv
         WHuYswNS0goNqezzYhOH8T07sY0avlTpkA7XYSTvuyl+k6G+wYkk8RZhv4ALnNcG8kI0
         4t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhGX1nqtyoIZtWHowHcHPTDuXomALEwGp67YDIAs05A=;
        b=YZY11TQ+CyUjUzbRYiTbM/5V4ekKEuceSFgQh3m+4LrdVwmKHxsWvN5/I/Tk3FuyxW
         C3ZmV7ZkO0dd/xGjFHF/viHPUpRDvA2jszYBSpc6bnhtEVlLc1xaN1pofxhDcbz82Chg
         qRbMuVnmDoJWO+xQ+H3Ro347UixFCvw74h+fYcnt8tntWNFKWiQL1RFaOYXpi/2o9yyf
         eMNS1zkuibhHvL394bSmE+1Hw2HyQevoftP5swkxnWG+dBGH6CcltkTegX1RKAPG7p5G
         QaR3J6NQc8BzzXLDLnNT1PULEeUhbkGd2z07JRX68UOTZYmRN5kO47wqH3THLrWJ3/Z6
         HAlg==
X-Gm-Message-State: APjAAAXJHW+qhFe8qP3RfubYQsjMYEwyK9olf1dttZQi5lAW+gOczs0q
        G+jrbnDclvEcXJtMQGM6q6xHXo2WO1EFmQt4gwU=
X-Google-Smtp-Source: APXvYqx5U4qXgJUFLodBAh/Su0iA4o4YjM2gOenS+CuMOI6/b0kQEpYd45al918MVd/znVyYVIAaXhGujEJ328y18VE=
X-Received: by 2002:a17:906:2359:: with SMTP id m25mr13932991eja.22.1579384843512;
 Sat, 18 Jan 2020 14:00:43 -0800 (PST)
MIME-Version: 1.0
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com> <1579220504-110067-5-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1579220504-110067-5-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 18 Jan 2020 23:00:32 +0100
Message-ID: <CAFBinCAZ1iUKDnV2ewrT0ytXjVbpbZVpn-Ybj9caN4Od3Z0UEg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hanjie,

thank you for this update - your patch looks great now!

On Fri, Jan 17, 2020 at 1:22 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>
> Adds support for Amlogic A1 USB Control Glue HW.
>
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
> - a DWC3 IP configured as Host for USB2 and USB3
>
> A glue connects the controllers to the USB2 PHY of A1 SoC.
>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
