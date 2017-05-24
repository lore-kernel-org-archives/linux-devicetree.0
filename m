From: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] orange-pi-zero: minor updates for peripherals
Date: Thu, 25 May 2017 00:24:31 +0300
Message-ID: <20170524212433.14386-1-geomatsi@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

These two patches simplify the use of orange-pi-zero board
right out of the box:
- specify interrupts for the on-board XR819 SDIO WiFi chip
- add node on-board SPI NOR

Changes from v1:
- update commit messages: drop links to wiki at linux-sunxi.org
- disable SPI NOR flash by default
- drop description of the flash partitions
- add compatible property for XR819 wifi node

sun8i-h2-plus-orangepi-zero.dts |   16 ++++++++++++++++
1 file changed, 16 insertions(+)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
