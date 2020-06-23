Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB11C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 02:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CB00207BC
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 02:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3c/skWM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731765AbgFWCs7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 22:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731653AbgFWCs7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 22:48:59 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26261C061796
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 19:48:59 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h10so9176536pgq.10
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 19:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OMT0tAbK+jcwWnAe4UeKwOysBhRXg6SAX4UKEt6CX+U=;
        b=l3c/skWMlGzPJVVxCV3fE+UpaB1qvhq84a0NcB4IRjtd8HUyDF8m4laX7wNLl2J26b
         GCR4t4Ahca3+4n4k0IirVOzSisuZcPtRLkKnQL9U9CSfRBkMnjIYZkkII0XaLadu433y
         rlckgBupYxV+x1W+52KXfM/W5TcYtlGD2iv3YMoJ8KR+eYHxV3uzoLMkvd+5ClEwvv8e
         UngVK+mw9g0MuoiO1u0SVfMbJNAr0U2/zyXFHKBkctrXBdVepAdE5NtAKPxfQKuqUg73
         ZWgafLJ0g/6A0qTTKs55FaYmJhpPqp1xXe3Ynp0+PS+AXDYDMJTCBmWQ9wlXczAIgxxM
         ARqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OMT0tAbK+jcwWnAe4UeKwOysBhRXg6SAX4UKEt6CX+U=;
        b=q643QflegKPCw+/MkTpvl0XVgtUmYcTPdHvALo1zYTSM4m7NR9nky3KaXii8fyJd8q
         zuqxWlIzKgCIiA+i/gZm01Yyx0EXxb3orTl43djVbzfD+M9XuxsmQITuap3cQcGL91Rh
         /RPn8H/sce9CqcK5KwU4YBPsV4qK3yFiA3IFpUPqzNtrAaF6YQH+n59X9afHkyFDvXx7
         HVJk/csUDnUwpjEg83XILycxaLpKGFdd1bHZQZGpS/Nwn6qjZsdPEHVljcLUtH+KGi8C
         52ppYo3f9ntB7tDjfbwAdV7dk97ytaLu8cthiAE5vfNZILisN+9Lflrjg7BtkGYh8fCm
         6v1g==
X-Gm-Message-State: AOAM532zWgwbeovPQanZ0l1gZ2LwNf6Qq2j/lMmN4pY94rcgStv/pC6l
        94Wa61SgD2LnPT333lFrnaRV
X-Google-Smtp-Source: ABdhPJw0sHGBfLWBjcezUMwqRXUM5R3vYdkB+TVg5lQLXmzMTSzwevNKN/iiw3jf3Q8qx2KUiD2dVg==
X-Received: by 2002:a62:ee1a:: with SMTP id e26mr22474377pfi.228.1592880538523;
        Mon, 22 Jun 2020 19:48:58 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:609d:7d26:e4ff:f0b0:edd6:2484])
        by smtp.gmail.com with ESMTPSA id i14sm14990861pfo.14.2020.06.22.19.48.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 19:48:57 -0700 (PDT)
Date:   Tue, 23 Jun 2020 08:18:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8250: Add SMP2P nodes
Message-ID: <20200623024851.GD11093@Mani-XPS-13-9360>
References: <20200622222747.717306-1-bjorn.andersson@linaro.org>
 <20200622222747.717306-5-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622222747.717306-5-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 22, 2020 at 03:27:45PM -0700, Bjorn Andersson wrote:
> SMP2P is used for interrupting and being interrupted about remoteproc
> state changes related to the audio, compute and sensor subsystems.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 246e6f279aa8..364d9a798673 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -314,6 +314,78 @@ smem: qcom,smem {
>  		hwlocks = <&tcsr_mutex 3>;
>  	};
>  
> +	smp2p-adsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_LPASS
> +				IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <2>;
> +
> +		smp2p_adsp_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_adsp_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smp2p-cdsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <94>, <432>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_CDSP
> +				IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <5>;
> +
> +		smp2p_cdsp_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_cdsp_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smp2p-slpi {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <481>, <430>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_SLPI
> +				IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <3>;
> +
> +		smp2p_slpi_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_slpi_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -- 
> 2.26.2
> 
