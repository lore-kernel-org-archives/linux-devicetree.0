From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: imx: Pass empty memory size on board dts
Date: Wed, 24 Jan 2018 10:26:34 -0200
Message-ID: <CAOMZO5DFH1yuihOcdhtx+7o2+gHjt-CxTRfu1Jt3F5CdEUWxuQ@mail.gmail.com>
References: <1516796485-24912-1-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516796485-24912-1-git-send-email-marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Oi Marco,

On Wed, Jan 24, 2018 at 10:21 AM, Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> In preparation for removing 'reg = <0 0>;' from the dtsi SoC files, pass
> 'reg = <0 0 >;' to the dts/dtsi board files that do not pass the memory
> size.
>
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
> ---
> Change since v1:
> -none

Quando for enviar pra lista retire isso e remova o v2 do Subject.

>  arch/arm/boot/dts/imx51-zii-rdu1.dts         | 5 +++++
>  arch/arm/boot/dts/imx53-tx53.dtsi            | 5 +++++
>  arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts | 5 +++++
>  arch/arm/boot/dts/imx6dl-dfi-fs700-m60.dts   | 5 +++++
>  arch/arm/boot/dts/imx6dl-ts4900.dts          | 5 +++++
>  arch/arm/boot/dts/imx6dl-ts7970.dts          | 5 +++++
>  arch/arm/boot/dts/imx6q-dfi-fs700-m60.dts    | 5 +++++
>  arch/arm/boot/dts/imx6q-h100.dts             | 5 +++++
>  arch/arm/boot/dts/imx6q-novena.dts           | 5 +++++
>  arch/arm/boot/dts/imx6q-ts4900.dts           | 5 +++++
>  arch/arm/boot/dts/imx6q-ts7970.dts           | 5 +++++
>  arch/arm/boot/dts/imx6q-zii-rdu2.dts         | 5 +++++
>  arch/arm/boot/dts/imx6qdl-apalis.dtsi        | 5 +++++
>  arch/arm/boot/dts/imx6qdl-cubox-i.dtsi       | 5 +++++
>  arch/arm/boot/dts/imx6qdl-hummingboard.dtsi  | 5 +++++
>  arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 5 +++++
>  arch/arm/boot/dts/imx6qp-zii-rdu2.dts        | 5 +++++
>  17 files changed, 85 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
> index 5306b78..f20fdd9 100644
> --- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
> +++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
> @@ -51,6 +51,11 @@
>                 stdout-path = &uart1;
>         };
>
> +       /* Will be filled by the bootloader */
> +       memory@0 {

Favor remover o @0.

Eu sei que isso vai dar warning, mas temos que remover o @0, pois 0
nao eh o endereco real.

O bootloader vai preencher com o endereco correto.

Depois cada board maintainer pode passar o tamanho minimo (no caso de
varias placas forem suportadas) pra resolver esses warnings.

Valeu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
