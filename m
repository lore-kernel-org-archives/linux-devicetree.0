Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDCCC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 09:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C480720787
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 09:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJCNd0WP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731316AbgEYJOf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 05:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730467AbgEYJOf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 May 2020 05:14:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93319C061A0E
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 02:14:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z22so10174075lfd.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSWtEhfY7GuoKSs7S18uevxT7dM1KmwlES4LoPR1dYI=;
        b=iJCNd0WP4T2/2xqHFj/gIuNqq2nAz8/rYUUIUMZXbhSqNUH2wD9d3ImpsmUT5K9JZb
         HsUwtqhLL0TxmmR3R4r6kjSl752W9kBUXh4OvNsiWWoG9z9K9aPMeV+Yhz0+P/nc/qFG
         swvJAy4yoYzTVccX4U0CUZYHt46vJVgrlNyoAugFZV+j6kJEa4iI+Cx1QeUubo/b8lsJ
         +6Y3GUjKomjQlycqaTGKcxaCX0j20+DiFID247pDl4P7ou76Y7Mg9uSvjA5V0Xi4CT7+
         Q/YRNFpbc5ck+tD6ijCl4tcbtVvhXXWsDQj2kJxs8zhn1B8zAxcSKSk06O83JNFmfoIB
         fcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSWtEhfY7GuoKSs7S18uevxT7dM1KmwlES4LoPR1dYI=;
        b=CSyf1dUowMrHFR7tfMQDePQmwoE0mQuqbaH5PIqIHd6Fn8evgDuM2rjxIjX8eTimyf
         yXrs1S+/fvdMd5RIYuGyRLndCCycXUTmm5k852QkdpdMBlu1rwTQ8ktGChaBUxugqscv
         CPnt5ZpwW6XF6rBBxjfbR6O5xO4ZL3iR5qMV+vEtdTJ62Hk8qzwj1CyHLzpPZhEijbnF
         kJKu54FkcNeqJ1jkG9+2ZZW0Qw8YVha8oRblK4j9AOFm3eChwUFnOIPUwE8Z7IfWdyVy
         HzDZeb/8hKxmSzEDidF0JCCud8XmUKek2RbunIIWn7HDyRYEvgyYsOwNFxmAXQnBvu1o
         tTJw==
X-Gm-Message-State: AOAM530/7U6HshF7r+rC19WyADT8VpDvfdwcm3hvLlafYBMFgUHgC9fB
        gSjXbvgLkQ2p0zGSVPbBqWtoB0mXzmL8wAENVS4xzA==
X-Google-Smtp-Source: ABdhPJxQ9pMnQX/FaNFVrr0x1mPP3nm72DesDbrY4FPLvRnsQmiNp4caVpBfoS9ZM1qO93+pmo9dQs2du+BlgOqmq1k=
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr13045361lfq.4.1590398072107;
 Mon, 25 May 2020 02:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200519081157.29095-1-geert+renesas@glider.be>
In-Reply-To: <20200519081157.29095-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:14:21 +0200
Message-ID: <CACRpkdahxkbxXd29bUJY-25gmMzZ97LUixtJ9y=ZhchkaEETww@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Add renesas,em-gio bindings
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 19, 2020 at 10:11 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Document Device Tree bindings for the Renesas EMMA Mobile General
> Purpose I/O Interface.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Pretty uncontroversial patch and you know what you're doing so
patch applied with Niklas' review tag.

Yours,
Linus Walleij
