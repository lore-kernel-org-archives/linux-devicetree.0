From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFCv3 3/3] interconnect: imx: Add platform driver for imx8mm
Date: Wed, 21 Aug 2019 14:21:36 +0000
Message-ID: <VI1PR04MB7023E441FEE0D9288CAC0F44EEAA0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1565088423.git.leonard.crestez@nxp.com>
 <cf265add1502a75c4d6e6261ab1570c665e82c83.1565088423.git.leonard.crestez@nxp.com>
 <a2e09a9b-574f-8410-423e-0b0d8ea5c2ab@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Martin Kepplinger <martink@posteo.de>
Cc: Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Jacky Bai <ping.bai@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio
List-Id: devicetree@vger.kernel.org

On 21.08.2019 17:03, Martin Kepplinger wrote:
> On 06.08.19 12:55, Leonard Crestez wrote:
>> This adds a platform driver for the i.MX8MM SoC.
>>
>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>> ---
>>   drivers/interconnect/imx/Kconfig          |   4 +
>>   drivers/interconnect/imx/Makefile         |   1 +
>>   drivers/interconnect/imx/imx8mm.c         | 114 ++++++++++++++++++++++
>>   include/dt-bindings/interconnect/imx8mm.h |  49 ++++++++++
>>   4 files changed, 168 insertions(+)
>>   create mode 100644 drivers/interconnect/imx/imx8mm.c
>>   create mode 100644 include/dt-bindings/interconnect/imx8mm.h
> 
> Do you plan to add such a driver for imx8mq too?

Yes! The topology is different (serving different IP blocks) but no 
functional code changes are required between 8mm 8mn 8mq.

I already wrote the code and tested it but didn't post because I want to 
get the core parts in first. I periodically push my "full" 
work-in-progress to github:

https://github.com/cdleonard/linux/commits/next_imx8mm_busfreq

You need out-of-tree ATF changes or devfreq probe will fail:

https://github.com/cdleonard/arm-trusted-firmware/commits/imx_2.0.y_busfreq

--
Regards,
Leonard
