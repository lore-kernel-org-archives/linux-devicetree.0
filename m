From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] clk: max77620: Add clock driver for MAX77620/MAX20024
Date: Fri, 10 Jun 2016 18:43:52 +0530
Message-ID: <575ABD10.60208@nvidia.com>
References: <1465553536-23838-1-git-send-email-ldewangan@nvidia.com>	<1465553536-23838-2-git-send-email-ldewangan@nvidia.com> <CABxcv=mrmN5Mzt595ZFgGbOoHJWQMwQ1wiCvcHEiWh_79EbJqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABxcv=mrmN5Mzt595ZFgGbOoHJWQMwQ1wiCvcHEiWh_79EbJqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Friday 10 June 2016 06:50 PM, Javier Martinez Canillas wrote:
> Hello Laxman,
>
> On Fri, Jun 10, 2016 at 6:12 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> MAXIM MAX77620 is the power management IC with multiple DCDC/LDO(
>> regulators, RTC, GPIOs, Watchdog, 32KHz clock source etc.
>>
>> Add support for controlling the 32KHz clock source via clock
>> framework.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> ---
> It looks very similar to the max77686 and max77802 drivers (with only
> the difference in number of clock outputs), can you use the helpers in
> drivers/clk/clk-max-gen.c ?

I have explored that option.

The bit location for clock bit on register are same in case of max77686 
and max77802 but it is different for the max77620.

So until I change it too generic, it will not be possible.
Also if it is require then what about all max77686/max77802 and max77620 
in single file, the way we did for RTC.
We dont need 4 files for the similar driver then.
