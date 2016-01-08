From: Linux Kernel <linuxkernelmails@gmail.com>
Subject: Re: [PATCH 5/6] rtc: max77620: add support for max77620/max20024 RTC
 driver
Date: Fri, 8 Jan 2016 06:37:31 +0530
Message-ID: <568F0BD3.8080000@gmail.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
 <1452177524-23192-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452177524-23192-6-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 07 January 2016 08:08 PM, Laxman Dewangan wrote:

> Maxim Semiconductor's PMIC MAX77620/MAX20024 has on chip
> RTC  module. This support for setting alarm and time.
>
> Add RTC driver to access this chip's RTC module via RTC
> APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>
> Tested-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
> ---
>   drivers/rtc/Kconfig        |   9 +
>   drivers/rtc/Makefile       |   1 +
>   drivers/rtc/rtc-max77620.c | 574 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 584 insertions(+)
>   create mode 100644 drivers/rtc/rtc-max77620.c
>
(...)

> +static struct platform_driver max77620_rtc_driver = {
> +	.probe = max77620_rtc_probe,
> +	.remove = max77620_rtc_remove,
> +	.id_table = max77620_rtc_devtype,
> +	.driver = {
> +			.name = "max77620-rtc",
> +			.owner = THIS_MODULE,

Drop this line, .owner will be populated by driver core.

> +			.pm = &max77620_rtc_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(max77620_rtc_driver);
> +
> +MODULE_DESCRIPTION("max77620 RTC driver");
> +MODULE_AUTHOR("Chaitanya Bandi <bandik@nvidia.com>");
> +MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
> +MODULE_ALIAS("platform:max77620-rtc");
> +MODULE_LICENSE("GPL v2");
