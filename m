From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] pinctrl: Add pinctrl binding for Broadcom Capri SoCs
Date: Wed, 9 Oct 2013 10:53:34 +0200
Message-ID: <CACRpkdZTKFtvc3vuNwuP9UuimXuEB2EsOQ3==mXrQw6CMDcxdA@mail.gmail.com>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com>
	<1380846199-12829-3-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380846199-12829-3-git-send-email-syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 4, 2013 at 2:23 AM, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:

> +- brcm,hysteresis: Multiple integers, applicable to standard pins only.  Turns
> +               on hysteresis of input.
> +               0: TTL input, 1: Schmitt Trigger input
> +- brcm,pull:   Multiple integers, applicable to standard pins only.  Specifies
> +               pull-up or pull-down.
> +               0: neither, 1: pull-up, 2: pull-down, 3: both
> +- brcm,input_dis: Multiple integers, applicable to all pins.  Input disable
> +               control.
> +               0: off, 1: input disabled
> +- brcm,slew:   Multiple integers.  Slew rate of output.
> +               0: fast output, 1: normal output (most pins)
> +               0: normal output, 1: fast output (IC_DM and IC_DP)
> +               0: Fast mode, 1: High speed mode (I2C)

0,0,0? I don't get this.

> +- brcm,drive_str: Multiple integers.  Drive strength.
> +               0: 2 mA
> +               1: 4 mA
> +               2: 6 mA
> +               3: 8 mA
> +               4: 10 mA
> +               5: 12 mA
> +               6: 14 mA
> +               7: 16 mA
> +- brcm,pull_up_str: Multiple integers.  Pull Up strength.
> +               0: No pull-up
> +               1: 1.2 kOhm
> +               2: 1.8 kOhm
> +               3: 720 Ohm
> +               4: 2.7 kOhm
> +               5: 831 Ohm
> +               6: 1.08 kOhm
> +               7: 568 Ohm
> +- brcm,mode:   Multiple integers.  Mode select.
> +               0: Fast mode, 1: High Speed mode (I2C)

This should *all* be using generic pin config.

For the devicetree side of this, read:
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

Your driver should also be selecting GENERIC_PINCONF in
drivers/pinctrl/Kconfig so you use the generic pinconf
library.

Read
include/linux/pinctrl/pinconf-generic.h
for definitions of the generic config options.

Your driver should be calling
pinconf_generic_parse_dt_config() and
pinconf_generic_dt_subnode_to_map() to get the config
out of the device tree nodes.

I don't understand the brcm,mode. Can this be selected on
all pins or just for I2C? I would suspect it be related to
things like disabling the schmitt-trigger, but elaborate on this
so we understand what this is. It may need to be added to the
generic options if it turns out to be unique enough.

New options can be added but first we need to exactly understand
those to see that their definitions does not overlap with already
existing generic pin config terminology.

> +The following are valid pin names and their pin types:
> +
> +       "adcsync",              std

std? std what?

Sorry I don't get anything from this list... you need to be way
more specific in defining what is happening here.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
