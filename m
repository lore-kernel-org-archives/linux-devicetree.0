From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: bcm2835: dt: Add the ethernet to the device
 trees
Date: Fri, 5 Feb 2016 21:13:12 -0700
Message-ID: <56B572D8.9030701@wwwdotorg.org>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
 <1454571364-24708-2-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454571364-24708-2-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>, popcornmix <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/04/2016 12:36 AM, Lubomir Rintel wrote:
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
> pid/vid pair for the Version 2 was provided by Olivier Blin. Original
> Model B is a blind short, though very likely correct.

The series,
Tested-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

A few nits though...

>  arch/arm/boot/dts/bcm2835-rpi-b-plus.dts | 18 ++++++++++++++++++
>  arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts | 18 ++++++++++++++++++
>  arch/arm/boot/dts/bcm2835-rpi-b.dts      | 18 ++++++++++++++++++
>  arch/arm/boot/dts/bcm2836-rpi-2-b.dts    | 18 ++++++++++++++++++
>  arch/arm/boot/dts/bcm283x.dtsi           |  4 +++-

Rather than cut/paste everything, can't we share the duplicate content
using a *.dtsi file? IIRC some dtsi files already exist. Perhaps there
could be a bcm283x-rpi-smsc9512.dtsi and bcm283x-rpi-smsc9514.dtsi, and
even a bcm283x-rpi-smsc-eth.dtsi since 99% of those two are common?
Hopefully that doesn't sound like busy work/bike-shedding too much.

> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts

> +&usb {
> +	usb1@1 {
> +		compatible = "usb0424,9514";
> +		reg = <01>;

Here and ...

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethernet: usbether@1 {
> +			compatible = "usb0424,ec00";
> +			reg = <01>;

... here, reg should be "1" not "01". Same in all the files.

> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts

> +&usb {
> +	usb1@1 {
> +		compatible = "usb0424,9512";

I don't think that ID is correct. On my systems, I have:

RPi B (original, rev 1, 2 USB ports): 9512
RPi B (rev 2 w/ P5, 2 USB ports): 9512
RPi B+ (4 USB ports): 9514
RPi 2 (4 USB ports): 9514

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
