Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D81C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 09:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDCC220776
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 09:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h1hgyTlR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgH1JGj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 05:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbgH1JGg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 05:06:36 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964FEC061264
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 02:06:34 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id l2so574019eji.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 02:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvV7eXBvyQgCBgrsjvWaIv2rEaJefsbSLUIuZLspMEA=;
        b=h1hgyTlR8KltTUDbvjiOZ0FJPdU1qPb2uGFPxuC9WkmLFRhAEyeaFSrZW97ojGNcp0
         ccRdiTageCHFfZJBLuATi1xd0boWZlbxqSGcqSlmEk1SE5ZKwTSi9YCZAIGfUZiNksWn
         mBZgya8M2DBV7E+1WLVtyLXHnyeyR28qvSLsk3mBKW1XGhw+ERe3+pE8Hxv8ePRG2Uc3
         FqDohuRqdAKDiQe60Wp7dd+SAqOlJDTYXWvF5PYjIrtO70S+9wpqgoV0PH57Lti/mkS7
         lkA0rwUzvgBigA19Oou95yEg2rao3yIdKqpkBcEr/hgJpNN9FGAPgr0LiMO2eTLNh9sf
         XsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvV7eXBvyQgCBgrsjvWaIv2rEaJefsbSLUIuZLspMEA=;
        b=cFJds9JgvMJVNyM7sPBmpIfHPU2oJKvKdtkqxB1uaGVBGq2Och+SZBjiOxm54CeEZ5
         i7QG95LPvPY8bHHyRSuekiHPtumb783MCxMj8zV5cnQ0hGcqoPX7HiSj3qHGHlDIw78J
         SiqO/zodQd0qkmvY5aVG/KwjgdMfgl+gz1xC68jzjbKjyaOAmDogDO8VIqGi7Hy2uWRW
         zmAJe3TVGYGH3+uXsjOY+zR38HHz5BQPsse5sh894C6pSmBwsgyMcoipmq6JPi98Ud9s
         3Hn88ZlrUqY4ce7uGh6qQc5FAZ0r9FMJlRNNaazuO/9bKj5sH8+A+/xiS54XfVlnYBcm
         kPwA==
X-Gm-Message-State: AOAM53100RK+9K6+Qwrh4dfmRrD347DDkvuwW8axoKtDjJqK7bW2y5yZ
        BXC7onybo0FCloQW1QOaBfpslJ7CdAbPePeerFayNw==
X-Google-Smtp-Source: ABdhPJzmAhVb+RcSV8T4sZX5/XRKDlKD6uVeC4jK3X8WbHU7aWhc8Y1BK4BLw7LNFeiAVXdSfK9JBKq/4Qwn8LtOpcU=
X-Received: by 2002:a17:906:5f8d:: with SMTP id a13mr767284eju.226.1598605593511;
 Fri, 28 Aug 2020 02:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk> <20200814100357.209340-2-thomas.preston@codethink.co.uk>
In-Reply-To: <20200814100357.209340-2-thomas.preston@codethink.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 11:06:21 +0200
Message-ID: <CACRpkdZj-eAz0yse3OcKLiO0sPVHJMmhVZ_yLWFt1YKPe3hkRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: Fixup mcp23x17 regmap_config
To:     Thomas Preston <thomas.preston@codethink.co.uk>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Phil Reid <preid@electromag.com.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Aug 14, 2020 at 12:04 PM Thomas Preston
<thomas.preston@codethink.co.uk> wrote:

> - Fix a typo where mcp23x17 configs are referred to as mcp23x16.
> - Fix precious range to include INTCAP{A,B}, which clear on read.
> - Fix precious range to include GPIOB, which clears on read.
> - Fix volatile range to include GPIOB, to fix debugfs registers
>   reporting different values than `gpioget gpiochip2 {0..15}`.
>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

Since the other two patches seem wrong, please resend this one patch,
also include the people on TO: here: Andy, Phil and Jan, who all use
this chip a lot.

Yours,
Linus Walleij
