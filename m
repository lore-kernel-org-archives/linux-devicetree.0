From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm64: mt8173.dtsi: correct i2c node names
Date: Wed, 16 Sep 2015 21:34:46 +0800
Message-ID: <CAGS+omCzycc+RFeDftooDcj_f9M4SXhoO79u8m9e=ZiL1QV1tA@mail.gmail.com>
References: <1442367325-55819-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442367325-55819-1-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 16, 2015 at 9:35 AM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Node name in device tree should describe general class of the
> device. Correct incorrect i2c node names.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
> This is based on v4.3-rc1.
> All the other i2c node names are correct.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index d18ee42..7f360b7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -365,7 +365,7 @@
>                         status = "disabled";
>                 };
>
> -               i2c3: i2c3@11010000 {
> +               i2c3: i2c@11010000 {
>                         compatible = "mediatek,mt8173-i2c";
>                         reg = <0 0x11010000 0 0x70>,
>                               <0 0x11000280 0 0x80>;
> @@ -381,7 +381,7 @@
>                         status = "disabled";
>                 };
>
> -               i2c4: i2c4@11011000 {
> +               i2c4: i2c@11011000 {
>                         compatible = "mediatek,mt8173-i2c";
>                         reg = <0 0x11011000 0 0x70>,
>                               <0 0x11000300 0 0x80>;
> @@ -397,7 +397,7 @@
>                         status = "disabled";
>                 };
>
> -               i2c6: i2c6@11013000 {
> +               i2c6: i2c@11013000 {
>                         compatible = "mediatek,mt8173-i2c";
>                         reg = <0 0x11013000 0 0x70>,
>                               <0 0x11000080 0 0x80>;
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
