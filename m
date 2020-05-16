Return-Path: <SRS0=eLFl=66=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0785C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 May 2020 18:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8382020657
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 May 2020 18:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="rx9FBAhg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgEPSGu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 16 May 2020 14:06:50 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21326 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726263AbgEPSGu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 16 May 2020 14:06:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589652409; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: From: References: Cc: To: Subject:
 Sender; bh=PUhHaL8byAHsraSTMCjlU45f45jhPMUm8voesvF7xDo=; b=rx9FBAhgBHukgzNIJG6dQUSSFYt8xqGO779hca4Yz68UQVZ0to5ylA5P/A/wMKdMu1j7vu4j
 1cMNXOxHQl8PQSr9GGP9rIPH24Ff6OxiVEi9YrAQubKWgCF9fYeX7z3CwJzMah/ffXMI0UFm
 mzEwVzDt5r9/N7TIUQ7wFP1Ev68=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec02ba8.7f371f0c61f0-smtp-out-n02;
 Sat, 16 May 2020 18:06:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E4A51C43637; Sat, 16 May 2020 18:06:31 +0000 (UTC)
Received: from [10.86.13.83] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ajitp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FF84C433D2;
        Sat, 16 May 2020 18:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FF84C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ajitp@codeaurora.org
Subject: Re: [PATCH v2 2/7] ASoC: qcom: Add common array to initialize soc
 based core clocks
To:     Mark Brown <broonie@kernel.org>
Cc:     plai@codeaurora.org, bgoswami@codeaurora.org,
        srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: =?UTF-8?Q?=3c=1c1586592171-31644-1-git-send-email-ajitp=40codeau?=
 =?UTF-8?Q?rora=2eorg=ef=bf=bd=3e_=3c1589474298-29437-1-git-send-email-ajitp?=
 =?UTF-8?Q?=40codeaurora=2eorg=3e_=3c1589474298-29437-4-git-send-email-ajitp?=
 =?UTF-8?Q?=40codeaurora=2eorg=3e_=3c20200514164532=2eGK5127=40sirena=2eorg?=
 =?UTF-8?Q?=2euk=3e?=
From:   Ajit Pandey <ajitp@codeaurora.org>
Message-ID: <1d47fad3-54bc-1b95-8608-d5846e4b9c83@codeaurora.org>
Date:   Sat, 16 May 2020 23:36:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 5/14/2020 10:15 PM, Mark Brown wrote:
> On Thu, May 14, 2020 at 10:08:14PM +0530, Ajit Pandey wrote:
>> AHB-I/X bus clocks inside LPASS coreis not a mandatory clocks for
>> SC7180 soc lpass variants, hence make it an optional one.
> Do we need to improve the checks in the rest of the code so that if the
> clock is missing on a SoC where it is actually mandatory we don't end up
> trying to start without it?  Perhaps it's more trouble than it's worth
> though.
> Agreed.. adding a case check with soc id or name definately make sense 
> to avoid issue with soc where it's  a mandatory one, I'll also look if 
> this "ahbix-clk" can also be moved with other soc-based clocks array ? 
> and can be enabled in soc specific driver.
