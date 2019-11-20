Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE029C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 20:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4ED320872
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 20:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yy4lTCWd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfKTURm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 15:17:42 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46301 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfKTURm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 15:17:42 -0500
Received: by mail-lf1-f66.google.com with SMTP id a17so560913lfi.13
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 12:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OYT8CC6GpWfJu0xkWtk6XTUYUrlBXFqIdiEKAusrjn4=;
        b=yy4lTCWdl9Av+zr3CTm0ggDnEp7nwBfl83TXX6d0SX5Mj95Fc5lBVhk+KFeKFsUu/+
         5HlcRcFaOyZNNs+D019UtncETQl+U5hGAo5W+asM/MvV52pQ9zwVQAwM7UpkhsXfl42X
         Z4xpH8sbZ8wNnBGRwFoWnGypZbuFlABl2gOnFig1o03cfVpzoGo4sb5gF8xBXO+v2SeL
         BTAf82oSqJpUftzdcioR/5bq6otu3XFP5cyQfEwLKaoz/7H2cvWMUWAxt6V2/CGsWANv
         NfZi59lvb1H5fGUBFlauWB64HxtCRZMVFB1Dh4i6mVXfdUCkf/jErbfmAkhGfs47g+dk
         eUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYT8CC6GpWfJu0xkWtk6XTUYUrlBXFqIdiEKAusrjn4=;
        b=hab5T/wU1g/FKPgcCkkUktx/8TJazHUVddZSmZK77liJNIXIG3bYbF/1rwF7KPRA5v
         LZzv3dG12yRRls2PKRABUs+Ilwss90PrDG0XlPxN77h9D049hh03jPBZafnCd8w1OK1y
         IthE9WXcqTNyDhA7x2DFMNTxQkozwNifgcE/poF2PsLHDHk+dZBKgVQiv1kZJEc98N1C
         xmDneQUNZ2jERpbPOM/tHkXVp+cEWYVY5nBpV6TwDpxm7nCw5sy+eWfHNB+nFOpSz1gW
         EK3Sb4uYzWTzrk51iywLO9yVIITAGiJezxP9cf0W0SORN0ECL9M4JU8AUrV7Vhg6TWC2
         cJPQ==
X-Gm-Message-State: APjAAAX9GY0j5VajHjEb1gdSJX7/5VjN+wpbLrLWsnHyykbcVztnhSkh
        wjRaa3oMU4ZxuFALprMFX5kzQ4a84C9aAwni8CHNAw==
X-Google-Smtp-Source: APXvYqyGWF4ZIZmyLQMuDX14kcvxeeCM5hkV3U0eHSk6sdJXWFiGdgPgXZZqM7Qcb2XEL4SvXgko2JXcJMShZLT4asg=
X-Received: by 2002:a19:651b:: with SMTP id z27mr4439294lfb.117.1574281058113;
 Wed, 20 Nov 2019 12:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20191117221053.278415-1-stephan@gerhold.net> <20191117221053.278415-2-stephan@gerhold.net>
In-Reply-To: <20191117221053.278415-2-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Nov 2019 21:17:26 +0100
Message-ID: <CACRpkdYx1SP4r48L+5vJMttuGPoRH+HMhBw-CnZN0MdqtwZdVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: ab8500-core: Add device tree support for AB8505
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Nov 17, 2019 at 11:14 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> AB8505 support was never fully converted to the device tree.
> Most of the MFD cells for AB8505 lack an "of_compatible",
> which prevents them from being configured through the device tree.
>
> Align the definition of the AB8505 MFD cells with the ones for AB8500,
> and add device tree compatibles. Except for GPIO and regulators the
> compatibles are equal to those used for AB8500 because the hardware
> does not differ much.
>
> Finally, change db8500_prcmu_register_ab8500() to check for the AB8505
> device tree node additionally, and probe it if it is found.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
