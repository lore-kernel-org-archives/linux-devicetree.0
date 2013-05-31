From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v2 0/3] Add DP related DT and Display-timing Node to
 exynos5250 based Arndale Board
Date: Fri, 31 May 2013 08:36:53 +0530
Message-ID: <CAD025yQ_WKdJzDTpWCdFK1BVqGLw3AQFgL6b-pKq_CcV69zD7g@mail.gmail.com>
References: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org> <019801ce5d97$7cdac500$76904f00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <019801ce5d97$7cdac500$76904f00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, jg1.han@samsung.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Thanks Mr. Kim

On 31 May 2013 06:10, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Vikas Sajjan wrote:
>>
>> This patch series adds support for DP on Exynos5250 based Arndale Board
>>
>> changes since v1:
>>       - moved display-timimg node inside fimd DT node as suggested by
>>       Steffen Trumtrar s.trumtrar@pengutronix.de
>>
>> Is based on branch "for-next"
>> http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>
>>
>> Vikas Sajjan (3):
>>   ARM: dts: Add DT node for DP controller for Arndale Board
>>   ARM: dts: Add clock provider information for DP controller in
>>     Exynos5250 SoC
>>   ARM: dts: Add display timing node to exynos5250-arndale.dts
>>
>>  arch/arm/boot/dts/exynos5250-arndale.dts |   28
>> ++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5250.dtsi        |    2 ++
>>  2 files changed, 30 insertions(+)
>>
> Looks good to me, applied.
>
> Thanks.
>
> - Kukjin
>



-- 
Thanks and Regards
 Vikas Sajjan
