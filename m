Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007DDC433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 06:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3EDC24841
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 06:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WP3cfbjw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729369AbgFUGpH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 02:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729343AbgFUGpE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 02:45:04 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74303C061794
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2020 23:45:03 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b201so6803334pfb.0
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2020 23:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=osTb1fwq44iccUp7hotNVHhBAPFuB/3ogsSLu+R5RqU=;
        b=WP3cfbjwxKhNOAKg7Fg1MyP+00tJ6Lv3jB7fl2KRarxmTexkjlEpr1gZiebJNJyiZT
         dfxNHDIC/WSlUZxrICNo+0jME8zYdANfXsSl1m9+eTxiOJVUgvZePxoNaZnhjf0MEAEu
         bIaxUtwnGBXsQl1+0QDfDsHR12DVvkKaFO74hEfpx+UTC7lWagCAxR0jvn6kzopuR46g
         T06r83oD2NglatzJ/GySEnouPjfjr4lvwBGRg+lO7SrDTyBVbm45NS7pjP6iuJH1q14m
         8a5Jm1SB+IoedLolEwPYgtZXo6SVXlvpMAX+Pwk4wisZCqLeK5kMRC8Qrv0pUCw40FOO
         OI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=osTb1fwq44iccUp7hotNVHhBAPFuB/3ogsSLu+R5RqU=;
        b=WPhRARvnrTPDcvjcS0WAwr/XOCA9nbgv1oc1uKmdzfz7vaoqaTg9E8yQ7T54O1LvdY
         voyT4TzZeGCPicxSklZ27AHtoMN03lkx6CfitgVtiR1JrgcgAJmXjS1omodRSqYlnfVL
         SW691F5AutnUSO1o7u467pC6j+paNVkp1hYcRzZir47+UVOibJbTR95BuUEabVY7cmVR
         PQ24sfavONGHsbteBKFh/W8iKthyThREx9zAJJ7wZ50FX5atWaRDIymaQ7yVyRlJvkxN
         cIpZVdhDu6eojg/hHqL9uTxzYPTu3de9hKHmcpQGZOF+bL2zUfwdPmdMTno/Ig0Dovyo
         inrQ==
X-Gm-Message-State: AOAM532Y/n75gyFDCwAWU4IBSX8tNwXx2ilayFnfmqVZnQbABBqYpple
        lppbD10Ta232hrk548EB74FQKA==
X-Google-Smtp-Source: ABdhPJw9LN0E2pS43SPNSywYcib2HaTFIglDSk3ij155rFRLsVzVMkSdN1yLI9/ZsvXLTgdMUmyvNg==
X-Received: by 2002:a63:af50:: with SMTP id s16mr8905598pgo.365.1592721902798;
        Sat, 20 Jun 2020 23:45:02 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a7sm9849188pjd.2.2020.06.20.23.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 23:45:01 -0700 (PDT)
Date:   Sat, 20 Jun 2020 23:42:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: pm8009: Add base dts file
Message-ID: <20200621064214.GA128451@builder.lan>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 03 Jun 17:43 PDT 2020, Dmitry Baryshkov wrote:

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
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +
> +&spmi_bus {
> +	pmic@a {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		power-on@800 {

Please name this "pon", just for consistency.

> +			compatible = "qcom,pm8916-pon";

Can you confirm that pm8009 is subtype 1, and hence the reboot reason
going into RB_SPARE should be shifted 2 steps, rather than 1 as in the
newer PMICs?

Would be nice if we had a generic compatible that read the subtype,
rather than having to add new compatibles for each pmic (or use the old
ones)...

Regards,
Bjorn

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
