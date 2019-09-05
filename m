From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1] watchdog: imx_sc: this patch just fixes whitespaces
Date: Thu, 5 Sep 2019 06:24:23 -0700
Message-ID: <016e268c-f289-4127-a47e-3d8faa790ded@roeck-us.net>
References: <20190905073730.22258-1-oliver.graute@kococonnector.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905073730.22258-1-oliver.graute@kococonnector.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oliver Graute <oliver.graute@kococonnector.com>, "oliver.graute@gmail.com" <oliver.graute@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 9/5/19 12:44 AM, Oliver Graute wrote:
> Fix only whitespace errors in imx_sc_wdt_probe()
> 
> Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>

This patch no longer applies due to commit "watchdog: imx_sc: Remove
unnecessary error log".

Guenter

> ---
>   drivers/watchdog/imx_sc_wdt.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index 78eaaf75a263..94db949042c9 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -175,12 +175,12 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>   	watchdog_stop_on_unregister(wdog);
>   
>   	ret = devm_watchdog_register_device(dev, wdog);
> -
> - 	if (ret) {
> - 		dev_err(dev, "Failed to register watchdog device\n");
> - 		return ret;
> - 	}
> -
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to register watchdog device\n");
> +		return ret;
> +	}
> +
>   	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>   				       SC_IRQ_WDOG,
>   				       true);
> 
