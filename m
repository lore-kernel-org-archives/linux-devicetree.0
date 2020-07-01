Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47685C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 19:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B5E02082F
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 19:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S69Z6hVz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgGATjZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 15:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgGATjV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 15:39:21 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2979BC08C5DB
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 12:39:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d17so13951316ljl.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 12:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uZLgRyeqLIrejgbskRWtUMI2dY4YQCIX+GY0py5r3AA=;
        b=S69Z6hVz4wBbcWfEPDTLxOfydDlRKVUspZAmALfKiePq4efP4D6Zy/HnkTrZixiCmy
         Ot40/jExbO/G56aM0fEZsfzeJIC3kCvsxrM7MHZqzW1HJEEA5UTAiUuuECa6C9aUljR+
         zCe1fEdW+aHQAlQoaCXz6DY9c4jxfT6LcKyQivUp/xGtatGLTUNnwj6aAa/FWUWiG9K1
         bWQfTOvQY0EpekmLmMomA0vYwaXO07Hu72AKOO1B90d4yUJX1W3dMZUDfX17J7iVY1pG
         fllXRQrJrjqemB9c2daT5zN3LzqeuPJW/vRph40oc5de9fK+rU2K+xUO9rJc4nLbCpB6
         ZJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uZLgRyeqLIrejgbskRWtUMI2dY4YQCIX+GY0py5r3AA=;
        b=H1D73dZ3U5uEV/qto33RV1IJFoPT0HJsV1Ojef5g7g6LumcJzFreZ84uPZjoC2VEp3
         C25wy3FLue6vVtjdieJdbJNqRRJ82EHMTJjsIWx2EA9AYUp01nLjJkPcaJR+CAe/Kv1B
         k5EAqvKSn1bgg1Zm0m7cfSC5K3j7tvHDzyhpAtPmvthVQ5i5XJ2pJzCFo7DW0ITmMoms
         1NyyNsCENNlBDwtRNilTzeaWdaRvlC6fj+rUi2JOumVMukTHOqSVTRGUsq4UUbP+8PU6
         c8YLkLGY1a8Dx0U1Zirfnxpy5EBodVHskfpPkUFPN1wGwA0lS2Q4v16HZPfDojk7yZpd
         QKpQ==
X-Gm-Message-State: AOAM533XMN+Mns4Zm9GdyQVwl8GWcD+JhfFzyBZVydowunAWIy5vhrrs
        whVE12Euxq3PRYsW7oCShqQ2OQ==
X-Google-Smtp-Source: ABdhPJznwKrMubCqqzSMTK6VHjJjbQbSK8SWzIJNnS6XVefIEXAhs3wc0iBxGIMfRySbgrsw6uZjLQ==
X-Received: by 2002:a2e:b4ce:: with SMTP id r14mr5133513ljm.88.1593632359481;
        Wed, 01 Jul 2020 12:39:19 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.65.203])
        by smtp.gmail.com with ESMTPSA id y24sm2126434ljy.91.2020.07.01.12.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 12:39:18 -0700 (PDT)
Subject: Re: [PATCH v2 07/13] dt-bindings: clock: Introduce SM8250 QCOM
 Graphics clock bindings
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200629172049.30452-1-jonathan@marek.ca>
 <20200629172049.30452-8-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <caa05cad-ff88-fbcb-ce13-9e43133afb7b@linaro.org>
Date:   Wed, 1 Jul 2020 22:39:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629172049.30452-8-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 29/06/2020 20:20, Jonathan Marek wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SM8250 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   .../bindings/clock/qcom,sm8250-gpucc.yaml     | 74 +++++++++++++++++++
>   include/dt-bindings/clock/qcom,gpucc-sm8250.h | 40 ++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
>   create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
> new file mode 100644
> index 000000000000..2b9c8f97b76d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8250-gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller Binding for SM8250
> +
> +maintainers:
> +  -
> +
> +description: |
> +  Qualcomm graphics clock control module which supports the clocks, resets and
> +  power domains on SM8250.
> +
> +  See also dt-bindings/clock/qcom,gpucc-sm8250.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-gpucc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: GPLL0 main branch source
> +      - description: GPLL0 div branch source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: gcc_gpu_gpll0_clk_src
> +      - const: gcc_gpu_gpll0_div_clk_src

Missing qdss_qmp_clk here.

> +
> +  '#clock-cells':
> +    const: 1
> +



-- 
With best wishes
Dmitry
