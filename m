From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 6/6] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Wed, 13 Jan 2016 18:41:11 +0530
Message-ID: <56964CEF.3030900@nvidia.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com> <1452590273-16421-7-git-send-email-ldewangan@nvidia.com> <5695A854.60108@samsung.com> <5696378B.6070704@nvidia.com> <20160113115736.GJ6588@sirena.org.uk> <56963D8D.9060908@nvidia.com> <20160113123133.GK6588@sirena.org.uk> <5696451F.3000707@nvidia.com> <20160113130909.GL6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160113130909.GL6588@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 13 January 2016 06:39 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jan 13, 2016 at 06:07:51PM +0530, Laxman Dewangan wrote:
>> On Wednesday 13 January 2016 06:01 PM, Mark Brown wrote:
>>> What is FPS_SRC and why is it set from init_data?  A driver should never
>>> be looking at init_data.
>> When FPS_SRC is set to NONE (this is needed from platform data) then based
>> on constraint like boot enable/always enable, it need to be on desired
>> state. Otherwise we may endup with disabling the rail when setting to NONE
>> and create issue.
> What is "it" and why can't we check what the current configuration is
> while setting FPS to NONE?
I will have platform specific data in callback of enable/disable only.
Which call back do I need to set this? enable/disable or post register?

>> I need to set the FPS src properly for each rails before callback happen
>> from regulator init so that enable/disable/is_enable can handle it properly.
> Why not just reorder the callback so it happens before the constraints
> are applied?
>
which callback I need to reorder for getting the context for configruation?
