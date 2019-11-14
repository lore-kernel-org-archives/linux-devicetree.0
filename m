Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A101EC432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 16:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62B13206E5
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573749514;
	bh=r6239xpNQjiA90Hu7abkz2VVimdZsUkVBgJYAv84NIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=wT9+Clpe7vZ3ODuhzBOyRRbQQJh8l5BLcnQC+z2xjPZx4b+hxtiDJ3jOlTawXX+gm
	 280Dys8wliBSwJfCGXt7NISuio7RZq9GTZ6j/8rTTNc71dJxJ5cl+r5N8/2Sk2RNKl
	 p1tg9/7Byye6fYDY0Ki9sRRgx7v1IV2SUsEbiBRw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfKNQid (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 11:38:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:54556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbfKNQid (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 Nov 2019 11:38:33 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A396E2071F
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 16:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573749512;
        bh=r6239xpNQjiA90Hu7abkz2VVimdZsUkVBgJYAv84NIE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Fn2j8MozP/jF5WgRbNYSyQjkyNonioQIgDpSTCQ4mJ5MswbHnv1F5Ff12vXJKXV4R
         guq7Exy1m2ihDuWwt4dAJGRF87bi6okPbtdkDe9yANrjT0bXwZMnSV8+UERIx8+eDU
         S23iqFnPXq+ZPiV7yc0LVGiBZPaq31LcPhB7aO8E=
Received: by mail-qt1-f176.google.com with SMTP id r20so7399485qtp.13
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 08:38:32 -0800 (PST)
X-Gm-Message-State: APjAAAU2RPYJyGNfQ/EXQnhs4x1oYWSZENNO3FHTSyvJPe7Yvaw2crTS
        X7UMAhjLtChmXemxjCOWq9qRZkzzdAHW3CNhqg==
X-Google-Smtp-Source: APXvYqwDR8S9cYrUYILLP/I2tU3UMGkZtLBmA2zLHpUvplAXjetDE9ennCRPukJ9ArEABqjaXO1HmqiEessy+uBaq+4=
X-Received: by 2002:aed:2706:: with SMTP id n6mr9138767qtd.224.1573749511747;
 Thu, 14 Nov 2019 08:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20191114131525.3988-1-linus.walleij@linaro.org>
In-Reply-To: <20191114131525.3988-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 14 Nov 2019 10:38:20 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+P6-V2L_JJmwkuoV=DzBzMGdfqsUpZLY6pR_+B-uOF1g@mail.gmail.com>
Message-ID: <CAL_Jsq+P6-V2L_JJmwkuoV=DzBzMGdfqsUpZLY6pR_+B-uOF1g@mail.gmail.com>
Subject: Re: [PATCH 1/2 v6] drm/panel: Add DT bindings for Sony ACX424AKP
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Nov 14, 2019 at 7:15 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Sony ACX424AKP panel.
> Let's use YAML.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v5->v6:
> - Fix the binding by simply not referencing the display controller
>   bindings from a panel binding.
> ChangeLog v4->v5:
> - Fix up all warnings etc incurred from the now working schema check
>   and DTS compilation.
> - I still have a vert annoying error message in the Sony
>   panel bindings that uses this schema:
>   sony,acx424akp.example.dt.yaml: panel@0: $nodename:0: 'panel@0' does not match '^dsi-controller(@.*)?$'
>   As this is modeled very closely to
>   Documentation/devicetree/bindings/net/mdio.yaml
>   and that one doesn't emit this type of warning for its ethernet-phy@0
>   etc I am pretty much clueless and just can't see what the problem
>   is.
> - If I can't figure this out the only viable next step is to drop the
>   ambition to create yaml bindings simply because I'm unable to do
>   it, and go back to traditional text bindings :(
> ChangeLog v3->v4:
> - Adjust to adjusted DSI bindings.
> ChangeLog v2->v3:
> - Put the example inside a dsi-controller so we have a complete
>   example that verifies to the DSI panel generic binding.
> ChangeLog v1->v2:
> - Suggest a stand-alone YAML bindings file for DSI panels in
>   a separate patch, and use that to reference the
>   boolean "enforce-video-mode" attribute for DSI panels
> ---
>  .../display/panel/sony,acx424akp.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml

I'll trust that you get the dsi-controller.yaml schema done as without
it this is incomplete even though there's not a direct dependency.

Reviewed-by: Rob Herring <robh@kernel.org>
