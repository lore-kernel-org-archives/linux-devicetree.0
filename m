From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 01/12] ARM: dts: da850: fix interrupt numbers for
 clocksource
Date: Fri, 8 Feb 2019 18:39:07 +0530
Message-ID: <4325c375-0519-7775-e4a9-8bd70aa59f94@ti.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-2-brgl@bgdev.pl>
 <ce4c305e-7d76-6028-07e4-4922f3c700bf@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ce4c305e-7d76-6028-07e4-4922f3c700bf@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 05/02/19 6:48 AM, David Lechner wrote:
> On 2/4/19 11:17 AM, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> The timer interrupts specified in commit 3652e2741f42 ("ARM: dts:
>> da850: Add clocks") are wrong but since the current timer code
>> hard-codes them, the bug was never spotted.
>>
>> This patch must go into stable since, once we introduce a proper
>> clocksource driver, devices with buggy device tree will stop booting.
>>
>> Fixes: 3652e2741f42 ("ARM: dts: da850: Add clocks")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
> 
> Reviewed-by: David Lechner <david@lechnology.com>

This patch is already in ARM SoC. Should be soon in Linus's tree too.

https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/commit/?h=fixes&id=e3966a766865da7ced1dece663697861dd5cf103

Thanks,
Sekhar
