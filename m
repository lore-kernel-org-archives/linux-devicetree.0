From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: nvmem: add description for UniPhier eFuse
Date: Mon, 4 Sep 2017 21:55:39 +0900
Message-ID: <CAK7LNASLh4vYqZhM9g2AL1uUtieviAmmWOp_Mzoj0zG=Ejz0cA@mail.gmail.com>
References: <1504221620-358-1-git-send-email-hayashibara.keiji@socionext.com> <1504221620-358-2-git-send-email-hayashibara.keiji@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504221620-358-2-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Kiyoshi Owada <owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-09-01 8:20 GMT+09:00 Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> Add uniphier-efuse dt-bindings documentation.
>
> Signed-off-by: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>  .../devicetree/bindings/nvmem/uniphier-efuse.txt   | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt
>
> diff --git a/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt b/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt
> new file mode 100644
> index 0000000..09024a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/uniphier-efuse.txt
> @@ -0,0 +1,45 @@
> += UniPhier eFuse device tree bindings =
> +
> +This UniPhier eFuse must be under soc-glue.
> +
> +Required properties:
> +- compatible: should be "socionext,uniphier-efuse"
> +- reg: should contain the register base and length
> +
> += Data cells =
> +Are child nodes of efuse, bindings of which as described in
> +bindings/nvmem/nvmem.txt
> +
> +Example:
> +
> +       soc-glue@5f900000 {
> +               compatible = "socionext,uniphier-ld20-soc-glue-debug",
> +                            "simple-mfd";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x5f900000 0x2000>;


IMHO, I think an empty "ranges;" will clarify the code,
but it is up to your taste.


> +
> +               efuse {
> +                       compatible = "socionext,uniphier-efuse",
> +                                    "syscon";


You are adding a dedicated driver for "socionext,uniphier-efuse".

Then, "syscon" as well?




> +                       reg = <0x100 0xf00>;


Not so many efuse registers exist on the SoC.

reg = <0x100 0x200>; will be enough.


Or if you want to be strict to the hw spec, you can write as follows:

        soc-glue@5f900000 {
               compatible = "socionext,uniphier-ld20-soc-glue-debug";
                            "simple-mfd";
               #address-cells = <1>;
               #size-cells = <1>;
               ranges = <0x0 0x5f900000 0x2000>;

               efuse@100 {
                           compatible = "socionext,uniphier-efuse";
                           reg = <0x100 0x28>;
               };

               efuse@200 {
                           compatible = "socionext,uniphier-efuse";
                           reg = <0x200 0x68>;
               };
       };




> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       /* Data cells */
> +                       usb_mon: usb_mon {
> +                               reg = <0x154 0xc>;
> +                       };


This <0x154 0xc> represents 0x5f900254 in CPU address view.
(0x5f900000 + 0x100 + 0x154)

So many ranges conversion, and how error-prone..





> +       };
> +
> += Data consumers =
> +Are device nodes which consume nvmem data cells.
> +
> +Example:
> +
> +       usb {
> +               ...
> +               nvmem-cells = <&usb_mon>;
> +               nvmem-cell-names = "usb_mon";
> +       }
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
