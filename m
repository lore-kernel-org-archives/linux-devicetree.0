From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] phy: rockchip-inno-usb2: add COMMON_CLK dependency
Date: Wed, 17 Aug 2016 12:19:20 +0200
Message-ID: <1923063.8aq8klSAh0@diego>
References: <1471327320-92871-1-git-send-email-frank.wang@rock-chips.com> <1471327320-92871-2-git-send-email-frank.wang@rock-chips.com> <20160816163150.GA28201@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160816163150.GA28201-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, kishon-l0cyMroinI0@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 16. August 2016, 09:31:50 schrieb Guenter Roeck:
> On Tue, Aug 16, 2016 at 02:02:00PM +0800, Frank Wang wrote:
> > On kernel builds without COMMON_CLK, the newly added rockchip-inno-usb2
> > driver fails to build:
> > 
> > drivers/phy/phy-rockchip-inno-usb2.c:124:16: error: field 'clk480m_hw'
> > has incomplete type
> > 
> >    struct clk_hw clk480m_hw;
> > 
> > In file included from include/linux/clk.h:16:0
> > 
> >                  from drivers/phy/phy-rockchip-inno-usb2.c:17:
> > include/linux/kernel.h:831:48: error: initialization from incompatible
> > pointer type [-Werror=incompatible-pointer-types]
> > 
> >    const typeof( ((type *)0)->member ) *__mptr = (ptr); \
> >   
> >   ... ...
> > 
> > Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> > 
> >  drivers/phy/Kconfig |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index f9bf981..c6d57e5 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -370,6 +370,7 @@ config PHY_ROCKCHIP_USB
> > 
> >  config PHY_ROCKCHIP_INNO_USB2
> >  
> >  	tristate "Rockchip INNO USB2PHY Driver"
> >  	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> > 
> > +	depends on COMMON_CLK
> 
> Wonder what is preferred here. I find 33 "select COMMON_CLK" and
> 18 "depends on COMMON_CLK".

In drivers/ I count 12 select COMMON_CLK vs. 37 depends on COMMON_CLK
Do I need new glasses? :-)

With MMC_SDHCI_OF_ARASAN being the only one of all of them we're using on 
Rockchip platforms.

I vaguely remember depends being preferred over select in general, so you 
don't enable large parts by accident or cause some select chains - but I may 
be wrong.


> Either case
> 
> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

for me as well:
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>


> 
> >  	select GENERIC_PHY
> >  	help
> >  	
> >  	  Support for Rockchip USB2.0 PHY with Innosilicon IP block.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
