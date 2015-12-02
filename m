From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RFC 1/4] ARM: bcm2835: remove sdhci pins from GPIO pinctrl
Date: Tue, 1 Dec 2015 20:40:39 -0700
Message-ID: <565E6837.1070909@wwwdotorg.org>
References: <1447949176-21926-1-git-send-email-stefan.wahren@i2se.com>
 <1447949176-21926-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447949176-21926-2-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/19/2015 09:06 AM, Stefan Wahren wrote:
> Currently the pins alt3 (sdhci) are assigned to GPIO pinctrl.
> This is bad because a user could export it to sysfs and break
> sdhci. In order to avoid that remove those pins from GPIO pintrl.

> diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts

>  &gpio {
> -	pinctrl-0 = <&gpioout &alt0 &i2s_alt0 &alt3>;
> +	pinctrl-0 = <&gpioout &alt0 &i2s_alt0>;

This doesn't make sense. The current DT content is configuring those
pins as SDHCI, not as GPIO. Admitedly this is redundant since the
firmware and/or bootloader already did this in order to boot the system,
but irrespective, the current DT causes no issues. Removing the pinctrl
setting should not influence whether the pins can be exported via GPIO
sysfs either.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
