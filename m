From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/6] dt-bindings: phy-rockchip-typec: move extcon property
 to be optional.
Date: Thu, 01 Mar 2018 10:49:52 +0100
Message-ID: <379977528.QSC4nRyzFz@diego>
References: <20180301092420.1191-1-enric.balletbo@collabora.com>
 <20180301092420.1191-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180301092420.1191-3-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vicencb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Enric,

Am Donnerstag, 1. M=E4rz 2018, 10:24:16 CET schrieb Enric Balletbo i Serra:
> The extcon property is used to detect the cable-state but some boards,
> like Sapphire, currently does not seem to support, others might just not
> need, as are supposed to work in host-mode only. So, extcon property is
> not really a required property, move to be optional instead.

The change itself is justified, the "justification" in the message might
need some rework, as this sounds more like a kernel-side issue,
while the extcon should always be optional.

Something like:

The extcon property is used to detect the cable-state but some boards
just connect the type-c phy to a regular USB-A connector without any
power-delivery and thus no controller reporting the cable-state.
So the extcon property is not really a required property, move it to be =

optional instead.


For the change itself:
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
> =

>  Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt index
> 6ea867e3176f..a66f23a01129 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> @@ -14,6 +14,8 @@ Required properties:
>   - resets : a list of phandle + reset specifier pairs
>   - reset-names : string reset name, must be:
>  		 "uphy", "uphy-pipe", "uphy-tcphy"
> +
> +Optional properties:
>   - extcon : extcon specifier for the Power Delivery
> =

>  Note, there are 2 type-c phys for RK3399, and they are almost identical,
> except
