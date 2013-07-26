From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v11] reset: Add driver for gpio-controlled reset pins
Date: Fri, 26 Jul 2013 22:05:43 +0100
Message-ID: <51F2E4A7.1040200@codethink.co.uk>
References: <1374834384-8071-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374834384-8071-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Len Brown <len.brown@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Pavel Machek <pavel@ucw.cz>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On 26/07/13 11:26, Philipp Zabel wrote:
> This driver implements a reset controller device that toggle a gpio
> connected to a reset pin of a peripheral IC. The delay between assertion
> and de-assertion of the reset signal can be configured via device tree.
>
> Signed-off-by: Philipp Zabel<p.zabel@pengutronix.de>
> Reviewed-by: Stephen Warren<swarren@nvidia.com>

[snip]

> +static struct of_device_id gpio_reset_dt_ids[] = {
> +	{ .compatible = "gpio-reset" },
> +	{ }
> +};

I think you need the following:
MODULE_DEVICE_TABLE(of, gpio_reset_dt_ids);

> +static struct platform_driver gpio_reset_driver = {
> +	.probe = gpio_reset_probe,
> +	.remove = gpio_reset_remove,
> +	.driver = {
> +		.name = "gpio-reset",
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(gpio_reset_dt_ids),
> +	},
> +};
> +
> +module_platform_driver(gpio_reset_driver);
> +
> +MODULE_AUTHOR("Philipp Zabel<p.zabel@pengutronix.de>");
> +MODULE_DESCRIPTION("gpio reset controller");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:gpio-reset");
> +MODULE_DEVICE_TABLE(of, gpio_reset_dt_ids);


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
