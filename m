From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 5/6] rtc: max77xxx: add RTC driver for Maxim MAX77xxx
 series RTC IP
Date: Mon, 18 Jan 2016 13:23:26 +0900
Message-ID: <569C68BE.3030804@samsung.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-6-git-send-email-ldewangan@nvidia.com>
 <569594F0.4020007@samsung.com> <5695CD73.5010709@nvidia.com>
 <5695D268.3060705@samsung.com> <5695D1AF.9000806@nvidia.com>
 <5696665A.5030508@nvidia.com> <5696F0C4.1060904@samsung.com>
 <5696F7F8.108@samsung.com> <20160114142048.GS6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <20160114142048.GS6588@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org

On 14.01.2016 23:20, Mark Brown wrote:
> On Thu, Jan 14, 2016 at 10:20:56AM +0900, Krzysztof Kozlowski wrote:
> 
>> 2. It has different register address.
>>    We need a register-layout/configuration structure. The logic is the
>> same except few differences (e.g. presence of MAX77802_RTC_AE1).
> 
> Depending on what the differences are either just some variables in the
> driver data that get set on probe with the different registers (if it's
> just the register) or using regmap_field (if things get shifted as well,
> or if it happens to make more sense) should work.

Thanks for the hints!

The addresses for registers are indeed shifted. It is non-linear because
apart of different offset at beginning, a new field appears. Anyway it
would be good for me (or other person doing this work) to get more
knowledge of what regmap API provides.

Best regards,
Krzysztof


