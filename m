From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH 3/3] arm64: dts: imx8mq: Add system counter node
Date: Sun, 23 Jun 2019 13:20:40 +0200
Message-ID: <8a887fee-54e7-16ac-6373-a693ec7ad944@posteo.de>
References: <20190621082838.12630-1-Anson.Huang@nxp.com>
 <20190621082838.12630-3-Anson.Huang@nxp.com>
 <6c632476-9ecd-d6cc-b543-a28576c06a0c@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6c632476-9ecd-d6cc-b543-a28576c06a0c@posteo.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, l.stach@pengutronix.de, abel.vesa@nxp.com, ccaione@baylibre.com, angus@akkea.ca, andrew.smirnov@gmail.com, agx@sigxcpu.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 22.06.19 16:16, Martin Kepplinger wrote:
> On 21.06.19 10:28, Anson.Huang@nxp.com wrote:
>> From: Anson Huang <Anson.Huang@nxp.com>
>>
>> Add i.MX8MQ system counter node to enable timer-imx-sysctr
>> broadcast timer driver.
> 
> with these changes and TIMER_IMX_SYS_CTR selected, I don't see cpuidle
> working yet (which is what I want to achieve on imx8mq). Might there be
> a system counter clock definition or anything else missing?
> 

To be clear about what I tried running: Abel's wakeup-workaround (with
the corresponding ATF changes): https://lkml.org/lkml/2019/6/10/350 plus
your patches here (although you don't define a system counter clock,
like you do in your imx8mm patches).

In any case, I might try to enable cpuidle totally wrong still :) and
I'd be happy for hints and test your changes (no matter how fit they are
to be merged right now).

thanks,
                                     martin
