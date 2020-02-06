Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DBDC2D0B1
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 12:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C217214AF
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 12:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgBFMgB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 07:36:01 -0500
Received: from foss.arm.com ([217.140.110.172]:57882 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726687AbgBFMgB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 6 Feb 2020 07:36:01 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A7B630E;
        Thu,  6 Feb 2020 04:36:01 -0800 (PST)
Received: from [192.168.1.123] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03BE73F68E;
        Thu,  6 Feb 2020 04:35:59 -0800 (PST)
Subject: Re: [PATCH 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE control
 explicit
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, heiko@sntech.de, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, pgwipeout@gmail.com
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
 <20200206114606.GM3897@sirena.org.uk>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
Date:   Thu, 6 Feb 2020 12:36:04 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206114606.GM3897@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-02-06 11:46 am, Mark Brown wrote:
> On Thu, Feb 06, 2020 at 01:07:12AM +0000, Robin Murphy wrote:
>> The RK3328 reference design uses an external line driver IC as a buffer
>> on the analog codec output, enabled by the GPIO_MUTE pin, and such a
>> configuration is currently assumed in the codec driver's direct poking
>> of GRF_SOC_CON10 to control the GPIO_MUTE output value. However, some
> 
> This makes sense but it is an ABI break so is going to need
> quirking for existing boards that unfortunately rely on the
> existing behaviour.

Yeah, that's where it gets tricky - there doesn't seem to be a nice way 
to differentiate between "no GPIO because old DT" and "no GPIO because 
the enable is hard-wired/irrelevant and GPIO_MUTE doesn't do what you 
think it does", and it seems really improper to introduce a DT property 
for the sole purpose of telling a Linux driver not to assume something 
it shouldn't really have in the first place.

My opinion fell on the side of a minor ABI break being the lesser of two 
evils, given that the worst case once people start enabling this codec 
on Renegade/ROC-CC boards (which I was only anticipating, but have just 
discovered is happening already[1]) results in unexpectedly stuffing 
3.3V into the SD card and SoC I/O domain while both are in 1.8V mode, 
and that the change would only really affect one other current board 
(Rock64), where most mainline users are likely to be upgrading their DTB 
in lock-step with the kernel anyway.

I guess the existing (mis)behaviour could be predicated on an 
of_machine_is_compatible() check for Rock64 boards - it's ugly, but 
should do the job if you feel it's more important to be 100% strict 
about not regressing supported systems for any possible kernel/DTB 
combination.

Thanks,
Robin.

[1] 
https://github.com/armbian/build/commit/18b24717be9639b65b86db3dbcf2b42fe73ca12c
