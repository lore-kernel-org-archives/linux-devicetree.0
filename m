Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB15C83007
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 22:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38BBC20730
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 22:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HYO8E/N+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgD1W1Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 18:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726272AbgD1W1Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 18:27:24 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE219C03C1AD
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 15:27:24 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id y10so182441uao.8
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 15:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MneTeEsl9HAajGzseS68PtFpQqpR7WXRnzKFmK+XRpk=;
        b=HYO8E/N+MMu6+8V05SjealqWlT/rFE3JYskdr3qTSPz02pknp0CcrhldrgkWJ1cVim
         j5eXn6RdtT3vlvnGs1toIFmKpvlBcvau1rE3BkF1izMMBMb+rvJ3u+zJrD4+/X7Uw+2B
         NKsPeC6OehmoRRTMka8FVUXHf0DP2shJ97Org=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MneTeEsl9HAajGzseS68PtFpQqpR7WXRnzKFmK+XRpk=;
        b=Va6OxwveWvKY+KRc6ygP8ub4kShSworJ1ki7vXxyK0b5wtBow1tV8F5slXzE0U6FOZ
         VygM9jBK4Br6U31ClAGCbwhq78w8jTuCwxAL7JIZ7GsEiWVReRCS01lFRJbU3ZXYJH20
         R8dRmyqh5p8711aYiyZg77YkyK6Z5gKuAkGJWdAOstzMiJVsBrK7i7ksPr2UhfxAs7p6
         UrUwOe1onCBwElUOUZ8dxITNYIdReurCu9KWqNDBwdHCtx5eNmlVS2OjJa40L23Jk6x+
         dtyQUYKXEHWcbzj+Ml6njslo2qZV8kGvrXK9kC18MjkhL+rqA5K7nyPfC5CefDEsTsV3
         vHtQ==
X-Gm-Message-State: AGi0Pua1fgvoaKdIISHUbjsGbS/m0sNuhfHkpepqxYHHUnLx+J6Ek8Xw
        T746hXj12924nRT1qgS9cwwUY+Fp5sg=
X-Google-Smtp-Source: APiQypLEH32PUv8gmg/8LjoiIeXiKxmc3f8mVtl/R5xKD0S3+6oqfC36iN2OlylCHdrzUvonxYKMuw==
X-Received: by 2002:ab0:10d:: with SMTP id 13mr22532229uak.56.1588112843430;
        Tue, 28 Apr 2020 15:27:23 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id n193sm5293815vkf.43.2020.04.28.15.27.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 15:27:22 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id v192so147516vkd.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 15:27:22 -0700 (PDT)
X-Received: by 2002:a1f:9605:: with SMTP id y5mr22452968vkd.75.1588112842024;
 Tue, 28 Apr 2020 15:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <1588073914-15712-1-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588073914-15712-1-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Apr 2020 15:27:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPG4x+TTu5-169EPObhvtPEpodzjnk2WSBCQgR434xdA@mail.gmail.com>
Message-ID: <CAD=FV=WPG4x+TTu5-169EPObhvtPEpodzjnk2WSBCQgR434xdA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm-smmu: Add a new compatible string and a clock
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Apr 28, 2020 at 4:39 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds a new compatible string for sc7180 and also an
> additional clock listing needed to power the TBUs and the TCU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

nit: mention sc7180 in subject, like:

dt-bindings: arm-smmu: Add sc7180 compatible string and mem_iface clock


> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..15946ac 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2
>                - qcom,sdm845-smmu-v2
>            - const: qcom,smmu-v2
>
> @@ -113,16 +114,22 @@ properties:
>        present in such cases.
>
>    clock-names:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - const: bus
>        - const: iface
> +      - const: mem_iface_clk

People usually frown on clock-names ending in "_clk".  Just name it "mem_iface".


>    clocks:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - description: bus clock required for downstream bus access and for the
>            smmu ptw
>        - description: interface clock required to access smmu's registers
>            through the TCU's programming interface.
> +      - description: clock required for the SMMU TBUs and the TCU

Is this clock only needed for sc7180, or would it be useful if we
enabled certain features on existing devices?  Please document exactly
when someone would provide this clock and when they'd leave it off.

...also: maybe it's obvious to those that understand IOMMUs in depth,
but to me I have no idea what your description means and why it's
different from the other two clocks.  Any way you could punch up your
description a little bit?

Looking at sdm845 I see that this clock seems to exist but wasn't
listed in the IOMMU device tree node.  Is that a mistake on sdm845?
...or is it just fine because the GPU holds the clock?  Is there a
reason the sdm845 solution and the sc7180 solution shouldn't be the
same (AKA we should either add this clock to the sdm845 device tree
file or remove it from sc7180)?

Thanks!

-Doug
