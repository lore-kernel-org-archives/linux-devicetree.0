From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/3] usb: gadget: udc: renesas_usb3: add support for some R-Car Gen3 SoCs
Date: Fri,  4 Aug 2017 11:16:55 +0900
Message-ID: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest Felipe's usb.git / testing/next branch
(the commit id = 5771a8c08880cdca3bfb4a3fc6d309d6bba20877)

Changes from v1:
 - The usb3_of_match has "renesas,rcar-gen3-usb3-peri" only in patch 3.

Yoshihiro Shimoda (3):
  usb: gadget: udc: renesas_usb3: add debugfs to set the b-device mode
  usb: gadget: udc: renesas_usb3: add support for R-Car H3 ES2.0
  usb: gadget: udc: renesas_usb3: add support for R-Car M3-W

 .../devicetree/bindings/usb/renesas_usb3.txt       |  16 ++-
 drivers/usb/gadget/udc/renesas_usb3.c              | 107 +++++++++++++++++++--
 2 files changed, 114 insertions(+), 9 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
