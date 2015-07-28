From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] DEVICETREE: Misc fix for the AR7100 SPI controller binding
Date: Tue, 28 Jul 2015 10:56:22 -0500
Message-ID: <CAL_JsqKw9LqqbkvjbU2L5t1pv-vYtCAvoQXtNj0nPTOeG_1d1w@mail.gmail.com>
References: <1435911297-10389-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435911297-10389-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 3, 2015 at 3:14 AM, Alban Bedel <albeu-GANU6spQydw@public.gmane.org> wrote:
> Fix the clocks property documentation and use lower case for
> hex values in the example.
>
> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>

Applied. Thanks.

Rob

> ---
>  Documentation/devicetree/bindings/spi/spi-ath79.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/spi-ath79.txt b/Documentation/devicetree/bindings/spi/spi-ath79.txt
> index f1ad9c3..9c696fa 100644
> --- a/Documentation/devicetree/bindings/spi/spi-ath79.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-ath79.txt
> @@ -3,7 +3,7 @@ Binding for Qualcomm Atheros AR7xxx/AR9xxx SPI controller
>  Required properties:
>  - compatible: has to be "qca,<soc-type>-spi", "qca,ar7100-spi" as fallback.
>  - reg: Base address and size of the controllers memory area
> -- clocks: phandle to the AHB clock.
> +- clocks: phandle of the AHB clock.
>  - clock-names: has to be "ahb".
>  - #address-cells: <1>, as required by generic SPI binding.
>  - #size-cells: <0>, also as required by generic SPI binding.
> @@ -12,9 +12,9 @@ Child nodes as per the generic SPI binding.
>
>  Example:
>
> -       spi@1F000000 {
> +       spi@1f000000 {
>                 compatible = "qca,ar9132-spi", "qca,ar7100-spi";
> -               reg = <0x1F000000 0x10>;
> +               reg = <0x1f000000 0x10>;
>
>                 clocks = <&pll 2>;
>                 clock-names = "ahb";
> --
> 2.0.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
