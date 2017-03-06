From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: add DT bindings for usb2-phy grf
Date: Mon, 06 Mar 2017 04:59:44 +0100
Message-ID: <2314169.2PShvd0WLX@diego>
References: <1488763778-27499-1-git-send-email-daniel.meng@rock-chips.com>
 <1488763778-27499-3-git-send-email-daniel.meng@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488763778-27499-3-git-send-email-daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 6. M=E4rz 2017, 09:29:37 CET schrieb Meng Dongyang:
> Adds the device tree bindings description for usb2-phy grf
> of RK3328 platform.
> =

> Changes in v2:
>  - add usb2-phy grf specification
> Chagnes in v3:
>  - remove the example of usb2-phy grf
> =

> Signed-off-by: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

looks good now,

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> b/Documentation/devicetree/bindings/soc/rockchip/grf.txt index
> 013e71a..af5b44d 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> @@ -7,6 +7,8 @@ From RK3368 SoCs, the GRF is divided into two sections,
>  - GRF, used for general non-secure system,
>  - PMUGRF, used for always on system
> =

> +On RK3328 SoCs, the GRF adds a section for USB2PHYGRF,
> +
>  Required Properties:
> =

>  - compatible: GRF should be one of the followings
> @@ -19,6 +21,8 @@ Required Properties:
>  - compatible: PMUGRF should be one of the followings
>     - "rockchip,rk3368-pmugrf", "syscon": for rk3368
>     - "rockchip,rk3399-pmugrf", "syscon": for rk3399
> +- compatible: USB2PHYGRF should be one of the followings
> +   - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
>  - reg: physical base address of the controller and length of memory mapp=
ed
>    region.
