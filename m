Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A120C4332B
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF28E20739
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZGRQRHVY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgCTQqP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 12:46:15 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46315 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbgCTQqP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 12:46:15 -0400
Received: by mail-lj1-f196.google.com with SMTP id v16so95881ljk.13
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVeMWWgOR9TOsajWbE931ud3emvQ0ziFK5hlBW9OADE=;
        b=ZGRQRHVYCzH20glp+CuGONYp6DfLbf36SiaLFRCofD+cDdIUlqDIJFyII0gsPvuBtO
         hCqPw+nLaQvXF1wEZLoYIPhwNfGVkUUZtXGg05RoKCrMYcQutWHg+7zLOZ3+BSB+QIvY
         EV93/VSdJajMFJqONuXGVgXN27wm7h3uUh4yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVeMWWgOR9TOsajWbE931ud3emvQ0ziFK5hlBW9OADE=;
        b=Je/QmU3bLHy3XLGdqQNt7l3I4fsd0WdeE+iEGXly7McP3wT/ZN6+moMjlm15+1oUKT
         2NNdwAMo9xtZIpNQqL7Qg8AkX2hFkscRPbyVc+DVt6ivBOWIf+6SbYHY8b+pu2LNpoTa
         pJ4ZfCs8RtJrw5lszO09xmOD70/gmxmb47sa7A2+k+V0pMDF83BQog0VReG0CygJKRBq
         65ZPN+qwOG23H2Xm4zKsTuwaiQqgoHBFLMGF14lay2ExdLQxLejw8phoP+xVO1HK2fZ5
         HuO5TpiSumbovopnJ6gSilTDgzqbImxpkewL0RIwobhuFauE9tIL5W0VOrPS+aBO0QFd
         RKMQ==
X-Gm-Message-State: ANhLgQ2meRNaUfUXyQ6PwbqEdO/S6SzUxXpMLbrTUcLbrmNqvm+Az2Dt
        MC6a79oS2K3geF7+mBOgWdnYAzEQ47U=
X-Google-Smtp-Source: ADFU+vuFWcO8B5LgoqLYxctU9fZorsLvCW1WQyEOk3VrBu6AynHhMTFfRrRqW580FFrrzIFmgE4u5A==
X-Received: by 2002:a2e:8350:: with SMTP id l16mr5764786ljh.202.1584722772406;
        Fri, 20 Mar 2020 09:46:12 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id h25sm3667264ljg.31.2020.03.20.09.46.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 09:46:11 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 19so7128353ljj.7
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 09:46:10 -0700 (PDT)
X-Received: by 2002:a2e:2206:: with SMTP id i6mr5969667lji.208.1584722770463;
 Fri, 20 Mar 2020 09:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
 <CAE=gft4_Su4+SXWAW_HWy5BF1mH7QaDHCiwAAhrNaekTeU57rA@mail.gmail.com> <74851dda-296d-cdc5-2449-b9ec59bbc057@codeaurora.org>
In-Reply-To: <74851dda-296d-cdc5-2449-b9ec59bbc057@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 20 Mar 2020 09:45:34 -0700
X-Gmail-Original-Message-ID: <CAE=gft5Uucr83DoQqaE7_8_H=ExnkPBQvRiUK_+LxOMeadam_g@mail.gmail.com>
Message-ID: <CAE=gft5Uucr83DoQqaE7_8_H=ExnkPBQvRiUK_+LxOMeadam_g@mail.gmail.com>
Subject: Re: [PATCH V2 2/8] soc: qcom: geni: Support for ICC voting
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 20, 2020 at 4:03 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Evan,
>
> +/* Core 2X clock frequency to BCM threshold mapping */
> +#define CORE_2X_19_2_MHZ               960
> +#define CORE_2X_50_MHZ                 2500
> +#define CORE_2X_100_MHZ                        5000
> +#define CORE_2X_150_MHZ                        7500
> +#define CORE_2X_200_MHZ                        10000
> +#define CORE_2X_236_MHZ                        16383
>
> These are all just 50 * clock_rate. Can you instead specify that one
> define of CLK_TO_BW_RATIO 50, and then use clk_get_rate() to get the
> input clock frequency. That way, if these end up getting clocked at a
> different rate, the bandwidth also scales appropriately. Also, can you
> enumerate why 50 is an appropriate ratio?
> -Evan
>
> -Evan
>
> Clock rate for Core 2X is controlled by BW voting only, we don't set clock rate for core 2X clock either by DFS or calling clk_set_rate API like we do for SE clocks from individual driver.
>
> In DT node it's not mentioned as clock.
>
> As discussed in patch@ https://patchwork.kernel.org/patch/11436897/  We are not scaling Core 2X clock based on dynamic need of driver instead we are putting recommended value from HW team for each driver.

Oh I get it. This is pretty opaque, since this table is saying "here
are the bandwidth values that happen to work out to a Core2X clock
rate of N". But it's not obvious why setting the Core2X clock rate to
N is desirable or appropriate. The answer seems to be hardware guys
told us these thresholds work well in practice. And if I'm reading
into it more, probably they're saying these bandwidths are too low to
be worth dynamically managing beyond on/off.

At the very least we should explain some of this in the comment above
these defines. Something like:
/* Define bandwidth thresholds that cause the underlying Core 2X
interconnect clock to run at the named frequency. These baseline
values are recommended by the hardware team, and are not dynamically
scaled with GENI bandwidth beyond basic on/off. */
-Evan
