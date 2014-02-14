From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: bcm2835: fix clock DT node names
Date: Fri, 14 Feb 2014 10:39:01 +0000
Message-ID: <20140214103901.GD9907@e106331-lin.cambridge.arm.com>
References: <1392358613-19962-1-git-send-email-swarren@wwwdotorg.org>
 <1392358613-19962-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392358613-19962-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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

On Fri, Feb 14, 2014 at 06:16:53AM +0000, Stephen Warren wrote:
> DT nodes should be named according to the type of object that they
> represent rather than the identity. DT nodes that contain a reg
> property should include a unit address in their name. Fix these issues.

As mentioned on patch one, I don't think this makes sense. clock@N is
simply not correct, and if simple-bus weren't being abused it would be
far clearer that that is the case.

Please use clock_N rather than clock@N here, and get rid of the
meaningless reg values.

The simple-bus should either be removed or fixed up to meet the
requirements of the simple-bus binding (i.e. add a ranges property). I
would prefer the former.

Thanks,
Mark.

> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> This is the bcm2835 patch which depends on patch 1. I guess this could
> also go through the clk tree if that makes it easier, although there's
> always the small risk of conflicts if you do that.
> 
>  arch/arm/boot/dts/bcm2835.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> index a2d4889..1cf1ae7 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -155,21 +155,21 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		clk_mmc: mmc {
> +		clk_mmc: clock@0 {
>  			compatible = "fixed-clock";
>  			reg = <0>;
>  			#clock-cells = <0>;
>  			clock-frequency = <100000000>;
>  		};
>  
> -		clk_i2c: i2c {
> +		clk_i2c: clock@1 {
>  			compatible = "fixed-clock";
>  			reg = <1>;
>  			#clock-cells = <0>;
>  			clock-frequency = <250000000>;
>  		};
>  
> -		clk_spi: spi {
> +		clk_spi: clock@2 {
>  			compatible = "fixed-clock";
>  			reg = <2>;
>  			#clock-cells = <0>;
> -- 
> 1.8.3.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
