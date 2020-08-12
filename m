Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3D8C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 09:09:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AC8120774
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 09:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q57wbOro"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgHLJJ6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 05:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgHLJJ6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 05:09:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119B6C06174A
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 02:09:58 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so1417080ljc.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FY3s3maREqriezAI0XSi4RMXYCcvv0BPXHDmals4/6M=;
        b=Q57wbOrowTYtxr1anQHxx0lBW2HWmtXxI9cPkMmt9j2D8O8jN2fqlCByUwMz3CncD4
         M5+/o5UCGvGqf+Ja2GyGAHGLz58rayiAE77Bvu2bNxeGHWvlZ2AcC938js3h9lK6d+P9
         j06AleNQ0Kc0CXQUyC+JrZODbXEeCnONOp4A2lKlPyzzNe+3IRNR92xkPyLzI6K2pfh3
         aAX9ZHH4qp/PgXDpjuL0MxVktNWv9h7Ls120D7HEo6aYz0cFC8fc4L1zXGz4pdYeMLzf
         X1pbwWWNBJgM3ofqqinadVsDI4s9gX1sLP4p+7XBaYLciaX95yuS+pI2YxbGfEcJ2xF2
         U7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FY3s3maREqriezAI0XSi4RMXYCcvv0BPXHDmals4/6M=;
        b=o7gPxlPlQWSqJasrlC68VV2nWXYzp/DrRKYNxPI5VA05ettVD9cCY8+L8PkCvuuwa4
         BWXjOauyEmpXpEA0fIZigI5QVRE5pJXJYyaD980VQxVHeBJCyozPIqwuX3F5JpEvQWKN
         08BkoNvQ5Gt0SNcFNVloWRgzfABIiMMIRJORbukw6/Ce2eQXtN8yx3VUFg4C/p8uMrLf
         BQizcqFiVb9MbqyaAIuFuWg/E8S0cp1QSSdqG/22eEwWpGzloxQ6fhmjA1+Hod0+NSuB
         EHNwwlEbEjmzzSQxnY5hrShxY//xyk9BD+PdLorIk5QRxz4+ka9XZfm+qcIJeWgP7fn/
         AZtg==
X-Gm-Message-State: AOAM531x2ENyRMuvIQU1MhlRXy4SV6jrEMKTXlibl6pjWcfzdvvqKU9a
        ttpX8pXJHDFX8ZbG+QLO0QqcOEAVx1bqfp794Kf2VQ==
X-Google-Smtp-Source: ABdhPJwk3HeAScHDHyqAL6rzVjK90mHBIkeel3C16tOuoxFFvERp8sKFXIkkmblpmQ+SXrfuD2s2ooieJ3igNrOfAAc=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr5087144ljb.283.1597223396558;
 Wed, 12 Aug 2020 02:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200720203506.3883129-1-linus.walleij@linaro.org>
 <20200721083228.GA283099@ravnborg.org> <CACRpkdbuihAwvsx4QmV6PnVM5aDFMiaR9h-8aBF8EzXRGZ1XNA@mail.gmail.com>
 <20200812073454.GA584918@ravnborg.org>
In-Reply-To: <20200812073454.GA584918@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Aug 2020 11:09:45 +0200
Message-ID: <CACRpkdbFf7ZTwNt5_DCd1nYWqeUnnY8HPJMakJ9UVwkfBtjRoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 12, 2020 at 9:34 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hmm, I think I looked at leds/ when I wrote that comment about
> common.yaml.
>
> Please consider Rob's comment in commit: 44e1655a444fe7a1bd81994d34c6bbb5245b9e60
> ("dt-bindings: backlight: Convert common backlight bindings to DT
> schema")
>
> Rob did not see the need for a common binding - but that may change as
> we add more backlight bindings.

It can't hurt. The proposal is out there, there are some drivers in
backlight that can readily be converted to use it if it is favored.

Thanks!
Linus Walleij
