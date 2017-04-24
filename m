From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/4] ARM: dts: keystone: Add support for new K2G evm
Date: Mon, 24 Apr 2017 15:22:00 -0500
Message-ID: <20170424202204.24170-1-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for new K2G Industrial Communication Engine
evm. For now only a bare minimal dts which will allow ram boot. Additional
peripherals will be added when base K2G SoC patches are upstreamed allowing
peripherals to be enabled.

Version 2 changes:
Make various tweaks to allow unit address to be added to memory node.

Franklin S Cooper Jr (4):
  ARM: dts: keystone-k2g: Remove skeleton.dtsi
  ARM: dts: k2g-evm: Add unit address to memory node
  ARM: keystone: Create new binding for K2G ICE evm
  ARM: dts: keystone: Add minimum support for K2G ICE evm

 .../devicetree/bindings/arm/keystone/keystone.txt  |  3 ++
 arch/arm/boot/dts/Makefile                         |  3 +-
 arch/arm/boot/dts/keystone-k2g-evm.dts             |  2 +-
 arch/arm/boot/dts/keystone-k2g-ice.dts             | 35 ++++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi                |  3 +-
 5 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/keystone-k2g-ice.dts

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
