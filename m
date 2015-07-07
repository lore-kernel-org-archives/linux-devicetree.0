From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: add clock_null
Date: Tue, 7 Jul 2015 15:07:32 +0200
Message-ID: <20150707130732.GD18561@pengutronix.de>
References: <1434605351-64592-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434605351-64592-1-git-send-email-eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 01:29:11PM +0800, Eddie Huang wrote:
> Add clk_null, which represents clocks that can not / need not
> controlled by software.
> There are many clocks' parent set to clk_null.
> 
> Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
> Base on 4.1-rc1
> 
> Change-Id: I4db9b40d07e28f54f7bae9b676316cbd6a962124
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 924fdb6..4798f44 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -81,6 +81,12 @@
>  		cpu_on	      = <0x84000003>;
>  	};
>  
> +	clk_null: clk_null {
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +		#clock-cells = <0>;
> +	};

The discussion around this patch shows that we don't want to have this
clock in the device tree as it is not a hardware description.

Ok, fine. Eddie, you told us that the rate of the current clk_null children
is not interesting. What's the motivation to send this patch anyway
then? Why can't you keep its children on the orphan list where they are
already now?

Another possibility would be to instantiate the clk_null clock from C
code rather than from the device tree. This way we wouldn't put any
wrong descriptions into the device tree and still can implement the
support for the real parent clocks when we actually need them.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
