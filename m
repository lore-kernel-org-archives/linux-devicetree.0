From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: keystone: Add support for new K2G evm
Date: Thu, 30 Mar 2017 10:29:05 -0500
Message-ID: <20170330152907.12595-1-fcooper@ti.com>
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

Bootlog: https://pastebin.ubuntu.com/24281838/

Franklin S Cooper Jr (2):
  ARM: keystone: Create new binding for K2G ICE evm
  ARM: dts: keystone: Add minimum support for K2G ICE evm

 .../devicetree/bindings/arm/keystone/keystone.txt  |  3 ++
 arch/arm/boot/dts/Makefile                         |  3 +-
 arch/arm/boot/dts/keystone-k2g-ice.dts             | 42 ++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/keystone-k2g-ice.dts

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
