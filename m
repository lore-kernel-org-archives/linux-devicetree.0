From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V7 2/8] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Mon, 1 Feb 2016 14:01:18 +0530
Message-ID: <56AF17D6.2090106@nvidia.com>
References: <201601310157.sKXyINX7%fengguang.wu@intel.com> <56ACEEE1.1050800@nvidia.com> <20160201082553.GW3368@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160201082553.GW3368@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, vreddytalla@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Monday 01 February 2016 01:55 PM, Lee Jones wrote:
> On Sat, 30 Jan 2016, Laxman Dewangan wrote:
>
>> This depends on patch
>> [PATCH V2] mfd: core: add macro for adding mfd cells
>>
>> and due to absence of this patch, it reports the error.
> If you have dependencies, why aren't they in this set?
>

This change is not related to the series as such and so independent.
I just thought that mentioning on commit log will be fine here. May be I 
missed some points here.

Let me know if I need to add this to back on series.

Thanks,
Laxman

