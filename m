Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E932C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFDEA20675
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pL+XB6xD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgENIVX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 04:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725935AbgENIVW (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 04:21:22 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA79C061A0E
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:21:22 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h4so2469524ljg.12
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ylNyjxPU0jW9A5cG6J8lYn77ZbNao4PuP4byNxuwb40=;
        b=pL+XB6xDy0cGnanxPxZeCoXI+0/bH/MJrC9FZHLbSFeABMiSHzmaFy/I+vlbadTqdg
         moVU55iWLxpm1nnhHrCGKzA2uK7DqkWVrHrypLWkQ77O98C65VIQg4eWTACmBhqQAvbe
         pHSqklAJtsA1BGN8aJrEPgAzkjuaIRy0vNfWRPOiZ0Gx9pkVb9qjr26pYd9MiqLjtOJr
         54QU9Kl6XwBPNiecFaQ5Q2UN0C0xobJnHAsuUb9l4eWMcWJxS8krPxWVDver5JV680GH
         IzpZdlsYOHiSkmT8GBGTZ0VfuqV8Pk7Uv4HSe7NIk0lkUADLNFPO/dZ01aPB2TJo4RoU
         he7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylNyjxPU0jW9A5cG6J8lYn77ZbNao4PuP4byNxuwb40=;
        b=ZYOe/z2ckaytBhybwXb1qdYuXZLGWeEqXMSfP0RXzOccWs9by3WOdXcajZPdKt0QlO
         F1Gy8BMYkKJ96tQBcX6w2guFHVAC4nLetJml6Fu5Av/eXHMps4pHKi5Pbzu+7+pHLq+r
         pfNEsPVWMr+8krKeeduravyhqEqtAtQ/A7yuJEcJnG4U0WdQZZbO/t3bfrk7boqeKnam
         AgKK3LhOcKv505ZMkPTviGCICPhY8iUAQTYNjAMGI07BHV6c6Ry4fhvbpd1MM05+cfAS
         N/PfTRVmwbT3KHF8tWTnmPd1knrDGFcI6lMvv34NzHK2Z8uKCOX4yliUMtqbsESXp3tw
         Kz6Q==
X-Gm-Message-State: AOAM531gBoXDRUlIjp2s1MRxEX3SpWJdAWwb3Ge02wq8pAyHPfbF1wt8
        QrAlq9IW/TRCfCwXHaP33b0b1xluA6842p4F7JSDpw==
X-Google-Smtp-Source: ABdhPJyRERMIh+MQZPItj7QatuGXtUx06mgJ88uloHfqTCykxSiONeYCm+tNHIHuv9MC+hs2Hr0mPlFfLP8XGnr3zRA=
X-Received: by 2002:a2e:531e:: with SMTP id h30mr1125043ljb.168.1589444480845;
 Thu, 14 May 2020 01:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com> <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 May 2020 10:21:09 +0200
Message-ID: <CACRpkdZUyRh0KZzRxsdfFU_L-F=Ns0j1d3eR-ermhx2Gb0Zrgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
To:     dillon.minfei@gmail.com
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 12, 2020 at 9:03 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
