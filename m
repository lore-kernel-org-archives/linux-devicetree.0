From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V8 0/8] Add support for MAXIM MAX77620/MAX20024 PMIC
Date: Tue, 1 Mar 2016 17:04:16 +0530
Message-ID: <56D57E38.2060804@nvidia.com>
References: <1455191794-6065-1-git-send-email-ldewangan@nvidia.com> <20160216160029.GC11400@ulmo.nvidia.com> <56C7EE58.8000905@nvidia.com> <20160225161510.GB1903@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160225161510.GB1903@ulmo.nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, k.kozlowski@samsung.com
List-Id: devicetree@vger.kernel.org


On Thursday 25 February 2016 09:45 PM, Thierry Reding wrote:
> On Sat, Feb 20, 2016 at 10:10:56AM +0530, Laxman Dewangan wrote:
>> On Tuesday 16 February 2016 09:30 PM, Thierry Reding wrote:
>>> On Thu, Feb 11, 2016 at 05:26:26PM +0530, Laxman Dewangan wrote:
>>>> Add SW support for MAXIM Semiconductor's Power Management
>>>> IC (PMIC) MAX77620/MAX20024. This PMIC supports DC-DC/LDOS, GPIOs,
>>>> RTC, watchdog, clocks etc.
>>> Hi Laxman,
>>>
>>> This series is starting to look pretty good. Do you have patches in the
>>> works to add the corresponding DT content for the various boards that we
>>> support? I think the Jetson TX1 patch would be most interesting since
>>> that's what people can get their hands on.
>>>
>> Yes, I am just waiting for this series to be concluded and applied. Once it
>> is done, I will immediately post the patches to enable this driver in config
>> and dt entry for the Jetson-TX1.
> Why hold back on the patches? I'm currently having trouble testing
> your stash here on Jetson TX1 and I suspect that I'm using the wrong
> device tree content (it was derived from downstream many moons ago).
> There's nothing wrong with posting patches that depend on patches on
> the list. Typically you'd note the dependency in the cover letter to
> make it easier for people to find what belongs together.
>

OK, posted patches as:

[PATCH 2/2] arm64: tegra: Jetson-TX1: Add DT entry for system PMIC MAX77620
[PATCH 1/2] arm64: tegra: Add DT entry for keys used in Jetson-TX1
[PATCH 1/1] arm64: defconfig: Enable Maxim PMIC max77620 config

Currently, the execution is crashing with this series + above patches as 
MFD_CELLS are not correctly defined.
Discussion is going on with patch from Rhyland Klein
[PATCH] mfd: Fix MACRO for commonly declared MFD cell attributes

Once MFD_CELL defines get fixed, either series need to be revisit or 
automatically fix the issue.




