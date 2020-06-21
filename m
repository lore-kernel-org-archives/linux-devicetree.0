Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED918C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:36:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD4DF23ECE
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mbLfBZte"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgFUTgw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730170AbgFUTgw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 15:36:52 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E837CC061795
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:36:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jz3so7009589pjb.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GiPGL0KixKUZEggpcuvnQ2W4jyDXzf9YcPGFlK/W3KA=;
        b=mbLfBZteetG2m1x8jSaFUqIQpyGg40cM84u39l8cX7hR6xz2ZSWD2GpPkk3gy7uvVs
         Y0HCiz068zxERkQJmb7t18S4KBxpXmwna2UOlB8WJjRvsU99Vp7M10S7zoR9AksTKUEX
         tdXQDMHvGjuXWS1iWrMvhh7vZT+XODAt5Zm0OQQOU0aLrlp4yKYvHEVG79+2PXBaJKKo
         Zj+fA7hoE98lWfC0mOnfH6l76yeS2FhlGJFzcZzLDxsKrdR/6Cpd1KX747xN00QlwtUb
         oNF+2wvCAFb2+UpVuWqWoQX0Eu/UIYKB+wBlFbTcqT396qta9irbWLdheQp9QQ2m07yi
         QaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GiPGL0KixKUZEggpcuvnQ2W4jyDXzf9YcPGFlK/W3KA=;
        b=e/TKxDV4Aslu00iZHsUk7qmbOc18tIZP7ia6gWrfOveasJk8qVsZ/tMZyHtxJ2lo/3
         QGV9FwHAPy+EA4OK2MnGM4tYnPIMTbrEGqI6jAWPw9xoxqwCOvX/FiEHjb4KHeTiUOot
         uQdqUr5LxUTLFnn9gVzDkTpmm9J2yM0x741DwJvH8+n/tMTuEXX3D3sfar3aMzW7IQDV
         7sZan2S2dbaH6oEWxMEZFUPZNm9S0G8YW03Ahirf2T81QpICLEBesiTrGdbllq5ZXBiu
         qfYCJ9FvEBPmlXrjIVRNMeaHRIraGVZHTuk2Do7WCMQd6lGaXMVHpy9Lo8mbB4e17rPR
         4f1w==
X-Gm-Message-State: AOAM5330TTeeBsHKcDs+30M3HoURKmPcDAWJfXxGpeU3zwOrSohTvrvh
        U+88f3IHd3zgQkiWHKEEEKuIinyRC5w=
X-Google-Smtp-Source: ABdhPJw1I8d+Aq3dTSSP13wu3UUzyuDeXX60UifmfZwWlP0no7eMkGik08Na+mB+kLZIJwFQz5LNaw==
X-Received: by 2002:a17:90a:4d09:: with SMTP id c9mr14957628pjg.137.1592768210427;
        Sun, 21 Jun 2020 12:36:50 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k126sm11807514pfd.129.2020.06.21.12.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:36:49 -0700 (PDT)
Date:   Sun, 21 Jun 2020 12:34:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: pm8009: Add base dts file
Message-ID: <20200621193403.GM128451@builder.lan>
References: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 21 Jun 12:28 PDT 2020, Dmitry Baryshkov wrote:

> Add base DTS file for pm8009 along with GPIOs and power-on nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I took the liberty of adding a pm8009_pon label to the pon node, then
applied the three patches.

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/pm8009.dtsi | 37 ++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> new file mode 100644
> index 000000000000..cb1a10e72474
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Limited
> + */
> +
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pmic@a {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pon@800 {
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
> 2.27.0
> 
