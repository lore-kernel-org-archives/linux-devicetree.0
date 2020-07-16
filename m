Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCDFC433E5
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 12:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A554207BB
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 12:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nk82UzN5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbgGPM53 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 08:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbgGPM52 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 08:57:28 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69522C061755
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 05:57:28 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id j11so7009773ljo.7
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YG2LKOdWYd/bTTjkxfoKbEzQhT3TK/zDfM+CI3ExrzM=;
        b=Nk82UzN5seJrl1cNhd5ZZzA9N7Ryj8gabhrOFllw1G/xGomBuYnR9kgX/TTrnQAcKr
         k4jd7BiRk0qKQPuyh75qogQZZlNbViUSqd8MGqHxIINCPaEELr9C5afXHS+E3c0gnQ+g
         ztsOv6J9ZIQqkNwI8AR2U75UJT5O9CKySItQJit3hJq7M8SGQaYs+abu/ao2Oe8GwCvx
         TfZU9OTKtmDUDSdLjPtglEbioJnRy8H+YI0t3K7hAqKYxsIh9xUtYwk6x8357KOhMt8N
         DkYrW1qE0WcpoyQuBOFieGC1FffoFHQBtbdntuK4chG3KdSTT3/X8EEwD3JYx/ucxTm0
         1OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YG2LKOdWYd/bTTjkxfoKbEzQhT3TK/zDfM+CI3ExrzM=;
        b=Yqq75daPdyDngEyf5jQWM7evuI1sSU4ZIG7wS9uEgtpX0n74JFaagOARcqi8lgpYm+
         IFCH+BrTlQSdpQ6j7V9xI8ylgnTI7xSo3dODcJLzo5JlE7uIaZGMMTaKkVMbhIyGiYTz
         gfOigmaoOWFiHRC9lit16hXngyuz12rXoUXGWoLF6kGA/5vPw8OFbPQSsUy+jkNvNRHD
         HdVvj95vNihPCA2ZlMCrM6SOPbnbq22GDkVBmRv1/D3I4LLHvd1TyaJ6J5XXtB6r/eT7
         hx1aDPdHZZh3ucXS8slCKQvztmuL1iWxIo3Zf00aynbXgH4SFcuKbJHHWMKitr1MFP/2
         yhdg==
X-Gm-Message-State: AOAM530G+GEUrBYV8kd5DM9rzKh9i7zYHpXrzjOTpGJiK8ReBYB8c5iD
        ObGJ0eN3iWlHSwckU3kYFG3wp2kImfL3q6RPPJBtsQ==
X-Google-Smtp-Source: ABdhPJwvgTFLxPouWe0ts45LeDMTroofYm7kdd4TAF9Saf4bU0BF0CtPgz4G2dEZU8LGfXYo1Kje5pie0asFSyBYuGI=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1818019lji.338.1594904246944;
 Thu, 16 Jul 2020 05:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7EQ@mail.gmail.com>
 <20200711045441.19464-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20200711045441.19464-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 14:57:16 +0200
Message-ID: <CACRpkdZ6AKfpAVbBgWffOonp1m7_AfeCw-6YTQxw1wSfMFsyFg@mail.gmail.com>
Subject: Re: [PATCH v2] [RFC] dt-bindings: gpio: introduce hog properties with
 less ambiguity
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jul 11, 2020 at 6:54 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
>
> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high respectively have today, but with a more
> sensible name.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> compared to (implicit) v1, changed to ..asserted from ...active as Linus
> Walleij suggested.

I'm fine to apply this but would prefer if I can apply it back-to-back
with a patch adding support to the kernel.

I know the bindings and the OS should be decoupled in theory
but ... feels better for me.

Yours,
Linus Walleij
