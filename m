Return-Path: <SRS0=nhew=WC=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH V5 1/5] clocksource: imx-sysctr: Add internal clock
 divider handle
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
 <DB3PR0402MB3916B06E8907604A71169063F5D50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7edad4d7-5ba2-d710-eb8d-b3ff97051a41@linaro.org>
Date: Tue, 6 Aug 2019 12:27:51 +0200
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB3916B06E8907604A71169063F5D50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Anson Huang <anson.huang@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 06/08/2019 03:55, Anson Huang wrote:
> Gentle ping...

Coming back from vacation. It is in the pipe ... :)

>> From: Anson Huang <Anson.Huang@nxp.com>
>>
>> The system counter block guide states that the base clock is internally divided
>> by 3 before use, that means the clock input of system counter defined in DT
>> should be base clock which is normally from OSC, and then internally divided
>> by 3 before use.
>>
>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>> ---
>> Changes since V4:
>> 	- to solve the clock driver probed after system counter driver issue,
>> now we can easily switch to
>> 	  use fixed clock defined in DT and get its rate, then divided by 3 to
>> get real clock rate for
>> 	  system counter driver, no need to add "clock-frequency" property in
>> DT.
>> ---
>>  drivers/clocksource/timer-imx-sysctr.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/clocksource/timer-imx-sysctr.c
>> b/drivers/clocksource/timer-imx-sysctr.c
>> index fd7d680..b7c80a3 100644
>> --- a/drivers/clocksource/timer-imx-sysctr.c
>> +++ b/drivers/clocksource/timer-imx-sysctr.c
>> @@ -20,6 +20,8 @@
>>  #define SYS_CTR_EN		0x1
>>  #define SYS_CTR_IRQ_MASK	0x2
>>
>> +#define SYS_CTR_CLK_DIV		0x3
>> +
>>  static void __iomem *sys_ctr_base;
>>  static u32 cmpcr;
>>
>> @@ -134,6 +136,9 @@ static int __init sysctr_timer_init(struct device_node
>> *np)
>>  	if (ret)
>>  		return ret;
>>
>> +	/* system counter clock is divided by 3 internally */
>> +	to_sysctr.of_clk.rate /= SYS_CTR_CLK_DIV;
>> +
>>  	sys_ctr_base = timer_of_base(&to_sysctr);
>>  	cmpcr = readl(sys_ctr_base + CMPCR);
>>  	cmpcr &= ~SYS_CTR_EN;
>> --
>> 2.7.4
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
