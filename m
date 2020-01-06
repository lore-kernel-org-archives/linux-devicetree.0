Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE957C00523
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 01:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88FCE215A4
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 01:16:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hn8vyumt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgAFBQQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Jan 2020 20:16:16 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44039 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgAFBQQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Jan 2020 20:16:16 -0500
Received: by mail-lf1-f68.google.com with SMTP id v201so35278890lfa.11
        for <devicetree@vger.kernel.org>; Sun, 05 Jan 2020 17:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f2WYAmTo9xkjt45plH42IIsrxPXmZB5PIF0gHSmLChM=;
        b=hn8vyumtM0xH7s8HR84SRPg0B29DOwjMqYDrseu40EnqqMc+vH93vkcRZz+oT9nlPr
         XVNKHK0qroXWyfkOsCcDLujtjnU0YQ6C7LPJchoGcDnMbJdXqRiUJ6X76QdtmYxfN3Vj
         0IWzB5FzS9HNqKUQpFmnOUu9Qtg9MDX3rNqPc7ffhAp1dT3tuvv9deOkMPwtE8dEyyvX
         lYMorJOMxTrBnUBKm32dClhdGrpD1SrTQs3bHhOl1iBXQ4d1yYIBICldc6steznulSoF
         Wz8fF8STz7k/JggqEntUHTS+yyUjCPDw3sAPnGPvxEIwxDAvbpKiWFhAD85sZovW/gUf
         eBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2WYAmTo9xkjt45plH42IIsrxPXmZB5PIF0gHSmLChM=;
        b=c/LYmPv70XVP9vnJMy7/BrLDrLMhBaVpM7IrNtdDAWV1pmWOC8VsaBMzdPtDESoI+t
         eSaf3sYz6zVHU61C0UNlX0v78NrVn3ObZKTCMUW3lzSftVbeUNdepic2oea6EBwqjTu/
         Gb/Z/aoAAiinrTRlUf2fCEPwkBqnwDRd+OtrkCgs+6X6Fw8K6wM4bGis+CMsM+aVE4L1
         PA5vlOsQOJDKElClh5twALpEKUE3FEAe3wxlfpi5quEWXFUw1KUl3BqV94rHTSNiQaxV
         5lGMBkS7YmIE+UPt9A0sK000tw4Tp1sjlf9v1BWXDGP1riCpOhxViHXQhaG7yfO0RDZK
         AWiA==
X-Gm-Message-State: APjAAAWMcKv8tVa4rutc6oGUhFhk+x8d0qXA4ACPdYX3PQeecIxmVSxn
        PvdEWhJccw1ou5kzhC2n4AM3EiTJ6Mil5jffbVFkGw==
X-Google-Smtp-Source: APXvYqwf8jnx5IcRTepvZ7QaLz/z3X5jA7aJ1JJrmMg/b1X3F+f0YmXm+ZtYEeB4FHgA8jp+KE1R3KyhgzbtNcoWmA8=
X-Received: by 2002:a19:2389:: with SMTP id j131mr53069301lfj.86.1578273374851;
 Sun, 05 Jan 2020 17:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20191231172458.25984-1-linus.walleij@linaro.org> <CAL_JsqKcuV1dKuTD7iYdyHA3fqv3ENBVj7RXQuT+yMja4tJpxA@mail.gmail.com>
In-Reply-To: <CAL_JsqKcuV1dKuTD7iYdyHA3fqv3ENBVj7RXQuT+yMja4tJpxA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Jan 2020 02:16:03 +0100
Message-ID: <CACRpkdb51srgTSiCny45=8=JAwL+3NS2XZiXSXr1wwePz4DoJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Create DT bindings for [PS]ATA controllers
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

thanks for the feedback, I am fixing up the patches with some
hammering and tinkering. Just answering this question:

On Tue, Dec 31, 2019 at 7:44 PM Rob Herring <robh+dt@kernel.org> wrote:

> Why do you need to describe the drives in DT for IDE? They are
> discoverable, right? And unlike SATA, the power to master and slave is
> shared.

It is because of a related patch set by Guenter Roeck where we
add thermal zones to the thermal sensors found in the drives.

To associate these with a thermal zone as defined in device tree,
I need a handle on the drive.

See my mail to hwmon for an example:
https://lore.kernel.org/linux-hwmon/CACRpkdb8rehAPKE2Zu-Jf4TSE2m6ks91vZdrVy+HitijabeVbg@mail.gmail.com/

Yours,
Linus Walleij
