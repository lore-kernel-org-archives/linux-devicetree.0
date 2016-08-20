From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH 0/4 v4] usb: dwc2: fix the usb host for host port at RK32
Date: Sun, 21 Aug 2016 04:32:16 +0800
Message-ID: <1471725140-3833-1-git-send-email-ayaka@soulik.info>
References: <7ca3b54d-e9d8-a137-79b6-d24f0b7065c7@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7ca3b54d-e9d8-a137-79b6-d24f0b7065c7-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello All:
 This version would move reset into phy. I wanted to implement a hard
code version but I meet some problem with ioremap reset controller,
in order to keep my word, I offer this version this time.

Randy Li (4):
  phy: Add reset callback
  phy: rockchip-usb: use rockchip_usb_phy_reset to reset phy during
    wakeup
  usb: dwc2: assert phy reset when waking up in rk3288 platform
  ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset

 arch/arm/boot/dts/rk3288.dtsi  |  5 +++++
 drivers/phy/phy-rockchip-usb.c | 20 ++++++++++++++++++++
 drivers/usb/dwc2/core_intr.c   |  9 +++++++++
 include/linux/phy/phy.h        |  2 ++
 4 files changed, 36 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
