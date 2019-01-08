From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Add DT for NanoPi M4
Date: Tue, 08 Jan 2019 23:15:34 +0100
Message-ID: <1755553.je4OVlYtzY@phil>
References: <cover.1546981251.git.robin.murphy@arm.com>
 <324b75bbeef2552ddde62f4e1834ac908a45bebd.1546981251.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <324b75bbeef2552ddde62f4e1834ac908a45bebd.1546981251.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Robin,

Am Dienstag, 8. Januar 2019, 22:57:24 CET schrieb Robin Murphy:
> There are a number of subtle differences between the nanopi4 variants,
> and where they disagree, the common DTSI currently follows the details
> of NanoPi M4. In order to improve matters even more, let's add a
> separate DTS for the M4 to which we can start splitting things out
> appropriately. The third variant, NanoPi NEO4, is a lot closer to the M4
> than either is to the larger T4, so arguably could get away with just
> sharing the M4 DT for now (plus I have neither of the smaller boards to
> actually test with).
> 
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

I'm not sure if Rob actually checks the devicetree list or relies on
patches Cc'ed directly to him for binding review, so you might want
to add the 2 dt maintainers explicitly.

> ---
>  .../devicetree/bindings/arm/rockchip.yaml      |  5 +++++
>  arch/arm64/boot/dts/rockchip/Makefile          |  1 +
>  .../boot/dts/rockchip/rk3399-nanopi-m4.dts     | 18 ++++++++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index bcc60c492a12..b4756e0cb7d0 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -92,6 +92,11 @@ properties:
>            - const: friendlyarm,nanopc-t4
>            - const: rockchip,rk3399
>  
> +      - description: FriendlyElec NanoPi M4
> +        items:
> +          - const: friendlyarm,nanopi-m4
> +          - const: rockchip,rk3399
> +

When we hashed out the Rockchip yaml thingy, there also
came up the possibility of grouping the similar boards together
into an enum, see the rk3399-firefly or the rk3288-evb-* for example.

So the binding for both could possibly become:

      - description: FriendlyElec NanoPi
        items:
	  - enum:
          	- friendlyarm,nanopi-m4
          	- friendlyarm,nanopi-t4
          - const: rockchip,rk3399

We didn't come up with a hard rule for all cases, but the
Nano PI feels like it qualifies ;-)


Heiko



>        - description: GeekBuying GeekBox
>          items:
>            - const: geekbuying,geekbox
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 1c7406111dfd..91a669378605 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -17,6 +17,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-kevin.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-scarlet-inx.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-scarlet-kd.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-m4.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock960.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts
> new file mode 100644
> index 000000000000..8d3f0ba29c72
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * FriendlyElec NanoPi M4 board device tree source
> + *
> + * Copyright (c) 2018 FriendlyElec Computer Tech. Co., Ltd.
> + * (http://www.friendlyarm.com)
> + *
> + * Copyright (c) 2018 Collabora Ltd.
> + * Copyright (c) 2019 Arm Ltd.
> + */
> +
> +/dts-v1/;
> +#include "rk3399-nanopi4.dtsi"
> +
> +/ {
> +	model = "FriendlyElec NanoPi M4";
> +	compatible = "friendlyarm,nanopi-m4", "rockchip,rk3399";
> +};
> 
