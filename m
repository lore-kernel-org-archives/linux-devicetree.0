From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 2/3] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Tue, 23 Apr 2013 22:56:13 +0900
Message-ID: <517692FD.9080005@samsung.com>
References: <1366036922-4103-1-git-send-email-t.figa@samsung.com> <1366036922-4103-3-git-send-email-t.figa@samsung.com> <201304222310.34775.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <201304222310.34775.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org
List-Id: devicetree@vger.kernel.org

On 04/23/13 06:10, Arnd Bergmann wrote:
> On Monday 15 April 2013, Tomasz Figa wrote:
>> This patch extends exynos_init_time() function to handle Exynos4210 rev0
>> SoC, which differs in availability of system timers and needs different
>> clocksource initialization.
>>
>> This makes it possible to use exynos_init_time() function as init_time
>> callback for all Exynos-based boards, including Universal_C210, which
>> originally had to use samsung_timer_init().
>>
>> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
>
> Acked-by: Arnd Bergmann<arnd@arndb.de>
>
> Note that it would be helpful to mention here that this is required for
> the calling samsung_timer_init from the exynos4-dt.c file.
>
I did 'amend' as per your suggestion and added your ack on this series.

Thanks.

- Kukjin
