From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/8] ARM: dts: exynos: Fix watchdog reset on Exynos4412
Date: Mon, 13 Mar 2017 08:41:08 +0200
Message-ID: <CAJKOXPf7MDtg1KbtdBcvo78BihKPA3M6OhuEfMAfrhYGzrOZAA@mail.gmail.com>
References: <20170311172527.16368-1-krzk@kernel.org> <20170311172527.16368-4-krzk@kernel.org>
 <050544d8-5513-16b3-3d8f-117aa173226f@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <050544d8-5513-16b3-3d8f-117aa173226f@roeck-us.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 12, 2017 at 10:48 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 03/11/2017 09:25 AM, Krzysztof Kozlowski wrote:
>>
>> The Exynos4412 has the same watchdog as newer SoCs (e.g. Exynos5250).
>> Just like the others, for working it requires additional steps in Power
>> Management Unit: unmasking the reset request and enabling the system
>> reset.  Without these additional steps in PMU, the watchdog will not be
>> able to reset the system on expiration event.
>>
>> Change the compatible of Exynos4412 watchdog device node to
>> samsung,exynos5250-wdt which includes the additional PMU steps.
>>
>> This will also fix infinite watchdog interrupt in soft mode (lack of
>> interrupt clear) because it is also included in samsung,exynos5250-wdt.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> I assume this patch will be pushed through some arm tree.

Yes, I will take it through samsung-soc.

Best regards,
Krzysztof
