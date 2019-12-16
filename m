Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8FBC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 19:29:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7151E20CC7
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 19:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FJW4xgqS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbfLPT3P (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 14:29:15 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42157 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfLPT3P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 14:29:15 -0500
Received: by mail-vs1-f66.google.com with SMTP id b79so4851080vsd.9
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 11:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x8Xzx0seGNgO73hnwCUt78Q5JjYJnfBh8nshT5JtITU=;
        b=FJW4xgqSh5a/O2CUVNjPYRBXY74pPDy4QIoSGisOiMeSnHhVx4x7WmsEYq/C1aARh2
         o25dmJ5gkBc34HgKuBdX6vJoKfJ7vPb7WZLgliAToedhYlNr8nt1JngCb8UzCP1kFKmI
         QjeLH+Cs8rWWuVmAb72lCvAPcNVii/xoEU63s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x8Xzx0seGNgO73hnwCUt78Q5JjYJnfBh8nshT5JtITU=;
        b=Z5hrTBOHaX9NmPdwMS1bV5VbySwpph59LlFORAtJcwwJj827tA+1xgMGgCBLChxLk6
         Fb5IPSRnl/6jZ9RMLcW4Z49mAemoeNahE8M1Shv9MxYfbR+Q2mFKzvP7l7ifo61JGXkj
         F4A72hSp8GqGyEEsaKz95ObiTnodiC1I4xL0p7ZW9Vldh3PPIyq0VRl9Um8vYIT1g3NR
         qMk1udNoF923qfaQPNv+iSLF//7gcy4AuhoaHA65VAL8NYJQotS2hEHd8y/r5ISBTnip
         wbtZP8SAJ4xzyY7AjirRfxnphGGOYSw4US5YIGSS17ZLMLfG/UysPL75eleBlhYNNFQt
         9Pgw==
X-Gm-Message-State: APjAAAWT0BQk0fauuH6u9dsouftG/1poQG7NMzWGdUlaxiOAut5UT1HV
        82veAC8M/mBfV3LJ3ueJIzQNc/sW1fEJzKxF+wFM7Q==
X-Google-Smtp-Source: APXvYqzq/Wjfn9HsXPu0Kmf0tLhdL8GHb4eZwK2nmAxrayk1ebVFL1ajC+pqXAwYewI3IgNW08qyvQE/D6dLOQc1TnA=
X-Received: by 2002:a67:d007:: with SMTP id r7mr349749vsi.93.1576524554661;
 Mon, 16 Dec 2019 11:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20191127223909.253873-1-abhishekpandit@chromium.org>
 <20191127223909.253873-2-abhishekpandit@chromium.org> <4093066.yl7jOIBBcd@phil>
In-Reply-To: <4093066.yl7jOIBBcd@phil>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Mon, 16 Dec 2019 11:29:03 -0800
Message-ID: <CANFp7mV61sjQ2sy9hAtVQ5hUNmwRbytL+sDPe5eAHP50TwiMfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: rockchip: Add brcm bluetooth for rk3288-veyron
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sorry, I was out last week and didn't get a chance to respond.

Thanks for following up on this. Happy to see this merged. :)

On Tue, Dec 10, 2019 at 2:32 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Mittwoch, 27. November 2019, 23:39:09 CET schrieb Abhishek Pandit-Subedi:
> > This enables the Broadcom uart bluetooth driver on uart0 and gives it
> > ownership of its gpios. In order to use this, you must enable the
> > following kconfig options:
> > - CONFIG_BT_HCIUART_BCM
> > - CONFIG_SERIAL_DEV
> >
> > This is applicable to rk3288-veyron series boards that use the bcm43540
> > wifi+bt chips.
> >
> > As part of this change, also refactor the pinctrl across the various
> > boards. All the boards using broadcom bluetooth shouldn't touch the
> > bt_dev_wake pin.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>
> applied for 5.6 with Matthias' Rb.
>
> Thanks
> Heiko
>
>
