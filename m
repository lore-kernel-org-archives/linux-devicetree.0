From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH V3 RFT 3/5] ARM64: dts: bcm283x: Use dtsi for USB host
 mode
Date: Wed, 31 Aug 2016 09:59:36 +0200
Message-ID: <bb073ea3-2f89-4fc5-e3af-2e27c54f221e@i2se.com>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com>
 <1471792204-21908-4-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471792204-21908-4-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gerd,

Am 21.08.2016 um 17:10 schrieb Stefan Wahren:
> In case dr_mode isn't passed via DT, the dwc2 driver defaults
> to OTG mode. But the Raspberry Pi 3 is designed only for host mode.
> So fix this issue by linking to the dtsi file which set the dr_mode
> to host.

this patch is pending and the rest has been merged. Since i don't have a
RPi 3 it's only compile tested.

Could you please test it (requires patch 1 and 2 of this series) on your
RPi 3?

Regards
Stefan

>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts   |    1 +
>  .../boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi    |    1 +
>  2 files changed, 2 insertions(+)
>  create mode 120000 arch/arm64/boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> index 7841b72..7625e57 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> @@ -2,6 +2,7 @@
>  #include "bcm2837.dtsi"
>  #include "bcm2835-rpi.dtsi"
>  #include "bcm283x-rpi-smsc9514.dtsi"
> +#include "bcm283x-rpi-usb-host.dtsi"
>  
>  / {
>  	compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
> diff --git a/arch/arm64/boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi b/arch/arm64/boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi
> new file mode 120000
> index 0000000..cbeebe3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi
> @@ -0,0 +1 @@
> +../../../../arm/boot/dts/bcm283x-rpi-usb-host.dtsi
> \ No newline at end of file


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
