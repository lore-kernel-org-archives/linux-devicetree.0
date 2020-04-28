Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B7EC83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 12:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C068F206D7
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 12:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cpxZ39XB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgD1MRe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 08:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726746AbgD1MRd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 08:17:33 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C93CC03C1AD
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 05:17:33 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m2so16679927lfo.6
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LMRN5qxFiZK7LH7wFWLeZOcUrBLsRhKOimHQVM7fOfk=;
        b=cpxZ39XBlCTINntejfucjY+fxwFnKaspaM3tU4nQp/hop/2uuOah5PTPJIVYhBsP0W
         lfbrOouP0K5/qArfU93epvXV9Y0O6xB64TrG2LalkHRUXMuhtF1VOGCuunlHRaSWlCvU
         UHkcTxvAalSafoniWBgo7ypiQQoQkfcbaM7lr8XOmc03Hs2/vYdnvaGbEYi7RwmhyLgh
         Ix0qkhnBs+3QBU4zUqNxIMJE9AGHOeu95Yjh4jGOIRVTbFV9eWhbfrJs5DKMZu0bEYCE
         nPaF6CiFGEo7dZEoqMb+u78l257RyVEql24fQGrFjpdihMl/nM+w9d0ScNBUeGpLfumj
         egvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMRN5qxFiZK7LH7wFWLeZOcUrBLsRhKOimHQVM7fOfk=;
        b=N4S3RcPwG7aXeD1mkP7MyA8OunREw84amoG6qT1dp/2TGGN92m3WFSyvHPCuyT+mG6
         2FNaCdDDFukf8JccKNfmpGA0svXKa2SxmAUZuQITGooTQ/PtGjQmSejxhEsqKSuMQIqr
         dkidZozTtC5ke+kr1N7/8n2jciv/TnbIEdvTEWQgC/iI9vNfcC5B9XSFb9OotU85hSax
         U0DBQ/Bcn4RWFEl2+q3ZyiLEhGX6Q6cjWofEnmYy/SEJa9jr+buEsB1a5Uh7wlDmTQZ0
         dDivgCkSObLm9vlRSSw2NFIQtsuJaH28K10dHhTOOhbTyV8T36YTsmTFvJB/TNYXOGWv
         21tQ==
X-Gm-Message-State: AGi0PuYMv67zm5apAZixFs4phB4ShPpGiuEEZHBxs2fIsJkensDmeGik
        hDJWNz9l9b4UGOd1JIw0uEPaERqquAZVCujE4AN0hQ==
X-Google-Smtp-Source: APiQypLWMYHDowDI3oIfEvtVytKcitjHf4lYdOHlnfwZ2JMiRfn25SLHbT7DdEte3F2EYP1mH2KagEeErbh4nPD3DbI=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr19256598lfp.77.1588076251617;
 Tue, 28 Apr 2020 05:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org> <20200423092431.v3.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
In-Reply-To: <20200423092431.v3.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:17:20 +0200
Message-ID: <CACRpkdZuMALENkGjOUuQqS1pTH2sXkj1Z59mPjOrBynnkAQdpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: Add hpd-gpios to
 panel-common bindings
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:

> In the cases where there is no connector in a system there's no great
> place to put "hpd-gpios".  As per discussion [1] the best place to put
> it is in the panel.  Add this to the device tree bindings.
>
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
