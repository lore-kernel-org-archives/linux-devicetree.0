From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Add dts file for Polaroid MID2407PXE03 tablet
Date: Mon, 13 Jun 2016 11:23:20 +0800
Message-ID: <CAGb2v649R2VhH6U4YpiFpQp4S_b7N0RCERWjfthdKC_k3FjA3Q@mail.gmail.com>
References: <1465653230-1027-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465653230-1027-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Jun 11, 2016 at 9:53 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> The Polaroid MID2407PXE03 is an a23 based 7" tablet based on a M86_MB V2.0
> PCB, featuring a 800x480 LCD, 512MB RAM, 4G NAND, esp8089 wifi, gsl1680
> touchschreen, micro-sd slot, 3.5mm headphone jack and a micro-usb otg
> connector which doubles as charging port.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

It seems this tablet is very similar to the Q8s, differing only in the
WiFi solution (which we have to deal with for the Q8s anyway), and the
touchscreen firmware.

Should we somehow manage this using the q8-common and q8-tablet dts files?

Same comment for reg_drivevbus as the other patches.

Regards
ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
