Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2859FC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 14:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3856222D1
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 14:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEbnVhm3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfKSOsa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 09:48:30 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45827 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbfKSOs3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 09:48:29 -0500
Received: by mail-lj1-f193.google.com with SMTP id n21so23590786ljg.12
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 06:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=byAFlXzzH8jPBQ/aAVNrm3vOvpWN1xVTx4/MeZUVxQY=;
        b=yEbnVhm3gtJp5uGUSL7Pok3vTzWxNUWEt1wdLYeOpm9jbdCBolEwskTVQ5PPDzUlh5
         aasWp3wAeGWK7XJ7cTRBQEJmRMZF4DXusWa+M/9ixNWaB0xYJHE1+6XNAUcksjyT8/AY
         bVsChNiPEolUgUcff17R6SZYq72sKm00riC8Rvd02w9Ihz5auKvSUFdJfW0mEc51weHj
         4i4Mm+CCIg0kl4HPX2swUJOd4+Fj5InmXm+KjvmXCTl60j/d+VgpY/bnKkbsSw9mlopQ
         LtYKgQfjNOS+Q4ycfuSJGIVlUp3c+E0sJppMRHweG5oK4v+M/reknYklyUJDp4bE5/NO
         KwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=byAFlXzzH8jPBQ/aAVNrm3vOvpWN1xVTx4/MeZUVxQY=;
        b=DnJSJFhqHYplKjMqVWb8x1luiYNSQ2A3mRxl9sWq5wBlaLsK93GlBj3TrgJ16JktKt
         0TyGbUvW5+WTTK6rvNR42Mtvtft2c4prAEut5g+xlPRIhFILbmIE7SE/SOrCTYN5LWYg
         i8FqMeMshx/N00W9G/Gn+u3prYjmFbGRylUiaPP+UGm2L3dIuAQgxFLIsBrskvWjeiKa
         jbVuMQsdDJ5zMMoX4ZeR8Lw0E8gJF8ZPpQ+iObzSEfiS21s8dMBIJVxf+fkmQTA3prva
         E6xygkRa2xpfG/clZgqGMFeE4CqUsYqMFWIJtB3aFMcFmQd/qARuZylWHrKfWiW100xW
         Olcw==
X-Gm-Message-State: APjAAAV0Zv+CtIhNfSbLRH1YTFr7rdVZAiziF9jdtOy75tNUNYr7cGYj
        UrwHuTkVi31QVVcN6bjpWmkiDkVaFCsOhdXEm/NpFw==
X-Google-Smtp-Source: APXvYqypBpdcDjYi+awRNbMnaJ0xM8pEhAZMyB5wBSCbVU5PNhff35CN/EVhx1NFDxhNSxkHQUg4ODsr5mR56jda/Ns=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr4247059lji.191.1574174905582;
 Tue, 19 Nov 2019 06:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20191116005240.15722-1-robh@kernel.org>
In-Reply-To: <20191116005240.15722-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Nov 2019 15:48:12 +0100
Message-ID: <CACRpkdbiBAU451Tt1NqTGhemg800CH-sZQ7YMZ-RR18rzjv6fw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: PCI: Convert Arm Versatile binding to DT schema
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <andrew.murray@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Nov 16, 2019 at 1:52 AM Rob Herring <robh@kernel.org> wrote:

> Convert the Arm Versatile PCI host binding to a DT schema.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for doing this.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
