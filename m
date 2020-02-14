Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A03C3B195
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C71F20873
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gj6tG+Qt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgBNKUL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 05:20:11 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36568 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbgBNKUI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 05:20:08 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so10106716ljg.3
        for <devicetree@vger.kernel.org>; Fri, 14 Feb 2020 02:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a84WNLM8wHkd5zEtxHoEDgoCVKtrYjUViLHMY7hthbM=;
        b=Gj6tG+Qt7ycjUY4Q2ZAXyamt4t4+IDdww3s8W9LBz0qskerpmAwDH4ozKfHDaq9+3B
         OawNf6cyiZJ4cMn5p8gXDPXDqWERgdiSM4tHnRLkyR1BUTncMg0AiBKlUIaPCigS/w+I
         hHKj4YQAuRVNwLKDQMYcjNrsrORFZTl2NSe3GktvgggquQuVYglQ5uJOIzdg0855ye+C
         6uwaU4LtSMjMvgAJUzlgFZBaaBewg04d5gKNDb91yAuw834QulLqP095JhQvZkZMzb4Q
         LdxB4L75YeD1jYbj+FRGGS3MFhhk6pwX/YoqCFfWzKu8x9R/PPKVWxQx7lYFPIbCtrq7
         Zx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a84WNLM8wHkd5zEtxHoEDgoCVKtrYjUViLHMY7hthbM=;
        b=L9YoZ6apX8a7Wdci8c1JngX7e2tySi/HYD8h+aBOWPhMRvoWNBquu8G563dN3J3Mn/
         WPXjsBo3DH8VkEapNlXcEIjLyx8P2RmQTXMZaEeyTGWKj8ya3RQhU8bLEuhUIx9nCDcv
         G734BXZlY6C08x4hMvDSfQXr184IxAggLX59blCDDWCUXTf3lxRgUkxbEOx3TMIUFtMT
         NbTqKoGkpuJyTIjcCDLgPIlBS3rV5QwuH9Ld5Ve6Nrj5Tkln3djj9Dt+QXbpXQn9iHxz
         me9Jluz0fNd6+J/T3ApQuhd9J7H8PEyQ5wORpWX8+p5UshK8F5zkc0VVxNV4+3qAUZnj
         2hRg==
X-Gm-Message-State: APjAAAX3Y1Y7uPuThN4owEgMOxwd5ECP/5BAiDeVpFyIXr+/R0AVGEWq
        yrOxHzP9ldleGZWHm+MjlvGNxe0kCvi7/1PSsd7xVg==
X-Google-Smtp-Source: APXvYqxqN7AMNMFOzd2fYojplBnENxRnOLrJhK/Z0n4uE8TLS7K1XSLI5bd514akMiltxuCr4HE2d8mGerIytGW52qo=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr1526961ljo.99.1581675606201;
 Fri, 14 Feb 2020 02:20:06 -0800 (PST)
MIME-Version: 1.0
References: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:19:55 +0100
Message-ID: <CACRpkdZ1G-Rks+-JrY-bN6A1YpQGqRBoDKS5kYn9BfdWqYjXSQ@mail.gmail.com>
Subject: Re: [PATCH V6 0/5] Add minimal boot support for IPQ6018
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, sivaprak@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jan 19, 2020 at 2:13 PM Sricharan R <sricharan@codeaurora.org> wrote:

> The IPQ6018 is Qualcomm\u2019s 802.11ax SoC for Routers,
> Gateways and Access Points.
>
> This series adds minimal board boot support for ipq6018-cp01 board.
>
> [V6]
>  * Addressed more review comments on pinctrl bindings from Rob.
>  * Patch 4 arm64: dts: Add ipq6018 SoC and CP01 board support has build
>    dependency with,
>         https://lkml.org/lkml/2020/1/9/84

I have applied patches 1 & 2 and the remaining patches can be
applied to the ARM SoC-relavent tree (Bjorn can handle this I think?)

I am sorry it didn't make it into v5.6, this is caused by the bottleneck
for YAML schema review, we would appreciate more people
participating in writing and reviewing new schemas, we are currently
in a bit of learning phase.

Yours,
Linus Walleij
