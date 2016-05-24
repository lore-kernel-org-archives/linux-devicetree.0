From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: add used but undocumented rockchip grf
 compatible values
Date: Tue, 24 May 2016 10:05:58 +0800
Message-ID: <a31feead-5bc1-a77d-d4c5-111b7ba82b9d@rock-chips.com>
References: <1464015539-19521-1-git-send-email-heiko@sntech.de>
 <1464015539-19521-2-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464015539-19521-2-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=D4=DA 2016/5/23 22:58, Heiko Stuebner =D0=B4=B5=C0:
> There are some more General Register Files used in devicetree files
> already, but as of now undocumented in the binding document, fix that=
=2E
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---

Reviewed-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

>  Documentation/devicetree/bindings/soc/rockchip/grf.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b=
/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> index 013e71a..c6e62cb 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> @@ -5,11 +5,13 @@ is composed of many registers for system control.
>
>  From RK3368 SoCs, the GRF is divided into two sections,
>  - GRF, used for general non-secure system,
> +- SGRF, used for general secure system,
>  - PMUGRF, used for always on system
>
>  Required Properties:
>
>  - compatible: GRF should be one of the followings
> +   - "rockchip,rk3036-grf", "syscon": for rk3036
>     - "rockchip,rk3066-grf", "syscon": for rk3066
>     - "rockchip,rk3188-grf", "syscon": for rk3188
>     - "rockchip,rk3228-grf", "syscon": for rk3228
> @@ -19,6 +21,8 @@ Required Properties:
>  - compatible: PMUGRF should be one of the followings
>     - "rockchip,rk3368-pmugrf", "syscon": for rk3368
>     - "rockchip,rk3399-pmugrf", "syscon": for rk3399
> +- compatible: SGRF should be one of the following
> +   - "rockchip,rk3288-sgrf", "syscon": for rk3288
>  - reg: physical base address of the controller and length of memory =
mapped
>    region.
>
>


--=20
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
