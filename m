Return-Path: <SRS0=+D0Y=AB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718DBC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 21:34:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34FF3246E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 21:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fM4jBfoJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgFTVeI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 20 Jun 2020 17:34:08 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44838 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728942AbgFTVeH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 20 Jun 2020 17:34:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id c17so15259025lji.11
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2020 14:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMLLcSh0FlLbcDXmFaO9BURwcvJCFIp9+2dM/IBT/Z8=;
        b=fM4jBfoJ8l2d8ZgUkqeYaPu66l91KZ+pIQwrkEHS4iDVaScL1olYwKtzFsLv7tD6nc
         U5k2wV+U0eGTAME55rsSEefFLQbDFZoLdJWUSbEFQ6t2b9dMa5pThSZpU6CpmQhaAA6x
         wZQhubqxLH+t28SzlysCuddi8WW516Qro+ktfIHpZpNZO6upfyub7jvC1rh4j1dzn3kN
         r5s0jtTEv2e77Tzt4Z8dZ4ZvsjOeJF8+gJsFz2nwuIyW2DkeeOkQKMcGAsbiACdNNct8
         xXLJO8p/SzLJuWgd1BIvAcPLaFclUaxFY/oF3V6ZsY1n6ODXPpOTgsHK/601jY9P/XqC
         NDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMLLcSh0FlLbcDXmFaO9BURwcvJCFIp9+2dM/IBT/Z8=;
        b=RmvyEe5ItbMtdQ923Obme90DzEyPj4/3iGrbACigD+oxMEd4dUZj21+pZOC/xCyfq3
         7VG3jDP701pS320JoqKDPP40s2/PEiWmh4UQtIATS475G8RJBbTlNcQtbuMrUx7mc9iA
         gDxUjIbpOVFuUkmlS7uc4kxyUHfmlBm52QdKY3I78LCzH8alXHn1UDGGU99OHykgrcpb
         CUVywhA6eQMqi9aJTkxsjo7xnxD278jI+wGAQgKSBMpK7iVgxzeM3On7pBiWUxjeWewq
         JO05vq9+zl3HbK/9l1EXXLenaDROH3bu/Wt1U2soeE0s71qbVh6lxkCSnJc+iKZKrH2y
         Lvig==
X-Gm-Message-State: AOAM530rN3ahnEbpzTFx66zC1d+riqjg+bYhZUfBRxOa/+ep5jP7JM2Q
        OSEptpDNJ+C9yyCq9p4n9kREjPUCFONSHdEzdUCKSA==
X-Google-Smtp-Source: ABdhPJyc/rKcuZI7IzUgOFsdvhotZrQBegRWHGiFD7Jo5zA51VgOf9AQa+SOJTDLDml/A2XI/RqRiyXvUzFabtKoFAk=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr4816556ljz.144.1592688785302;
 Sat, 20 Jun 2020 14:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200220162246.8334-1-benjamin.gaignard@st.com> <20200520085142.GD271301@dell>
In-Reply-To: <20200520085142.GD271301@dell>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:32:54 +0200
Message-ID: <CACRpkdYry6=iJ8hpy+pS9hFuBJD5Cf1ZKJwCkCBZPGW4rGa86Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to json-schema
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.co>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 20, 2020 at 10:51 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 20 Feb 2020, Benjamin Gaignard wrote:
>
> > Convert stmfx bindings to json-schema
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> >  .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
> >  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>
> >  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>
> Linus, anything from you?

Looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
