From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V8 0/8] Add support for MAXIM MAX77620/MAX20024 PMIC
Date: Sat, 20 Feb 2016 10:10:56 +0530
Message-ID: <56C7EE58.8000905@nvidia.com>
References: <1455191794-6065-1-git-send-email-ldewangan@nvidia.com> <20160216160029.GC11400@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160216160029.GC11400@ulmo.nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, k.kozlowski@samsung.com
List-Id: devicetree@vger.kernel.org


On Tuesday 16 February 2016 09:30 PM, Thierry Reding wrote:
> On Thu, Feb 11, 2016 at 05:26:26PM +0530, Laxman Dewangan wrote:
>> Add SW support for MAXIM Semiconductor's Power Management
>> IC (PMIC) MAX77620/MAX20024. This PMIC supports DC-DC/LDOS, GPIOs,
>> RTC, watchdog, clocks etc.
> Hi Laxman,
>
> This series is starting to look pretty good. Do you have patches in the
> works to add the corresponding DT content for the various boards that we
> support? I think the Jetson TX1 patch would be most interesting since
> that's what people can get their hands on.
>

Yes, I am just waiting for this series to be concluded and applied. Once 
it is done, I will immediately post the patches to enable this driver in 
config and dt entry for the Jetson-TX1.

