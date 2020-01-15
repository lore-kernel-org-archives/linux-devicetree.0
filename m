Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0EEC33CB2
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 09:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F7802467A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 09:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729476AbgAOJml (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 04:42:41 -0500
Received: from foss.arm.com ([217.140.110.172]:33938 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729459AbgAOJml (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Jan 2020 04:42:41 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCB1631B;
        Wed, 15 Jan 2020 01:42:40 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 145DB3F6C4;
        Wed, 15 Jan 2020 01:42:38 -0800 (PST)
Subject: Re: [PATCH v8 04/15] coresight: cti: Add sysfs trigger / channel
 programming API
To:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, maxime@cerno.tech, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net
References: <20200113213149.25599-1-mike.leach@linaro.org>
 <20200113213149.25599-5-mike.leach@linaro.org>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <00236ff2-ea51-fa02-8286-b34376d55ed8@arm.com>
Date:   Wed, 15 Jan 2020 09:42:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113213149.25599-5-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 13/01/2020 21:31, Mike Leach wrote:
> Adds a user API to allow programming of CTI by trigger ID and
> channel number. This will take the channel and trigger ID supplied
> by the user and program the appropriate register values.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
