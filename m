Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03FDC433F1
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:09:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B530622206
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 11:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="OhwfK1gq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgGNLJw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 07:09:52 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:62493 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727118AbgGNLJv (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jul 2020 07:09:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594724991; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=063nsZA+TEvD+EIhBzADv1QQAX7cmYzUzYelnNmmLWM=;
 b=OhwfK1gqAnjBduKkjVAl++804ImaclPMhQDvABDPsbvlW2orBn1tqJWmhRtatlBKjhi8bI53
 LYJwiKzSHK2bE/GrzdQuyx4UKzx7njXQ0nmFTIkZLFwsFG2Vh69SYRVOe0W9bBXKjHx9CjjE
 4RkhFjHZ1EsJVqxT3ZlfIjEgPsc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f0d927e1e603dbb44cdf4fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 11:09:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4CDEC433C8; Tue, 14 Jul 2020 11:09:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B25B1C433CA;
        Tue, 14 Jul 2020 11:09:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 14 Jul 2020 16:39:47 +0530
From:   kalyan_t@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v1] drm/msm/dpu: add support for clk and bw scaling for display
In-Reply-To: <20200714011219.GQ3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
 <20200714011219.GQ3191083@google.com>
Message-ID: <38dc4bbfd754175e476252c4bc259d55@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-07-14 06:42, Matthias Kaehlcke wrote:
> On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
>> This change adds support to scale src clk and bandwidth as
>> per composition requirements.
>> 
>> Interconnect registration for bw has been moved to mdp
>> device node from mdss to facilitate the scaling.
>> 
>> Changes in v1:
>>  - Address armv7 compilation issues with the patch (Rob)
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> 
> It seems this is an evolution of this series:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351
> 
> Are the DT bits of the series still valid? If so please include them in 
> the
> series, otherwise please add DT patches to allow folks to test and 
> review,
> and get them landed in Bjorn's tree after the driver changes have 
> landed.

Hi,

Yes the patch is dependent on the DT changes, should i add them with 
depends tag in the commit text ?
https://patchwork.kernel.org/patch/11470785/
https://patchwork.kernel.org/patch/11470789/

- Kalyan
