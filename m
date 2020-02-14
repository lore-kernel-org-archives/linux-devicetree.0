Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC330C3B196
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:50:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 809C9222C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spKYlIRd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgBNKu3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 05:50:29 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36628 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729153AbgBNKu3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 05:50:29 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so10205777ljg.3
        for <devicetree@vger.kernel.org>; Fri, 14 Feb 2020 02:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIA3W+3A4bSWg6/IXoCcQhYlPTEIwMnLSptSvMwiM4Y=;
        b=spKYlIRdf+1AzjlULsr1Z7JsO/k4DXYBqXtiI9UhHW5I+O5U2cbOqdiXr86g2K0FBA
         IFImVz8Pdr3K7+sZCx4rsqvUG4DsXUPf/lUySjxQCnPmaQYNnBvtZWRRGpNYNlE0XXPq
         RDVjPpqykFUvf6ifUff5qiqD0z1i4NkWGEZJAMvwgKuRowW7Qdr5GqxmagGhGrOhWQvP
         2De4n4B6OFX2i66uchc5Qph/AhFcOMu1bldmnQrlFuTtyWcmgZ0yGUhikyAmCvhLTMQd
         VlXhFojj0gwuFnBagb+1E11Bme0qW5eFBBWU4u5gEY/dbY0egq/PD/vqwsORgogtR4rf
         nwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIA3W+3A4bSWg6/IXoCcQhYlPTEIwMnLSptSvMwiM4Y=;
        b=fM34acINHKNr+qafG7jTj2S6mkCVCAlu0+1YjS2P6GdigQO9GTNyQNpRnT58u9BJ0+
         HbrSEhMA7r/HqeCWm3Z/vmhTMcoQd37CEQOAkHK5QFglrtHYwQauQr+lk4TLwYd0xxJ4
         rwC29EOw7BjuRji3360KWLsMeIE5T7a+O91gvL6eIb2ig3QHXG4acSrIFhLkyLfYF7BD
         Ycm+vFBoGHAeLGf2Aigi+hUr8lYvTrAolyADDRl0G4vsY+5bGLyIyjUhlQF9sUjot6Es
         rSp8+UomhuAqRMh9SiPkkdjfV6dAFI5BCrj3x2tNkBJ4sxlc2W3Z/I6WY8SkFqfICkFa
         ixhQ==
X-Gm-Message-State: APjAAAVP7L21WVJ7+Hp5JsPvRGGSjfuf3EWV9U3IhKuUxtihJscAvU1P
        6JT6TXYzJob/u87rprR+eiAqn3+gujNshrJ82h3iug==
X-Google-Smtp-Source: APXvYqyUZX06D7qDW1NxJWCMFUDXVgahKBLV8X2RzIk+Kuc0X/81i7YmxoaF+EMxTrfncBCFTDLL6rSLbe74lmM8mf0=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr1604098ljo.99.1581677425697;
 Fri, 14 Feb 2020 02:50:25 -0800 (PST)
MIME-Version: 1.0
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com> <1581166975-22949-4-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1581166975-22949-4-git-send-email-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:50:14 +0100
Message-ID: <CACRpkdb1NBEj5iebtim6_z7866B_bQAZS4J4fsOupusehHUO0Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: bcm2835: Add support for all GPIOs on BCM2711
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Feb 8, 2020 at 2:03 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> The BCM2711 supports 58 GPIOs. So extend pinctrl and GPIOs accordingly.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied with Nicolas' review tag!

Yours,
Linus Walleij
