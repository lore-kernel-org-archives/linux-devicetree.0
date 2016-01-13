From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 5/6] rtc: max77xxx: add RTC driver for Maxim MAX77xxx
 series RTC IP
Date: Wed, 13 Jan 2016 09:55:19 +0530
Message-ID: <5695D1AF.9000806@nvidia.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com> <1452590273-16421-6-git-send-email-ldewangan@nvidia.com> <569594F0.4020007@samsung.com> <5695CD73.5010709@nvidia.com> <5695D268.3060705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5695D268.3060705@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org


On Wednesday 13 January 2016 09:58 AM, Krzysztof Kozlowski wrote:
> On 13.01.2016 13:07, Laxman Dewangan wrote:
>> On Wednesday 13 January 2016 05:36 AM, Krzysztof Kozlowski wrote:
>
>> That is also fine to me but still I am not comfortable with the config
>> name and driver file name as this does not suggest the common.
> The name does not matter. Really. We have a lot of drivers with a
> specific device-like name and supporting different devices. To point
> that your argument is invalid - your initial name of driver
> "rtc-max77620.c" supported totally different "names": the max77620 and
> max20024. It also wasn't suggesting something "common"...
In all config string, I have mentioned the MAX20024.


> With my approach we are not developing common think neither. We just
> want to extend/re-use existing max77686 (or max77802) driver for new
> devices. Just like everywhere else.

OK, fine to me if this is acceptable.
I will drop this rtc patch form this series and work in max77686 driver 
to modify first and once merged, use this config on my defconfig.
