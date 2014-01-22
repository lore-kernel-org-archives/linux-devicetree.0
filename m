From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: Rename Broadcom Capri pinctrl driver
Date: Tue, 21 Jan 2014 16:59:35 -0800
Message-ID: <CAOesGMj7wXJ+DfXzk0U1pusKqZShq+KJdPY8hh=Ffj7KDti4_Q@mail.gmail.com>
References: <1390343886-25852-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390343886-25852-1-git-send-email-syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,


On Tue, Jan 21, 2014 at 2:38 PM, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> To be consistent with other Broadcom drivers, the Broadcom Capri pinctrl
> driver and its related CONFIG option are renamed to bcm281xx.
>
> Devicetree compatible string and binding documentation use
> "brcm,bcm11351-pinctrl" to match the machine binding here:
> Documentation/devicetree/bindings/arm/bcm/bcm11351.txt
>
> This driver supports pinctrl on BCM11130, BCM11140, BCM11351, BCM28145
> and BCM28155 SoCs.
>
> Signed-off-by: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  ...capri-pinctrl.txt => brcm,bcm11351-pinctrl.txt} |    8 +-
>  arch/arm/boot/dts/bcm11351.dtsi                    |    2 +-
>  arch/arm/configs/bcm_defconfig                     |    2 +-
>  drivers/pinctrl/Kconfig                            |    8 +-
>  drivers/pinctrl/Makefile                           |    2 +-
>  .../{pinctrl-capri.c => pinctrl-bcm281xx.c}        | 1521 ++++++++++----------
>  6 files changed, 775 insertions(+), 768 deletions(-)
>  rename Documentation/devicetree/bindings/pinctrl/{brcm,capri-pinctrl.txt => brcm,bcm11351-pinctrl.txt} (98%)
>  rename drivers/pinctrl/{pinctrl-capri.c => pinctrl-bcm281xx.c} (25%)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,capri-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm11351-pinctrl.txt
> similarity index 98%
> rename from Documentation/devicetree/bindings/pinctrl/brcm,capri-pinctrl.txt
> rename to Documentation/devicetree/bindings/pinctrl/brcm,bcm11351-pinctrl.txt
> index 9e9e9ef..c119deb 100644
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,capri-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm11351-pinctrl.txt
> @@ -1,4 +1,4 @@
> -Broadcom Capri Pin Controller
> +Broadcom BCM281xx Pin Controller
>
>  This is a pin controller for the Broadcom BCM281xx SoC family, which includes
>  BCM11130, BCM11140, BCM11351, BCM28145, and BCM28155 SoCs.
> @@ -7,14 +7,14 @@ BCM11130, BCM11140, BCM11351, BCM28145, and BCM28155 SoCs.
>
>  Required Properties:
>
> -- compatible:  Must be "brcm,capri-pinctrl".
> +- compatible:  Must be "brcm,bcm11351-pinctrl"

Since the original binding is queued for 3.14 (I believe?), if this
rename isn't merged for 3.14 then you will still need to accept the
old compatible string (binding). You can document it as deprecated,
but the driver needs to still probe with it.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
