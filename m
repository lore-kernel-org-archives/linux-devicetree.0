Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A893C2D0FA
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 23:03:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A4FC20675
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 23:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vuwi+lAx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731540AbgELXDc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 19:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELXDb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 May 2020 19:03:31 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EC2C061A0C
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 16:03:30 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id l25so8962826vso.6
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 16:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H5FetxvGPLFWpsF7g0nhJxUni2v4MfzWKsEb+uV6F5g=;
        b=Vuwi+lAx5qAhG+ORwRRDlUSpm7T4YexVmx8bD0gPLnVVjYZvL3BNJcMQ2iWO4IfwCn
         R29kGOxoF0L/2YE19OWsp/s/2fAHmGjXUwFvWjbVG+mTmsqUnyNj9NwFzoGmSbPO0zI2
         6orwbCaFgjpEMwMixF3eAx0GccTMbCDY13kn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H5FetxvGPLFWpsF7g0nhJxUni2v4MfzWKsEb+uV6F5g=;
        b=qSRu5qu1I1KF+t2aN5JB7lKpIXgdqdCDOHH8cazzvNAyBqt7LWDLtczScmK/KY6qn+
         mQ7UvUpY1d85PVAg9bgj8IMOEXfGWpVx4FNN7t++OP6eMQXCeIKHtnyw4y2+bo4mbBqY
         5YrSiiPK1Xjpx3rURo/5m5V1kkplyUAB7WxFVIFiJT/rXjdvLDa7Ep9E0V/0Hl4Soy6U
         Yairv1Jdrcio7F/gEtwLCPqfF7QUCd48Y8Q4+BNVMVJ0TMR+exTeKrGfDIkcE33u0O/q
         1aJFCnCvLn6BJucPS8c3rAoeyCYLhyHh0PFl2afvFPY4EA6n3p9rfnYmvk6Ng+8Gxv56
         Tzcg==
X-Gm-Message-State: AGi0PuZid7yGRZyvCDDGsiVLXJ+czfUHB1ebJT2gMGuzeZ0hXfnZF417
        nHtllWxFwfOjnvXW7nJIOOzqL2/mxrA=
X-Google-Smtp-Source: APiQypJFWXEfpFmNXa+Vu70Ac/NtsgsgXI+LsyL7vxMQOfA3sANOsBUqA4B0e3Rzx+YsEkEV1scDxQ==
X-Received: by 2002:a05:6102:1c3:: with SMTP id s3mr19970420vsq.56.1589324608689;
        Tue, 12 May 2020 16:03:28 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id j15sm10423537vsg.34.2020.05.12.16.03.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2020 16:03:27 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id p139so3790090vkd.7
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 16:03:27 -0700 (PDT)
X-Received: by 2002:a1f:4e46:: with SMTP id c67mr7154245vkb.92.1589324606642;
 Tue, 12 May 2020 16:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <1589307480-27508-1-git-send-email-rbokka@codeaurora.org> <1589307480-27508-2-git-send-email-rbokka@codeaurora.org>
In-Reply-To: <1589307480-27508-2-git-send-email-rbokka@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 12 May 2020 16:03:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wp5-=YgvaopeXROAfE5PESaghcthpFNy1qt4Zo5c-UkA@mail.gmail.com>
Message-ID: <CAD=FV=Wp5-=YgvaopeXROAfE5PESaghcthpFNy1qt4Zo5c-UkA@mail.gmail.com>
Subject: Re: [RFC v1 1/3] dt-bindings: nvmem: Add devicetree bindings for qfprom-efuse
To:     Ravi Kumar Bokka <rbokka@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, c_rbokka@codeaurora.org,
        mkurumel@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, May 12, 2020 at 11:18 AM Ravi Kumar Bokka <rbokka@codeaurora.org> wrote:
>
> This patch adds dt-bindings document for qfprom-efuse controller.
>
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> ---
>  .../devicetree/bindings/nvmem/qfprom-efuse.yaml    | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/qfprom-efuse.yaml
>
> diff --git a/Documentation/devicetree/bindings/nvmem/qfprom-efuse.yaml b/Documentation/devicetree/bindings/nvmem/qfprom-efuse.yaml
> new file mode 100644
> index 0000000..d262c99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/qfprom-efuse.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/qfprom-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc, QFPROM Efuse bindings
> +
> +maintainers:
> +  - Ravi Kumar Bokka <rbokka@codeaurora.org>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7180-qfprom-efuse
> +
> +  reg:
> +    maxItems: 3

Instead of this, add descriptions for the 3 items.  AKA:

reg:
  items:
    - description: The base of the qfprom.
    - description: The start of the raw region.
    - description: The start of the mem region.

...but do you really need to break this down into 3 ranges?  Why can't
you just do:

reg = <0 0x00780000 0 0x2100>;

Then you really don't need any description and you'd just have:

reg:
  maxItems: 1


> +

Need something for clocks and clock-names, like:

clocks:
  maxItems: 1

clock-names:
  items:
  - const: sec


> +required:
> +   - compatible
> +   - reg
> +   - clocks
> +   - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +
> +    efuse@780000 {
> +       compatible = "qcom,sc7180-qfprom-efuse";
> +        reg = <0 0x00780000 0 0x100>,
> +              <0 0x00780120 0 0x7a0>,
> +              <0 0x00782000 0 0x100>;
> +        clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
> +        clock-names = "secclk";

nit: Folks usually don't like the names of clocks to end in "clk".  We
know it's a clock.  Just name this "sec" or even a local name like
"core".
