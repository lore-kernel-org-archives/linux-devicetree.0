Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4EEC4BA14
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 14:09:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 570252467B
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 14:09:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20150623.gappssmtp.com header.i=@nexus-software-ie.20150623.gappssmtp.com header.b="uBz3+g+j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbgBZOJu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 09:09:50 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38617 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbgBZOJt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 09:09:49 -0500
Received: by mail-ed1-f67.google.com with SMTP id p23so3909121edr.5
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fXFKoR7odDqKyjm1wlalyPUtaV5JgRAtJWLDNUWDC8E=;
        b=uBz3+g+j8keWl8UqI79zfp5ubt5QR7/jXbEkrRg/FCZsiZGJC3aScHfLMQZxnVbof3
         /QZebawsO2zze1XxLqeBsXC2dsMaenQfIFyIOtbY2d5jk5G7uwQkFUZrYjeLa+zy3DE7
         lzADPtw5KQoK/Pm/ROUTLWxaKS8vLmq7PtHLzzwWCoYi/uqf06dA+oXXNc1vUs/imun1
         GOWPx1wK29lGZ/IcYPHFQbIU6q34VUM+92OI4u3yF1LEl7bMTJirNuZm/atrMNTPRdg5
         ZG/tqQrfoKU+uMNPz9Ru9PJe0pyNk6lFQEORi/37O03LN46FGtKkMXMCRNDMc5vDil1W
         RjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fXFKoR7odDqKyjm1wlalyPUtaV5JgRAtJWLDNUWDC8E=;
        b=DKvVwjvoXz1CknuKzsPB7sChC87prYvtOBR6a7W6aa8KsvRQmlWg0iQ88OCAhtdhep
         kZEJULXM0Qtj/BEQcSmfjXAJUbTV8IiCHvXnZvtLor3DWYVVED1WH8nGnwZyhn2ds1hk
         fxNnnugTzmL50L1mCtcW0+XN9pvDP0HadeGA57kXKF6dBoDISLX6tiqkN0X1n+1HY9zr
         E0JDznyn3hUassdXq50x6H6CuE3wajI6k1L1x4xkDwcPX9M+cFAlB6kMazHdtvgC9zvg
         1K2zSJH5H29HWykceACvqHWslagQ54Lj2uDinl9OB/1DFh7R2IoOIa01SRHh+6Sbdb5M
         mT7g==
X-Gm-Message-State: APjAAAUt4fb7caidu93Og6eagW/vyiZs7jzKwTpt4v2BYPHC2LHWw65I
        h5PO6CRLENmbgtuewtgIt2eJkg==
X-Google-Smtp-Source: APXvYqw0u4w7Awwn/Oq86trc1VxG309aOYxrpuzvaTjpcOA5sSGDTXcJUngxdDIFv1GDoA39EXuUlA==
X-Received: by 2002:a05:6402:22d4:: with SMTP id dm20mr5099174edb.353.1582726187668;
        Wed, 26 Feb 2020 06:09:47 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c19sm91152ejm.47.2020.02.26.06.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 06:09:46 -0800 (PST)
Subject: Re: [PATCH v4 0/5] Add clock drivers for SM8250 SoC
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org
References: <20200224045003.3783838-1-vkoul@kernel.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <ada86697-374c-653d-156e-36af61b53c52@nexus-software.ie>
Date:   Wed, 26 Feb 2020 14:09:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224045003.3783838-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 24/02/2020 04:49, Vinod Koul wrote:
> This series adds clock drivers support for SM8250 SoC.  As part of the
> device tree, the sm8250 dts file has basic nodes like CPU, PSCI, intc, timer
> and clock controller.
> 
> Required clock controller driver and RPMH cloks are added to
> support peripherals like USB.
> 
> All this configuration is added to support SM8250 to boot up to the
> serial console.
> 
> Changes in v4:
>   - Make qcom,gcc-sm8250.yaml license as dual GPL + BSD
> 
> Changes in v3:
> - Dropped accepted patches by Steve
> - Split the common rename patch to rename and refactor patches
> - Rebase on clk/clk-qcom and move yaml binding to .../bindings/clock/qcom,gcc-sm8250.yaml
> - Fix comments form Steve on gcc-sm8250 clk driver
> 
> Taniya Das (5):
>    clk: qcom: clk-alpha-pll: Use common names for defines
>    clk: qcom: clk-alpha-pll: Refactor trion PLL
>    clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs
>    dt-bindings: clock: Add SM8250 GCC clock bindings
>    clk: qcom: gcc: Add global clock controller driver for SM8250
> 
>   .../bindings/clock/qcom,gcc-sm8250.yaml       |   72 +
>   drivers/clk/qcom/Kconfig                      |    7 +
>   drivers/clk/qcom/Makefile                     |    1 +
>   drivers/clk/qcom/clk-alpha-pll.c              |  264 +-
>   drivers/clk/qcom/clk-alpha-pll.h              |   12 +
>   drivers/clk/qcom/gcc-sm8250.c                 | 3690 +++++++++++++++++
>   include/dt-bindings/clock/qcom,gcc-sm8250.h   |  271 ++
>   7 files changed, 4268 insertions(+), 49 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
>   create mode 100644 drivers/clk/qcom/gcc-sm8250.c
>   create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
