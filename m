From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 6/6] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Wed, 13 Jan 2016 20:12:10 +0530
Message-ID: <56966242.4080601@nvidia.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com> <1452590273-16421-7-git-send-email-ldewangan@nvidia.com> <5695A854.60108@samsung.com> <5696378B.6070704@nvidia.com> <20160113115736.GJ6588@sirena.org.uk> <56963D8D.9060908@nvidia.com> <20160113123133.GK6588@sirena.org.uk> <5696451F.3000707@nvidia.com> <20160113130909.GL6588@sirena.org.uk> <56964CEF.3030900@nvidia.com> <20160113142023.GM6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160113142023.GM6588@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 13 January 2016 07:50 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jan 13, 2016 at 06:41:11PM +0530, Laxman Dewangan wrote:
>> On Wednesday 13 January 2016 06:39 PM, Mark Brown wrote:
>>> What is "it" and why can't we check what the current configuration is
>>> while setting FPS to NONE?
>> I will have platform specific data in callback of enable/disable only.
>> Which call back do I need to set this? enable/disable or post register?
> I'm sorry but I can't parse what you're saying here.
Here, before machine constraint applies, I need to configure FPS on 
desired source.
>>>> I need to set the FPS src properly for each rails before callback happen
>>> >from regulator init so that enable/disable/is_enable can handle it properly.
>>> Why not just reorder the callback so it happens before the constraints
>>> are applied?
>> which callback I need to reorder for getting the context for configruation?
> The existing call to parse the DT.

Are we allow to do i2c transfer in the existing callback for parsing the DT?
By code, nothing is stopping but want to know if there is such 
limitation on policy/design of this API.
