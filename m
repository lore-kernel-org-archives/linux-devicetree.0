From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 3/7] PM / devfreq: Add generic imx bus driver
Date: Tue, 13 Aug 2019 03:02:31 +0000
Message-ID: <VI1PR04MB7023485353FCBBD7F8BEE8F3EED20@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <dbdd1ae60993d5fe73ce5b446b2c7d559c981cf1.1565633880.git.leonard.crestez@nxp.com>
 <cover.1565633880.git.leonard.crestez@nxp.com>
 <CGME20190812185005epcas3p10a9a3dbb90489534222e093c63f27900@epcms1p3>
 <20190813023338epcms1p307caf6727399e9f3e320b965fb95a603@epcms1p3>
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
To: "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Artur Swigon <a.swigon@partner.samsung.com>, Jacky Bai <ping.bai@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Georgi
List-Id: devicetree@vger.kernel.org

On 8/13/2019 5:33 AM, MyungJoo Ham wrote:

>> Add initial support for dynamic frequency switching on pieces of the imx
>> interconnect fabric.
>>
>> All this driver actually does is set a clk rate based on an opp table.
>>
>> +config ARM_IMX_DEVFREQ
>> +	tristate "i.MX DEVFREQ Driver"
>> +	depends on ARCH_MXC || COMPILE_TEST
>> +	select DEVFREQ_GOV_PASSIVE
>> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>> +	select DEVFREQ_GOV_USERSPACE
>> +	select PM_OPP
> 
> Does it support ALL ARCH_MXC SoCs?

Only imx8m currently but out of tree we support bus+dram frequency 
switching for ~10 imx6/7 SOCs, all other than imx7ulp.

When imx8 was upstreamed as the first 64-bit imx chip the arm64 
maintainers told us to drop stuff like ARCH_FSL_IMX8MM so there is no 
per-soc kconfig more specific than "ARCH_MXC".

I guess we could make it depend on (ARCH_MXC && ARM64) but the ARM64 
would eventually be dropped anyway.

--
Regards,
Leonard
