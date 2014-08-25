From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: pxa: dts: fix mmc controller compatible string
Date: Mon, 25 Aug 2014 14:53:09 +0800
Message-ID: <CAN1soZyeXsKFHsUU8d8-7SFBECa_ExrMSCvf5WE578LVaMVaLw@mail.gmail.com>
References: <1408009573-24523-1-git-send-email-zonque@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408009573-24523-1-git-send-email-zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bergmann Arnd <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 14, 2014 at 5:46 PM, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The vendor prefix was renamed from "mrvl" to "marvell". Follow this
> change in the dts file.
>
> Signed-off-by: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/pxa2xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
> index febd391..f188f8c 100644
> --- a/arch/arm/boot/dts/pxa2xx.dtsi
> +++ b/arch/arm/boot/dts/pxa2xx.dtsi
> @@ -128,7 +128,7 @@
>                 };
>
>                 mmc0: mmc@41100000 {
> -                       compatible = "mrvl,pxa-mmc";
> +                       compatible = "marvell,pxa-mmc";
>                         reg = <0x41100000 0x1000>;
>                         interrupts = <23>;
>                         dmas = <&dma 21
> --
> 2.0.4
>

Applied these 2 patches.

Regards
Haojian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
