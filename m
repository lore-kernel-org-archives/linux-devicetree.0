Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF75C2D0EF
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB4B621556
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMUW3PGe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439760AbgDPHvy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439758AbgDPHvu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 03:51:50 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A3FC061A41
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:51:50 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v9so6691148ljk.12
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=loMCxNASFvkfTDCyeUmtP2u+gte7x5OtiG/cQmRKcuQ=;
        b=xMUW3PGeSrw4ARkL9VDfzWDbSGxC6xcX4Ki7j9FBIb94zY/nyX3c8swn8+2K2eXQWf
         u5I0kwTaOMKF60tm8Ybb4RI83J/5chP+BKkJGzpCt4Njp+d5eKgO+RHGsvNhseRCUr0A
         kxzkYeOwrVdKr3ln53f3UvwS5CL7sp7ao9UeUyT58VwwdOmE7hQ8XnRCvvbD0t3FKapJ
         oJRfgQsGirpJkwaZ7IV8kGn4+8QNBvxXn8FYrLA5QKLO3da7dEJHYdfloWOUGYngvefF
         kPv4d618uycUv1TdFu4hKJ4ZeXV264Nmr2hjONIdx1CDO9GlIQy4qphT6PWNZXnRrTaf
         KZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loMCxNASFvkfTDCyeUmtP2u+gte7x5OtiG/cQmRKcuQ=;
        b=kpOwvwFgcLpkhnXqRtaLdDl5LX8FJuFEIPKpDLsDyy7oWnErD+ZCf7VJFIH/SvxOOB
         XuleCinFHE2O0p4M20J1k3f3XZt0O94VWtbWQznoFYU2tuatxvF/c2GAdiDIrJ5WmL+W
         ydzLcdmeffl7zVRvx1ZPBg9gLXw3HFXuPqHokvwKm04Cdp1+HVXxuDJrOgOfrMQoqfbC
         fayPCU1JuO/aczUXvuMRE/LngJnoZEgIxWumnhmk+nFxDyXClLwwXOaXkrSebZlOnymP
         InLeNjFV7XjAiyKOC+mbo41DpuiQYDzgihz/RLjrvy9jo/9Avwm3olhfjS2K8tfhtRkl
         IH7g==
X-Gm-Message-State: AGi0PuZMAfGXbKtuf+lQYbBfwziVKaEd68oKDI/PVU3v2xGDWkkRpkuc
        ZLi3UrmYios1B05RBeyE6II4EcIUO+WgIeDZNpQS/Q==
X-Google-Smtp-Source: APiQypJ3hmhHjH4xlCLoz3/xbW/q0EWD5I/m1MGIq4yanefRacOTieYBUa0MrvrxoWyMyTHM8e3D7N8MbRBPt6Mds40=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr731003ljp.277.1587023508445;
 Thu, 16 Apr 2020 00:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200329104549.GX25745@shell.armlinux.org.uk>
In-Reply-To: <20200329104549.GX25745@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 09:51:37 +0200
Message-ID: <CACRpkdaL4-Z36aKOVW4o2MtCG9fbqm4gxZN3QjejVRPBZrzxxA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] PWM fan support on Clearfog gt8k
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-pwm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Mar 29, 2020 at 12:46 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:

> This series adds support for the fan PWM output on the Clearfog GT8K
> platform, and can potentially be extended to the Macchiatobin.

The gpio changes all look fine to me +/- fixes for review comments.

Could the MVEBU maintainers provide some feedback?
Curiously the file is only listed as a PWM driver in MAINTAINERS
so formally Thierry & Uwe review it (and Uwe did), but surely
the MVEBU platform maintainers should take a look too.

Yours,
Linus Walleij
