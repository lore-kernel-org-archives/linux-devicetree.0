From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
Date: Wed, 24 Jul 2019 10:37:39 -0600
Message-ID: <20190724163739.GA29502@bogus>
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
 <20190708100641.2702-2-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190708100641.2702-2-dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, shengnan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bingbu.cao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 08, 2019 at 06:06:40PM +0800, dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> =

> Add the Devicetree binding documentation and MAINTAINERS entry for dw9768.
> =

> Signed-off-by: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt | 9 ++++=
+++++
>  MAINTAINERS                                                     | 7 ++++=
+++
>  2 files changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,=
dw9768.txt
> =

> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.=
txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> new file mode 100644
> index 0000000..94b8ec3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> @@ -0,0 +1,9 @@
> +Dongwoon Anatech DW9768 camera voice coil lens driver
> +
> +DW9768 is a 10-bit DAC with current sink capability. It is intended
> +for driving voice coil lenses in camera modules.
> +
> +Mandatory properties:
> +
> +- compatible: "dongwoon,dw9768"
> +- reg: I=B2C slave address

Why not shared with the existing DW9807 binding? Or this could be a =

trivial device.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5cfbea4..8f6ac93 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4872,6 +4872,13 @@ S:	Maintained
>  F:	drivers/media/i2c/dw9714.c
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
>  =

> +DONGWOON DW9768 LENS VOICE COIL DRIVER
> +M:	Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> +L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> +
>  DONGWOON DW9807 LENS VOICE COIL DRIVER
>  M:	Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>  L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> -- =

> 2.9.2
> =
