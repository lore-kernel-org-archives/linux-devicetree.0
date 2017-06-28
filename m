From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drivers/watchdog: ASPEED reference dev tree
 properties for config
Date: Wed, 28 Jun 2017 04:31:29 -0700
Message-ID: <606a2e11-2d43-5204-0bb6-9c4415ee03df@roeck-us.net>
References: <20170627211734.60477-1-cbostic@linux.vnet.ibm.com>
 <20170627211734.60477-3-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170627211734.60477-3-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/27/2017 02:17 PM, Christopher Bostic wrote:
> Reference the system device tree when configuring the watchdog
> engines.  Set external signal mode on timeout if specified.
> Set system reset on timeout if specified.
> 
> Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
> v2 - Change of_get_property() to of_property_read_bool()
>     - Remove redundant check for NULL struct device_node pointer
>     - Optional property names now start with prefix 'aspeed,'
> ---
>   drivers/watchdog/aspeed_wdt.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 1c65258..71ce5f5 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -140,6 +140,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   {
>   	struct aspeed_wdt *wdt;
>   	struct resource *res;
> +	struct device_node *np;
>   	int ret;
>   
>   	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
> @@ -170,8 +171,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	 * the SOC and not the full chip
>   	 */
>   	wdt->ctrl = WDT_CTRL_RESET_MODE_SOC |
> -		WDT_CTRL_1MHZ_CLK |
> -		WDT_CTRL_RESET_SYSTEM;
> +		WDT_CTRL_1MHZ_CLK;
> +
> +	np = pdev->dev.of_node;
> +	if (of_property_read_bool(np, "aspeed,sys-reset"))
> +		wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
> +

For backward compatibility, this should default to WDT_CTRL_RESET_SYSTEM
if no optional property is provided.

> +	if (of_property_read_bool(np, "aspeed,external-signal"))
> +		wdt->ctrl |= WDT_CTRL_WDT_EXT;
> +
> +	writel(wdt->ctrl, wdt->base + WDT_CTRL);
>   
>   	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
>   		aspeed_wdt_start(&wdt->wdd);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
