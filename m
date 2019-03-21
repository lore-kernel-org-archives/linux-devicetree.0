From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V8 2/4] watchdog: imx_sc: Add i.MX system controller
 watchdog support
Date: Wed, 20 Mar 2019 17:31:51 -0700
Message-ID: <11b2f114-90ef-47c5-5c1d-9a5437ce7e9e@roeck-us.net>
References: <1552630331-32068-1-git-send-email-Anson.Huang@nxp.com>
 <1552630331-32068-3-git-send-email-Anson.Huang@nxp.com>
 <20190320134404.GA848@roeck-us.net>
 <DB3PR0402MB39167ACE84A7610CCBC2FCD8F5420@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB39167ACE84A7610CCBC2FCD8F5420@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, Andy Gross <andy.gross@linaro.org>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.ander>
List-Id: devicetree@vger.kernel.org

On 3/20/19 5:22 PM, Anson Huang wrote:
> Hi, Guenter
> 
> Best Regards!
> Anson Huang
> 
>> -----Original Message-----
>> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
>> Roeck
>> Sent: 2019Äê3ÔÂ20ÈÕ 21:44
>> To: Anson Huang <anson.huang@nxp.com>
>> Cc: wim@linux-watchdog.org; robh+dt@kernel.org; mark.rutland@arm.com;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; catalin.marinas@arm.com; will.deacon@arm.com;
>> Aisheng Dong <aisheng.dong@nxp.com>; Daniel Baluta
>> <daniel.baluta@nxp.com>; heiko@sntech.de; horms+renesas@verge.net.au;
>> Andy Gross <andy.gross@linaro.org>; maxime.ripard@bootlin.com;
>> olof@lixom.net; bjorn.andersson@linaro.org; jagan@amarulasolutions.com;
>> enric.balletbo@collabora.com; ezequiel@collabora.com;
>> stefan.wahren@i2se.com; marc.w.gonzalez@free.fr; linux-
>> watchdog@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: Re: [PATCH V8 2/4] watchdog: imx_sc: Add i.MX system controller
>> watchdog support
>>
>> On Fri, Mar 15, 2019 at 06:17:25AM +0000, Anson Huang wrote:
>>> i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
>>> inside, the system controller is in charge of controlling power, clock
>>> and watchdog etc..
>>>
>>> This patch adds i.MX system controller watchdog driver support,
>>> watchdog operation needs to be done in secure EL3 mode via
>>> ARM-Trusted-Firmware, using SMC call, CPU will trap into
>>> ARM-Trusted-Firmware and then it will request system controller to do
>>> watchdog operation via IPC.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Waiting for bindings approval, though. Plus a minor comment below.
>>
>> Guenter
>>
>>> ---
>>> Changes since V7:
>>> 	- remove the dependence of IMX_SCU as it does NOT call SCU API
>> directly;
>>> 	- add more detail info into the help section of how this module works;
>>> 	- add back device id table since now we have watchdog node in DT.
>>> ---
>>>   drivers/watchdog/Kconfig      |  16 ++++
>>>   drivers/watchdog/Makefile     |   1 +
>>>   drivers/watchdog/imx_sc_wdt.c | 182
>>> ++++++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 199 insertions(+)
>>>   create mode 100644 drivers/watchdog/imx_sc_wdt.c
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig index
>>> 242eea8..44a3158 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -641,6 +641,22 @@ config IMX2_WDT
>>>   	  To compile this driver as a module, choose M here: the
>>>   	  module will be called imx2_wdt.
>>>
>>> +config IMX_SC_WDT
>>> +	tristate "IMX SC Watchdog"
>>> +	depends on HAVE_ARM_SMCCC
>>> +	select WATCHDOG_CORE
>>> +	help
>>> +	  This is the driver for the system controller watchdog
>>> +	  on the NXP i.MX SoCs with system controller inside, the
>>> +	  watchdog driver will call ARM SMC API and trap into
>>> +	  ARM-Trusted-Firmware for operations, ARM-Trusted-Firmware
>>> +	  will request system controller to execute the operations.
>>> +	  If you have one of these processors and wish to have
>>> +	  watchdog support enabled, say Y, otherwise say N.
>>> +
>>> +	  To compile this driver as a module, choose M here: the
>>> +	  module will be called imx_sc_wdt.
>>> +
>>>   config UX500_WATCHDOG
>>>   	tristate "ST-Ericsson Ux500 watchdog"
>>>   	depends on MFD_DB8500_PRCMU
>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>> index ba930e4..136d9f0 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -68,6 +68,7 @@ obj-$(CONFIG_NUC900_WATCHDOG) +=
>> nuc900_wdt.o
>>>   obj-$(CONFIG_TS4800_WATCHDOG) += ts4800_wdt.o
>>>   obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
>>>   obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
>>> +obj-$(CONFIG_IMX_SC_WDT) += imx_sc_wdt.o
>>>   obj-$(CONFIG_UX500_WATCHDOG) += ux500_wdt.o
>>>   obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
>>>   obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o diff --git
>>> a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c new
>>> file mode 100644 index 0000000..c8a087a
>>> --- /dev/null
>>> +++ b/drivers/watchdog/imx_sc_wdt.c
>>> @@ -0,0 +1,182 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright 2018-2019 NXP.
>>> + */
>>> +
>>> +#include <linux/arm-smccc.h>
>>> +#include <linux/io.h>
>>> +#include <linux/init.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/moduleparam.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/reboot.h>
>>> +#include <linux/watchdog.h>
>>> +
>>> +#define DEFAULT_TIMEOUT 60
>>> +/*
>>> + * Software timer tick implemented in scfw side, support 10ms to
>>> +0xffffffff ms
>>> + * in theory, but for normal case, 1s~128s is enough, you can change
>>> +this max
>>> + * value in case it's not enough.
>>> + */
>>> +#define MAX_TIMEOUT 128
>>> +
>>> +#define IMX_SIP_TIMER			0xC2000002
>>> +#define IMX_SIP_TIMER_START_WDOG		0x01
>>> +#define IMX_SIP_TIMER_STOP_WDOG		0x02
>>> +#define IMX_SIP_TIMER_SET_WDOG_ACT	0x03
>>> +#define IMX_SIP_TIMER_PING_WDOG		0x04
>>> +#define IMX_SIP_TIMER_SET_TIMEOUT_WDOG	0x05
>>> +#define IMX_SIP_TIMER_GET_WDOG_STAT	0x06
>>> +#define IMX_SIP_TIMER_SET_PRETIME_WDOG	0x07
>>> +
>>> +#define SC_TIMER_WDOG_ACTION_PARTITION	0
>>> +
>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>> module_param(nowayout,
>>> +bool, 0000); MODULE_PARM_DESC(nowayout, "Watchdog cannot be
>> stopped
>>> +once started (default="
>>> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>> +
>>> +static unsigned int timeout = DEFAULT_TIMEOUT;
>>
>> I still don't understand why you explicitly disable configuring the watchdog
>> timeout through devicetree (unless the user explicitly provides a timeout=0
>> module parameter). Maybe add some comment if you send another version.
> 
> I thought this watchdog will be built as module anyway, and user can pass the timeout
> parameter when insmod this module, so I just choose the way of getting it from module parameter.

Even when built as module, the driver will be loaded and instantiated
when its devicetree entry is parsed. That is what devicetree is about,
after all. There will be no insmod.

Guenter

> I will add a comment if there is another version needed.
> 
> Thanks,
> Anson.
> 
>>
>>> +module_param(timeout, uint, 0000);
>>> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
>>> +		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
>>> +
>>> +static int imx_sc_wdt_ping(struct watchdog_device *wdog) {
>>> +	struct arm_smccc_res res;
>>> +
>>> +	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_PING_WDOG,
>>> +		      0, 0, 0, 0, 0, 0, &res);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int imx_sc_wdt_start(struct watchdog_device *wdog) {
>>> +	struct arm_smccc_res res;
>>> +
>>> +	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_START_WDOG,
>>> +		      0, 0, 0, 0, 0, 0, &res);
>>> +	if (res.a0)
>>> +		return -EACCES;
>>> +
>>> +	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_WDOG_ACT,
>>> +		      SC_TIMER_WDOG_ACTION_PARTITION,
>>> +		      0, 0, 0, 0, 0, &res);
>>> +	return res.a0 ? -EACCES : 0;
>>> +}
>>> +
>>> +static int imx_sc_wdt_stop(struct watchdog_device *wdog) {
>>> +	struct arm_smccc_res res;
>>> +
>>> +	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_STOP_WDOG,
>>> +		      0, 0, 0, 0, 0, 0, &res);
>>> +
>>> +	return res.a0 ? -EACCES : 0;
>>> +}
>>> +
>>> +static int imx_sc_wdt_set_timeout(struct watchdog_device *wdog,
>>> +				unsigned int timeout)
>>> +{
>>> +	struct arm_smccc_res res;
>>> +
>>> +	wdog->timeout = timeout;
>>> +	arm_smccc_smc(IMX_SIP_TIMER,
>> IMX_SIP_TIMER_SET_TIMEOUT_WDOG,
>>> +		      timeout * 1000, 0, 0, 0, 0, 0, &res);
>>> +
>>> +	return res.a0 ? -EACCES : 0;
>>> +}
>>> +
>>> +static const struct watchdog_ops imx_sc_wdt_ops = {
>>> +	.owner = THIS_MODULE,
>>> +	.start = imx_sc_wdt_start,
>>> +	.stop  = imx_sc_wdt_stop,
>>> +	.ping  = imx_sc_wdt_ping,
>>> +	.set_timeout = imx_sc_wdt_set_timeout, };
>>> +
>>> +static const struct watchdog_info imx_sc_wdt_info = {
>>> +	.identity	= "i.MX SC watchdog timer",
>>> +	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
>>> +			  WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT, };
>>> +
>>> +static int imx_sc_wdt_probe(struct platform_device *pdev) {
>>> +	struct watchdog_device *imx_sc_wdd;
>>> +	int ret;
>>> +
>>> +	imx_sc_wdd = devm_kzalloc(&pdev->dev, sizeof(*imx_sc_wdd),
>> GFP_KERNEL);
>>> +	if (!imx_sc_wdd)
>>> +		return -ENOMEM;
>>> +
>>> +	platform_set_drvdata(pdev, imx_sc_wdd);
>>> +
>>> +	imx_sc_wdd->info = &imx_sc_wdt_info;
>>> +	imx_sc_wdd->ops = &imx_sc_wdt_ops;
>>> +	imx_sc_wdd->min_timeout = 1;
>>> +	imx_sc_wdd->max_timeout = MAX_TIMEOUT;
>>> +	imx_sc_wdd->parent = &pdev->dev;
>>> +	imx_sc_wdd->timeout = DEFAULT_TIMEOUT;
>>> +
>>> +	ret = watchdog_init_timeout(imx_sc_wdd, timeout, &pdev->dev);
>>> +	if (ret)
>>> +		dev_warn(&pdev->dev, "Failed to set timeout value, using
>>> +default\n");
>>> +
>>> +	watchdog_stop_on_reboot(imx_sc_wdd);
>>> +	watchdog_stop_on_unregister(imx_sc_wdd);
>>> +
>>> +	ret = devm_watchdog_register_device(&pdev->dev, imx_sc_wdd);
>>> +	if (ret) {
>>> +		dev_err(&pdev->dev, "Failed to register watchdog device\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int __maybe_unused imx_sc_wdt_suspend(struct device *dev) {
>>> +	struct watchdog_device *imx_sc_wdd = dev_get_drvdata(dev);
>>> +
>>> +	if (watchdog_active(imx_sc_wdd))
>>> +		imx_sc_wdt_stop(imx_sc_wdd);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int __maybe_unused imx_sc_wdt_resume(struct device *dev) {
>>> +	struct watchdog_device *imx_sc_wdd = dev_get_drvdata(dev);
>>> +
>>> +	if (watchdog_active(imx_sc_wdd))
>>> +		imx_sc_wdt_start(imx_sc_wdd);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static SIMPLE_DEV_PM_OPS(imx_sc_wdt_pm_ops,
>>> +			 imx_sc_wdt_suspend, imx_sc_wdt_resume);
>>> +
>>> +static const struct of_device_id imx_sc_wdt_dt_ids[] = {
>>> +	{ .compatible = "fsl,imx-sc-wdt", },
>>> +	{ /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, imx_sc_wdt_dt_ids);
>>> +
>>> +static struct platform_driver imx_sc_wdt_driver = {
>>> +	.probe		= imx_sc_wdt_probe,
>>> +	.driver		= {
>>> +		.name	= "imx-sc-wdt",
>>> +		.of_match_table = imx_sc_wdt_dt_ids,
>>> +		.pm	= &imx_sc_wdt_pm_ops,
>>> +	},
>>> +};
>>> +module_platform_driver(imx_sc_wdt_driver);
>>> +
>>> +MODULE_AUTHOR("Robin Gong <yibin.gong@nxp.com>");
>>> +MODULE_DESCRIPTION("NXP i.MX system controller watchdog driver");
>>> +MODULE_LICENSE("GPL v2");
