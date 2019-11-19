Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64CFC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 04:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80D8C22319
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 04:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HCeOD6Tu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfKSEFk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 23:05:40 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:44179 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727217AbfKSEFk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 23:05:40 -0500
Received: by mail-vk1-f196.google.com with SMTP id c17so139738vkm.11
        for <devicetree@vger.kernel.org>; Mon, 18 Nov 2019 20:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LIrHQsnQ6V+BzwizI1F2l2BgBcA0oa40rJqoMOUJJDE=;
        b=HCeOD6Tu76jGBNN2vs/QFo9RoiWqR8su519GDX3xUu3RA+PhDKU8rfJhqf8Eytvv3m
         cBf/KnZYDLRM8fHHTz1XmuDdNZnJR4EsstGmBzLt4vkDu0qpNZGEyWLQGmDCfxkSN7JT
         FC/a1JUueTcjv7gMT8S3ww/7ayWyICVvJOioc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIrHQsnQ6V+BzwizI1F2l2BgBcA0oa40rJqoMOUJJDE=;
        b=NSZ6oZssknu9p7jNxMTV2uLfzoDFk33h6y/DTIhy6rVuExvCu/XYU39gdBtV0elLYK
         g6pfcuw9VwpgWzkABX+AmzOL99gKiOlHrS+aZ17GXucioPgpDi5+daqRFrHMzoYfb7QL
         qDNllmvOgan+Gb/GjiIKFC2EejRJJHHJzQz/LcG9oZFO0MhOogpHsCg6ozXnGEX/ED3R
         VNhnXPhTN0xAiNq4kPA+j20JTXtnDhlNeMnKsdNo/EMfr4bIwPBUOjyVbMbt9jsWkOKJ
         IJ3tzP2IbBRk1WgkeOPjJYHfvXFv+DgmgDxdeitFC03OOlifIF2pmqu7cStWJARoaQLR
         L0Ug==
X-Gm-Message-State: APjAAAUBKJbPSrsKeIOraYcMbR8BYrgtuvwpU5hDBSkFYZk053Dftq21
        yHcd+hUjVEglU/pu3BZwhZ0tebhm25cg1Yinm/vAvQ==
X-Google-Smtp-Source: APXvYqxZjldlrzqFPxGpiEuY9hlr4GZvzrs6hiQjg39NYK3ahlpOSUNqc3f8+uwjpnSO86dKp8sB5dxpA5O5JpWNG1o=
X-Received: by 2002:a1f:3f56:: with SMTP id m83mr13480943vka.51.1574136339707;
 Mon, 18 Nov 2019 20:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20191117033149.259303-1-ikjn@chromium.org> <20191117071442.GC496402@kroah.com>
In-Reply-To: <20191117071442.GC496402@kroah.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 19 Nov 2019 12:05:28 +0800
Message-ID: <CAATdQgBSPHyhWsAvLE=_Fd990exgaZ+Dzftad7++ZjzGsSkmJA@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: override hub device bInterval with device node
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Suwan Kim <suwan.kim027@gmail.com>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Johan Hovold <johan@kernel.org>,
        Nicolas Boitchat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Nov 17, 2019 at 3:14 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Nov 17, 2019 at 11:31:49AM +0800, Ikjoon Jang wrote:
> > This patchset enables hard wired hub device to use different bInterval
> > from its descriptor when the hub has a combined device node.
>
> If it is a hard-wired hub, why can't you change that interval in the
> firmware for that hub as you (as a platform owner) have control over
> that?

yes, actually that's the best option, but the hub devices were shipped with
mask ROM we can't change the descriptors.

>
> thanks,
>
> greg k-h
