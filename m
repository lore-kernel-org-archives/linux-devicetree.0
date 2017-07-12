From: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] arm64: dts: add rk3399 display-related nodes
Date: Thu, 13 Jul 2017 00:03:50 +0800
Message-ID: <1499875435-23944-1-git-send-email-jacob-chen@iotwrt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series patches add the display-related nodes for rk3399.

Tested with kernel base on drm-misc and below patches.
https://cgit.freedesktop.org/drm/drm-misc/
"drm: bridge: synopsys/dw-hdmi: Provide default configuration function for HDMI 2.0 PHY"
"iommu/rockchip: Enable Rockchip IOMMU on ARM64"

HDMI could work and have a display output.
eDP could link with panel but i didn't get a display(Maybe something wrong in power things).

For convenience, i think we should have those nodes in kernel now.


Jacob Chen (5):
  arm64: dts: rockchip: Add rk3399 vop and display-subsystem
  arm64: dts: rockchip: add pd_edp node for rk3399
  arm64: dts: rockchip: add rk3399 edp nodes
  arm64: dts: rockchip: add rk3399 mipi nodes
  arm64: dts: rockchip: add rk3399 hdmi nodes

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 198 +++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
