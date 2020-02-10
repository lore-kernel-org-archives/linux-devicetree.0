Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C91C3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 11:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DBB820842
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 11:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g43EkP4T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgBJL7v (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 06:59:51 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38926 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJL7u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 06:59:50 -0500
Received: by mail-lj1-f196.google.com with SMTP id o15so6809557ljg.6
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 03:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N8ri1HdVPDzljdnoSaEAm04oUJIH8kMn84nyxZZBtKo=;
        b=g43EkP4TbcJv19phmkl5303wP1GAzi/ow/vV/dXqWPvtosCf0QlPvzt+zBYAgWAO/N
         dezbjWY0uhR0ryk00PKNWID6U9hNziz6EJGSzHWr2qslYSgJhLeGIp/rksWaMP51gg8R
         LmfI+CzoVVAuvGh1+8uMeIAE1wxkoq47wyRFD2UsgcLWg/cwVZdbZQTQdRRw6g4ANQUc
         HvEIHjbSqWGDgOaglqyuIcjc+kpexvUdNSmmQjto7RdWJiOkKkdyP/F4tP4s73D1zD1C
         qdCU0yC3dR0qbeLBSbwreIEuziNGPmVnNVC48ZizBlsz9kyiJ1M5IPc+H8o/0Ly5ptBw
         D4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8ri1HdVPDzljdnoSaEAm04oUJIH8kMn84nyxZZBtKo=;
        b=DSO6vOtjL6FvAlFT2yT6HJv1wbPns9pY+zzO7i7GbEn9oGsqveEg3CKUdmFb5uilfK
         GZjTAzo0MZlqfC6P/JG4YzNBgzd0beTaVdKHdWphka05WuW0fQ1H8UFDCBtoC7S/ocFH
         30ZedvBIXGo+Lp51K95cBKthyJGSD6rNW1+gWp55PQcnEBF4FhgeB2kc8ABTHtPWTgN9
         LL9NtARJ888Ru4rTeCmZ5l1u1w6mGxhqkrxQl5+VKSjKJkEBM/sGFhV9L+iHxN/goC5E
         tcxLBym0WxD0qAeO07f2UmazrsvcfKehhpsS2g7UhwgDTkLB4m0tsL6PwmzvK+iVceP0
         YNbw==
X-Gm-Message-State: APjAAAXfwMaxehBJE9FL0C39ehhxT5dEsSvchyRO2Om+Jel/JqmcmVT1
        xhc6743VP7+jmpU/TX44cIkwCoySggv4Q0ts/0fOsA==
X-Google-Smtp-Source: APXvYqwglVmXCBtqHmbsVj4LnQ6hKh9b/iLCxpT3Sd3eo1f5NK1zSVEncR7qmMFyYJgpThGlN6KNwGwe8ZZpiFsMTec=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr686115ljo.125.1581335988714;
 Mon, 10 Feb 2020 03:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20200205134336.20197-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200205134336.20197-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 12:59:37 +0100
Message-ID: <CACRpkdZqfz6Dbu879aC=FdQxkZB6E8cYxQvEnTOsfJRjjFeMKg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Avoid kernel.h inclusion where it's possible
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 5, 2020 at 2:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Inclusion of kernel.h increases the mess with the header dependencies.
> Avoid kernel.h inclusion where it's possible.
>
> Besides that, clean up a bit other inclusions inside GPIO subsystem headers.
> It includes:
>  - removal pin control bits (forward declaration and header) from linux/gpio.h
>  - removal of.h from asm-generic/gpio.h
>  - use of explicit headers in gpio/consumer.h
>  - add FIXME note with regard to gpio.h inclusion in of_gpio,h
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: Elaborate changes in the commit message (Bartosz)

Patch applied as clearly the kernel looks better after this patch
than before this patch.

Thanks!
Linus Walleij
