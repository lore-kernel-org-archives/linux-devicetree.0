Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD41C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:31:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CEA5207D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fn+435nT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgERHbO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 03:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgERHbO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 03:31:14 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA80C05BD0B
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:31:13 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d22so7101215lfm.11
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uh6U4dZDkbJvSpWnsBIA2oI3GollY7EReC9a0+QL8ds=;
        b=fn+435nTT2iQwLK5/3IA7H4r47HpNUn5YBHSB+1i2lkrJx9KrtWfql0W22bANgDWw5
         L+MnwKFA0pBFg2ZykU7CHeBPNSJlNsXD4oq9wb64di1dAgA/DLCvWUzMGsZZiHOpJn4w
         sdj7TJpIOJhma0T9ExyDAW9vsJxto9cpcDC2gNsExVzImla6dOG4PThs9V+fZS3puNcm
         IYvoNztUspqoRABag4wKI3CTCltF+XNU7FLKsLq8hWkwpeG3kDeFRarJZf/aYQloYKVX
         k2rwKJHcNK+axSzVLvl1quy/Etht9cPCUxdvWfKXkKbRJVAvkKAcKv4Fo2J4e2g414lq
         39IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uh6U4dZDkbJvSpWnsBIA2oI3GollY7EReC9a0+QL8ds=;
        b=Iz0mmDG5XzjndT3M96Y1jbCM0K5HZaAEXm7WfSSd1JUNGpQ4TJg1EDpUf6DnR6aBts
         FCqgQWpUUQ96gEW3rqgaNUkah8ZyGl5qUdbXBcu4YdcDlySb9cqPhnfNZTps1zXz0mLO
         O4HiQqeA8OWOjpgkKpt00EKcKE4i9vWLOGtiuLGOJu/NL1EKJFm7yTJn1UWWS2r83e3N
         CoaJ1AlZCP0naoxXhLE+HtIRrstJX2KJzpKVzrsS6Tpp2UNM8HJzY51teyT5xMeGTzqV
         f0xfUm6b+DjLnczHYWbH9X1B/tN/SRT0EXRG1VPCipLdwiwsfcJFd8WlXxqfy+XPb3co
         8hpQ==
X-Gm-Message-State: AOAM530SCJZM8rVsJhkz6E7KJYJVrTOD9/8KkBhrost3EQ3A7bH0WgIo
        AXq6AFMnB2NvVUWa1cGPPkefzrktGCsqCAyZs7tHJA==
X-Google-Smtp-Source: ABdhPJznbrsFsG8QKFvYdy2XwjkDX2MMyM6frFix0Prjjj2ufcZwEICHddKXiikVCWz07ysLLhFYASma4iKq36dcOmQ=
X-Received: by 2002:ac2:5588:: with SMTP id v8mr10393421lfg.217.1589787072183;
 Mon, 18 May 2020 00:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-3-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-3-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:31:01 +0200
Message-ID: <CACRpkdaZjjxfnRPNxOZghyY=pFMwEsd8GqRYxt1QsU3Qhm79mA@mail.gmail.com>
Subject: Re: [PATCH 02/14] pinctrl: ocelot: Remove instance number from pin functions
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

> This patch removes the instance number from the "miim", "reco_clk" and
> "sfp" pin function.
>
> The change needed is to prepare the driver for adding new platforms
> with more of these instances. The instance number is also redundant,
> as this is implicit for each pin.
>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
