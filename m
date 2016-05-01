From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4] ARM: bcm2835: dt: Add the ethernet to the device trees
Date: Sun, 1 May 2016 10:58:43 -0600
Message-ID: <572635C3.7070102@wwwdotorg.org>
References: <1462000432-18452-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462000432-18452-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/30/2016 01:13 AM, Lubomir Rintel wrote:
> The hub and the ethernet in its port 1 are hardwired on the board.
>
> Compared to the adapters that can be plugged into the USB ports, this
> one has no serial EEPROM to store its MAC. Nevertheless, the Raspberry Pi
> has the MAC address for this adapter in its ROM, accessible from its
> firmware.
>
> U-Boot can read out the address and set the local-mac-address property of the
> node with "ethernet" alias. Let's add the node so that U-Boot can do its
> business.
>
> Model B rev2 and Model B+ entries were verified by me, the hierarchy and
> pid/vid pair for the Version 2 was provided by Peter Chen. Original
> Model B is a blind short, though very likely correct.

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

One nit:

> diff --git a/arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi b/arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi
> new file mode 100644
> index 0000000..7200238
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi
> @@ -0,0 +1,20 @@
> +
> +/ {

There's an extra blank line at the top of the file.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
