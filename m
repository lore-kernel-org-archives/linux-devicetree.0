Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BC7C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 22:27:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96D1C207DA
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 22:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598048857;
	bh=AFxpIgnKyoS261/MzR8+Q/I3dWDZHAGsL7G+JNc/iiM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=IMi3VFG6J42Akzm+9Zv7fJTsD3PQYzUBArkNj1JMywYKsA4REHIEyUBsOUlbMjCHf
	 ccbEd17Ghe1GcXYfT7QppmOg9aSdBWDpiVL3kLoh6h8WzxyFAh54wehZ4d6M+VYAiW
	 0S17F1jwjutn2UBXtNVrOQaoefEgAM4+60pDMZBc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgHUW1h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 18:27:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:50012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgHUW1g (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Aug 2020 18:27:36 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FF1B2076E
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 22:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598048856;
        bh=AFxpIgnKyoS261/MzR8+Q/I3dWDZHAGsL7G+JNc/iiM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yLw7FmBkNjgSXR/LZ9wojPT7drdvZ695YcD1t3jY7SsqrY88iSpOXOpaZZXa2T/dG
         XaL1m8ErFdYLOyMP24XGyl3NH+MKRysNuW+uZ+D8M8uRcUkLINWfpHybD6CnNluE/o
         +9BSK0aGfsdLvylNJ1FLNhTIxia0g1WECm4QA0N0=
Received: by mail-oi1-f175.google.com with SMTP id j7so2845681oij.9
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 15:27:36 -0700 (PDT)
X-Gm-Message-State: AOAM530sC7oYTv1kTyQ+umUGPbEGNQSPRYVNbU8RxokvWUAPWw9cULVn
        qkWZs1PdRBWgGi9gF5K5LFXui4vtlpJ/soW/RA==
X-Google-Smtp-Source: ABdhPJyU0E2CnF2wX0LmGJe3RHuabbS+qMP20SZ0nbqziubcysrqCr00QZVV2shhQ9QHpPGM2B10QF0KCRkmgztKGLU=
X-Received: by 2002:aca:90a:: with SMTP id 10mr3191941oij.106.1598048855695;
 Fri, 21 Aug 2020 15:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200818164042.13969-1-festevam@gmail.com>
In-Reply-To: <20200818164042.13969-1-festevam@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 21 Aug 2020 16:27:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7FRMPJVuCzZZi_pubvUHjrsmE7i=n5j26aYz36ZM-EA@mail.gmail.com>
Message-ID: <CAL_JsqL7FRMPJVuCzZZi_pubvUHjrsmE7i=n5j26aYz36ZM-EA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Replace Fabio Estevam's old freescale e-mail
To:     Fabio Estevam <festevam@gmail.com>
Cc:     devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Aug 18, 2020 at 10:41 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> The freescale.com e-mail domain is gone for quite some time.
>
> Use a valid e-mail address instead.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/imx27-clock.yaml | 2 +-
>  Documentation/devicetree/bindings/clock/imx31-clock.yaml | 2 +-
>  Documentation/devicetree/bindings/clock/imx5-clock.yaml  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

This conflicts with what you sent and I applied last cycle:

commit 0115e6c98c22f3fc7ff7da2a41480483abe95b37 (tag:
devicetree-fixes-for-5.8-2)
Author: Fabio Estevam <festevam@gmail.com>
Date:   Tue Jun 30 21:53:46 2020 -0300

    dt-bindings: clock: imx: Fix e-mail address

    The freescale.com domain is gone for quite some time.

    Use the nxp.com domain instead.

    Signed-off-by: Fabio Estevam <festevam@gmail.com>
    Link: https://lore.kernel.org/r/20200701005346.1008-1-festevam@gmail.com
    Signed-off-by: Rob Herring <robh@kernel.org>
