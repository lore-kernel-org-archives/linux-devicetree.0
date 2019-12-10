Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C568C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 11:48:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F025720828
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 11:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbfLJLsl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 06:48:41 -0500
Received: from foss.arm.com ([217.140.110.172]:41164 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727219AbfLJLsj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 06:48:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF9A1FB;
        Tue, 10 Dec 2019 03:48:39 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E9073F6CF;
        Tue, 10 Dec 2019 03:48:38 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: allwinner: a64: set GPU clock to 432 MHz
To:     Maxime Ripard <mripard@kernel.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        arm-linux <linux-arm-kernel@lists.infradead.org>
References: <20191203021420.164129-1-anarsoul@gmail.com>
 <20191209193112.qr6un5ryhyxwu6a5@hendrix.lan>
 <CA+E=qVcxXu4CggnhZFti-J4MB5m3pvoxKCHnH6ap-4OSZMzCFQ@mail.gmail.com>
 <20191210083315.gixyhp2a4pg7oi7z@gilmour.lan>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <72b49266-fd4b-13ea-3126-e9d2d1037f2e@arm.com>
Date:   Tue, 10 Dec 2019 11:48:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191210083315.gixyhp2a4pg7oi7z@gilmour.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 10/12/2019 8:33 am, Maxime Ripard wrote:
> On Mon, Dec 09, 2019 at 12:23:18PM -0800, Vasily Khoruzhick wrote:
>> On Mon, Dec 9, 2019 at 12:03 PM Maxime Ripard <mripard@kernel.org> wrote:
>>> On Mon, Dec 02, 2019 at 06:14:20PM -0800, Vasily Khoruzhick wrote:
>>>> That's what BSP kernel sets it to and it seems to work fine.
>>>>
>>>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>>>> ---
>>>>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> index 27e48234f1c2..0051f39b3d98 100644
>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> @@ -976,6 +976,9 @@ mali: gpu@1c40000 {
>>>>                        clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
>>>>                        clock-names = "bus", "core";
>>>>                        resets = <&ccu RST_BUS_GPU>;
>>>> +
>>>> +                     assigned-clocks = <&ccu CLK_GPU>;
>>>> +                     assigned-clock-rates = <432000000>;
>>>>                };
>>>
>>> This doesn't really guarantee anything. If the GPU needs to remain at
>>> that rate, it should be set in the driver. I just saw that you did
>>> send a PR in github, I just merged it.
>>
>> Lima doesn't set GPU frequency at all since it's different for
>> different SoCs and we don't support operation points nor frequency
>> scaling yet.
> 
> You don't really need frequency scaling though, you just need to set
> it to any of the OPP. And if that's still too complicated, the binding
> mandates to associate a vendor compatible, so you can base the
> information on that.

Right, even just wiring up minimal OPP support with the userspace 
governor would be really useful for SoCs like RK3328, where the GPU PLL 
defaults to something pathetic, but the most useful upper frequencies 
typically require regulator adjustment as well.

Robin.

>> So this change effectively sets GPU frequency to 432MHz on A64 when
>> using lima.
> 
> Right before the driver is probed. For all you now, that frequency can
> be changed to anything else at the very next operation and you'd end
> up in the exact same situation than the one you're trying to fix.
> 
> Maxime
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
