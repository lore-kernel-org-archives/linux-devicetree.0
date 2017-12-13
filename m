From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/5] phy: renesas: rcar-gen3-usb2: add gpio handling for R-Car D3
Date: Wed, 13 Dec 2017 15:27:35 +0900
Message-ID: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest linux-phy / next branch
(commit id = 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323).

This new feature will be used by the renesas_usbhs driver on R-Car D3.

Yoshihiro Shimoda (5):
  phy: renesas: rcar-gen3-usb2: call INIT_WORK() anyway
  phy: renesas: rcar-gen3-usb2: unify OBINTEN handling
  phy: renesas: rcar-gen3-usb2: use prefix "has_otg_pins_" for dedicated
    pins handling
  phy: renesas: rcar-gen3-usb2: add rcar_gen3_role_swap_ops
  phy: renesas: rcar-gen3-usb2: add gpio handlings

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 262 ++++++++++++++++-----
 2 files changed, 206 insertions(+), 58 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
