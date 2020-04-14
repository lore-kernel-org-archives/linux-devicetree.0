Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8DEC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 08:09:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89D92076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 08:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkbFwgp1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406984AbgDNIJq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 04:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407007AbgDNIJk (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 04:09:40 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E36EC0A3BDC
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 01:09:39 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r26so12928475wmh.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BcPvPDgBERdit+Xn+lJRIaxxdEbWDEThNehuHj9urkI=;
        b=QkbFwgp1f5e2ka7kemm4skNAxC9Y321LFReQye8PqVNdhUK+k/w7lZaAm+J7eD4Ira
         KDU36gxiVD0m3i0h4yXzWp2i0LjnOh5P2rBdCpUyFnfOFsQdp+WlX0CXx0sodISjrTRB
         T88J9dKZU+6FIoJUSqM3xoGxu4Yp8vQCHB93XDh332k0JuRl9v1sQEPI9dga3AAEk2Rt
         FsGjN9HgffTrm7+YYSR6kExc8ErLrQP4NnkK7b1YnaAaRv3rOonc/3/pPyh1IkF+OiqK
         dJwmZklLMAQoFXSewDB1J20EuPQE++5B5Uc2m2FnHgVR1NqasRvEcohFCXFUXESNRIOQ
         DrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BcPvPDgBERdit+Xn+lJRIaxxdEbWDEThNehuHj9urkI=;
        b=shNvKyr4ESNOwA3k7331p1Z3sXsyLdfoR4g3uy4vL74aBTIN9R0nvzDlrxyiDluwO0
         9CumrFMjbg8Xk2sKoP1W4CrCY1gsP97SU9O9SBDK7iwhGAdIoNyeN5Wa0iS+3PCwk2Dg
         U6ml1O+4OqMUb0cKWGYff4Iy5rl05v7ZqmGxpSaZrrlmN2+Y9tqohDdLBw78Ly5i2Qv9
         ouwDGgoseBeHnF7+pjPd9FUsO26ZgrJ8NQWldexaVrohY+xGejjzolFVeUFEk6xDqG3U
         rnQMQt10nCiZaQfVC9R5C5/4qh7BIvyeeNBRxHRF8Y7YE63mn+dxwjfJiFLpJNWWscIQ
         ZLIw==
X-Gm-Message-State: AGi0Pua5Cgw6/HRMzkugc89bIvu1irQsMA7TjTXuU2F1htUdkH83Hkmn
        qyllNzusj3dvUWVxAz0k3x852Ys1J0g=
X-Google-Smtp-Source: APiQypIcxmgvB72hCCzwLyIf8yGou0MAelssXnzkUeucLPux9dAfshBB5oNoGYWIQD4hUWKjcEoWXQ==
X-Received: by 2002:a1c:82:: with SMTP id 124mr21081344wma.63.1586851777991;
        Tue, 14 Apr 2020 01:09:37 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id t16sm17207764wmi.27.2020.04.14.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 01:09:37 -0700 (PDT)
Date:   Tue, 14 Apr 2020 09:10:37 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200414081037.GD2167633@dell>
References: <20200306085513.76024-1-ikjn@chromium.org>
 <20200312192023.GA19701@bogus>
 <CAATdQgBFMbLLwkntKu6dgU1S0DAxx9yTffh0ERac6CM90-G0bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAATdQgBFMbLLwkntKu6dgU1S0DAxx9yTffh0ERac6CM90-G0bA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 08 Apr 2020, Ikjoon Jang wrote:

> On Fri, Mar 13, 2020 at 3:20 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri,  6 Mar 2020 16:55:13 +0800, Ikjoon Jang wrote:
> > > Convert the ChromeOS EC bindings to json-schema.
> > >
> > > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > > Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > > ---
> > >  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
> > >  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
> > >  2 files changed, 129 insertions(+), 76 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> This patch should go through Lee Jones tree?

The way we are operating at the moment, it's a coin flip (50/50)!

Happy either way at the moment to be honest.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
