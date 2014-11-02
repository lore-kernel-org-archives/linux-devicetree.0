From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/2] ARM: dts: rockchip: EMAC Rockchip for RK3066 SoCs and MarsBoard RK3066
Date: Sun,  2 Nov 2014 10:19:59 +0000
Message-ID: <1414923601-29504-1-git-send-email-romain.perier@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patches serie adds EMAC Rockchip support for RK3066 SoCs and defines an
initial devicetree source for MarsBoard RK3066.

changes since v2:
	- Squashed patch 1,2 and 4 together (this is the the second patch)
	- Add dual-licensing for rk3066a-marsboard.dts
	- Renamed regulator "vaux33_reg" to "vcc_rmii" as it is written in the
	  schematic

changes since v1:
	- Replaced hoayuelectronics by hoayu as suggested by the vendor-prefix doc in dt-bindings

Romain Perier (2):
  ARM: dts: rockchip: Add EMAC Rockchip for RK3066 SoCs
  ARM: dts: rockchip: Add devicetree source for MarsBoard RK3066

 Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/rk3066a-marsboard.dts            | 197 +++++++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi                     |  22 +++
 4 files changed, 224 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3066a-marsboard.dts

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
