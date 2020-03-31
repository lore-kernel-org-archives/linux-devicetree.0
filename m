Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D42C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 16:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E74720784
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 16:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dia3hfRr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731224AbgCaQ4Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 12:56:25 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38525 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730556AbgCaQ4Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Mar 2020 12:56:24 -0400
Received: by mail-pf1-f193.google.com with SMTP id c21so9937153pfo.5
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2020 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AoYRd9Pq6YoKCArfaky/GwN/okmu7M4Melv1gMLsus0=;
        b=Dia3hfRrpxaRBxvHdYd3kMBU9QW0vqQmdSuDx/tIahRVeQTZWE1qSImujnys9OAPzf
         ihL/Ae2uVTeIm7IRV4nnp3pPWpBiL7cxYKs2CPUGddpc3yogJ6Rik6vHHDjyPYtjRX5q
         Py3e9yi5uOJCFjqDCc48fMSRehdhvj0dXwqdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AoYRd9Pq6YoKCArfaky/GwN/okmu7M4Melv1gMLsus0=;
        b=kg0oaKw4hzNmK8FVTpnrvLd5hROgjrX7t73Xs6lmxwpfhu5bjcN4kURBGHOKkIjdiN
         5fPK1UeEiRs6U4vVtU9KFZxooWXtrLyC6GaV/2tcV1pmPp7zjHMrpHEhZszdmKREdxx7
         chcQo0u5293a9kVQ4U0IwvzVojhMOJ5LIRlja9YFP+kWPcQUMxT1sKzPIb3FlT9bWmCI
         6nn9T0+/ro1cHVFGNOXRglWo+QFQkwgBz3o+uAsbOWcmE/zOq82lOzbRXqJX8xqaAD49
         OPs2zk4084uH5nru/3pvh2TUM0LgxJAujEUroLDMcn0Jp7oDggWSRfASBCCH7bdGfaIF
         Z4TQ==
X-Gm-Message-State: ANhLgQ2q6JNcpQRs668HI/N9Ti6aAlm9ywGpZARKoc3r5gwBntGzRXvP
        pzvnAY41hwWBy17YCWda3mtjRxWP6AU=
X-Google-Smtp-Source: ADFU+vu2yJB9PydRxx64pKqd+7UiF/mWFNoEoubw30zUx4+AkYrfUieVzTWz0wrsdhsJ/MmJMU3XnQ==
X-Received: by 2002:a63:484:: with SMTP id 126mr19669475pge.161.1585673781872;
        Tue, 31 Mar 2020 09:56:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id p22sm12147731pgn.73.2020.03.31.09.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:56:21 -0700 (PDT)
Date:   Tue, 31 Mar 2020 09:56:20 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sc7180: Swap order of gpucc and sdhc_2
Message-ID: <20200331165620.GF199755@google.com>
References: <20200331092832.1.Ic361058ca22d7439164ffea11421740462e14272@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200331092832.1.Ic361058ca22d7439164ffea11421740462e14272@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 31, 2020 at 09:29:00AM -0700, Douglas Anderson wrote:
> Devices are supposed to be sorted by unit address.  These two got
> swapped when they landed.  Fix.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 998f101ad623..4bdadfd9efb9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1294,6 +1294,20 @@ pinconf-sd-cd {
>  			};
>  		};
>  
> +		gpucc: clock-controller@5090000 {
> +			compatible = "qcom,sc7180-gpucc";
> +			reg = <0 0x05090000 0 0x9000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_gpu_gpll0_clk_src",
> +				      "gcc_gpu_gpll0_div_clk_src";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		sdhc_2: sdhci@8804000 {
>  			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0 0x08804000 0 0x1000>;
> @@ -1312,20 +1326,6 @@ sdhc_2: sdhci@8804000 {
>  			status = "disabled";
>  		};
>  
> -		gpucc: clock-controller@5090000 {
> -			compatible = "qcom,sc7180-gpucc";
> -			reg = <0 0x05090000 0 0x9000>;
> -			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> -				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> -			clock-names = "bi_tcxo",
> -				      "gcc_gpu_gpll0_clk_src",
> -				      "gcc_gpu_gpll0_div_clk_src";
> -			#clock-cells = <1>;
> -			#reset-cells = <1>;
> -			#power-domain-cells = <1>;
> -		};
> -
>  		qspi: spi@88dc000 {
>  			compatible = "qcom,qspi-v1";
>  			reg = <0 0x088dc000 0 0x600>;

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
