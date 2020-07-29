Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3285C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 12:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C99A021744
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 12:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNNfZc+y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgG2MLc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 08:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgG2MLc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 08:11:32 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AEBC061794
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 05:11:32 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id h7so21879419qkk.7
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 05:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=yNeUcCB/F1/GGGKxhPZb81S5SG9ouesknVFnm9/hr7Q=;
        b=bNNfZc+y4mobO3WCIszkZDjJbFlTVzhyORB8bW4FX+/aE8H6fra/7HdZC4Kg4mtLPi
         ZS0dY/2rGGzYSXHjXVmbdzhnuERxn+LQhSyap2Qqtmf3klLLMaKoNQnApD0WziFNbLp4
         0EJ805uHmfkwTQiTOYDlXnB29p0S+36Yrqhhj5WXvGhI+2/qOFVbpT0x7K1D0xBMHxev
         3FPMl2Lba7WRasHGKUcemNqF46KCvHNKld1MRdWZ7piEt8XFFhEqtj09N/Vs4k9XTU94
         THk/C53J83fTKAomVPZo9nrsryoxfTDj5fqpazlhj2Lpp7wyMROymMWZE6ywniHBuXYW
         o6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=yNeUcCB/F1/GGGKxhPZb81S5SG9ouesknVFnm9/hr7Q=;
        b=WFdVEdg1N+WGK6CGRY9KtwsNdj4/QQtrls6mTkgKtdzN7JBPr3jC88+zrdnG1d9M//
         eMIX3AsvgmcS9fEOW2lwgvNxvqSerZwYZBgVtI6c8+LB+D+UatEs5yZpc1hVpegsm3oc
         dL+jf8fDYZT/WWuKEiRXMF17JVF0rCvIHTKLVjFkFJsNsuLgbsaKSVgmQDUEedNlbiGH
         Q5ICk0s02u1EnYRK5Tb3MsAh3eh0yzXKiIh3pnQZKL5NKDc4RZNgjfNRTu/BjtbmTNI3
         D2fiAzR1BGqtYS1UnvJbEzND5YT+qJ/KZsYTLW8KQsIxxPaAOErUbI4e8Sikp22WK6y/
         BzVg==
X-Gm-Message-State: AOAM5302w247pJLtOUYRRtPnV4L0GfsUrD7IluVTirHHqwNQjo8DA6Bl
        2gs7pV2O3mH3vWH55Xs527Jy2E8G3oYwir+SyZKfj3w=
X-Google-Smtp-Source: ABdhPJzJxaQjXNpXNaSsM6kZSqRh/xRNcrYnYW5mi76BJnEBFyC1khmCcP+2FdrBNCK4krbUQpiQnc81xr22bjrPhL0=
X-Received: by 2002:a05:620a:1355:: with SMTP id c21mr33690348qkl.378.1596024690532;
 Wed, 29 Jul 2020 05:11:30 -0700 (PDT)
MIME-Version: 1.0
From:   Alif Ilhan <alifilhan2@gmail.com>
Date:   Wed, 29 Jul 2020 18:11:18 +0600
Message-ID: <CAKfYjimfyfzLxjppSS_8RhLtr_qZuW-eEK0FBZM-uVToayjVqw@mail.gmail.com>
Subject: A new device tree from scratch
To:     devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Please pardon me for my absurd question. I have an ARM android device
for which I want to develop device tree. I have the kernel source for
the device but the kernel is very old (3.4.67)doesn't have any device
tree source files. But it has board specific files at mach-mediatek.
Is there any way to use those board files and build or generate a
device tree using any software or manually? Please give me hints, I
want to know.

Alif
