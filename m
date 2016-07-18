From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add spiX aliases for rk3399
Date: Mon, 18 Jul 2016 22:50:37 +0200
Message-ID: <2463583.1KcLgghiy0@diego>
References: <1468545873-134339-1-git-send-email-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468545873-134339-1-git-send-email-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 14. Juli 2016, 18:24:33 schrieb Brian Norris:
> It's nicer to see this:
> 
>     # ls -l /sys/bus/spi/devices/
>     total 0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi0.0 ->
> ../../../devices/platform/ff1c0000.spi/spi_master/spi0/spi0.0 lrwxrwxrwx 1
> root root 0 Dec 31  1969 spi1.0 ->
> ../../../devices/platform/ff1d0000.spi/spi_master/spi1/spi1.0 lrwxrwxrwx 1
> root root 0 Dec 31  1969 spi2.0 ->
> ../../../devices/platform/ff1e0000.spi/spi_master/spi2/spi2.0 lrwxrwxrwx 1
> root root 0 Dec 31  1969 spi5.0 ->
> ../../../devices/platform/ff200000.spi/spi_master/spi5/spi5.0
> 
> than this:
> 
>     # ls -l /sys/bus/spi/devices/
>     total 0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32763.0 ->
> ../../../devices/platform/ff200000.spi/spi_master/spi32763/spi32763.0
> lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32764.0 ->
> ../../../devices/platform/ff1e0000.spi/spi_master/spi32764/spi32764.0
> lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32765.0 ->
> ../../../devices/platform/ff1d0000.spi/spi_master/spi32765/spi32765.0
> lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32766.0 ->
> ../../../devices/platform/ff1c0000.spi/spi_master/spi32766/spi32766.0
> 
> With the latter, it's much clearer which bus devices are on.
> 
> Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

applied for 4.9

Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
