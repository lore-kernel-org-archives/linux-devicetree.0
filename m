From: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/2] Adapt phy-omap-usb2 for AM437x platform
Date: Tue, 15 Oct 2013 12:23:43 +0530
Message-ID: <1381820025-31376-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adapts the phy-omap-usb2 generic phy driver for AM437x.
While at that arrange the include files alphabetically (PATCH 1)
V2 of 2nd Patch which fixes the following from v1
	- List comaptible entries in Documentaion
	- Add usb_phy_data instead of checking compatible each time. 

George Cherian (2):
  phy: omap-usb2: Arrange the include in alphabetical order
  phy: omap-usb2: Adapt phy-omap-usb2 for AM437x

 Documentation/devicetree/bindings/usb/usb-phy.txt |  4 +-
 drivers/phy/phy-omap-usb2.c                       | 72 +++++++++++++++--------
 include/linux/usb/omap_usb.h                      | 10 ++++
 3 files changed, 62 insertions(+), 24 deletions(-)

-- 
1.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
