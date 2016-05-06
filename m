From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Amlogic: GXBB: Add pin controller
Date: Fri, 06 May 2016 14:35:24 +0200
Message-ID: <m2bn4jbbzn.fsf@baylibre.com>
References: <1462176138-29433-1-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462176138-29433-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> (Carlo
	Caione's message of "Mon, 2 May 2016 10:02:14 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> writes:

> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> Patchset to add and enable the pin controller driver on a couple of Amlogic
> boards with a Meson GXBB SoC.

Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

I tested this series on GXBB odroid-c2 and p200 boards, along with some
additional pins (patches forthcoming)

Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

> Please note that:
> * This patch depends on http://www.spinics.net/lists/devicetree/msg120964.html
>   ([PATCH] ARM64: dts: amlogic: Add hiu and periphs buses).

Linus, with your ack, we could keep this series together, or if you
prefer, you can take patch 1, and Carlo can take the others through his
tree.

> * The platform driver is still missing a lot of muxing configurations. This is
>   because Amlogic still hasn't publicly released documentation for the GXBB.
>   Since Kevin has already this documentation under NDA, he will integrate and
>   complete this driver with a separate submission.

Coming soon...

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
