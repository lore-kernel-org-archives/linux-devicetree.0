From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: dt: Add Raspberry Pi Zero
Date: Sun, 7 Feb 2016 11:33:10 +0100 (CET)
Message-ID: <841429508.164723.e944b9b3-11a0-4dc4-8c6d-62cb30e79b12.open-xchange@email.1und1.de>
References: <1454571546-25481-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454571546-25481-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lubomir,

> Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> hat am 4. Februar 2016 um 08:39 geschrieben:
>
>
> Notable difference from the other Raspberry Pi boards is the lack of PWR LED.
>
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> ---
> arch/arm/boot/dts/Makefile | 3 ++-
> arch/arm/boot/dts/bcm2835-rpi-zero.dts | 24 ++++++++++++++++++++++++
> 2 files changed, 26 insertions(+), 1 deletion(-)
> create mode 100644 arch/arm/boot/dts/bcm2835-rpi-zero.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d000814..5d38b88 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -64,7 +64,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
> bcm2835-rpi-b-rev2.dtb \
> bcm2835-rpi-b-plus.dtb \
> bcm2835-rpi-a-plus.dtb \
> - bcm2836-rpi-2-b.dtb
> + bcm2836-rpi-2-b.dtb \
> + bcm2835-rpi-zero.dtb
> dtb-$(CONFIG_ARCH_BCM_5301X) += \
> bcm4708-asus-rt-ac56u.dtb \
> bcm4708-asus-rt-ac68u.dtb \
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts
> b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
> new file mode 100644
> index 0000000..f9afc1a
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
> @@ -0,0 +1,24 @@
> +/dts-v1/;
> +#include "bcm2835.dtsi"
> +#include "bcm2835-rpi.dtsi"
> +
> +/ {
> + compatible = "raspberrypi,model-zero", "brcm,bcm2835";

please add this to

Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt

Thanks
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
