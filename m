From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: Add header file for pinctrl constants
Date: Mon, 23 Feb 2015 12:08:33 -0700
Message-ID: <54EB7AB1.5060200@wwwdotorg.org>
References: <1424624396-812-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424624396-812-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/22/2015 09:59 AM, Charles Keepax wrote:
> This patch adds a header file for the constants used in pincontrol
> configuration for the bcm2835.

This seems like a duplicate of the following series:

https://lkml.org/lkml/2015/1/16/402
[PATCH 0/4] ARM: bcm2835: DT improvements
[PATCH 1/4] dt-bindings: Add vendor prefix for Raspberry Pi
[PATCH 2/4] dt-bindings: Add root properties for Raspberry Pi B and B+
[PATCH 3/4] ARM: bcm2835: Add header file for pinctrl constants

https://lkml.org/lkml/2015/1/16/405
[PATCH 4/4] ARM: bcm2835: Use pinctrl header

Lee, are you planning on applying one/both/some of these?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
