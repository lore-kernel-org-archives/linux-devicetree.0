Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFCEC3F68F
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 10:12:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DF772073D
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 10:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfY9U2do"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfLMKMK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 05:12:10 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42730 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfLMKMK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 05:12:10 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so1522114lfl.9
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 02:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/LtYexBY2dXuMD99CyEqehHu+qZn+VwunxTbXsEsdM=;
        b=EfY9U2dohuaFocXEdGwpV2jB5gwsb/ceEYegtN52xewKHbBp3HUqhPkb4isfJq179J
         VzFHyb0kppgRTt3KQPhtPZDGvlf8OH1HIDaCvewdlkFC8+luy/SC2xXfffh7+VLLRwC+
         mHPVxFAxO2ebwyTtO0MfyaKn3c1g4KQxoifLUyFBWs63q3N9RdJ0o2xOaGnjKxAF1reL
         eOA05cw3KiYUH7N8J2UJwVHS1+MSYTxy5J1LlHX7ORWi40VpkBwz0uEpEMzfv8jrlxg7
         W8+EMbApNOtHTEBm+FMdeI4AC8EZEuiKO5ZdEH/Y8QHWmQHV6/5EM9pvimlKMV12ym3w
         LmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/LtYexBY2dXuMD99CyEqehHu+qZn+VwunxTbXsEsdM=;
        b=B71MJ8p7UPUibaAhAk31CnfqHdqvuhGlRjeHOdfkopwe5RaV5iq+OObV1fj6IgxiEy
         P+pn9ej5wbn2c7OjEtUD4XZuIe74y9nta3DYjHOgOSdoT6hBSH0DcV7FJDtgKLiwnvC4
         oTNjhyVr40ukNchAUPlAy9aQ5lMh9wppYTx7LE0VUvwNcBedEapvyu2arBkraEH+gmJW
         60gyAOa0jgPVDc/b7/XgDCYsFWeI0H2371x0hSdnT01QFHRX3TUboM9M7uJUA0w3gprJ
         k84IPFKrnJ9CvJcrjvkzaDgXIPrSxH1pfooMMjN8Cne7bLbcQooZdhI/p6S09JY140kp
         jRRw==
X-Gm-Message-State: APjAAAXkm6UjbrHShq1oRInK27JvyB5ASwWxWKPFUBW26QDP17PAE2rb
        Kj34z0WidqjWHXSaBVLqJGk6SaSUXbAvUQwD9J1Hxw==
X-Google-Smtp-Source: APXvYqylxfzNVPGqr9591RfVZ99OAOsLlKI2sKmjjlNFv7cMeHHTZsq313giYfhVet28Lcs1R6wVKgUeBdcUBTsUkqw=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr8287131lfg.117.1576231928054;
 Fri, 13 Dec 2019 02:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20191205133912.6048-1-geert+renesas@glider.be>
In-Reply-To: <20191205133912.6048-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 11:11:56 +0100
Message-ID: <CACRpkda=VSn1PS3J2iMnFZ=iGthCCtw7NX+S+8-76D30tntPRQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Document r8a77961 support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 5, 2019 at 2:39 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Document support for the GPIO controller in the Renesas R-Car M3-W+
> (R8A77961) SoC.
>
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
>
> No driver update is needed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
