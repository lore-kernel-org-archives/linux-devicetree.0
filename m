From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 09/32] bcm2837-rpi-3-b.dts for 32bit arm
Date: Thu, 02 Jun 2016 00:39:02 +0200
Message-ID: <5616246.RRQ2rLjLud@wuerfel>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com> <7065434.SNfT8zjcK3@wuerfel> <87zir4leyc.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87zir4leyc.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, June 1, 2016 3:30:35 PM CEST Eric Anholt wrote:
> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
> 
> > On Wednesday, June 1, 2016 11:43:18 PM CEST Gerd Hoffmann wrote:
> >> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> >> new file mode 100644
> >> index 0000000..36178a6
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> >> @@ -0,0 +1 @@
> >> +#include "../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts"
> >> -- 
> >> 1.8.3.1
> >> 
> >
> > What does this gain you?
> 
> Many Raspberry Pi users use a small set of SD cards that they swap
> between various versions of the hardware.  It would be good to have
> their 32-bit OS images work on the Pi3 as well.

Sure, but you already have the dts file in the other directory,
and the dtb is the same.

According to the comment in the other patch, the idea was to have
the file in the arm64 directory because it's a 64-bit platform,
but now you have it here as well.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
