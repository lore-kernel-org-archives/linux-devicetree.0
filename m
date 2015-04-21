From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: BCM2836 (Raspberry Pi 2) port
Date: Tue, 21 Apr 2015 11:09:47 -0700
Message-ID: <1429639796-2169-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is my first submission of a Raspberry Pi 2 port.  It can be found
at https://github.com/anholt/linux/tree/bcm2836

I'm using the 2835 interrupt controller support, without adding the
checks for ARM local interrupts first.  That means no support for IPIs
(and thus no SMP), no PMU events, and no local timer (I'm using the
same 2835 peripheral one).

It supports a similar featureset to Pi 1 at this point.  Serial and SD
cards work.  Just one CPU supported.  USB (ethernet) works if you use
U-Boot, or my mailbox series
(https://github.com/anholt/linux/tree/bcm2836-mbox).

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
