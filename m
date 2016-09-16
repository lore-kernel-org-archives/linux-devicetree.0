From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/7] clocksource: exynos_mct: Add the support for ARM64
Date: Fri, 16 Sep 2016 13:10:48 +0200
Message-ID: <18cb09bb-7a03-df7f-706d-5309b34e222b@kernel.org>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-2-git-send-email-cw00.choi@samsung.com>
 <562e232f-7e69-6d54-e49d-36042d166800@linaro.org>
 <CGME20160916111052eucas1p1fb19531ab7b3e53f6fdeb4fa0e8a5449@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <562e232f-7e69-6d54-e49d-36042d166800@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krzk@kernel.org, jh80.chung@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, inki.dae@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@samsung.com, ideal.song@samsung.com, ingi2.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com, s.nawrocki@samsung.com, chanwoo@kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 09/08/2016 01:04 PM, Daniel Lezcano wrote:
> On 24/08/2016 15:49, Chanwoo Choi wrote:
>> This patch adds the support for ARM 64bit. The delay_timer is only supported
>> on ARM 32bit.
>>
>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Kukjin Kim <kgene@kernel.org>
>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
> 
> I don't really like #ifdef in the code itself but I suppose there is no
> much choice.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thanks, applied.
If needed, I can provide a stable tag to base on top of it.

Best regards,
Krzysztof
