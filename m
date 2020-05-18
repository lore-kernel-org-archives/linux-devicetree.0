Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8291CC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 09:48:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69F2920709
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 09:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgERJsJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 05:48:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:55876 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbgERJsI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 May 2020 05:48:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 655B2AA6F;
        Mon, 18 May 2020 09:48:10 +0000 (UTC)
Subject: Re: [PATCH v1 8/9] arm64: dts: actions: Add MMC controller support
 for S700
To:     =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Amit Tomer <amittomer25@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, cristian.ciocaltea@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
 <1589472657-3930-9-git-send-email-amittomer25@gmail.com>
 <b2ad8a81-619f-5f35-9596-c2061ae15e4c@arm.com>
 <CABHD4K9yjUGuo0w-RfhdZQJm3Wtj6bU2H4DXcp4Jjp=e0fFeyA@mail.gmail.com>
 <2cd3cdaf-826e-9d12-9fd4-9f7e2a517ecd@arm.com>
 <CABHD4K-OaQ4Vf_+dg9FMR97ocLeUkDswyEnChPV=H=VcbyUhkg@mail.gmail.com>
 <abbef32c-84d2-7dac-c667-49610d014710@arm.com>
 <CABHD4K-MHs4jhL_9otJJ_xjC1uv1N20mnHqT39b2kob7WjZcVQ@mail.gmail.com>
 <20200518061755.GA25113@mani> <29500523-0fe4-955d-57de-d4b9f11cedb8@arm.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <fceaf802-5923-1be3-d582-59465c6e7369@suse.de>
Date:   Mon, 18 May 2020 11:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <29500523-0fe4-955d-57de-d4b9f11cedb8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

Am 18.05.20 um 10:29 schrieb André Przywara:
> On 18/05/2020 07:17, Manivannan Sadhasivam wrote:
>> I don't know if the DT fallback is discouraged or not.
> 
> I don't know if there is an "official" statement on this, but last thing
> I heard, adding SoC specific compatibles to generic fallback strings was
> encouraged. Hence my proposal, to add one.

I believe the official guidance would be to never be too generic in the 
first place. I.e., prefer s500 (oldest model tested) over generic owl.

But now that we have it, prepending a more specific one (rather than 
replacing it) is the only way to go. In that case the binding needs to 
be changed to allow both the old and the recommended new variant, as 
André points out. Please add a comment to help bindings readers choose 
which of the two to adopt then.

Amit, next time please quote errors you see right away, that could've 
spared a handful of messages discussing about the driver when it was in 
fact just a bindings issue (which you had been asked to fix by André).

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
