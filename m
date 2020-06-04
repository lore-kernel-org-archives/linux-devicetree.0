Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34280C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 06:09:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AA9D2077D
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 06:09:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYYE+woU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgFDGJB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 02:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgFDGJB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 02:09:01 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1934C05BD1E
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 23:09:00 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y17so1762596plb.8
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pmFDoKX5wz/mBcFrTGX9SIAeZsye0K07CGwAnpg7u7g=;
        b=bYYE+woUoYsdCiappu46pprNhNhbH9gIlFZYY3fFb6uLbL0bKTfEV5aMN0VcOXP6Mx
         mq82B8KBPk1hskT6GmjRevQJnJ/tVmMrdHs9ROdYR38OF78ZKadXFbS0uxMSTfbxU2le
         Y254RUQFW7GjtQPmf81soFIQU7RseTLddpAqzWTA6qEd+iawQBZ/TplQHHDLDOVflSVw
         nSRgu8ab9vMs4pjXFk/cb44Pv+ZIaNsKOljxZKD+Szp7SWhRddDQpwr9oTbcnaPjMcDd
         CynXnMtIgX8UUXsqHZLRs72MPXoj/TzrtpL1uIlrBylr4Zf4GhDz9REIfCyaSSq7nmX6
         xEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pmFDoKX5wz/mBcFrTGX9SIAeZsye0K07CGwAnpg7u7g=;
        b=T6s0lzSJXhUQ+Jdfe/8SOff6G+4+tx6jtVY9zkColvgMNtR6tpMR2rnEbVKvYjxnsO
         YMnvJfIuR9j8tx1AtP2xbwCHjZD9u9rkIjZqS8q33dag9t5OFAc6/hsAfNIHiV1ucHez
         pZUwhdUS7U9asbJiI/KyDjuqPCHQVJ5OiXFHhAOFlHhCAVYQATESe1yMMIYcwNAWhPeC
         HDK01SgbDTBWrlHxFW2CbskMa2BJGHhDlpdJdYWlfDOOyGeYEl92A9SdJ4nwpC5ZJw7F
         3gxp2Qyo2J4zxXJtufa4o2FHUKZv+0AxZ1dLOUIZvkScwScdv5+gRPpkgqyX9ZnQOtJ4
         pp/g==
X-Gm-Message-State: AOAM531EUQ8+Mg35W5j4zC25EQUcHO3Op5vaRc8+1dorhoyTzA/h9OUO
        zT229iskEF2/XZzKrz/luOGB
X-Google-Smtp-Source: ABdhPJxZZH4d3iwIiFJA9lcpV6nsEWxGD9GsfPdXjNbA7cZNj3hHPYEI+DWiR1ltututcddPqpxK6A==
X-Received: by 2002:a63:2257:: with SMTP id t23mr2865507pgm.245.1591250940259;
        Wed, 03 Jun 2020 23:09:00 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e90:f3d4:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id 145sm3423898pfa.53.2020.06.03.23.08.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 23:08:59 -0700 (PDT)
Date:   Thu, 4 Jun 2020 11:38:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: pm8009: Add base dts file
Message-ID: <20200604060852.GD16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 04, 2020 at 03:43:25AM +0300, Dmitry Baryshkov wrote:
> Add base DTS file for pm8009 along with GPIOs and power-on nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8009.dtsi | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> new file mode 100644
> index 000000000000..9f3e19b5bd00
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019, Linaro Limited

2020

> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>

Sort includes alphabetically.

Thanks,
Mani

> +
> +&spmi_bus {
> +	pmic@a {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		power-on@800 {
> +			compatible = "qcom,pm8916-pon";
> +			reg = <0x0800>;
> +		};
> +
> +		pm8009_gpios: gpio@c000 {
> +			compatible = "qcom,pm8005-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pmic@b {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xb SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.26.2
> 
