From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add spiX aliases for rk3399
Date: Tue, 19 Jul 2016 08:39:55 +0200
Message-ID: <20160719063955.GE5368@pengutronix.de>
References: <1468545873-134339-1-git-send-email-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468545873-134339-1-git-send-email-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, Jul 14, 2016 at 06:24:33PM -0700, Brian Norris wrote:
> It's nicer to see this:
> =

>     # ls -l /sys/bus/spi/devices/
>     total 0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi0.0 -> ../../../devices/plat=
form/ff1c0000.spi/spi_master/spi0/spi0.0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi1.0 -> ../../../devices/plat=
form/ff1d0000.spi/spi_master/spi1/spi1.0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi2.0 -> ../../../devices/plat=
form/ff1e0000.spi/spi_master/spi2/spi2.0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi5.0 -> ../../../devices/plat=
form/ff200000.spi/spi_master/spi5/spi5.0
> =

> than this:
> =

>     # ls -l /sys/bus/spi/devices/
>     total 0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32763.0 -> ../../../devices/=
platform/ff200000.spi/spi_master/spi32763/spi32763.0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32764.0 -> ../../../devices/=
platform/ff1e0000.spi/spi_master/spi32764/spi32764.0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32765.0 -> ../../../devices/=
platform/ff1d0000.spi/spi_master/spi32765/spi32765.0
>     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32766.0 -> ../../../devices/=
platform/ff1c0000.spi/spi_master/spi32766/spi32766.0
> =

> With the latter, it's much clearer which bus devices are on.
> =

> Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3399.dtsi
> index 4c84229789ef..b04abbfd4898 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -70,6 +70,12 @@
>  		serial2 =3D &uart2;
>  		serial3 =3D &uart3;
>  		serial4 =3D &uart4;
> +		spi0 =3D &spi0;
> +		spi1 =3D &spi1;
> +		spi2 =3D &spi2;
> +		spi3 =3D &spi3;
> +		spi4 =3D &spi4;
> +		spi5 =3D &spi5;

Note that Rob Herring (with his dt-maintainer hat on) doesn't like these
aliases.
See for example:
	http://mid.gmane.org/20160705140546.GA10601@rob-hp-laptop

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
