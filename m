Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7078C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 03:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83EB32075F
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 03:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhMVgVCb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgESDW1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 23:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgESDW1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 23:22:27 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AE8C061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 20:22:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so725430pjh.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 20:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RXCWhh+K4SQcY2NtUrmXF0Iatj9K6se6h6eqA2KUaEU=;
        b=rhMVgVCbrqnPnH7an0wNelI1+yrziK1SPdG7cgVEQeIHpHGq2idWsE9MLgbdKaGoMX
         EXPuYk9/mjgHIROxvJpVYc7tUO5bAIdOIvbKo4jJ9fsi8145L06O3Nnl66AqMPei7gj4
         VUxSBXLRN5XjDr4QRIeK1+g50D9H4nJ6x13sBMDAcuD4+lXmHB6QvhqPprVNvZvR7MzQ
         7WAhSLeRVkSZwPcdYDPDQy8M99vDpTtNiaCTUr3ASAl25NYwX+eB6Zfa3andLGWbs7bK
         UxgsET6hnvmXE82FF1NgWjEoSLgiBIIBmjHLNUId94ldzMNCQyDObgfAejrUz9WnRRSj
         KmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RXCWhh+K4SQcY2NtUrmXF0Iatj9K6se6h6eqA2KUaEU=;
        b=Wzj7vpHGZEPXZEI0Ix1XLpLuzqm6jHdU8TJ9HfwrFYMOndc9SICZikojdTcxaPJLO/
         mZvOIQSgB2huVYJP2I4850JzBu329GPM2mJ54eBdah0KQf8+vme5x8JSTX3glwbpt2j4
         TE70PlYvMISZqFFKjxEzv2v94qNPC4v8Kr9W12OmcoGISs+arQc4M0dtn3+g4q6wmS98
         3bOa7YyD89eYEx4NW3JEMFcxJVyvdWsPasOrQPTCfX0sFn0GjwwJBEvyrRI3erRlpD2K
         EQQ76pD5vJpvUZBbeSf05G6m1PLGk5TL0MK/YRShc8zmid44dIS+ReMdX9KPbVxHoERO
         Rgxw==
X-Gm-Message-State: AOAM531WaAifqBxHIPO5CRedI8Wymx4jnIkHcGGxpruKO+iD3rjZXu7A
        4yhylHdomACxn/PL4jPsJ1yHjQ==
X-Google-Smtp-Source: ABdhPJyYyfiEJloxUySsn6B0LmGt8iuo2CU4tP8PrdonR5ag84nKRqFJbM2AL5rZK23hU8EJATxrfQ==
X-Received: by 2002:a17:902:bd95:: with SMTP id q21mr15459153pls.238.1589858545203;
        Mon, 18 May 2020 20:22:25 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b1sm9800312pfa.202.2020.05.18.20.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 20:22:24 -0700 (PDT)
Date:   Mon, 18 May 2020 20:21:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: apq8016-sbc-d3: Add Qualcomm
 APQ8016 SBC + D3Camera mezzanine
Message-ID: <20200519032102.GI279327@builder.lan>
References: <20200518082129.2103683-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518082129.2103683-1-robert.foss@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 18 May 01:21 PDT 2020, Robert Foss wrote:

> Add device treee support for the Qualcomm APQ8016 SBC, otherwise known as
> the Dragonboard 410c with the D3Camera mezzanine expansion board.
> 
> The D3Camera mezzanine ships in a kit with a OmniVision 5640 sensor module,
> which is what this DT targets.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v2:
>  - Vinod: Change copyright assignment to Linaro
> 
> Changes since v1:
>  - Vinod: Changed license to GPL+BSD
>  - Vinod: Changed copyright year to 2020
>  - Nico: Changed name of mezzanine to d3camera
> 
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../boot/dts/qcom/apq8016-sbc-d3camera.dts    | 45 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cc103f7020fd..3f95b522694e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM) += apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts
> new file mode 100644
> index 000000000000..752e5ec47499
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3camera.dts
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.

That's not how you spell "Linaro Ltd" :)

> + */
> +
> +/dts-v1/;
> +
> +#include "apq8016-sbc.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. APQ 8016 SBC w/ D3Camera Mezzanine";
> +	compatible = "qcom,apq8016-sbc", "qcom,apq8016", "qcom,sbc";

Please add qcom,apq8016-sbc-d3camera" (or qcom,db410c-d3camera :)) and
drop the vague "qcom,sbc".

> +};
> +
> +&cci_i2c0 {
> +	/delete-node/ camera_rear@3b;

camera_rear@3b is disabled already, so you shouldn't need this.

Should we really carry the node in apq8016-sbc.dtsi? (Unrelated/separate
change).

Regards,
Bjorn

> +
> +	camera_rear@76 {
> +		compatible = "ovti,ov5640";
> +		reg = <0x76>;
> +
> +		enable-gpios = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&camera_rear_default>;
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> +		clock-names = "xclk";
> +		clock-frequency = <23880000>;
> +
> +		vdddo-supply = <&camera_vdddo_1v8>;
> +		vdda-supply = <&camera_vdda_2v8>;
> +		vddd-supply = <&camera_vddd_1v5>;
> +
> +		status = "ok";
> +
> +		port {
> +			ov5640_ep: endpoint {
> +				clock-lanes = <1>;
> +				data-lanes = <0 2>;
> +				remote-endpoint = <&csiphy0_ep>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.25.1
> 
