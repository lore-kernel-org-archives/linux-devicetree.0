Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4D9C10F29
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 12:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D347B2076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 12:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="GeVWRuLj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgCQMNV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 08:13:21 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:25778 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbgCQMNV (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Mar 2020 08:13:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584447201; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=a1YiAJpWf/Sf823hJI2HWkW5ILCzCOPKtuET3jua5IY=; b=GeVWRuLjsF4CkdqYW+lXsDzYTuYkzJb2TopRXzP893Ai5DmcvSin8cmCuvMnGNAwjjbiC6GP
 AUZaZIughubbRNaXypB0JFulde1RJ1p7Xsq7ihWK3IQzfzvPbzaN2VK0rLZ/P0iP5OGXeylw
 3q5tAf7nL0uhYjE4wS769zVN92I=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70bed6.7f4896cd1308-smtp-out-n01;
 Tue, 17 Mar 2020 12:13:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3ED21C432C2; Tue, 17 Mar 2020 12:13:10 +0000 (UTC)
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 680F7C433D2;
        Tue, 17 Mar 2020 12:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 680F7C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
 <20200314005817.GN144492@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
Date:   Tue, 17 Mar 2020 17:43:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200314005817.GN144492@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Matthias,

On 3/14/2020 6:28 AM, Matthias Kaehlcke wrote:
> Hi,
>
> On Fri, Mar 13, 2020 at 06:42:13PM +0530, Akash Asthana wrote:
>> Get the interconnect paths for QSPI device and vote according to the
>> current bus speed of the driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>>     path handle
>>   - As per Matthias comment, added error handling for icc_set_bw call
>>
>>   drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 45 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
>> index 3c4f83b..ad48f43 100644
>> --- a/drivers/spi/spi-qcom-qspi.c
>> +++ b/drivers/spi/spi-qcom-qspi.c
>> @@ -2,6 +2,7 @@
>>   // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>>   
>>   #include <linux/clk.h>
>> +#include <linux/interconnect.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/io.h>
>>   #include <linux/module.h>
>> @@ -139,7 +140,10 @@ struct qcom_qspi {
>>   	struct device *dev;
>>   	struct clk_bulk_data *clks;
>>   	struct qspi_xfer xfer;
>> -	/* Lock to protect xfer and IRQ accessed registers */
>> +	struct icc_path *icc_path_cpu_to_qspi;
>> +	unsigned int avg_bw_cpu;
>> +	unsigned int peak_bw_cpu;
> This triplet is a recurring pattern, and is probably not limited to geni SE/QSPI.
> On https://patchwork.kernel.org/patch/11436889/#23221925 I suggested the creation
> of a geni SE specific struct, however adding a generic convenience struct to
> 'linux/interconnect.h' might be the better solution:
>
> struct icc_client {
> 	struct icc_path *path;
> 	unsigned int avg_bw;
> 	unsigned int peak_bw;
> };
>
> I'm sure there are better names for it, but this would be the idea.

Yeah, I think introducing this to ICC header would be better solution.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
