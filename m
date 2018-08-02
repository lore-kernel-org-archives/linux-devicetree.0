From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: mfd: rk808: Add binding informations
 for RK809 and RK817.
Date: Thu, 02 Aug 2018 13:16:18 +0200
Message-ID: <2820701.ErqR8ge6r7@phil>
References: <1533023850-29004-1-git-send-email-tony.xie@rock-chips.com>
 <1533023850-29004-4-git-send-email-tony.xie@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1533023850-29004-4-git-send-email-tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Tony Xie <tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xsf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tony,

Am Dienstag, 31. Juli 2018, 09:57:28 CEST schrieb Tony Xie:
> Add device tree bindings documentation for Rockchip's RK809 & RK817 PMIC.
> 
> Signed-off-by: Tony Xie <tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

I don't see the devicetree binding maintainers listed in the recipient
list, so adding them in the next iteration might increase your chances
to get an Ack on the binding.

scripts/get_maintainer.pl -f Documentation/devicetree/bindings lists

Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

as the main dt maintainers.

[...]

> @@ -99,6 +147,13 @@ number as described in RK818 datasheet.
>  	- HDMI_SWITCH
>  	- OTG_SWITCH
>  
> +There are three pins needed to config, named "gpio_ts" "gpio_gt" "gpio_slp".
> +	The gpio_gt and gpio_ts pins support the gpio function.
> +	The gpio_slp pin is for controlling the pmic states, as below:
> +		- reset
> +		- power down
> +		- sleep
> +

Is this common for all rk8xx pmics or just the two new ones?
As the paragraph above makes it sound like these are present on all
and I didn't find mention of them in the datasheets for previous pmics
I have.

Also to me it is not clear in what way these should be used and I didn't
find any mention of them at all in the rest of your series.


Heiko
