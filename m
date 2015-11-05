From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: dts: imx: Add Advantech BA-16 Qseven module
Date: Thu, 5 Nov 2015 13:33:45 -0500
Message-ID: <563BA109.8000208@timesys.com>
References: <1446160607-16053-1-git-send-email-akshay.bhat@timesys.com>
 <1446160607-16053-3-git-send-email-akshay.bhat@timesys.com>
 <1446454663.3156.4.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446454663.3156.4.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, peter.stretz-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,

Thanks for the feedback :) I have submitted a v2 patch incorporating 
your feedback.

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/383276.html

On 11/02/2015 03:57 AM, Lucas Stach wrote:
> Am Donnerstag, den 29.10.2015, 19:16 -0400 schrieb Akshay Bhat:
>
> There is a suspiciously high number of always-on regulators in the list
> above. Are they really required to be powered on always, or are we
> lacking supplies on some of the devices below?
>

Agree, many of them do not need be always-on, fixed in v2

>> +		};
>> +	};
>> +};
>> +
>> +&iomuxc {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_hog>;
>> +
>> +	imx6q-ba16 {
>> +		pinctrl_hog: hoggrp {
>> +			fsl,pins = <
>> +				MX6QDL_PAD_GPIO_4__GPIO1_IO04    0x80000000	/* uSDHC2 CD */
>> +				MX6QDL_PAD_NANDF_CS0__GPIO6_IO11 0x80000000	/* uSDHC4 CD */
>> +				MX6QDL_PAD_NANDF_CS1__GPIO6_IO14 0x80000000	/* uSDHC4 SDIO PWR */
>> +				MX6QDL_PAD_NANDF_CS2__GPIO6_IO15 0x80000000	/* uSDHC4 SDIO WP */
>> +				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16 0x80000000	/* uSDHC4 SDIO LED */
>> +				MX6QDL_PAD_EIM_EB2__GPIO2_IO30   0x80000000	/* SPI1 CS */
>> +				MX6QDL_PAD_GPIO_17__GPIO7_IO12   0x80000000	/* PCIe Reset */
>> +				MX6QDL_PAD_GPIO_5__GPIO1_IO05    0x80000000	/* PCIe Wake */
>> +				MX6QDL_PAD_GPIO_0__CCM_CLKO1     0x130b0	/* FEC CLK */
>> +				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28 0x80000000	/* FEC Reset */
>> +				MX6QDL_PAD_NANDF_D0__GPIO2_IO00  0x80000000	/* GPIO0 */
>> +				MX6QDL_PAD_NANDF_D1__GPIO2_IO01  0x80000000	/* GPIO1 */
>> +				MX6QDL_PAD_NANDF_D2__GPIO2_IO02  0x80000000	/* GPIO2 */
>> +				MX6QDL_PAD_NANDF_D3__GPIO2_IO03  0x80000000	/* GPIO3 */
>> +				MX6QDL_PAD_NANDF_D4__GPIO2_IO04  0x80000000	/* GPIO4 */
>> +				MX6QDL_PAD_NANDF_D5__GPIO2_IO05  0x80000000	/* GPIO5 */
>> +				MX6QDL_PAD_NANDF_D6__GPIO2_IO06  0x80000000	/* GPIO6 */
>> +				MX6QDL_PAD_NANDF_D7__GPIO2_IO07  0x80000000	/* GPIO7 */
>> +				MX6QDL_PAD_NANDF_CLE__GPIO6_IO07 0x80000000	/* CAM_PWDN */
>> +				MX6QDL_PAD_GPIO_2__GPIO1_IO02    0x80000000	/* CAM_RST */
>> +				MX6QDL_PAD_GPIO_9__WDOG1_B       0x80000000	/* Watchdog out */
>> +				MX6QDL_PAD_GPIO_16__GPIO7_IO11   0x80000000	/* HUB_RESET */
>> +				MX6QDL_PAD_GPIO_18__GPIO7_IO13   0x80000000	/* PMIC Interrupt */
>> +				MX6QDL_PAD_GPIO_19__GPIO4_IO05   0x80000000	/* AR8033 Interrupt */
>> +				MX6QDL_PAD_KEY_ROW2__GPIO4_IO11  0x80000000	/* SUS_S3_OUT */
>> +				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15  0x80000000	/* BLEN_OUT */
>> +				MX6QDL_PAD_EIM_D22__GPIO3_IO22   0x80000000	/* LVDS_PPEN_OUT */
>> +				MX6QDL_PAD_KEY_COL2__GPIO4_IO10  0x80000000	/* RTC_INT */
>
> Please don't overuse the hog group but add pins that are related to a
> specific device to the pinmux group of that device. USDHC, SPI, PCIe,
> FEC are the obvious examples from the list above.
>

Makes sense, have moved many of the entries from hog group into their 
relevant groups in v2. There are a couple more which can be moved but 
are dependent on new device tree nodes/drivers that I am yet to submit.

>> +
>> +&pcie {
>> +	power-on-gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
>
> There is no such thing as a power-on-gpio in mainline Linux.
>

Good catch, was a left over from 3.14 kernel. Fixed in v2.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
