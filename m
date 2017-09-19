From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 0/4] arm64: Add initial Actions Semi S700 and CubieBoard7
 support
Date: Tue, 19 Sep 2017 07:08:05 +0200
Message-ID: <0a3e9a40-cb67-d2b2-7f06-fa0f24a4fb42@suse.de>
References: <20170911022241.11603-1-afaerber@suse.de>
 <6beabaab-d95f-4ac9-96f1-7c1c98bd7811@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6beabaab-d95f-4ac9-96f1-7c1c98bd7811@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: Thomas Liau <thomas.liau@actions-semi.com>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf@actions-semi.com>, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, =?UTF-8?B?5byg5aSp55uK?= <tyzhang@actions-semi.com>, =?UTF-8?B?5qKF5Yip?= <harrymei@actions-semi.com>, support@cubietech.com, linux-kernel@vger.kernel.org, Ahha Lee <lee@cubietech.com>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am 18.09.2017 um 23:50 schrieb Daniel Lezcano:
> On 11/09/2017 04:22, Andreas Färber wrote:
>> Cc: devicetree@vger.kernel.org
>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>
>> Andreas Färber (4):
>>   dt-bindings: arm: actions: Add S700 and CubieBoard7
>>   dt-bindings: timer: Add Actions Semi S700
>>   clocksource: owl: Prepare S700
>>   arm64: dts: actions: Add S700 and CubieBoard7
>>
>>  Documentation/devicetree/bindings/arm/actions.txt  |  15 ++
>>  .../bindings/timer/actions,owl-timer.txt           |   1 +
> 
> Usually sub system maintainers are also Cc'ed with Dt bindings
> definitions and usage.

Your MAINTAINERS entry is lacking an entry for the bindings. Can you
please fix that in linux-next? Then the next patches should reach you.

Actually I'm even surprised that it works for the drivers - I would
expect a trailing "/" for the directory (see line 95ff).

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
