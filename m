From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 6/6] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Wed, 13 Jan 2016 17:35:33 +0530
Message-ID: <56963D8D.9060908@nvidia.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com> <1452590273-16421-7-git-send-email-ldewangan@nvidia.com> <5695A854.60108@samsung.com> <5696378B.6070704@nvidia.com> <20160113115736.GJ6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160113115736.GJ6588@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 13 January 2016 05:27 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jan 13, 2016 at 05:09:55PM +0530, Laxman Dewangan wrote:
>
>> Yaah, this is something new and I think Mark also wanted to do this cleanup
>> on his comment. I did not understand it previously. Looks cool now.
> I did, please don't just ignore review comments.
Sure, I respect all comments and thanks for review.
Seems your mail got lost somewhere (still not seeing in my inbox).

>
>> However, I have requirement to configure PMIC with some inital setting based
>> on init_data (parsed) before regulator registration happened. Once I move to
>> this new mecahinsm, the inti_data parsing and regulator init happen in the
>> same function. So I need to have one callback from regulator_register to
>> driver.
>> Something below. This will do the pre configuration before
>> regulator_register happena dn machine constraint sets.
>> I can not use the init_data->regulator_init() as I need to have the init
>> data passed to the driver.
> Why do you have this requirement?

This is require to
- configure FPS_SRC based on platform data for each rail,
     - If FPS_SRC enabled then enable it always.
     - If FPS_SRC is disabled (NONE) then based on init data constraint,
       set it to desired state.
- Power mode and slew rate init based on default configuration from the 
register if platform does not want to set it.


