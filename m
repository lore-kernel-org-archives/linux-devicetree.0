From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: fixed-rate: use full DT node name
Date: Fri, 14 Feb 2014 10:35:56 +0000
Message-ID: <20140214103556.GC9907@e106331-lin.cambridge.arm.com>
References: <1392358613-19962-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392358613-19962-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 14, 2014 at 06:16:52AM +0000, Stephen Warren wrote:
> clk-fixed-rate currently names clocks according to a node's name without
> the unit address. When faced with the legal and technically correct DT
> structure below, this causes rgistration attempts for 3 clocks with the
> same name, 2 of which fail.
> 
> 	clocks {
> 		compatible = "simple-bus";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		clk_mmc: clock@0 {
> 			compatible = "fixed-clock";
> 			reg = <0>;
> ...
> 		clk_i2c: clock@1 {
> 			compatible = "fixed-clock";
> 			reg = <1>;
> ...
> 		clk_spi: clock@2 {
> 			compatible = "fixed-clock";
> 			reg = <2>;
> ...

I'd argue that this case isn't valid.

The fixed-clock binding doesn't define a reg, yet simple bus binding
implies that the reg property of child nodes should be interpretted as
the same address space as their parent (MMIO in this case?). The
fixed-clock nodes reg proeprties clearly aren't MMIO addresses.

Additionally, the _requred_ ranges property is missing.

It's just nonsensical; rename them to clock_{0,1,..} instead and get rid
of the reg properties. Then they're named uniquely.

However, for cases where the reg value is meaningful the below patch
makes sense.

Thanks,
Mark.

> 
> Solve this by naming the clocks after the full node name rather than the
> short version (e.g. /clocks/clock@0).
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> Note that if this is accepted, I intend to submit a patch for the RPi DTS
> which uses the naming structure above, so it might be useful to place this
> patch in its own branch. Or, I could submit the cleanup after 3.15-rc1.
> ---
>  drivers/clk/clk-fixed-rate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
> index 0fc56ab..3335b3c 100644
> --- a/drivers/clk/clk-fixed-rate.c
> +++ b/drivers/clk/clk-fixed-rate.c
> @@ -115,7 +115,7 @@ EXPORT_SYMBOL_GPL(clk_register_fixed_rate);
>  void of_fixed_clk_setup(struct device_node *node)
>  {
>  	struct clk *clk;
> -	const char *clk_name = node->name;
> +	const char *clk_name = node->full_name;
>  	u32 rate;
>  	u32 accuracy = 0;
>  
> -- 
> 1.8.3.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
