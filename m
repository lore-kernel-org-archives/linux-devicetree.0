Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44795C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 21:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F3782071A
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 21:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="uKnp0/oM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgGVVh5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 17:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgGVVh4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jul 2020 17:37:56 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981FFC0619DC
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 14:37:56 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n26so3988204ejx.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 14:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWgYgasEBFnUWZrjUIWCT1ojhoXmHViVids8XouBfF0=;
        b=uKnp0/oMCDGRjqyDy2WeNxgylKXxzNzln91iOTWtrAY0VYBVVVUWR1a2EfiAWWtVI8
         v1OTjF2EtY//278Z3fijbZK10+VYbawKLLic1Tmqqx4KjxoOOVVxqRVCATg3fSsUwyIb
         t7ofZ237jokeyQS0kvVe8ttokaX/ENSuFdaBLzoFq0ffHLbb1Qt50lRhVoVuQTy/RAfw
         gCstJ/1HvSf9HXfW2bRdIF9IdfjCNoOIysvFfD+ErbnSJBQsyzBiiqspHylw1B902uUn
         kP/G0c5UmM8v3kwz48wUIXJOFO84/LWDmMOkdm81g5MlCllVjOUoJ0nt+189Woji0qUu
         ZbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWgYgasEBFnUWZrjUIWCT1ojhoXmHViVids8XouBfF0=;
        b=alIHqACoP31ufprTvCf7VqVzNrWfB+MahI8EvbCOozjpePbYjOF6n4bKA9RxCIUfly
         mPKBogK4m02DW4SXXMLl+OvYfIixpRO7Jw4EoyvqEvXA2AfUtL8jBL/1gWmstx41A1Qp
         F4tL0Kh1Zq/R7xE85YZNyg/OeH+5F/XIQccTNs0CsSwwBFA+ncUXx5JgmAR0gj/NyZA3
         gCTpFO8v5KxZJipqtO8/e/GMsT1WFILWl18iGSYa1/ofQa3olJDL9xwr4b9XxkEDEPaS
         /FXgly3eJxXbZpu5ZkjlYsnB6b/fwrbyVKDfg5B+ySxncYiLBB8vlvl+8kkO8DtB0nMj
         DwOQ==
X-Gm-Message-State: AOAM530TJcVbNa55lTHDi9QQ0MkIWzD5LzLtdlzjaZKsqI+cT+hNgPM6
        PJF6GmScbYUtGW6H7rJzenLjSO1nxBQXOz4lyXRhHQ==
X-Google-Smtp-Source: ABdhPJwkLqIgPTCoHB5608wXZ6psHWtmwseZ6NAUWiauk9X2myp5Pu+p9JJt2O56dimXRhUyOo/xKJKH0O+d6MEgH78=
X-Received: by 2002:a17:907:10d4:: with SMTP id rv20mr1497544ejb.413.1595453875110;
 Wed, 22 Jul 2020 14:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org> <20200713060842.471356-3-acourbot@chromium.org>
In-Reply-To: <20200713060842.471356-3-acourbot@chromium.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 22 Jul 2020 18:37:43 -0300
Message-ID: <CAAEAJfD8yfdTptkmXoPzrw6S=6eKr=K4yL9-5aq2JtWF7M3=7w@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> The mediatek codecs can use either the VPU or the SCP as their interface
> to firmware. Reflect this in the DT bindings.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index b6b5dde6abd8..7aef0a4fe207 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -19,7 +19,9 @@ Required properties:
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> -- mediatek,vpu : the node of video processor unit
> +One of the two following nodes:
> +- mediatek,vpu : the node of the video processor unit, if using VPU.
> +- mediatek,scp : the noode of the SCP unit, if using SCP.
>

This interface doesn't enforce the fact only one of the two
should be present, but not both (which is the case, right?).

I hope I'm not bikeshedding here, but from an interface POV,
would it be cleaner to just have a single mediatek,coprocessor
property, and then use of_device_is_compatible
to distinguish VPU from SCP type?

Moreover, I'd argue you don't need a dt-binding change
and should just keep the current mediatek-vpu property,
and then rely on of_device_is_compatible.

Regards,
Ezequiel

>
>  Example:
> --
> 2.27.0.383.g050319c2ae-goog
>
