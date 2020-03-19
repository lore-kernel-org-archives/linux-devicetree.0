Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E6BC4332B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 08:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE0EF20724
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 08:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="GErH3qee"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgCSIdU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 04:33:20 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13871 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbgCSIdS (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Mar 2020 04:33:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584606797; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OROpbwz6Sl2/iofvDAbw1QWoGqGQL4/CHkBzZoLHDbc=; b=GErH3qeebyxNh9rSo2pQeLdSDxQQo9DbaTc5UsD2M5u1SI9JpS5LkmaL7VWG57weY25pQ22K
 vU4ueOxEhpzRzs95zL7gvYTreZoH0enwEPQgCDRY2LuKdnkp3aSuVJpb0UxeZcbaEVvD8FmI
 crfouNiIvCv4xp2Ix1nvIyswtiM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e732e3b.7f285d946ab0-smtp-out-n02;
 Thu, 19 Mar 2020 08:32:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CB449C43636; Thu, 19 Mar 2020 08:32:59 +0000 (UTC)
Received: from [192.168.0.103] (unknown [106.51.30.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11CA4C433CB;
        Thu, 19 Mar 2020 08:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11CA4C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: cpus: Add kryo468 compatible
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, sibis@codeaurora.org,
        swboyd@chromium.org, dianders@chromium.org
Cc:     devicetree@vger.kernel.org
References: <cd0f3d35ca0fc2944fd97e030a28318ff82dd5c1.1584516925.git.amit.kucheria@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <5bacd2ad-811f-103f-ac5c-fd91522df40d@codeaurora.org>
Date:   Thu, 19 Mar 2020 14:02:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cd0f3d35ca0fc2944fd97e030a28318ff82dd5c1.1584516925.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 3/18/2020 2:38 PM, Amit Kucheria wrote:
> Kryo468 is found in sc7180, so add it to the list of cpu compatibles
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

>   Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 7a9c3ce2dbef..57408c773b4d 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -156,6 +156,7 @@ properties:
>         - qcom,krait
>         - qcom,kryo
>         - qcom,kryo385
> +      - qcom,kryo468
>         - qcom,kryo485
>         - qcom,scorpion
>   
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
