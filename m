From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: bcm283x: fix typo in mailbox address
Date: Sun, 30 Oct 2016 16:34:18 +0100
Message-ID: <6b13e96d-78d1-fcab-4273-803310ae4da6@suse.de>
References: <1477505640-26658-1-git-send-email-stefan.wahren@i2se.com>
 <1477505640-26658-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477505640-26658-2-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 26.10.2016 um 20:14 schrieb Stefan Wahren:
> The address of the mailbox node in the bcm283x.dts has also a typo.

.dts -> .dtsi

"also has" or maybe "has the same typo as in the binding example"?

> So fix it accordingly.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> Fixes: 05b682b7a3b2 ("ARM: bcm2835: dt: Add the mailbox to the device tree")
> ---
>  arch/arm/boot/dts/bcm283x.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
> index 46d46d8..74dd21b 100644
> --- a/arch/arm/boot/dts/bcm283x.dtsi
> +++ b/arch/arm/boot/dts/bcm283x.dtsi
> @@ -104,7 +104,7 @@
>  			reg = <0x7e104000 0x10>;
>  		};
>  
> -		mailbox: mailbox@7e00b800 {
> +		mailbox: mailbox@7e00b880 {
>  			compatible = "brcm,bcm2835-mbox";
>  			reg = <0x7e00b880 0x40>;
>  			interrupts = <0 1>;

Otherwise,

Reviewed-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>

At one point in time dtc did complain about such mismatches...

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
