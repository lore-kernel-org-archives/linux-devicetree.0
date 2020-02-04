Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A4BC35247
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 22:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA5722084E
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 22:24:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T0Q/tP4S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbgBDWYb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Feb 2020 17:24:31 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:42422 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbgBDWYb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Feb 2020 17:24:31 -0500
Received: by mail-ua1-f66.google.com with SMTP id 80so96986uah.9
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 14:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W/dOefB9YrTV0gskCITaTQGX3QMblRXiArZqwyipaBs=;
        b=T0Q/tP4SVzdABbGXNrbJyR2jDuI4O/MTfu/EmhLaRb7EfZxXu22wzMWwln2QAh6nDG
         WSVH9d3HFQd/hPeVZY0wRYYYC+K+qPEz2fNVw1tZgKSmOm37sHlwiMQC7f+LoZoqFQKd
         W6l74FSt3k88L6n1yE+s4ZCEb5ce4KR/OiVHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W/dOefB9YrTV0gskCITaTQGX3QMblRXiArZqwyipaBs=;
        b=h1MSPES/yntK9iR9USr/8TCZvcMkNbiGDvMhSIA/U0wO4mvUaDFwxAeGM7QrcjpGj3
         czBQGoJb3bX/tI8nQcbw1jSGZCMvm5u5wAKJiZldPUw6UEPnu2pEXEg3NLQtVWMjSz5v
         EEwVBXCFHXzBLfRYrztIBAk/twua/zVbadt5EhwSfceYx84s1cksNReo6B1J3b/RLT1R
         dhXn3e1hMg65uxAl0GU5/NKNICkpcLpUyurJHsuD5G/fNTxipe9s2DLWuJWq/FYhkcgx
         ZQkQzfuOQxz9aekcSBM0iwb/+VV7kTrZwS42mix/h6GawVbQbCyubpF2ntaMJEeF1RkN
         op/g==
X-Gm-Message-State: APjAAAVv/bvGbUl5ABXEzi4rlwIYBWnS6NplVE/1BzfUFxl/gZ7r0nj7
        P5tVsxDvbeSQEJlZ+BM79hcgwITXbhE=
X-Google-Smtp-Source: APXvYqzk59G/WvrnWMvZtSL1gDcgvGYTesRxdWAlYqxjTPxtHpBwwJ16Q5UdIMuqZ1cIc5+5L2bFqw==
X-Received: by 2002:ab0:6e6:: with SMTP id g93mr19835366uag.105.1580855070029;
        Tue, 04 Feb 2020 14:24:30 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id m11sm7673817vkm.52.2020.02.04.14.24.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 14:24:29 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id 7so41073vsr.10
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 14:24:29 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr19667574vsm.198.1580855068703;
 Tue, 04 Feb 2020 14:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20200202043949.213427-1-swboyd@chromium.org>
In-Reply-To: <20200202043949.213427-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 14:24:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X5WUVq-g1_2qD7CJrJ1EiYfVOrtiB3hrx98Q+XVyJ0eg@mail.gmail.com>
Message-ID: <CAD=FV=X5WUVq-g1_2qD7CJrJ1EiYfVOrtiB3hrx98Q+XVyJ0eg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: tpm: Convert cr50 binding to YAML
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andrey Pronin <apronin@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Sat, Feb 1, 2020 at 8:39 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This allows us to validate the dt binding to the implementation. Add the
> interrupt property too, because that's required but nobody noticed when
> the non-YAML binding was introduced.
>
> Cc: Andrey Pronin <apronin@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes from v1:
>  * Dropped spi-max-frequency as required
>  * Capped spi-max-frequency at 1MHz
>  * Added interrupt-parent to example to be realistic
>
>  .../bindings/security/tpm/google,cr50.txt     | 19 -------
>  .../bindings/security/tpm/google,cr50.yaml    | 50 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 19 deletions(-)

This seems sane to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
