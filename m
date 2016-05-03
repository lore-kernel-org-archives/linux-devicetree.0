From: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v5] ARM: bcm2835: dt: Add the ethernet to the device trees
Date: Tue, 03 May 2016 23:35:45 +0200
Message-ID: <m3lh3qrfim.fsf@euphor.blino.org>
References: <1462172811-24206-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462172811-24206-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org> (Lubomir
	Rintel's message of "Mon, 2 May 2016 09:06:51 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> writes:

> The hub and the ethernet in its port 1 are hardwired on the board.
>
> Compared to the adapters that can be plugged into the USB ports, this
> one has no serial EEPROM to store its MAC. Nevertheless, the Raspberry Pi
> has the MAC address for this adapter in its ROM, accessible from its
> firmware.
>
> U-Boot can read out the address and set the local-mac-address property of the
> node with "ethernet" alias. Let's add the node so that U-Boot can do its
> business.
>
> Model B rev2 and Model B+ entries were verified by me, the hierarchy and
> pid/vid pair for the Version 2 was provided by Peter Chen. Original
> Model B is a blind shot, though very likely correct.
>
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Tested-by: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>

Though, I still need the following patch for this DT patch to be useful:
net/smscx5xx: use the device tree for mac address

Thanks for the update Lubomir

-- 
Olivier Blin - blino
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
