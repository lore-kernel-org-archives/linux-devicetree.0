From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v3] mtd: hisilicon: add device tree node for NAND controller
Date: Thu, 26 Mar 2015 10:13:29 +0800
Message-ID: <CAD6h2NQr_Z600vC+7RRuLgoGvV4MCXz8TAd4C5eCnqbA0ZdPWw@mail.gmail.com>
References: <1427267091-227474-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427267091-227474-1-git-send-email-wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Liguozhu (Kenneth)" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25 March 2015 at 15:04, Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org> wrote:
> This patch adds dts support for NAND flash controller of Hisilicon Soc Hip04.
> Now it is based on v4.0-rc5
>
> Changes in v3:
> - Change E-mail address in signed-off-by to "wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org"
> Changes in v2:
> - Base on v3.19-rc1
> - Use nand-ecc-strength, nand-ecc-step-size to replace hisi,nand-ecc-bits
> Changes in v1:
> - Move partition and other board related information into board dts file:
>   hip04-d01.dts
>
> Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  arch/arm/boot/dts/hip04-d01.dts | 27 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/hip04.dtsi    |  7 +++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm/boot/dts/hip04-d01.dts b/arch/arm/boot/dts/hip04-d01.dts
> index 40a9e33..ba04dd5 100644
> --- a/arch/arm/boot/dts/hip04-d01.dts
> +++ b/arch/arm/boot/dts/hip04-d01.dts
> @@ -28,5 +28,32 @@
>                 uart0: uart@4007000 {
>                         status = "ok";
>                 };
> +
> +               nand: nand@4020000 {
> +                       nand-bus-width = <8>;
> +                       nand-ecc-mode = "hw";
> +                       nand-ecc-strength = <16>;
> +                       nand-ecc-step-size = <1024>;
> +
> +                       partition@0 {
> +                               label = "nand_text";
> +                               reg = <0x00000000 0x00400000>;
> +                       };
> +
> +                       partition@00400000 {
> +                               label = "nand_monitor";
> +                               reg = <0x00400000 0x00400000>;
> +                       };
> +
> +                       partition@00800000 {
> +                               label = "nand_kernel";
> +                               reg = <0x00800000 0x00800000>;
> +                       };
> +
> +                       partition@01000000 {
> +                               label = "nand_fs";
> +                               reg = <0x01000000 0x1f000000>;
> +                       };
> +               };
>         };
>  };
> diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.dtsi
> index 2388145..ac32fce 100644
> --- a/arch/arm/boot/dts/hip04.dtsi
> +++ b/arch/arm/boot/dts/hip04.dtsi
> @@ -269,6 +269,13 @@
>                         interrupts = <0 372 4>;
>                 };
>
> +               nand: nand@4020000 {
> +                       compatible = "hisilicon,504-nfc";
> +                       reg = <0x4020000 0x10000>, <0x5000000 0x1000>;
> +                       interrupts = <0 379 4>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +               };
>         };
>
>         etb@0,e3c42000 {
> --
> 1.9.1
>

Acked-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
