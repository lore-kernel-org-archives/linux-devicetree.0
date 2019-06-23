From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 3/3] arm64: dts: imx8mq: Add system counter node
Date: Sun, 23 Jun 2019 11:30:06 +0000
Message-ID: <DB3PR0402MB3916E2E26F96AED711182C64F5E10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190621082838.12630-1-Anson.Huang@nxp.com>
 <20190621082838.12630-3-Anson.Huang@nxp.com>
 <6c632476-9ecd-d6cc-b543-a28576c06a0c@posteo.de>
 <8a887fee-54e7-16ac-6373-a693ec7ad944@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8a887fee-54e7-16ac-6373-a693ec7ad944@posteo.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Kepplinger <martink@posteo.de>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Martin Kepplinger <martink@posteo.de>
> Sent: Sunday, June 23, 2019 7:21 PM
> To: Anson Huang <anson.huang@nxp.com>; daniel.lezcano@linaro.org;
> tglx@linutronix.de; robh+dt@kernel.org; mark.rutland@arm.com;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; l.stach@pengutronix.de; Abel Vesa
> <abel.vesa@nxp.com>; ccaione@baylibre.com; angus@akkea.ca;
> andrew.smirnov@gmail.com; agx@sigxcpu.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Cc: dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH 3/3] arm64: dts: imx8mq: Add system counter node
> 
> On 22.06.19 16:16, Martin Kepplinger wrote:
> > On 21.06.19 10:28, Anson.Huang@nxp.com wrote:
> >> From: Anson Huang <Anson.Huang@nxp.com>
> >>
> >> Add i.MX8MQ system counter node to enable timer-imx-sysctr broadcast
> >> timer driver.
> >
> > with these changes and TIMER_IMX_SYS_CTR selected, I don't see cpuidle
> > working yet (which is what I want to achieve on imx8mq). Might there
> > be a system counter clock definition or anything else missing?
> >
> 
> To be clear about what I tried running: Abel's wakeup-workaround (with the
> corresponding ATF changes):
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.o
> rg%2Flkml%2F2019%2F6%2F10%2F350&amp;data=02%7C01%7CAnson.Huan
> g%40nxp.com%7C445690743187422a2d2b08d6f7ccd665%7C686ea1d3bc2b4
> c6fa92cd99c5c301635%7C0%7C0%7C636968856477185012&amp;sdata=k1Aj
> CJ5SGUYQE7VnzciihRTKgf1yi4bDaBqCCv9DzpU%3D&amp;reserved=0 plus
> your patches here (although you don't define a system counter clock, like you
> do in your imx8mm patches).
> 
> In any case, I might try to enable cpuidle totally wrong still :) and I'd be happy
> for hints and test your changes (no matter how fit they are to be merged
> right now).

Could be something else than this patch series, i.MX8MQ uses platform driver model
for clock driver, to enable system counter driver, something needs to be changed in
system counter driver, and no need to have system counter clock definition in i.MX8MQ
clock tree, while i.MX8MM uses OF_CLK as clock driver initialization, so we need system
counter clock definition.

My understanding is, even without this patch series, cpu-idle should be able to work, but
The last CPU could be always powered ON to ack as broadcast timer, if with system counter
enabled, all CPUs can be powered OFF when entering state #1 idle independently, as system
counter can be broadcast timer. Correct me if anything wrong, maybe latest upstream kernel
has something different about this part. 

Thanks,
Anson.

> 
> thanks,
>                                      martin
