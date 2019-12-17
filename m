Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D93C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 11:43:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0568420665
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 11:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbfLQLnH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 06:43:07 -0500
Received: from foss.arm.com ([217.140.110.172]:34038 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727621AbfLQLnA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Dec 2019 06:43:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66E831B;
        Tue, 17 Dec 2019 03:42:59 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8082C3F6CF;
        Tue, 17 Dec 2019 03:42:58 -0800 (PST)
Subject: Re: [PATCH v6 10/15] dt-bindings: qcom: Add CTI options for qcom
 msm8916
To:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, robh+dt@kernel.org,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org
References: <20191211230902.5414-1-mike.leach@linaro.org>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <12030924-d647-7c1b-bcc2-b3e5a2955722@arm.com>
Date:   Tue, 17 Dec 2019 11:42:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191211230902.5414-1-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 11/12/2019 23:09, Mike Leach wrote:
> Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
> (Dragonboard DB410C).
> System CTIs 2-11 are omitted as no information available at present.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
