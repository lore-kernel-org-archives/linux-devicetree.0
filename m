Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC57C10F29
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 14:39:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09CCF206E7
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 14:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9hyoRKS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729887AbgCKOjd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 10:39:33 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:36379 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729795AbgCKOjc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 10:39:32 -0400
Received: by mail-il1-f195.google.com with SMTP id h3so2224209ils.3
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wy+o8H7bDaEo8BGddDsCo4a2Cywi6MmVF56mviUaRRY=;
        b=x9hyoRKSsjcNql8Vs3VDhHu71U7F4mVlz+l+9FFNuzzath0jvqI2Dy20OaCZrSbi64
         8n7VekEx3zlK1oMbjct/nFIPRc9TFXpuqiM7kigXd5fqYqGpv3Slvldg4Qc7R6PV2xih
         IXwB6jOdD7D/4nMP5juQIBgH4PDziLPcKEz1EJ19eD79TdJR40mzNUIX9vb1rc1gySzX
         FIgMzmFkRKfEH0xeeyhy6d0IvS97CZP54idilKEoybizu/hSnMFoYgHv71n5Jz+4Gsts
         0a/h8tBSKBHSlTWjvfxw6wsQQ/ddTuCD+cqE8/rZd176hzJbW+ZzVJWR67I4Jy83dI2W
         dCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wy+o8H7bDaEo8BGddDsCo4a2Cywi6MmVF56mviUaRRY=;
        b=kgaMxZQIrmY3G7rzY4ou0U2DE2bZTvvVOa/Blnj0x9ufnAIbvTXiH2ZUoZ+xYY+bQs
         nnIGWswvNVX5bR5eX3LYQa8j+RBOJVwSHuRXzhDIcW7NXUvXrw8VDgleCwQwkFFxIfX7
         4mAf51HI5wvWPPkA64CvoAkHLk6Gy04h9/Mnc4AudRueOAUTRl4Y8IOtPPNW7SCVqacS
         2qIKfk2PeeZvgNSKemjgb5yWXQdky4rsjGHsvCIM+7guBoW9NZ8muM/WGLjZExe35dwj
         d4IaQjlTN6WOH1sSWEqtRlvH5tmkuuTqOgYigkeq4Ji0/vpFu6nxem4zb/WIZaIB/SBH
         PIHw==
X-Gm-Message-State: ANhLgQ2Gl9nScG12Cw0RJayTO29O932QMPTjJPt112ZphETKo13q5v4B
        K7AMrXO5cUlrPStxn7HUzv1N4g==
X-Google-Smtp-Source: ADFU+vsoLXbHGd59x7Q6lscbF+LgH2AFuhNx/jrcSAvda5RCT92+oTo8i3ASrpHiJWGnWl/FdM3Wng==
X-Received: by 2002:a92:d9d0:: with SMTP id n16mr3509344ilq.200.1583937570436;
        Wed, 11 Mar 2020 07:39:30 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id h14sm8868430iow.23.2020.03.11.07.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 07:39:29 -0700 (PDT)
Subject: Re: [PATCH v2 17/17] arm64: dts: sdm845: add IPA information
To:     Jon Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Miller <davem@davemloft.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Johannes Berg <johannes@sipsolutions.net>,
        Dan Williams <dcbw@redhat.com>,
        Evan Green <evgreen@google.com>,
        Eric Caruso <ejcaruso@google.com>,
        Susheel Yadav Yadagiri <syadagir@codeaurora.org>,
        Chaitanya Pratapa <cpratapa@codeaurora.org>,
        Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200306042831.17827-1-elder@linaro.org>
 <20200306042831.17827-18-elder@linaro.org>
 <ec9776b3-ac79-8f9d-8c4d-012d62dc8f72@nvidia.com>
From:   Alex Elder <elder@linaro.org>
Message-ID: <4decbc8a-b0a6-8f10-b439-ade9008a4cff@linaro.org>
Date:   Wed, 11 Mar 2020 09:39:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ec9776b3-ac79-8f9d-8c4d-012d62dc8f72@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 3/11/20 5:49 AM, Jon Hunter wrote:
> 
> On 06/03/2020 04:28, Alex Elder wrote:
>> Add IPA-related nodes and definitions to "sdm845.dtsi".
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 51 ++++++++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index d42302b8889b..58fd1c611849 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -675,6 +675,17 @@
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
>>  		};
>> +
>> +		ipa_smp2p_out: ipa-ap-to-modem {
>> +			qcom,entry-name = "ipa";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		ipa_smp2p_in: ipa-modem-to-ap {
>> +			qcom,entry-name = "ipa";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>>  	};
>>  
>>  	smp2p-slpi {
>> @@ -1435,6 +1446,46 @@
>>  			};
>>  		};
>>  
>> +		ipa@1e40000 {
>> +			compatible = "qcom,sdm845-ipa";
>> +
>> +			modem-init;
>> +			modem-remoteproc = <&mss_pil>;
>> +
>> +			reg = <0 0x1e40000 0 0x7000>,
>> +			      <0 0x1e47000 0 0x2000>,
>> +			      <0 0x1e04000 0 0x2c000>;
>> +			reg-names = "ipa-reg",
>> +				    "ipa-shared",
>> +				    "gsi";
>> +
>> +			interrupts-extended =
>> +					<&intc 0 311 IRQ_TYPE_EDGE_RISING>,
>> +					<&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
>> +					<&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
>> +					<&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "ipa",
>> +					  "gsi",
>> +					  "ipa-clock-query",
>> +					  "ipa-setup-ready";
>> +
>> +			clocks = <&rpmhcc RPMH_IPA_CLK>;
>> +			clock-names = "core";
>> +
>> +			interconnects =
>> +				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_EBI1>,
>> +				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>,
>> +				<&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>;
>> +			interconnect-names = "memory",
>> +					     "imem",
>> +					     "config";
>> +
>> +			qcom,smem-states = <&ipa_smp2p_out 0>,
>> +					   <&ipa_smp2p_out 1>;
>> +			qcom,smem-state-names = "ipa-clock-enabled-valid",
>> +						"ipa-clock-enabled";
>> +		};
>> +
>>  		tcsr_mutex_regs: syscon@1f40000 {
>>  			compatible = "syscon";
>>  			reg = <0 0x01f40000 0 0x40000>;
>>
> 
> 
> This change is causing the following build error on today's -next ...
> 
>  DTC     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
>  arch/arm64/boot/dts/qcom/sdm845.dtsi:1710.15-1748.5: ERROR (phandle_references): /soc@0/ipa@1e40000: Reference to non-existent node or label "rsc_hlos"

This problem arises because a commit in the Qualcomm SoC tree affects
"arch/arm64/boot/dts/qcom/sdm845.dtsi", changing the interconnect provider
node(s) used by IPA:
  b303f9f0050b arm64: dts: sdm845: Redefine interconnect provider DT nodes

I will send out a patch today that updates the IPA node in "sdm845.dtsi"
to correct that.

In the mean time, David, perhaps you should revert this change in net-next:
  9cc5ae125f0e arm64: dts: sdm845: add IPA information
and let me work out fixing "sdm845.dtsi" with Andy and Bjorn in the
Qualcomm tree.

Thanks.

				-Alex

> Cheers
> Jon
> 

