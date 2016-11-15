From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: specifying order of /dev/mmcblk devices via device-tree?
Date: Tue, 15 Nov 2016 12:27:53 -0800
Message-ID: <CAJ+vNU38XQBHt709S_z6Quvce6wcqLzRHFuN_bVZ_0eARa3=fw@mail.gmail.com>
References: <CAJ+vNU1g8nQedd06LeaD10YWUQ_UmdRToUMFKaTNT1aNY56b0g@mail.gmail.com>
 <20161028153755.GL5806@leverpostej> <CAJ+vNU26tx-1bLKNpzYJ0UCeFJ-SczZOca1dYdt5mCGDxAuKTQ@mail.gmail.com>
 <20161114190839.GS1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161114190839.GS1041-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 11:08 AM, Russell King - ARM Linux
<linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:
> So, someone merged a patch which makes mmcblk devices follow the
> host controller numbering.
>
> Now my cubox-i fails to boot correctly because the SD card in the
> _only_ SD card slot now gets called "mmcblk1" and not "mmcblk0".
>
> USDHC1 is wired to the on-microsom WiFi, and never has anything
> remotely near a SD card or eMMC present.  So, this change is
> confusing on these platforms.
>
> Moreover, this is _going_ to break SolidRun distros if people upgrade
> their kernels.
>
> It may be appropriate for eMMC, but it's not appropriate everywhere.
>
> This is a user visible _regression_ in 4.9-rc.  Whoever did this,
> please revert whatever change caused this, and next time limit it
> to only eMMC.
>
> Thanks.

I see the same thing on newer kernels, which is why I asked the
question. I didn't expect (or even want honestly) a non mmcblk0 boot
device and was looking for a way to control that via dt. Now I'm
understanding that to avoid this kind of bootloader/kernel dependence
issue I should be using UUID's to identify the boot device.

>From my testing it looks like the change your looking for occurred
some time ago and is somewhere between 4.5 and 4.6 and not a 4.9
regression specifically.

Regards,

Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
