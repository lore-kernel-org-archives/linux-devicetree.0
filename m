From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] phy: rockchip-inno-usb2: add COMMON_CLK dependency
Date: Tue, 16 Aug 2016 09:31:50 -0700
Message-ID: <20160816163150.GA28201@roeck-us.net>
References: <1471327320-92871-1-git-send-email-frank.wang@rock-chips.com>
 <1471327320-92871-2-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471327320-92871-2-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 16, 2016 at 02:02:00PM +0800, Frank Wang wrote:
> On kernel builds without COMMON_CLK, the newly added rockchip-inno-usb2
> driver fails to build:
> 
> drivers/phy/phy-rockchip-inno-usb2.c:124:16: error: field 'clk480m_hw'
> has incomplete type
>    struct clk_hw clk480m_hw;
> 
> In file included from include/linux/clk.h:16:0
>                  from drivers/phy/phy-rockchip-inno-usb2.c:17:
> include/linux/kernel.h:831:48: error: initialization from incompatible
> pointer type [-Werror=incompatible-pointer-types]
>    const typeof( ((type *)0)->member ) *__mptr = (ptr); \
> 
>   ... ...
> 
> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  drivers/phy/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index f9bf981..c6d57e5 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -370,6 +370,7 @@ config PHY_ROCKCHIP_USB
>  config PHY_ROCKCHIP_INNO_USB2
>  	tristate "Rockchip INNO USB2PHY Driver"
>  	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> +	depends on COMMON_CLK

Wonder what is preferred here. I find 33 "select COMMON_CLK" and
18 "depends on COMMON_CLK".

Either case

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>


>  	select GENERIC_PHY
>  	help
>  	  Support for Rockchip USB2.0 PHY with Innosilicon IP block.
> -- 
> 1.7.9.5
> 
> 
