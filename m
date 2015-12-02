From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 11/19] ARM: dts: imx: replace legacy *,wakeup property
 with wakeup-source
Date: Wed, 2 Dec 2015 10:05:24 +0000
Message-ID: <565EC264.80902@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-12-git-send-email-sudeep.holla@arm.com>
 <20151123053705.GH13744@tiger> <5656EE1E.2030104@arm.com>
 <20151202015400.GB692@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151202015400.GB692@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org



On 02/12/15 01:54, Shawn Guo wrote:
> On Thu, Nov 26, 2015 at 11:33:50AM +0000, Sudeep Holla wrote:
>>
>>
>> On 23/11/15 05:37, Shawn Guo wrote:
>>> On Wed, Oct 21, 2015 at 11:10:08AM +0100, Sudeep Holla wrote:
>>>> Though the keyboard and other driver will continue to support the legacy
>>>> "gpio-key,wakeup", "linux,wakeup" boolean property to enable the wakeup
>>>> source, "wakeup-source" is the new standard binding.
>>>>
>>>> This patch replaces all the legacy wakeup properties with the unified
>>>> "wakeup-source" property in order to avoid any futher copy-paste
>>>> duplication.
>>>>
>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>> Cc: Sascha Hauer <kernel@pengutronix.de>
>>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>>>
>>> <snip>
>>>
>>>> diff --git a/arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi b/arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi
>>>> index 321662f53e33..16fc69c69ab2 100644
>>>> --- a/arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi
>>>> +++ b/arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi
>>>> @@ -156,7 +156,7 @@
>>>>   	pinctrl-names = "default";
>>>>   	pinctrl-0 = <&pinctrl_esdhc2>;
>>>>   	cap-sdio-irq;
>>>> -	enable-sdio-wakeup;
>>>> +	wakeup-source;
>>>
>>> I do not see this be mentioned in commit log.  I do not see relevant
>>> kernel changes in v4.4-rc1 to support that.  Am I missing anything?
>>>
>>
>> Sorry for that, you weren't copied on that patch[1], Ulf has queued it
>> now [2]
>
> My branch is based on v4.4-rc1 which doesn't have that patch.  That
> said, I can not apply it for now.
>

Ah OK, that's fine pick it up when appropriate. I just wanted to let you
know that dependent patch is already queued.

-- 
Regards,
Sudeep
