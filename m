Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD5AC35656
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 16:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90FA6222C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 16:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVdWb+3x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgBUQKl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 11:10:41 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35748 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbgBUQKj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 11:10:39 -0500
Received: by mail-lf1-f67.google.com with SMTP id l16so1895184lfg.2
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1fzmdPVewt4poXC+/NMgaFWzacayCygYoOgCnUFqrFA=;
        b=fVdWb+3x5OJjWjTS8JQOQcRTidOkvjo2ir5U7PGAMVw5WxJMB39mldwFJOaGJBpPUy
         TygGJ4Dh2eYuVpqhNmTy3A+mpVuIa2KKYLFA3KwEZW7wHuF9sM0lfQDUBvctfKY5m1/w
         pO0dTq0SLvot91o2JkazTn4LiuQ4fl4I5uYWo0e5ArrD3w5jCckR3bFlT9HGTa+m8PiK
         8VAPpY7zeJn+UMraJSLg7HWnf8dY0AdiTCeorPVYG50crBQzgoxJZ4GIyr4FyKjRhKom
         FwWdL94yUF4/ORBxgq/aGEs+gPSJnwmTca7vaVtED+YyMLd2N70TOhnvv4WIVVP46psz
         EG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1fzmdPVewt4poXC+/NMgaFWzacayCygYoOgCnUFqrFA=;
        b=pZfCjQUpKWY9bp/MqVp9gI2QIIZ8imqcOZeCOhdd8k5t8DG5Zs+ACOGMI3680fAI2E
         UtxqV0CHRdnnAePe/Ggyez16i5VoE4KBfNiDiq5gX1EhHVmm8pggjmgpIKgChiy4mQM2
         M9OXBFd5Ba+lOd06snJ99mRPLPtgAwu5MeMdfFeDqG5yT3IaadyLcu7E7AdK8IcEa9jU
         WqtT1sJ6fh+JAlEnaoPEaBbBynrdWP5F5MTcMVggf0j461HJ2j6ImMxjFQXZO2jP8O4q
         qBj4Oggs9krHfk7SjxPppReVkAyPe9ptiutG7vE0t8YJPLFxJAC6hGHo9xTv+/xxWMZi
         fAgw==
X-Gm-Message-State: APjAAAWdqjfF4D3DxKHMIj6VRp05cnO7HLW2G1ln7O4NmJEyI/2T0GY/
        ONXGks6uQB3Erf4lg9f0bPEIP2E3x8PhFKFRlvnKHQ==
X-Google-Smtp-Source: APXvYqzfFpHz+WEEPdfY1KvmrQ7fJ+JA1hBH/qsYBoXtX0Ad1P1ZdxZA5yWVXCM5V2QXzRc1KsrSTBXhNXruk6AbO4k=
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr20384167lfb.21.1582301436869;
 Fri, 21 Feb 2020 08:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20200220130149.26283-1-geert+renesas@glider.be> <20200220130149.26283-3-geert+renesas@glider.be>
In-Reply-To: <20200220130149.26283-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 17:10:25 +0100
Message-ID: <CACRpkdbFRv2ab-fa3htiLBTmW4kCuB6Rmxb0Afj=eP4hH0W7BA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 20, 2020 at 2:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As GPIO hogs are configured at GPIO controller initialization time,
> adding/removing GPIO hogs in DT overlays does not work.
>
> Add support for GPIO hogs described in DT overlays by registering an OF
> reconfiguration notifier, to handle the addition and removal of GPIO hog
> subnodes to/from a GPIO controller device node.
>
> Note that when a GPIO hog device node is being removed, its "gpios"
> properties is no longer available, so we have to keep track of which
> node a hog belongs to, which is done by adding a pointer to the hog's
> device node to struct gpio_desc.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop RFC state,
>   - Document that modifying existing gpio-hog nodes is not supported.

Clean and well separated code, patch applied
with Frank's review tag!

Yours,
Linus Walleij
