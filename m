From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: RE: [PATCH 3/7] PM / devfreq: Add generic imx bus driver
Date: Tue, 13 Aug 2019 11:33:38 +0900
Message-ID: <20190813023338epcms1p307caf6727399e9f3e320b965fb95a603@epcms1p3>
References: <dbdd1ae60993d5fe73ce5b446b2c7d559c981cf1.1565633880.git.leonard.crestez@nxp.com>
 <cover.1565633880.git.leonard.crestez@nxp.com>
 <CGME20190812185005epcas3p10a9a3dbb90489534222e093c63f27900@epcms1p3>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <dbdd1ae60993d5fe73ce5b446b2c7d559c981cf1.1565633880.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Artur Swigon <a.swigon@partner.samsung.com>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Anson Huang <Anson.Huang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Will Deacon <will@kernel.org>, Alexandre Bailon <abailon@baylibre.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jacky Bai <ping.bai@nxp.co>
List-Id: devicetree@vger.kernel.org

>Add initial support for dynamic frequency switching on pieces of the imx
>interconnect fabric.
>
>All this driver actually does is set a clk rate based on an opp table.
>
>No attempt is made to map registers or anything clever.
>
>Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>---
> drivers/devfreq/Kconfig       |  12 +++
> drivers/devfreq/Makefile      |   1 +
> drivers/devfreq/imx-devfreq.c | 148 ++++++++++++++++++++++++++++++++++
> 3 files changed, 161 insertions(+)
> create mode 100644 drivers/devfreq/imx-devfreq.c
>
>diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
>index defe1d438710..9088a151bafe 100644
>--- a/drivers/devfreq/Kconfig
>+++ b/drivers/devfreq/Kconfig
>@@ -90,10 +90,22 @@ config ARM_EXYNOS_BUS_DEVFREQ
> 	  Each memory bus group could contain many memoby bus block. It reads
> 	  PPMU counters of memory controllers by using DEVFREQ-event device
> 	  and adjusts the operating frequencies and voltages with OPP support.
> 	  This does not yet operate with optimal voltages.
> 
>+config ARM_IMX_DEVFREQ
>+	tristate "i.MX DEVFREQ Driver"
>+	depends on ARCH_MXC || COMPILE_TEST
>+	select DEVFREQ_GOV_PASSIVE
>+	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>+	select DEVFREQ_GOV_USERSPACE
>+	select PM_OPP

Hello,

I have a simple question:

Does it support ALL ARCH_MXC SoCs?

Cheers,
MyungJoo
