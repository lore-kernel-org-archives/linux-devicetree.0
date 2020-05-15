Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AF9C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 15:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C31C7207C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 15:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgEOPOh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 11:14:37 -0400
Received: from foss.arm.com ([217.140.110.172]:57954 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726615AbgEOPOh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 May 2020 11:14:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 924242F;
        Fri, 15 May 2020 08:14:36 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 549BC3F71E;
        Fri, 15 May 2020 08:14:35 -0700 (PDT)
Subject: Re: [PATCH v3 16/20] arm64: dts: juno: Fix GPU interrupt order
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-17-andre.przywara@arm.com>
 <20200513182405.GE27686@bogus>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <a1dd3eda-fa8b-630a-a64c-479dcbd053ae@arm.com>
Date:   Fri, 15 May 2020 16:13:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513182405.GE27686@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 13/05/2020 19:24, Sudeep Holla wrote:

Hi,

> On Wed, May 13, 2020 at 11:30:12AM +0100, Andre Przywara wrote:
>> The Mali binding insists on the GPU interrupts to be in ordered as: job,
>> mmu, gpu.
>> Sort the GPU interrupts and interrupt-names properties accordingly.
>>
> 
> I assume this is not a bug fix, just clean up to make it 100% binding
> compliant. Things work just fine without this too. Just for my info.

Yes, that's true, it works either way right now.
Originally I was under the impression that the purpose of
interrupt-names was to allow any order of interrupts, but according to
Rob this is just to support optional IRQs (so having a shorter list).
The bindings require a certain order, and the dt-schema validation
complains if that differs in the DT.

Cheers,
Andre
