From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/8] ARM: dts: keystone*: Stage 1 cleanup for W=1
Date: Fri, 15 Dec 2017 07:20:54 -0600
Message-ID: <20171215132102.435-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
Series to squash some of the build warnings with dts. At least try and get
through 2/3rd of the warnings low hanging ones with this series.

 Warning status:
As of master: http://pastebin.ubuntu.com/26188581/
After this series: http://pastebin.ubuntu.com/26188578/
Diff: 243 warnings squashed.

 + Additional patch in https://patchwork.kernel.org/patch/10114913/

Nishanth Menon (8):
  ARM: dts: keystone*: Standardize license with SPDX tag
  ARM: dts: keystone*: Use a single soc0 instance
  ARM: dts: keystone: Get rid of usage of skeleton.dtsi
  ARM: dts: keystone: Add missing unit name to interrupt controller
  ARM: dts: keystone-clocks: Add missing unit name to  clock nodes that
    have regs
  ARM: dts: keystone-hk-clocks: Add missing unit name to  clock nodes
    that have regs
  ARM: dts: keystone-k2e-clocks: Add missing unit name to  clock nodes
    that have regs
  ARM: dts: keystone-k2l-clocks: Add missing unit name to clock nodes
    that have regs

 arch/arm/boot/dts/keystone-clocks.dtsi      | 59 ++++++++++-----------
 arch/arm/boot/dts/keystone-k2e-clocks.dtsi  | 15 +++---
 arch/arm/boot/dts/keystone-k2e-evm.dts      | 11 ++--
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi   |  7 +--
 arch/arm/boot/dts/keystone-k2e.dtsi         | 11 ++--
 arch/arm/boot/dts/keystone-k2g-evm.dts      | 12 +----
 arch/arm/boot/dts/keystone-k2g-ice.dts      |  3 +-
 arch/arm/boot/dts/keystone-k2g.dtsi         | 14 ++---
 arch/arm/boot/dts/keystone-k2hk-clocks.dtsi | 81 ++++++++++++++---------------
 arch/arm/boot/dts/keystone-k2hk-evm.dts     | 57 ++++++++++----------
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi  |  7 +--
 arch/arm/boot/dts/keystone-k2hk.dtsi        | 11 ++--
 arch/arm/boot/dts/keystone-k2l-clocks.dtsi  | 51 +++++++++---------
 arch/arm/boot/dts/keystone-k2l-evm.dts      | 11 ++--
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi   |  7 +--
 arch/arm/boot/dts/keystone-k2l.dtsi         | 11 ++--
 arch/arm/boot/dts/keystone.dtsi             | 18 +++----
 17 files changed, 164 insertions(+), 222 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
