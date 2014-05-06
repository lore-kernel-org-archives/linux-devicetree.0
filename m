From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: rockchip: add root compatible properties
Date: Tue, 6 May 2014 12:23:43 -0500
Message-ID: <CAL_JsqJ0k2ke91oZwrDUS3YMq6rDE4n7qbnTidThJKMvEZ94mg@mail.gmail.com>
References: <1399396211-25353-1-git-send-email-b.galvani@gmail.com>
	<1399396211-25353-2-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399396211-25353-2-git-send-email-b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 6, 2014 at 12:10 PM, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add the missing 'compatible' property to device tree root node of
>
>  - rk3066a-bqcurie2.dts
>  - rk3188-radxarock.dts
>
> and document the new values.
>
> Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>
> v2:
>  - use mundoreader prefix instead of bq as suggested by Heiko Stuebner
>
>  Documentation/devicetree/bindings/arm/rockchip.txt |   10 ++++++++++
>  arch/arm/boot/dts/rk3066a-bqcurie2.dts             |    1 +
>  arch/arm/boot/dts/rk3188-radxarock.dts             |    1 +
>  3 files changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/rockchip.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
> new file mode 100644
> index 0000000..857f126
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> @@ -0,0 +1,10 @@
> +Rockchip platforms device tree bindings
> +---------------------------------------
> +
> +- bq Curie 2 tablet:
> +    Required root node properties:
> +      - compatible = "mundoreader,bq-curie2", "rockchip,rk3066a";
> +
> +- Radxa Rock board:
> +    Required root node properties:
> +      - compatible = "radxa,rock", "rockchip,rk3188";
> diff --git a/arch/arm/boot/dts/rk3066a-bqcurie2.dts b/arch/arm/boot/dts/rk3066a-bqcurie2.dts
> index 035df40..afb3273 100644
> --- a/arch/arm/boot/dts/rk3066a-bqcurie2.dts
> +++ b/arch/arm/boot/dts/rk3066a-bqcurie2.dts
> @@ -18,6 +18,7 @@
>
>  / {
>         model = "bq Curie 2";
> +       compatible = "mundoreader,bq-curie2", "rockchip,rk3066a";
>
>         memory {
>                 reg = <0x60000000 0x40000000>;
> diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
> index 3ba1968..a5eee55 100644
> --- a/arch/arm/boot/dts/rk3188-radxarock.dts
> +++ b/arch/arm/boot/dts/rk3188-radxarock.dts
> @@ -17,6 +17,7 @@
>
>  / {
>         model = "Radxa Rock";
> +       compatible = "radxa,rock", "rockchip,rk3188";
>
>         memory {
>                 reg = <0x60000000 0x80000000>;
> --
> 1.7.10.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
