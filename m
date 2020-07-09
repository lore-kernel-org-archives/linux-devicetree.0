Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E2FC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D52DC2074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="LUdZOVDl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGIKHA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:07:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37818 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgGIKG6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 06:06:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594289218; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SN9DQ+QBBeWj7EmgAR6uveFVP41a+vYgqlb4wBPMxK0=; b=LUdZOVDltghPwXL0BiFQLQZZixUwmD06/Q9gNVLuc6rPGEDyRQCI21vIwZLBskehkOr99ZnA
 57fuDry1nmZQEjk63IBh2xKul7entM9ZUN0h58W++utAtZHEAVtMflxpbEwvkJzgyi9BhSQt
 +csyzmHSyaEauRQ7eLSbNV4n/x0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f06ec2919b27ae9cea5e30a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 10:06:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65E8CC43391; Thu,  9 Jul 2020 10:06:32 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F15CC433C6;
        Thu,  9 Jul 2020 10:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F15CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v3 4/8] include: dt-bindings: sound: Add sc7180-lpass
 bindings header
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org,
        plai@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
        robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        srinivas.kandagatla@linaro.org, Ajit Pandey <ajitp@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-5-git-send-email-rohitkr@codeaurora.org>
 <20200708144528.GT4655@sirena.org.uk>
From:   Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <29d000ad-cea9-8cee-85f4-5a99a49c00c1@codeaurora.org>
Date:   Thu, 9 Jul 2020 15:36:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708144528.GT4655@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On 7/8/2020 8:15 PM, Mark Brown wrote:
> On Wed, Jul 08, 2020 at 10:38:12AM +0530, Rohit kumar wrote:
>> From: Ajit Pandey <ajitp@codeaurora.org>
>>
>> Add header defining dai-id and mclk id for SC7180 lpass soc.
>>
>> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
>> ---
> This one is missing a signoff as well, and I can't seem to see any
> reference to this header in the bindings document patches?

Thanks Mark for reviewing. I will add it documentation in next patchset.

Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

