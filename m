Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83024C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 11:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6363820679
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 11:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgFCLVb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 07:21:31 -0400
Received: from foss.arm.com ([217.140.110.172]:60102 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgFCLVa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 3 Jun 2020 07:21:30 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6916531B;
        Wed,  3 Jun 2020 04:21:29 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43F343F305;
        Wed,  3 Jun 2020 04:21:28 -0700 (PDT)
Subject: Re: [PATCH v3 04/20] arm64: dts: arm: vexpress: Move fixed devices
 out of bus node
To:     Rob Herring <robh@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-5-andre.przywara@arm.com>
 <20200528024810.GA232303@roeck-us.net>
 <48afb8bb-a22a-54df-7751-55b7b84c3c88@arm.com>
 <22687572-becf-7b4e-9759-cfba44677a1d@arm.com>
 <CAL_JsqLgNDd-+rrYD=Y0Hm=NaV7f0NbBFb9uhhYhzM6LjxnXZg@mail.gmail.com>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <1d111f40-1702-7ea0-825f-ab08d77353e9@arm.com>
Date:   Wed, 3 Jun 2020 12:20:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLgNDd-+rrYD=Y0Hm=NaV7f0NbBFb9uhhYhzM6LjxnXZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 02/06/2020 00:12, Rob Herring wrote:

Hi,

> On Mon, Jun 1, 2020 at 4:15 AM André Przywara <andre.przywara@arm.com> wrote:
>>
>> On 28/05/2020 14:30, André Przywara wrote:
>>
>> Hi,
>>
>>> On 28/05/2020 03:48, Guenter Roeck wrote:
>>>
>>> Hi Guenter,
>>>
>>>> On Wed, May 13, 2020 at 11:30:00AM +0100, Andre Przywara wrote:
>>>>> The devicetree compiler complains when DT nodes without a reg property
>>>>> live inside a (simple) bus node:
>>>>> Warning (simple_bus_reg): Node /bus@8000000/motherboard-bus/refclk32khz
>>>>>                           missing or empty reg/ranges property
>>>>>
>>>>> Move the fixed clocks, the fixed regulator, the leds and the config bus
>>>>> subtree to the root node, since they do not depend on any busses.
>>>>>
>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>
>>>> This patch results in tracebacks when booting the vexpress-a15 machine
>>>> with vexpress-v2p-ca15-tc1 devicetree file in qemu. Reverting it as well
>>>> as the subsequent patches affecting the same file (to avoid revert
>>>> conflicts) fixes the problem.
>>>
>>> Many thanks for the heads up! I was able to reproduce it here. On the
>>> first glance it looks like the UART is probed before the clocks now,
>>> because the traversal of the changed DT leads to a different probe
>>> order. I will look into how to fix this.
>>
>> Turned out to be a bit more complicated:
>> The arm,vexpress,config-bus driver walks up the device tree to find a
>> arm,vexpress,site property [1]. With this patch the first parent node
>> with that property it finds is now the root node, with the wrong site ID
>> (0xf instead of 0x0). So it queries the wrong clocks (those IDs are
>> actually reserved there), and QEMU reports back "0", consequently [2].
>> Finding a clock frequency in the range of [0, 0] won't get very far.
>>
>> Possible solutions are:
>> 1) Just keep the mcc and its children at where it is in mainline right
>> now, so *partly* reverting this patch. This has the problem of still
>> producing a dtc warning, so kind of defeats the purpose of this patch.
>>
>> 2) Add a "arm,vexpress,site = <0>;" line to the "mcc" node itself.
>> Works, but looks somewhat dodgy, as the mcc node should really be a
>> child of the motherboard node, and we should not hack around this.
>>
>> 3) Dig deeper and fix the DT in a way that makes dtc happy. Might
>> involve (dummy?) ranges or reg properties. My gut feeling is that
>> arm,vexpress-sysreg,func should really have been "reg" in the first
>> place, but that's too late to change now, anyway.
>>
>> I will post 2) as a fix if 3) turns out to be not feasible.
> 
> I would just do 1).
> 
> To some extent, the warnings are for avoiding poor design on new
> bindings. We need a way to distinguish between existing boards and new
> ones. Maybe dts needs to learn some warning disable annotations or we
> need per target warning settings (DTC_FLAGS_foo.dtb ?). Or maybe this
> check is just too strict.

So I was always wondering about this check, actually. A simple-bus
describes a bus which is mapped into the CPU address space (in contrast
to say an I2C bus, for instance). So children of this bus node typically
have a reg property.

Now also those simple-bus nodes seem to be used to logically group
hardware in a DT (see this "motherboard" node here). *If* we go with
this, we should also allow other subnodes, for instance fixed-clocks:
after all there is probably an actual fixed crystal oscillator on the
motherboard, so it would also belong in there.
I see that (ab)using simple-bus for *just* grouping nodes is probably
not a good design, but I don't see why *every* child must be mapped into
the address space.

Maybe dtc's simple-bus check should indeed be relaxed, to just require
*at least one* child with a reg or ranges property, but also allow other
nodes?

Cheers,
Andre
