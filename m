Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCA6C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D42E207D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdzqRAP4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgERH3z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 03:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgERH3z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 03:29:55 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97E9C05BD0B
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:29:53 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x22so4200493lfd.4
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0QQj8C5JeEmDZ6ZApGtOW1NT9hev78BCGty9WyW8HQU=;
        b=KdzqRAP43Jx15JsBd7CMIo/2/+5tguTprPLSwNIyfoZQ0+ufPuN6S/BANnhJsjrhDD
         DtP3v+cVRz1H4W7gZemFOLYygUe9Nnqc8CiVseZ1qH7MkopzW0uYIM/6QDifbVQUaEzY
         I9Io5hrtK55gyaPukpP3UulY28GmqBr7704IEqyzsek9z5cWKXKh+nj6/8N35gBEzKLB
         z7UbsMop5bQJkCqzM/P6qv2TYsuzenpxX9AvppK/Ewkg0FlUbL6cOIGLnAWxK13GtB1K
         pL1FPAWkCnhD9H5FlvEDJp4hPMXkM7uAmjEi0J/HlDU7NpDvA7JOV3+ynsGeu4wzmRsg
         XxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0QQj8C5JeEmDZ6ZApGtOW1NT9hev78BCGty9WyW8HQU=;
        b=MPhNsaEepnogIC/sjoUWIQ76shKrI7lzZj+i09YKpwT8Vs69rOI51/BdhZ4BOe1eIq
         SYgE6UF8wF3LI8xXqpdD9v0XDFYqCx3LBl75AMFpUFPgekX8YTLw56T9oYmfAbMcg8cf
         5KMcgI5WvJg34+BwnpH1zIk4lN9Lpai7vYbZtAShMBlAUzvp8NUNilpD3pQ5YjoVVs4W
         r7ojJ3tK0ZgfEXa+yGh3/Wz7MH8Kwu4p7MVOD1GkP428a5A2e0r3BejQaaJUd5ZHtSpc
         sqOe6fJPYHCK7hX6NW1zJlExf2+o1rzNv5f7wmz9hELywoU3M5bdRi8qAitE3hlT6F9x
         2BJA==
X-Gm-Message-State: AOAM530L74bWIZkFysJgyUqbUpl2z+mGiS48+vCcnkG3KzxhkGq6NUUu
        Cw9uSqFwJoy3M0f/PqmKY6Mt8Sig/zRgF5kc5qNo8g==
X-Google-Smtp-Source: ABdhPJx6fCXx6eAlYEP7owDMWFfg7cz4sOJv/yQfCTAhywTwMqJW95DyJ7NsllwioD8AhEiAVzPb9dcty/D6ToHML3U=
X-Received: by 2002:a19:c8cb:: with SMTP id y194mr7741076lff.89.1589786992310;
 Mon, 18 May 2020 00:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-2-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-2-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:29:41 +0200
Message-ID: <CACRpkdZF++0AExBvDHNT+whKP2sNKnbczV4w9SXksG2Dyctecw@mail.gmail.com>
Subject: Re: [PATCH 01/14] pinctrl: ocelot: Should register GPIO's even if not
 irq controller
To:     Lars Povlsen <lars.povlsen@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 2:56 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This fixes the situation where the GPIO controller is not used as an
> interrupt controller as well.
>
> Previously, the driver would silently fail to register even the
> GPIO's. With this change, the driver will only register as an
> interrupt controller if a parent interrupt is provided.
>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
