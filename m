Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA21CC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 20:21:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 928FD2068F
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 20:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bg6mfY2z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfKTUVW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 15:21:22 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44661 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKTUVW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 15:21:22 -0500
Received: by mail-lf1-f68.google.com with SMTP id n186so579301lfd.11
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 12:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=caC3q0Im5rpn3jVBjSdb9pB4f6Xutg4Ojk0RRX7E3Ok=;
        b=bg6mfY2zpiL/RfVmwZqFbQHz/Rgt3PXS6DXi0qCBphUJaLHDGQBguI6vIaNzt+9DYu
         ZokEIAxWE+lQr57hhnp1G4Fri2750tAnxHK3aabWXBWU8SM7ElfI+A0k3RnQznb8w/df
         Vs0JPiDxhlI2my6BeVn3xwVwCG9xA2mOXFTG/ZRgl4lHMEN6Eh5RSs9QT1fzfoavs1ln
         665fDynlhkzVgTRCkgiR6aG/gT/vKDN0fj/Rkt9WGkNeQILCVxIXt8mv9eAlR8/WXvSZ
         CmCMqO67FAB3U++aoY3tQQH5jRzVk1fSVjhuKIGlmyY9nFk2kHJIABK9VSwfeSvnsYCN
         bz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=caC3q0Im5rpn3jVBjSdb9pB4f6Xutg4Ojk0RRX7E3Ok=;
        b=lSzLX8jL+WX5Ed6nJeMSZyXfHEnto4gimJkT+HnBVaYVJnnX6VFlwg43jZ5bvRNAqM
         5R7QLH6fsjlcjHh6zYAkRBZBhybmjB5yLMNmsZpRxZ20ibxt24kECZIMddKgG7Fqw9E8
         wPFlZxzqaoeM5xgBtv9VsNZAm2sb1Na2snEtodHV5J/iU3e+pOPjIszQS9JaCOAWRan+
         2yyJ4h2p0FY3U/pyT3JoNdZgH59RbLV4KNQ5980ZjZQbZNRKvSBvgQn57zrPYZBmDimO
         X8p6049Vl6Rif06gLCMAz1tgbewOVrIyMnQeWqir4mzp8KijedieU2RwxS2Qf/M3XFn0
         4znw==
X-Gm-Message-State: APjAAAUjksb920qNnwLMH7obwML1dEZKnIjOS5K65qsnlgxlGOjcJ+Ps
        IxX2azmlOXjQfVMtgrEqrJzindCmUKQ12EMv9xHTIopEy2Q=
X-Google-Smtp-Source: APXvYqxBuwInWxqkVn5H7A2OVGPx7wX8ODFx7j//AFHuRlDKHd1fd0fTnmOJMAEpYK3rqOamjhcnY7Nauq736y5nZOM=
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr4491477lfn.44.1574281279989;
 Wed, 20 Nov 2019 12:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20191120181857.97174-1-stephan@gerhold.net> <20191120181857.97174-3-stephan@gerhold.net>
In-Reply-To: <20191120181857.97174-3-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Nov 2019 21:21:08 +0100
Message-ID: <CACRpkdZSwX6jdtE-e3v3BWb5-jicL=9uXnvNJVchjKHzStWg3w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: vendor-prefixes: Add "calaosystems"
 for CALAO Systems SAS
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 20, 2019 at 7:19 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> The Snowball SBC supported by arch/arm/boot/dts/ste-snowball.dts
> was made by CALAO Systems and uses the "calaosystems,snowball-a9500"
> compatible. Prepare for documenting the compatible by adding
> "calaosystems" to the list of vendor prefixes.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
