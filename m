Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB8EC2BA15
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 16:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEDD4207FF
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 16:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="X0wCRK40"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgDCQ4t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 12:56:49 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:42622 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728377AbgDCQ4r (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 12:56:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585933007; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9GAbZWuPcTKjEXz3EeVxBNWDn+mYvVxInvRy5MFxrck=; b=X0wCRK40w6F9QsEX7g0BIUdYkcml2k5LCE/NUrCH9MiW/PfJyHisk3+PlaibfMqCcJ68j2Dw
 DLMPC8dDH3+lMyZpiONqKyuByVRBQ2hPIfE/C3Z92WdBmrA9sy2ca/F1YO81mwoDncB4mbx1
 AG9/tYMUASwRo0wEvKbzRiASad8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e876ac7.7fc470598378-smtp-out-n01;
 Fri, 03 Apr 2020 16:56:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 658F5C44791; Fri,  3 Apr 2020 16:56:39 +0000 (UTC)
Received: from [10.110.122.98] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 171CCC433D2;
        Fri,  3 Apr 2020 16:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 171CCC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v5 2/5] phy: qcom-snps: Add SNPS USB PHY driver for QCOM
 based SOCs
To:     Vinod Koul <vkoul@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1585880634-15222-1-git-send-email-wcheng@codeaurora.org>
 <1585880634-15222-3-git-send-email-wcheng@codeaurora.org>
 <20200403060127.GM72691@vkoul-mobl>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <91262538-6b1e-afd3-97f8-614bb4a54b5a@codeaurora.org>
Date:   Fri, 3 Apr 2020 09:56:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403060127.GM72691@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Vinod,

Thanks for the review, I'll address these in the next version.

On 4/2/2020 11:01 PM, Vinod Koul wrote:
> On 02-04-20, 19:23, Wesley Cheng wrote:
>> This adds the SNPS FemtoPHY V2 driver used in QCOM SOCs.  There
>> are potentially multiple instances of this UTMI PHY on the
>> SOC, all which can utilize this driver.  The V2 driver will
>> have a different register map compared to V1.
> 
> Some nitpicks below, otherwise:
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
>> +/**
>> + * struct qcom_snps_hsphy - structure holding snps hs phy attributes
>> + *
>> + * @phy: generic phy
>> + * @base: iomapped memory space for qubs2 phy
>> + *
>> + * @cfg_ahb_clk: AHB2PHY interface clock
>> + * @ref_clk: phy reference clock
>> + * @iface_clk: phy interface clock
>> + * @phy_reset: phy reset control
>> + * @vregs: regulator supplies bulk data
>> +
> 
> This is missing the marker * for kernel doc
> 
>> + * @phy_initialized: if PHY has been initialized correctly
>> + *
> 
> This empty line is redundant
> 
>> + */
>> +struct qcom_snps_hsphy {
>> +	struct phy *phy;
>> +	void __iomem *base;
>> +
>> +	struct clk *cfg_ahb_clk;
>> +	struct clk *ref_clk;
>> +	struct reset_control *phy_reset;
>> +	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
>> +
>> +	bool phy_initialized;
>> +};
>> +
>> +static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>> +				    u32 mask, u32 val)
> 
> coding style mandates that second line should start at preceeding line
> opening brace :), so can you please make it:
> 
> static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>                                               u32 mask, u32 val)
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
