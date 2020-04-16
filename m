Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404ADC2BB55
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1001421841
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fK5JsDoc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633236AbgDPL1r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 07:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633217AbgDPL1j (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 07:27:39 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CDDC061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 04:27:39 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u15so7434282ljd.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7w8uSc7h8KgS1tb3yibkFzYY8qlF5pm6oSHV83Uw1Yo=;
        b=fK5JsDocnEIQpMxmcyB3SNBb4AiE3ckwZUinj2ftQ0O4JRKTIbO7AkXbjTfZHrcW4F
         Ph4c5dNJHtoDZPzBgS5P46KsV0i5vqL12l8Fs/R5cK17ebKdvWg/2V+X+dGThmiG0Mkv
         CY8x/8PHE4auLNJwrIDut8yIQXTG48mnpFO4s9Bkdg7Jqu0V2DhS3i+8y7+iU/jAYrz5
         gcPWZXxCD0D3Se2pwjLcJlq6OFklUaSAbw8qzQo2/9Eg8O6oPpRRVUNjnI8s5CRe/79x
         RLkZULM9yPYZh8o1WkzqHdKmixESJch8RSdCExmIi23JUhWnw8TPN8DTSxP75/5Ij5fh
         /jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7w8uSc7h8KgS1tb3yibkFzYY8qlF5pm6oSHV83Uw1Yo=;
        b=N/WPpAWWXk0OxlgkEIrqv5ymreQb4pb/zExsBo5whFJYPqZS0CCGw97M6Ba9fF+7a9
         Aiq9m/E4lYhRX0w4OfdG7hCjwSwovEwFeASdYq1tMuq0HdkaARRFZY0kzyyG3M0EieVh
         1qf1VHWcXsUhmyDh+8L36tepWRruHbpJK7gL/FSwMvG6rlF24KUsT3cShN03G1eWbNKs
         zuWHukd4BFw9BV6HAIUUrIzTb5VCCIIzNFqpZlMprIfc2cI1TOkaAvsEm5CpjNv1n5hE
         g3BdWQjpNDr0YCnCyzIATxt0mtgCa2jJ+xu1NuOAZR/nRbGUjOPyLqOH44ShGFy/afsJ
         MJsw==
X-Gm-Message-State: AGi0PuYIuDZD5dWVDGhggt5GLgteMt+bGNA+c5qTDgE3QxuQjCbzd0fu
        2etSfHyMnQbgoQtffZqxlKs0HVd9tiXDj+eR5Yfb8g==
X-Google-Smtp-Source: APiQypK+/66JCAU5dR9ygtoleJlBgRb0eW5swJDYGED+qjknJO+le0b3+Jc2JWnpyeRFTwKn69HDCp2PQXUZ6a9msV8=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr1282479ljp.277.1587036457745;
 Thu, 16 Apr 2020 04:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org> <20200408195109.32692-6-sam@ravnborg.org>
In-Reply-To: <20200408195109.32692-6-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:27:26 +0200
Message-ID: <CACRpkdaG+WcckCK27HPx=tCKMHaz+TLbTkj3gi+4cyK+EbbO3g@mail.gmail.com>
Subject: Re: [PATCH v2 05/36] dt-bindings: display: convert
 arm,versatile-tft-panel to DT Schema
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

> v2:
>   - Fix entry in MAINTAINERS
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
