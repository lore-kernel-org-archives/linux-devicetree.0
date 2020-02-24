Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34983C3567B
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 10:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B19120828
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 10:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="nJL1sWSL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgBXKhu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 05:37:50 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:40442 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727202AbgBXKhu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Feb 2020 05:37:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582540670; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qjzPp+O8tXzYCBRUzA0c7FdmKgMX92vvMqwCboWI5tU=; b=nJL1sWSL7cUjP+nUKOYVsPn7uFp8rVVOiCaf+53uzKvYgslaegh+q4n8mO65OWtorkaGYsWE
 +uhdrwW8Wi/UIV4V39ad1QDSzEUKNt3nIQOSqq6XjgTtTICUl9KrBam/1/bYo6x6yw02dgGJ
 7Vud7NPqLa26SHEWHI6mWjabyVA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e53a76e.7fd75365db58-smtp-out-n01;
 Mon, 24 Feb 2020 10:37:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB3A1C433A2; Mon, 24 Feb 2020 10:37:32 +0000 (UTC)
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C681C43383;
        Mon, 24 Feb 2020 10:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C681C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-soc-owner@vger.kernel.org
References: <1582049733-17050-1-git-send-email-tdas@codeaurora.org>
 <1582049733-17050-4-git-send-email-tdas@codeaurora.org>
 <20200218230026.GA3778@bogus>
 <6298769e-09bc-eb69-bf72-5aedd0e87f16@codeaurora.org>
 <7cf3950b53a7b5881c840ed371e64158@codeaurora.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <bee354db-23a0-3654-dc8b-a2487ef060d4@codeaurora.org>
Date:   Mon, 24 Feb 2020 16:07:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7cf3950b53a7b5881c840ed371e64158@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 2/20/2020 4:48 PM, Sibi Sankar wrote:
> Hey Taniya,
> 
> +    <&gcc GCC_MSS_NAV_AXIS_CLK>,
> 
> error is because of ^^ typo
> it should be GCC_MSS_NAV_AXI_CLK
> instead, with that dt_bindings
> check will go though.
> 
> 

Thanks Sibi for pointing the typo.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
