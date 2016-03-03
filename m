From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/3] phy: rcar-gen3-usb2: add vbus-supply and extcon
Date: Thu, 3 Mar 2016 19:09:03 +0900
Message-ID: <1456999746-2800-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest linux-phy / next branch
(commit id = 89636adde4a05953e3bf18807ba1f6f205572f67)
and the following patches:

http://thread.gmane.org/gmane.linux.kernel/2166364
http://thread.gmane.org/gmane.linux.kernel.renesas-soc/1512/focus=1514

The patch "Add vbus-supply to handle VBUS on/off" has
Rob's Acked-by as the followings:
http://thread.gmane.org/gmane.linux.kernel.renesas-soc/1087/focus=1153

Yoshihiro Shimoda (3):
  phy: rcar-gen3-usb2: remove unnecesary struct rcar_gen3_data
  phy: rcar-gen3-usb2: Add vbus-supply to handle VBUS on/off
  phy: rcar-gen3-usb2: add extcon support

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
 drivers/phy/Kconfig                                |  1 +
 drivers/phy/phy-rcar-gen3-usb2.c                   | 87 +++++++++++++++++-----
 3 files changed, 71 insertions(+), 19 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
