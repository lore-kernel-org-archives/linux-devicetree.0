From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 0/5] ARM: Exynos: Enable device tree support for MCT controller
Date: Sun, 30 Dec 2012 21:13:57 -0800
Message-ID: <CAJuYYwTrDXX3+A1WiSCq8f1Xu1J0kd3RsdyY0du-yJaHiveS1g@mail.gmail.com>
References: <1356814238-23895-1-git-send-email-thomas.abraham@linaro.org>
	<20121230052453.GA20903@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20121230052453.GA20903@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, chaos.youn@samsung.com, sylvester.nawrocki@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 29 December 2012 21:24, Olof Johansson <olof@lixom.net> wrote:
> On Sat, Dec 29, 2012 at 12:50:33PM -0800, Thomas Abraham wrote:
>> Changes since v2:
>> - Rebased to linux 3.8-rc1
>>
>> Changes since v1:
>> - Includes changes suggested by Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
>>
>> This patch series adds device tree support for Exynos4/5 MCT controller.
>> This patch series has been tested on Exynos4210 based Origen board, Exynos4412
>> based Origen board and Exynos5250 based SMDK board.
>
> Hi,
>
> Nice cleanups -- no specific comments on those at this time. But
> this is a good time to move the MCT driver out of arch/arm and into
> drivers/clocksource. Can you please do that in this series as well,
> please?

Hi Olof,

Ok. I will move the MCT diver to drivers/clocksource and repost this
series. Thanks for your suggestion.

Regards,
Thomas.

>
>
> Thanks,
>
> -Olof
