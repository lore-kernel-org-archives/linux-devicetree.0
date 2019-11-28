Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E405C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 12:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 521542176D
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 12:21:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jabLiYoV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfK1MV5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 07:21:57 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45135 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfK1MV5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 07:21:57 -0500
Received: by mail-lj1-f193.google.com with SMTP id n21so28251006ljg.12
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 04:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SXCA4P1++mZ4GjWU0WE3nsYL5FMcWa3cXbIapek2T/s=;
        b=jabLiYoVLgEE4KTwesZZ2DmLmaC34ZclwZ1kroQlBm1emD0PcHERirT/hIXKWoQFos
         FXGKTcgMut7RTmZ5gXXmVxyK4gRpeofT8e2F8s6uLfmA+TQObcbJyQh1OR+sP5z3w+vH
         iVyRWxpvtyGd0kqgtzW3CQRScRwwOudpNBwxE1TAHpVCjIzAJwfin6SsgPTMGVpotdh3
         ooylYNSUGySU9KKHhWVPly1OHawrnLauXENT78d93EllPbBwpznUq9al7WKA6Jc+w8X2
         yzAsA4EJ59JuX+Vfi82qtpXLIyN+EOD8BlzexqqEakfaRNLtDQBtKzorXhAlD3MTM1sV
         03JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SXCA4P1++mZ4GjWU0WE3nsYL5FMcWa3cXbIapek2T/s=;
        b=GLBf+GMYq+QhU66PQCYUmYY7WOj8ARDTjdRcj5XxZECCvXQMxG/umCVWruWL956e5Z
         i0070XXEfatO+6346ToER8I7N2tO6mmzkdsADBVvPcLLtrax2CgQjjt/cP5po9H1TkSK
         66BMLKOnE0Pf1DuwNUCq3oJ+SANLE3yzQmYRCPM9G3Xru2boD71JNBkrGvRo3A/99Xjm
         uF8r5cG6gkCKbPYaHvUIDXNhdgVc2KUcytEBVAIsBeHA0uVsLds/5dIGYeUz4ExvexWf
         xsJlVzflJcFPKbK4ArG6MkI3MgEhxjBBi1uyTW1zfb7ScKufCQHho6wFMLzMR9pn2ISN
         52MQ==
X-Gm-Message-State: APjAAAUmSccP8Sdtmx2qgUS4nH8QdM9/c7ofnr8saAQoizqHpE9mxNH5
        gksZSrFdkPesbNa4tWVYmr8YU/8Jrv2mbjXofDxnRQ==
X-Google-Smtp-Source: APXvYqxC+CilfFecs694uPA2TkzfBRgLiP8clA3RZ7THF3M8WYbpWuyE8yJFEz9LrJzLIs8TgrYqaoLQgeR+Iv/pMiA=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr13384895ljm.233.1574943715334;
 Thu, 28 Nov 2019 04:21:55 -0800 (PST)
MIME-Version: 1.0
References: <7556683b57d8ce100855857f03d1cd3d2903d045.1574943062.git.christophe.leroy@c-s.fr>
In-Reply-To: <7556683b57d8ce100855857f03d1cd3d2903d045.1574943062.git.christophe.leroy@c-s.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 13:21:43 +0100
Message-ID: <CACRpkdZZc5QKqX74WbyO8WQmVw7SSm2HYYMtoxjbEWomGvnkUg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/devicetrees: Change 'gpios' to 'cs-gpios' on
 fsl,spi nodes
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Nov 28, 2019 at 1:16 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> Since commit 0f0581b24bd0 ("spi: fsl: Convert to use CS GPIO
> descriptors"), the prefered way to define chipselect GPIOs is using
> 'cs-gpios' property instead of the legacy 'gpios' property.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
