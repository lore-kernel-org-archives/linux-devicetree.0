From: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/1] orange-pi-zero: minor updates for peripherals
Date: Sun, 28 May 2017 13:30:25 +0300
Message-ID: <20170528103026.6396-1-geomatsi@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds optional node for SPI NOR chip on the orange-pi-zero board.

Changes from v2:
- add new node in alphabetical order
- drop changes for wifi xr819 node for the time being:
  -- more work is needed, e.g. adding bindings for XR819

Changes from v1:
- update commit messages: drop links to wiki at linux-sunxi.org
- disable SPI NOR flash by default
- drop description of the flash partitions
- add compatible property for XR819 wifi node

sun8i-h2-plus-orangepi-zero.dts |   13 +++++++++++++
1 file changed, 13 insertions(+)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
