Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8EEC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 16:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71A4820829
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597249466;
	bh=MHsw4QVUnxGXT6s95XEoPuJX8QkmG6c7KYrdRecqU0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Y2p1D1McMkUHcpNxJly27eHq2ZcVUUiWw/GtJ8Z6BgsA06Q0PW9Fn0FhoFvFOzK3L
	 txSl0qE0wquDoGBF9oGLLBWi4coz/ct1vfwz+nG9URQe0WogO+awp0fgHR85L6lHoV
	 9Hkc2lk4GYeN5et1yREiWJbIvimAh9BwSYS67gDA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbgHLQYZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 12:24:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:45120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgHLQYZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Aug 2020 12:24:25 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EF5A20829
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597249464;
        bh=MHsw4QVUnxGXT6s95XEoPuJX8QkmG6c7KYrdRecqU0g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DDTNVA7qYpT1cUld/SEca0XFo9Gztgb32XOrIRv1BmwN42tRreEtdvqbRXSRdeblb
         n/cHP2EusUQzCt7VU7qzy21x9I477Ne+wcU30qL4P8lrFAOVhh2C2HRbF2zbVvrz8r
         R4OKmRBXGVCX+r/aqLNi6PmxRllQV6Hp8hBfiVMk=
Received: by mail-ot1-f43.google.com with SMTP id x24so2417552otp.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 09:24:24 -0700 (PDT)
X-Gm-Message-State: AOAM531wrY0QgSTQXHVv2K05qrcB5LOclY2seOwQSu47y8fy+Jo9IDNw
        7SFDQOtzgu950aDcqkRv3XZLRkEzRN4Mbpg3Ug==
X-Google-Smtp-Source: ABdhPJzgAY+bdDwV4rSuBWXEO9RFsgF3BfcSH4f62IcU/4Ab7g9JYkJoYCR3c9ASGd9nvndA6EYO1c42vexzdti4u9M=
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr461003otp.192.1597249463483;
 Wed, 12 Aug 2020 09:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200812070640.2543557-1-linus.walleij@linaro.org>
In-Reply-To: <20200812070640.2543557-1-linus.walleij@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 12 Aug 2020 10:24:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3r1hFnWCfpnKHQqRWHwWC3BxW1+Vr0vrerqpk4OujuA@mail.gmail.com>
Message-ID: <CAL_JsqL3r1hFnWCfpnKHQqRWHwWC3BxW1+Vr0vrerqpk4OujuA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pip command elaboration
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 12, 2020 at 1:06 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> pip is now for most practical set-ups implied to be pip3, so
> just use "pip" rather than "pip3" in the instructions.

Are you sure about that? A fresh ubuntu 20.04 install for me defaulted
to python2 for 'python' and 'pip'. From what I've read, that should
always be the case. Anything expressly needing python3 should be
explicit. But then ubuntu has python-is-python2 and python-is-python3
packages to set the default, so I'm confused... (I was trying to
figure out what to do with spdxcheck.py which broke on 20.04 because
the new version of the 'git' python module is python3 only and
spdxcheck.py was using python2.)

In any case, pip3 always works and pip may or may not work. So I think
the answer here is obvious.

> Pass --user explicitly in the example so it is clear that this
> gets installed in the user home directory.
>
> Add an additional instruction on how to upgrade the project,
> not everyone is aware of how pip works.

BTW, releases are now on PyPi, so you can do just 'pip3 install
dtschema'. I've been meaning to update this doc with that.


>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/writing-schema.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/writing-schema.rst b/Documentation/devicetree/writing-schema.rst
> index 8c74a99f95e2..a9cebfca8d31 100644
> --- a/Documentation/devicetree/writing-schema.rst
> +++ b/Documentation/devicetree/writing-schema.rst
> @@ -115,11 +115,16 @@ The DT schema project must be installed in order to validate the DT schema
>  binding documents and validate DTS files using the DT schema. The DT schema
>  project can be installed with pip::
>
> -    pip3 install git+https://github.com/devicetree-org/dt-schema.git@master
> +    pip install --user git+https://github.com/devicetree-org/dt-schema.git@master
>
>  Several executables (dt-doc-validate, dt-mk-schema, dt-validate) will be
>  installed. Ensure they are in your PATH (~/.local/bin by default).
>
> +We sometimes update th DT schema project, and then you can simply add the
> +"--upgrade" option to the above command to get to the latest version:
> +
> +    pip install --user --upgrade git+https://github.com/devicetree-org/dt-schema.git@master
> +
>  dtc must also be built with YAML output support enabled. This requires that
>  libyaml and its headers be installed on the host system. For some distributions
>  that involves installing the development package, such as:
> --
> 2.26.2
>
