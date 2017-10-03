From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] usb: renesas_usbhs: add support for R-Car D3
Date: Tue,  3 Oct 2017 20:09:12 +0900
Message-ID: <1507028954-15738-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest Felipe's usb.git / testing/next branch
(commit id = af846d7ab55c846af6d6f150e9af96295101e068)

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: unify Gen2/3 pipe_config setting
  usb: renesas_usbhs: add support for R-Car D3

 .../devicetree/bindings/usb/renesas_usbhs.txt      |  1 +
 drivers/usb/renesas_usbhs/common.c                 | 21 ++++++----
 drivers/usb/renesas_usbhs/rcar3.c                  | 48 ++++++++++++++++++++++
 drivers/usb/renesas_usbhs/rcar3.h                  |  1 +
 include/linux/usb/renesas_usbhs.h                  |  5 ++-
 5 files changed, 65 insertions(+), 11 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
