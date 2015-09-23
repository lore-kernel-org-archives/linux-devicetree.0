From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 2/6] ARM: dts: sun7i: Enable USB DRC on
 Bananapi
Date: Wed, 23 Sep 2015 10:47:12 +0200
Message-ID: <56026710.9090103@redhat.com>
References: <1442928966-6418-1-git-send-email-hdegoede@redhat.com>
 <1442928966-6418-2-git-send-email-hdegoede@redhat.com>
 <87io718so8.fsf@karme.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87io718so8.fsf-k/3wkfGq5Xs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Thiele <karme-k/3wkfGq5Xs@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 23-09-15 10:07, Jens Thiele wrote:
> Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:
>
>> Enable the otg/drc usb controller on the Bananapi.
>
> would something similar apply to the a20 olimex olinuxino micro/lime2
> boards?

a20 olimex olinuxino micro already has this in 4.3-rc1, see:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts

a20 olimex olinuxino lime2 support is pending:

https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?h=sunxi/dt-for-4.4&id=9ff5052f7561068207c2b0e7590ad8ca5765f2cc

Regards,

Hans


>
> is there some documentation how to port devicetree improvements/new
> features to all boards or to at least help with that? i think you did
> some workshop like that?
>
> i think i have seen other features being added only to some boards?
> pwm backlight?
> audio output?
> but my understanding of all of this is really very limited.
>
> thanks,
> Jens
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
