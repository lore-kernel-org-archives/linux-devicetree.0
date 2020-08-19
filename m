Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B7AC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 17:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B714208C7
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 17:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cf6w4ypy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgHSRDY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 13:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgHSRDR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 13:03:17 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5777C061383
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 10:03:15 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id p4so22272771qkf.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ktYpsCxiLWJOQgFpjU6rm698Y/qLm2dIO8jCJsadEOU=;
        b=Cf6w4ypyePA72N9OwZ/X/gIqgQ3/Z2O3rsVEAnbMsPXxSteDXfBbrAJ2YKaLKzi+2G
         eJlNvZyKM6mcCsbB8rTNwjE0zNlCUOU27vLJyO1vH/Kf6P5hVdc0XLNeLzE0ilaNzTIL
         c/q/2eCUoXXxQCiuP4bqs7wWJmNaxuO94MGUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ktYpsCxiLWJOQgFpjU6rm698Y/qLm2dIO8jCJsadEOU=;
        b=mJb5tpMQoNswIs58Yc8bQwiEm8I8Jcr4rry8vNWSVvrip+terdXVmTdOFrIyi7ooEF
         1wqLD84IushvtPqS33ckKLoi3Zv+WJcneFth9nZT+9bEULi52oYXuUqLrQ5VLrz7oLzk
         /tVJghTDI6KE7ajS3QLERuHReMID5/KcjdolX5w9JDeBKbYPqxlb6d0AnqWjI4LqeZbQ
         O2yADOcfgrQH7HB+LC8MDlRIvjVnucbo7Sh+EuJ8oamhAe3KsAH1v6o8Vf6nR4qd4PbH
         bNCRpGazbtYhLjIwrwaUSIoKGA85kuFbP6bytCxYh1jIJnabi5uEhNgWNjqDGYch0eN2
         2svw==
X-Gm-Message-State: AOAM531W1D5rZ0L6fiRg/JV+JXAGviNqn4T8Pg++LjUuvMSgj5gl1+/p
        UIS3nZzJQNeezZhFa8jPV6wpqBmY+6fw6g==
X-Google-Smtp-Source: ABdhPJzDHarbU8eY2e3+fTUv3eESoD2IU7xgNmI6dXwgitgPp15zIAMJ6sOmoQ2bADrdneFYXsBXvQ==
X-Received: by 2002:a37:674d:: with SMTP id b74mr22633613qkc.84.1597856592910;
        Wed, 19 Aug 2020 10:03:12 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id y14sm28381824qtc.84.2020.08.19.10.02.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 10:02:42 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id u6so7870782ybf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 10:02:38 -0700 (PDT)
X-Received: by 2002:a25:d802:: with SMTP id p2mr37420399ybg.446.1597856554388;
 Wed, 19 Aug 2020 10:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com> <20200817220238.603465-11-robdclark@gmail.com>
In-Reply-To: <20200817220238.603465-11-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 19 Aug 2020 10:02:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
Message-ID: <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
Subject: Re: [PATCH 10/20] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Aug 17, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Jordan Crouse <jcrouse@codeaurora.org>
>
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 503160a7b9a0..5ec5d0d691f6 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -40,6 +40,10 @@ properties:
>                - qcom,sm8150-smmu-500
>                - qcom,sm8250-smmu-500
>            - const: arm,mmu-500
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> +        items:
> +          - const: qcom,adreno-smmu
> +          - const: qcom,smmu-v2

I know I'm kinda late to the game, but this seems weird to me,
especially given the later patches in the series like:

https://lore.kernel.org/r/20200817220238.603465-19-robdclark@gmail.com

Specifically in that patch you can see that this IOMMU already had a
compatible string and we're changing it and throwing away the
model-specific string?  I'm guessing that you're just trying to make
it easier for code to identify the adreno iommu, but it seems like a
better way would have been to just add the adreno compatible in the
middle, like:

      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
        items:
          - enum:
              - qcom,msm8996-smmu-v2
              - qcom,msm8998-smmu-v2
              - qcom,sc7180-smmu-v2
              - qcom,sdm845-smmu-v2
        - const: qcom,adreno-smmu
        - const: qcom,smmu-v2

Then we still have the SoC-specific compatible string in case we need
it but we also have the generic one?  It also means that we're not
deleting the old compatible string...

-Doug


>        - description: Marvell SoCs implementing "arm,mmu-500"
>          items:
>            - const: marvell,ap806-smmu-500
> --
> 2.26.2
>
