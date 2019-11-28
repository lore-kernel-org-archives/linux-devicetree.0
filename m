Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F2BC43215
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 10:54:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCCA621775
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 10:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfK1KyJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 05:54:09 -0500
Received: from foss.arm.com ([217.140.110.172]:33652 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfK1KyJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Nov 2019 05:54:09 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91CA61FB;
        Thu, 28 Nov 2019 02:54:08 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B60083F6C4;
        Thu, 28 Nov 2019 02:54:07 -0800 (PST)
Subject: Re: [PATCH v5 03/14] coresight: cti: Add sysfs access to program
 function regs
To:     Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-4-mike.leach@linaro.org>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <cc0eb144-48a2-bde5-4790-2fd5e1168360@arm.com>
Date:   Thu, 28 Nov 2019 10:54:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191119231912.12768-4-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/2019 23:19, Mike Leach wrote:
> Adds in sysfs programming support for the CTI function register sets.
> Allows direct manipulation of channel / trigger association registers.
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>


> +/*
> + * #define CTI_DEBUG_INTEGRATION_CTRL to enable the access to the integration
> + * control registers. Normally only used to investigate connection data.
> + */

On a second thought, I have some comments on this symbol.

Given that the integration control registers may be useful for people to
find the device connections, I strongly feel that this is provided
via a CONFIG symbol rather than a  debug symbol within the code.

i.e, CONFIG_CTI_DEBUG_INTEGRATION_CTRL, to help the people better.
Codewise this doesn't make much difference, but it certainly makes
it more easier for people to use it.

We have used debug symbols elsewhere in the drivers for pure functional
debugging purposes. However I feel this is case is superior.


Cheers
Suzuki
