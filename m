Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220CAC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 15:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F08F42065D
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 15:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0mq7C3Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgGJPSK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 11:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbgGJPRs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 11:17:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E29C08C5DC
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 08:17:47 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id j11so6873744ljo.7
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MBzd4hH+xPa5cF7la/kEb0Nq4FT5rPywUwxxeRP0m34=;
        b=M0mq7C3QBlaEOLnOCZmhgM2MN0Zmag4gdlB/fhTCAniT2to+O/qQQPQFgTIeYlu3/U
         2YXqlfjdhejw+ZHKaTUyNRcciJeAjPrtyCUuom3EnwKp9SaQMwDzPFw2SGcIqMv0uVKE
         t6iZjPgQV44AXsacEaDOJvzq59ZEUruDI5zPMHgutVxL6aTPM6yK8NMDEFGfmweIYOkT
         aCgr2TcQECncWnJ8IDQEK4nDD7ruv/u1S06moasIAyqWUE8sKpOBA58VXsN/kUlaAYGS
         uEQCMVM4TTFRQyD4l2xlcTjOBNsn+gWwx3JG4ZyyLFD5kTa/7x8NMxILq7DZeNh8DKm7
         JiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MBzd4hH+xPa5cF7la/kEb0Nq4FT5rPywUwxxeRP0m34=;
        b=Ex+YDewa67yaACRbEXj97RAinhIv0qX/V35s3PqoFTT5PqpHE35K0IBvM+foER7G3d
         JH3EUxHZD+HCEJgyXUwwqOo9/lV0paM4M/jRTWzCGHzh3+GQ8E9amisf50j0fDTL/B6M
         KpRmtOY0TEUnhomfKEflVC5rWbF0gSzkfJceDOQnIxn8xVRNsIu6xaOTTFxtWkl8To3m
         V8YyvkgY2f9q3QHhu/RBpZFOU6q2e2/1Ro2GbAfrGY+cCNkwI1uzEgizHxXE9rUWmdoU
         pagDuPvjNnm69Oe89mg4zyytMebiBBGPozrhA1yAHNgtSkC56+h5E4K7Bm4WG5KmV2ZE
         DgaQ==
X-Gm-Message-State: AOAM532EMoNQ1Dv4o0KSwEjeAFfBQPtun577nJvsWX7YqC56TMXcjx/i
        cwDh+5FROvrlFIceryJ9+XKjI8A2HEYSsbK6vejxlQ==
X-Google-Smtp-Source: ABdhPJxRJJCZmyMgIi7ROiq/VnFe3L6378lev7x65S/YgiNtVOyASHMYenf1xU7L95S0S6KO7wz7zEeyvO+aDEGd+/A=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr34496205ljg.144.1594394265987;
 Fri, 10 Jul 2020 08:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200709063929.9789-1-uwe@kleine-koenig.org>
In-Reply-To: <20200709063929.9789-1-uwe@kleine-koenig.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Jul 2020 17:17:35 +0200
Message-ID: <CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7EQ@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: gpio: introduce hog properties with less ambiguity
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 9, 2020 at 8:39 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org=
> wrote:

> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
>
> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high have respectively today, but with a more
> sensible name.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> no code changes yet. Just asking for feedback if you consider this
> sensible.

It makes sense, and it is in line with earlier inversion problems that
people have had.

Could you use the properties:
output-asserted
output-deasserted
?

(The anglo-saxon can maybe comment on whether it should be
"deasserted" or "unasserted", sorry for bikeshedding.)

This was the terminology we discussed wrt changing the prototypes
of gpiod_set_value() from:

void gpiod_set_value(struct gpio_desc *desc, int value);

to:

void gpiod_set_value(struct gpio_desc *desc, bool asserted);

This latter simple semantic change over the entire kernel is
something "someone should do" possibly with a script or
Cocinelle.

Yours,
Linus Walleij
