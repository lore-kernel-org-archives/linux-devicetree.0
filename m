Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CBBC2BB85
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6958721D7F
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvISHrsR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633179AbgDPL1H (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 07:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632907AbgDPL0q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 07:26:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D08C061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 04:26:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m8so7446254lji.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 04:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ItMKLhoTTV7+wK6jse2c5OaBjQvnx9Iemy9x9CFhkc4=;
        b=JvISHrsRWazHdYXKKlYLrRFdELBOOow4Jw0w8jLB8I+kKrAW3K+XyJ4C0ZUCKrfDLB
         SXdvCSJ2taPL878hyP8+B9KlVKF7WXiA4YrRismX2hcWsERKIhSgw0H/wd5gy+h4hceg
         JedVIO+b2FRg3fiTm2xDGBYL8X/sPUpyDsRG3nNRLFAcVHgKwOkFXBJ+JVCrTgw0oYaz
         sP6F407pdOwux8LsVxgkg/oMNOZPkvA//c5J5ML5Dznp1eajfl0j1XxWAU3tLU2ais5U
         tt/Pe7BXE8G94vhYVpEgbMyPYwfIJaFiGxwu7T1UsxkUNuyvJ+yyO6XTb/ComqT0d7bQ
         nreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ItMKLhoTTV7+wK6jse2c5OaBjQvnx9Iemy9x9CFhkc4=;
        b=VVlzkAvC4P8f6fwLu8fUJqbr6L8aoA79pQHldzDUKpOVLVyQujHUwIARwjesg7du6w
         /ofofzhW9liBBaKp9LUgpnc0JJcRMW4n9ouvtLB6cQvT+55PGbVYNvcOhoM3DPn0vYpA
         KWs0FI0yXdpKvukR1nZo4/mPpzZa88T7FkQB5cYC58QLwoEHp7kcdtKJo3HRE0hngbpi
         9j2ohSyoImBMZBiEttWC65t8wqiysDqC7IecP3WL25ncrSNXXBf/2aD0sfW1bFUmOBka
         qwguf7OxSWllaenXZAq6xYZvzkU6K8q6q7gWG/CP1m2XHJmG8tmnKFHVPA/xYnujXMvb
         gANw==
X-Gm-Message-State: AGi0PuYcfxL4gdWzD3TGSOj2Y4c31LmOEEYcT/I+3cHwdvGUDBzhGVAW
        Oni4QFJGGCO/2XBgrjhir1K3LamgAt+58msBpGAjNg==
X-Google-Smtp-Source: APiQypLNKo+8PBIa8cWaqGfJbETe1Y+lXjOhLcXgDjTUKhJLS2kG20SytVqpK+1mdy1IOLnR0YF0xwYrUVk0CaPMNSU=
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr5984508ljo.168.1587036404026;
 Thu, 16 Apr 2020 04:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org> <20200408195109.32692-3-sam@ravnborg.org>
In-Reply-To: <20200408195109.32692-3-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:26:32 +0200
Message-ID: <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in dsi-controller
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 8, 2020 at 9:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Rob wrote:
>
>     Uhhh, it's looking for dsi-controller(@.*)? which is not the common
>     case found in dts files. We should fix that to dsi(@.*)?.
>
> See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/
>
> Fix it.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>

I think I was instructed to use dsi-controller@ at some point but I
suppose it was a misunderstanding.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
