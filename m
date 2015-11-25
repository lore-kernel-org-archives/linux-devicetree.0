From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH (v2) 7/10] watchdog: bcm63xx_wdt: Add get_timeleft
 function
Date: Tue, 24 Nov 2015 18:51:00 -0800
Message-ID: <56552214.2050808@roeck-us.net>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <5650C08C.6090300@simon.arlott.org.uk> <5650E2FA.6090408@roeck-us.net>
 <5650E5BB.6020404@simon.arlott.org.uk> <56512937.6030903@roeck-us.net>
 <5651CB13.4090704@simon.arlott.org.uk> <5651CC90.7090402@simon.arlott.org.uk>
 <a1461a17c94353f38316d2c6ae04d6b77c91bfd4@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a1461a17c94353f38316d2c6ae04d6b77c91bfd4-dyyJQ+qCPjsfFgGGEbPnq5KvX+y0N6jJ2mWzQvkZbzCn6nfhxgf73RdaaeUjXGGo@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/24/2015 02:15 PM, Simon Arlott wrote:
> Return the remaining time from the hardware control register.
>
> Warn when the device is registered if the hardware watchdog is currently
> running and report the remaining time left.

This is really two logical changes, isn't it ?

Nice trick to figure out if the watchdog is running.

What is the impact ? Will this result in interrupts ?
If so, would it make sense to _not_ reset the system after a timeout
in this case, but to keep pinging the watchdog while the watchdog device
is not open ?

Thanks,
Guenter

>
> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
> ---
> Changed "if (timeleft > 0)" to "if (hw->running)" when checking if a
> warning should be printed, in case the time left is truncated down to
> 0 seconds.
>
>   drivers/watchdog/bcm63xx_wdt.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>
> diff --git a/drivers/watchdog/bcm63xx_wdt.c b/drivers/watchdog/bcm63xx_wdt.c
> index 3c7667a..9d099e0 100644
> --- a/drivers/watchdog/bcm63xx_wdt.c
> +++ b/drivers/watchdog/bcm63xx_wdt.c
> @@ -14,6 +14,7 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
>   #include <linux/clk.h>
> +#include <linux/delay.h>
>   #include <linux/errno.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> @@ -75,6 +76,19 @@ static int bcm63xx_wdt_stop(struct watchdog_device *wdd)
>   	return 0;
>   }
>
> +static unsigned int bcm63xx_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct bcm63xx_wdt_hw *hw = watchdog_get_drvdata(wdd);
> +	unsigned long flags;
> +	u32 val;
> +
> +	raw_spin_lock_irqsave(&hw->lock, flags);
> +	val = __raw_readl(hw->regs + WDT_CTL_REG);
> +	val /= hw->clock_hz;
> +	raw_spin_unlock_irqrestore(&hw->lock, flags);
> +	return val;
> +}
> +
>   static int bcm63xx_wdt_set_timeout(struct watchdog_device *wdd,
>   	unsigned int timeout)
>   {
> @@ -130,6 +144,7 @@ static struct watchdog_ops bcm63xx_wdt_ops = {
>   	.owner = THIS_MODULE,
>   	.start = bcm63xx_wdt_start,
>   	.stop = bcm63xx_wdt_stop,
> +	.get_timeleft = bcm63xx_wdt_get_timeleft,
>   	.set_timeout = bcm63xx_wdt_set_timeout,
>   };
>
> @@ -144,6 +159,8 @@ static int bcm63xx_wdt_probe(struct platform_device *pdev)
>   	struct bcm63xx_wdt_hw *hw;
>   	struct watchdog_device *wdd;
>   	struct resource *r;
> +	u32 timeleft1, timeleft2;
> +	unsigned int timeleft;
>   	int ret;
>
>   	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
> @@ -197,6 +214,23 @@ static int bcm63xx_wdt_probe(struct platform_device *pdev)
>   	watchdog_init_timeout(wdd, 0, &pdev->dev);
>   	watchdog_set_nowayout(wdd, nowayout);
>
> +	/* Compare two reads of the time left value, 2 clock ticks apart */
> +	rmb();
> +	timeleft1 = __raw_readl(hw->regs + WDT_CTL_REG);
> +	udelay(DIV_ROUND_UP(1000000, hw->clock_hz / 2));
> +	/* Ensure the register is read twice */
> +	rmb();
> +	timeleft2 = __raw_readl(hw->regs + WDT_CTL_REG);
> +
> +	/* If the time left is changing, the watchdog is running */
> +	if (timeleft1 != timeleft2) {
> +		hw->running = true;
> +		timeleft = bcm63xx_wdt_get_timeleft(wdd);
> +	} else {
> +		hw->running = false;
> +		timeleft = 0;
> +	}
> +
>   	ret = bcm63xx_timer_register(TIMER_WDT_ID, bcm63xx_wdt_isr, wdd);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to register wdt timer isr\n");
> @@ -214,6 +248,8 @@ static int bcm63xx_wdt_probe(struct platform_device *pdev)
>   		dev_name(wdd->dev), hw->regs,
>   		wdd->timeout, wdd->max_timeout);
>
> +	if (hw->running)
> +		dev_alert(wdd->dev, "running, reboot in %us\n", timeleft);
>   	return 0;
>
>   unregister_timer:
> @@ -255,6 +291,7 @@ module_platform_driver(bcm63xx_wdt_driver);
>
>   MODULE_AUTHOR("Miguel Gaio <miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org>");
>   MODULE_AUTHOR("Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>");
> +MODULE_AUTHOR("Simon Arlott");
>   MODULE_DESCRIPTION("Driver for the Broadcom BCM63xx SoC watchdog");
>   MODULE_LICENSE("GPL");
>   MODULE_ALIAS("platform:bcm63xx-wdt");
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
