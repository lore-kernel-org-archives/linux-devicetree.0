Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79FAC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 20:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8ACB520872
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 20:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEy7WaGq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfKTUQg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 15:16:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34568 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfKTUQg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 15:16:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id 139so603469ljf.1
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 12:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=As7pKQ0itiBPr+JVzJNRbGflXyWEUqoGImZXztf0jEU=;
        b=XEy7WaGq7tnXJWeHZWtz0DwTyLPI5ZIDiFBhpBU/p+enAkw3f0UID6GJcKUKKhDXwB
         3zAy7hyjoieIeZcKpDx5M3kdNUoMZqzFs5gZNm984sQbeIYqSq7ZFmRck6P7s4qJdPIS
         nydKNUoBsu2hVpIyERlo9YIrafC2SWqeJ9p0rTQXTSwsYU1flWI/42RRYkdlpdArN0Ab
         4lwJX/mndLLYBbj3ixlqdttpycoL7TjF1Ybm1R4TIC41cf0FFFHeBY84qDEZDHRTGW6k
         FglI8GhQAHWQFfVHDlFVgZyzB0zeTIwYjGzscfkYOoeEOlupu3J52a6Ah6QWfY/vJ25e
         A8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=As7pKQ0itiBPr+JVzJNRbGflXyWEUqoGImZXztf0jEU=;
        b=P/g3skEnTlM/I2GJPy4FM4UouOaFeoMdmHlSdnU3tPAfzj2wTDyWPmKbIGR1vRJ9qB
         etcNVREhfvhRB57Cq99sUmH1MvpoHY9vicKud/rw6sBUb5OSEvc1aN9EMdaAnXgtLRnp
         u5XvjMUOlQDNK0bWxqUpL0IRDdL4eY/t4JVdNeJXNYmDpSt+Sv4mGs2ByVHGaLfQ9Hle
         1kxX5h0tPcngebnfKC4lZLm/5M2NKWa9PBOe+/v95OqUEgfyOcJTCfEdkRM+IsGXrFsI
         635GrX4deqXSHe6QT84mxztaNnPHgLCgolPZDJGagclHbZ7AcfckTFOBi6afWNmp873C
         N3kA==
X-Gm-Message-State: APjAAAVE8S9x8pqHEa5Qn8LkauxaFmc7+KpikgqINEfcIZPCeehyY3QC
        b2PX2m7YO7XtaR5+Ayo3KSkchVzuT8h0HdVPUwVE9w==
X-Google-Smtp-Source: APXvYqx+bECbdnOoxTCki5xJSDVYs7EMIZ2Q1kvVZaDKVhZI1elr6NsjrHwr5uD2qsoUC1YJ0MgiOfh8fbu78lxOV2k=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr4421824lji.218.1574280992576;
 Wed, 20 Nov 2019 12:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20191117221053.278415-1-stephan@gerhold.net>
In-Reply-To: <20191117221053.278415-1-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Nov 2019 21:16:20 +0100
Message-ID: <CACRpkdYoq0E3HEmo4QBOWaAkQN8Ti=cm2OL+gjBORynsJ7D8jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: ab8500: Document AB8505 bindings
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Nov 17, 2019 at 11:14 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> AB8505 can now be configured from the device tree.
> The configuration is almost identical to AB8500, so just add a note
> for the nodes/compatibles that differ between the two revisions.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
