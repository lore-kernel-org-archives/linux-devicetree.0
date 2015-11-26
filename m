From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v8 2/2] arm64: dts: mt8173: Add nor flash node
Date: Thu, 26 Nov 2015 09:20:48 +0800
Message-ID: <CAGS+omBVfc=BPLoobOJSDPnbv97PnGsRxUTF1gbXEz4DeufbmQ@mail.gmail.com>
References: <1447817403-16631-1-git-send-email-bayi.cheng@mediatek.com> <1447817403-16631-3-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447817403-16631-3-git-send-email-bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bayi, Matthias,

Sorry for the late review, one comment below...

On Wed, Nov 18, 2015 at 11:30 AM, Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Add Mediatek nor flash node
>
> Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Acked-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 4dd5f93..7988656 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -387,7 +387,23 @@
>                         status = "disabled";
>                 };
>
> -               i2c3: i2c@11010000 {
> +               nor_flash: spi@1100d000 {
> +                       compatible = "mediatek,mt8173-nor";
> +                       reg = <0 0x1100d000 0 0xe0>;
> +                       clocks = <&pericfg CLK_PERI_SPI>,
> +                                <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +                       clock-names = "spi", "sf";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +
> +                       flash@0 {
> +                               compatible = "jedec,spi-nor";
> +                               reg = <0>;
> +                       };

I think this flash@0 node represents the flash device present on the
board and should therefore be moved to the board-specific .dts.

-Dan

> +               };
> +
> +               i2c3: i2c3@11010000 {
>                         compatible = "mediatek,mt8173-i2c";
>                         reg = <0 0x11010000 0 0x70>,
>                               <0 0x11000280 0 0x80>;
> --
> 1.8.1.1.dirty
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
