From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: specifying order of /dev/mmcblk devices via device-tree?
Date: Fri, 28 Oct 2016 16:37:55 +0100
Message-ID: <20161028153755.GL5806@leverpostej>
References: <CAJ+vNU1g8nQedd06LeaD10YWUQ_UmdRToUMFKaTNT1aNY56b0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU1g8nQedd06LeaD10YWUQ_UmdRToUMFKaTNT1aNY56b0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 28, 2016 at 08:23:04AM -0700, Tim Harvey wrote:
> Greetings,
> 
> I have an IMX6 board that has the following:
> sdhc1: mmc0: sdio radio
> sdhc2: mmc1: /dev/mmcblk1: microSD connector
> sdhc3: mmc2: /dev/mmcblk2: on-board eMMC
> 
> I would like to have sdhc3 registered as /dev/mmcblk0 and sdhc2
> registered as /dev/mmcblk1 so that permanent storage is the first
> mmcblk device as I think this is more intuitive however currently
> these get instanced in the order they appear in the imx6qdl.dtsi
> device-tree configuration and are not able to be mapped the way I want
> them in my dts file.
> 
> Is there a way, or if not is there a desire for a way, to specify the
> order of /dev/mmcblk devices via device-tree?

As with many other devices, there is no standard way of controlling the
Linux enumeration (and given the ID space is shared with other dynamic
devices it's not something that could generally work).

These should be refererd to by UUID if possible.

If not, we could cosider adding a by-dt-path or something like that.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
