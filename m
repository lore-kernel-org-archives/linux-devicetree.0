Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9A7C2D0F8
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 03:55:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 857CF205ED
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 03:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="ByUe69zA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgEMDz4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 23:55:56 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:51244 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727107AbgEMDzz (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 May 2020 23:55:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589342155; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=IgFKDSGjknGTNYONGt6w814LAjM7eJe3jLXGqPrlFK8=; b=ByUe69zAGDY2nqSu0/xfov94sCNsuhuNLvQw4PzF2a46TuXwMlYAqh+Y24zt/pYn91eHXqT5
 R7bpACelrjHUsv7KyVSEbEGjMaR7pWMEGsZKV81AYQoAVViHNXOOicJ1O/kgEZtHGhRlZXH5
 NtPTuCbWkSOtRcJEobm6ksCGhmg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebb6fb3.7fea8db43e68-smtp-out-n01;
 Wed, 13 May 2020 03:55:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7BCA3C433BA; Wed, 13 May 2020 03:55:30 +0000 (UTC)
Received: from [192.168.0.105] (unknown [49.207.133.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 996DCC433F2;
        Wed, 13 May 2020 03:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 996DCC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V4 8/8] arm64: dts: ipq6018: Add a53 pll and apcs clock
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-9-git-send-email-sivaprak@codeaurora.org>
 <20200512202439.GK2165@builder.lan>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <80039c21-41cf-2ace-939a-ef48fd773aa4@codeaurora.org>
Date:   Wed, 13 May 2020 09:25:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512202439.GK2165@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Bjorn,

On 5/13/2020 1:54 AM, Bjorn Andersson wrote:
> On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:
>
>> add support for apps pll and apcs clock.
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> index 1aa8d85..af2ceeb 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -294,12 +294,22 @@
>>   		};
>>   
>>   		apcs_glb: mailbox@b111000 {
>> -			compatible = "qcom,ipq8074-apcs-apps-global";
>> -			reg = <0x0b111000 0xc>;
>> -
>> +			compatible = "qcom,ipq6018-apcs-apps-global";
>> +			reg = <0x0b111000 0x1000>;
> My documentation states that IPQ8074 indeed has this block at
> 0x0b111000, but IPQ6018 it's at 0x6b111000. Can you confirm this is
> correct? Same with the pll below.
The address 0x6b111000 is how the RPM sees this block. For A53 it is 
still 0xb111000
>
> Apart from that the patch looks good.
>
> Regards,
> Bjorn
