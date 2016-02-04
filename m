From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH v2 0/2] Set the Raspberry Pi Ethernet MAC address
Date: Thu,  4 Feb 2016 08:36:02 +0100
Message-ID: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, popcornmix <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

an updated patch pair addressing the feedback. Originally submitted
in [1]. Still not ready for merge as it needs the usb core [2] change
and an U-Boot change [3] to work properly. 

[1] [PATCH 0/2] Set the Raspberry Pi Ethernet MAC address
    http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-February/003207.html

[2] USB: core: let USB device know device node
    https://patchwork.ozlabs.org/patch/572621/

[3] [U-Boot] [PATCH] rpi: set ethaddr as well
    http://lists.denx.de/pipermail/u-boot/2016-February/244663.html

Regards,
Lubo

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
