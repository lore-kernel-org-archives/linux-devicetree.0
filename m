Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4B2C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:38:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1D522068E
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pl1h98jg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKVHid (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 02:38:33 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35597 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfKVHic (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 02:38:32 -0500
Received: by mail-lf1-f65.google.com with SMTP id r15so1802109lff.2
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 23:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M73k0z7olr1IHrpftsQ3B7KfGCsjFAsCvNuWEozTB74=;
        b=pl1h98jg8j3mIJIWsfoGSLKK0LpyPFxOe4GjytdLoia19qqtoINC62IkV9XQzCvd6A
         iZSWTHwhfQOyeGhaskq6c6nTMrRRtr3kCaBElwtwfB6iCElo2DMoa3GivOSfgbhGdnpH
         A0HQIS/MV1UgpciecPdzcKw234QiaN6kxttZhbNID13MqWfxq/JP0jBNQ3wyGCvB5piu
         2Codjpz98ua+8kpwIwopE5MW5FSovaVeB4FARLlyEVp7Ziwm3zCXyvQmBFMBfUJjtE70
         mTaw7pL1Duz7o7cpa3eEZtqGpIK/KvR0ou4fSP9OwsjmDSgXejaivfu0zX5Rz7tkmJl1
         kH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M73k0z7olr1IHrpftsQ3B7KfGCsjFAsCvNuWEozTB74=;
        b=n3OfA3f1vJ7uT8khrwdInbyuy3Nwhq1cGi5HtZCvBmSK2ZtYf37CmGY7Bv+BLfTbxR
         4I4AM2Q5GPxYTz9pqNry6GdbC1hUA1B8XR7kaPns+NC3P1xx8RFWrEuNOMyrO9jQ+zYO
         EX3PYTz/Jl7kmIhrDS7V+KR2JJoKxMcZAsOst12Y+P3ClKXaWOnGDaSbNoEiZd5oHBja
         9q958aueWj8g4c/242xLX7nbXR61jAo1F4s4nGx0FMLBkAb4H+q9JZLdd4ES6ffJmDvG
         nMuTYX+44SIF1i4IvYCorM9+tneh4HMscXw0JXxFqtuPI7PCTSsszIaOZRT5DnhqpkH7
         qrMw==
X-Gm-Message-State: APjAAAW/hdXqCPGHXmum2CrnXfP0IStmiUUrpOJsuH2sJRlqDzwIEpyp
        wjQakP2vVOGxScqpIiVJkSsOlQzdn0ZDqZVFR6cLZA==
X-Google-Smtp-Source: APXvYqzMwCH/8/vy4szi4eTRh89ioCf9vV4Bs7jjblxQccv58GQ1TGH3HybDuIKRrqhlMjtxMZ95MNChFl4Y6uofITc=
X-Received: by 2002:a19:645b:: with SMTP id b27mr850294lfj.117.1574408310889;
 Thu, 21 Nov 2019 23:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20191120071302.227777-1-saravanak@google.com>
In-Reply-To: <20191120071302.227777-1-saravanak@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 08:38:19 +0100
Message-ID: <CACRpkdY-cQGK-Q+LLboa3E+0G=251PhMR5xDX2ZUY5-hPVL-9g@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add device link support for
 interrupt-parent, dmas and -gpio(s)
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>, kernel-team@android.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 20, 2019 at 8:13 AM Saravana Kannan <saravanak@google.com> wrote:

> Add support for creating device links out of more DT properties.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

This looks to me like doing the right thing and making sure that
the GPIO drivers get probed before their consumers and thus
speed up boot.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess I should get on with adding device links at runtime
as well, both for GPIO and pin control so that things work
with runtime-added devices and boardfiles and ACPI, if I
understand correctly it's fine to add the same link twice, it
will just be ignored?

Yours,
Linus Walleij
