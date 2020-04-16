Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0009C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:27:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9DDC206D5
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJcoaFeb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439026AbgDPH11 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438944AbgDPH1Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 03:27:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E632C061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:27:23 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h9so3559209wrc.8
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QxpHiucnhhWIScTRux26ZlKVnMyZxog3DZwM1hu74UY=;
        b=NJcoaFebkFEC/7qlTmJhtWoHhwkOt2K/gdRXFxzWdbjoaCzZkTTDYWJMPxpTxW8ORd
         aqdKBnWmj8kePfOpjU8NPE/K9DebqACnnOY/FjoNYBlalaz3Y7bsKDEIL5UA88ARoLMm
         jLsTpzXX2PUz8MV0Z0FvA4bkhGRJ5KWyld1m4wWCMZo3MjNRlWk17d4JYVtk1hLZ67bj
         s26VJ9CmUDcD6Kc/BNZxY+sr/GLlB5EAsCx8/v0s5n9op7aXDrmyBtKYhq0sSya8+Lvx
         /0YWTdD9FXCJAaR3d/Fsy4pbFIRIFBBLratFGfQH62kukXlOmPMjjWGyit+QrJKZBOrX
         v45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QxpHiucnhhWIScTRux26ZlKVnMyZxog3DZwM1hu74UY=;
        b=XcGk5w90BR00xvBeKtlbk1I0/9rI5Io7ZfGO1syMkkZiYTP+D/c5/W3fPG8wBevZCl
         nROpNPGmp6QmcHHudauufy7Y0TaFN/MZPIeg94qPF8vxJ9FRWfUqWfAGySOpHPf+UzQh
         AI+ZbEocQ1UFOabXbWhiRBMRAQhAWR5ckf1DCl/85JrGgQzULD5WHmP7hQTN/EUfggkF
         nCK5jSrU+SUwwyHkJ4V6OmgblLsiCtxw7YIAvZmN8e7iqwlsXzfCZ4lxBvwsXV+zBm59
         7I8CY1RLDqBzZOk4SlfuEnCyqpJmUYWjrCpjL+kdspG0ep24IwrX+5ATwaQKk2tbZ+Zm
         jLmQ==
X-Gm-Message-State: AGi0PuaVe+0jrdv3bvFcPIjh9mGGlaVdZd9WJqynq2IElViBekdBhQFi
        WizFGm5p0+5Nbk1KAosh3036nw==
X-Google-Smtp-Source: APiQypJqsIciqFOzLwVCqcUPSlriBEOlFHJnwMEFkwbNqkG6VNGQqvq0iwyOSnnG1sOY8gY5eFSegw==
X-Received: by 2002:a5d:49d2:: with SMTP id t18mr16202952wrs.85.1587022041753;
        Thu, 16 Apr 2020 00:27:21 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id b191sm2542521wmd.39.2020.04.16.00.27.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Apr 2020 00:27:20 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom: apr: Use generic node names
 for APR services
To:     Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org
References: <20200415081159.1098-1-stephan@gerhold.net>
 <20200415081159.1098-2-stephan@gerhold.net>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f0735d41-d274-841e-f6d3-69c301726883@linaro.org>
Date:   Thu, 16 Apr 2020 08:27:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415081159.1098-2-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 15/04/2020 09:11, Stephan Gerhold wrote:
> Device nodes should be named according to the class of devices
> they belong to. Change the suggested names of the subnodes to
> apr-service@<id>, which is already in use in
> arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   .../devicetree/bindings/soc/qcom/qcom,apr.txt | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> index f8fa71f5d84b..2e2f6dc351c0 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> @@ -65,30 +65,30 @@ which uses apr as communication between Apps and QDSP.
>   		compatible = "qcom,apr-v2";
>   		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>   
> -		q6core@3 {
> +		apr-service@3 {
>   			compatible = "qcom,q6core";
>   			reg = <APR_SVC_ADSP_CORE>;
>   		};
>   
> -		q6afe@4 {
> +		apr-service@4 {
>   			compatible = "qcom,q6afe";
>   			reg = <APR_SVC_AFE>;
>   
>   			dais {
>   				#sound-dai-cells = <1>;
> -				hdmi@1 {
> -					reg = <1>;
> +				dai@1 {
> +					reg = <HDMI_RX>;
>   				};
>   			};
>   		};
>   
> -		q6asm@7 {
> +		apr-service@7 {
>   			compatible = "qcom,q6asm";
>   			reg = <APR_SVC_ASM>;
>   			...
>   		};
>   
> -		q6adm@8 {
> +		apr-service@8 {
>   			compatible = "qcom,q6adm";
>   			reg = <APR_SVC_ADM>;
>   			...
> @@ -106,26 +106,26 @@ have no such dependency.
>   		qcom,glink-channels = "apr_audio_svc";
>   		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>   
> -		q6core {
> +		apr-service@3 {
>   			compatible = "qcom,q6core";
>   			reg = <APR_SVC_ADSP_CORE>;
>   		};
>   
> -		q6afe: q6afe {
> +		q6afe: apr-service@4 {
>   			compatible = "qcom,q6afe";
>   			reg = <APR_SVC_AFE>;
>   			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>   			...
>   		};
>   
> -		q6asm: q6asm {
> +		q6asm: apr-service@7 {
>   			compatible = "qcom,q6asm";
>   			reg = <APR_SVC_ASM>;
>   			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
>   			...
>   		};
>   
> -		q6adm: q6adm {
> +		q6adm: apr-service@8 {
>   			compatible = "qcom,q6adm";
>   			reg = <APR_SVC_ADM>;
>   			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> 
