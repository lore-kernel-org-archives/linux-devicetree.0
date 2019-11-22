Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FA5C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 19:19:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 496032071F
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 19:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aVndCNiu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfKVTTY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 14:19:24 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43968 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfKVTTY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 14:19:24 -0500
Received: by mail-ot1-f66.google.com with SMTP id l14so7107380oti.10
        for <devicetree@vger.kernel.org>; Fri, 22 Nov 2019 11:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7v+HUZympM2vga3lQVRE83tED8z+t+bdnGbnVspedM=;
        b=aVndCNiuB3JxApU8V3OHo2816NScq4NHcNmGp4w5ouU1rjHLtPs7nLK0CfU5oYyALX
         cffLrctH4d+l+wAsCHupkmN3XOBvTGqrKj1qPjI63o8a3Jy8ZqutpWA2l8b7RQtdHnXR
         V9uUKitZbRWHX81JRD4qN5jRoU+S/zc11ih3izKHiW20+ZqslV/7SMkHa0nkm3msKQlN
         +VKGWV9cJaXJ6jYSNghjG34WUdKxG4twT7eNMp1QrRw6QGPQxPf5sj5pViCCIbav8cDw
         LuEHnkqXXIa53B1ukbWmfjNmYqiTdl/2YDM9P16FXM87ID3n5lRFr1RGzJMmSEyqSzh8
         RVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7v+HUZympM2vga3lQVRE83tED8z+t+bdnGbnVspedM=;
        b=GRALnuUKWa9H1K2MuJOoUs90ZqJ4Tej/JVybh4YAcYbby3amZZhmaAMen6lU69j6Bg
         Y8pW3dXA/Ujd0fFV17OOlCBgochD3qWXLguOHBRxgnqR2+bQOT5CGeJTcpCu2BJg4kTU
         Ut1jQ6X+vtSZu9aa64ErgWrlNisrywPgr5DEl11bUyBEOwk40wK9V7fFGW8WdXQZCTfG
         RgMFE2uVm+2D7pxXHdgERmLHLLqDbbLFvBb2GJIX/nBc5pCVkPO0NC8fFZRAnaryQfm9
         CZzcE0RMPW0tx7bViFFHc/wlWdgMw+MY8+Ya8T9JRI2k6fiXhT61nmC8aKf2ePbKDSBv
         7GLw==
X-Gm-Message-State: APjAAAXejnIsq3mqxacrtQt5C8sUmQJG9/XNzEC5TiAmzvv5YeUMqJkJ
        54V7cY9wtWpQI3XW/vfNY+VuV5xvjsAa10tnUCf7zg==
X-Google-Smtp-Source: APXvYqwuZAa1fYP1qcPyObo9jAeE6aS2UTX20J798Pg09f4kfZzRwHjbqMuT1e/Y9wt5ONlbArjTrnZ74T08qv84QTs=
X-Received: by 2002:a05:6830:1d71:: with SMTP id l17mr11619625oti.236.1574450363407;
 Fri, 22 Nov 2019 11:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20191120071302.227777-1-saravanak@google.com> <CACRpkdY-cQGK-Q+LLboa3E+0G=251PhMR5xDX2ZUY5-hPVL-9g@mail.gmail.com>
In-Reply-To: <CACRpkdY-cQGK-Q+LLboa3E+0G=251PhMR5xDX2ZUY5-hPVL-9g@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 22 Nov 2019 11:18:47 -0800
Message-ID: <CAGETcx8WWhyVkFOTWBu4K-LY7dBC1FQ-U47N-V7BeEZixP4yGg@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add device link support for
 interrupt-parent, dmas and -gpio(s)
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Nov 21, 2019 at 11:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Nov 20, 2019 at 8:13 AM Saravana Kannan <saravanak@google.com> wrote:
>
> > Add support for creating device links out of more DT properties.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> This looks to me like doing the right thing and making sure that
> the GPIO drivers get probed before their consumers and thus
> speed up boot.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

>
> I guess I should get on with adding device links at runtime
> as well, both for GPIO and pin control so that things work
> with runtime-added devices and boardfiles and ACPI, if I
> understand correctly it's fine to add the same link twice, it
> will just be ignored?

It's actually ref counted. So do check that the device_link_add()
succeeds before trying to release it later on [1].

-Saravana
[1] - https://lore.kernel.org/lkml/20191115000438.45970-1-saravanak@google.com/
