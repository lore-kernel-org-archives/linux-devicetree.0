From: mohun106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v2 0/3] Add support for Cavium Thunder ARMv8 platform
Date: Mon, 24 Mar 2014 14:39:36 +0530
Message-ID: <1395652179-9216-1-git-send-email-mohun106@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pkapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

This patch series adds preliminary support for Cavium's Thunder SoC
which is based on ARMv8 core.

This patchset depends on following. They need to be applied before
working.

1) Boot time configuration of IPA
http://www.spinics.net/lists/arm-kernel/msg313723.html

2) GICv3 driver from Marc Zyngier
http://www.spinics.net/lists/kvm-arm/msg08544.html

3) GICv3 devicetree bindings from Marc Zyngier
http://www.spinics.net/lists/kvm-arm/msg08545.html

Changes from v1:
---------------
- Added documentation for the devicetree bindings used.
- Changed the Thunder device tree as per documentation.

Radha Mohan Chintakuntla (3):
  arm64: Add Kconfig option for Cavium Thunder SoC Family
  arm64: dts: Add initial dts for Cavium Thunder SoC
  Documentation: add devicetree bindings for Cavium Thunder SoC

 .../devicetree/bindings/arm/cavium-thunder.txt     |    9 +
 Documentation/devicetree/bindings/arm/cpus.txt     |    1 +
 arch/arm64/Kconfig                                 |    5 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/thunder.dts                    |  160 ++++++++++++++++++++
 5 files changed, 176 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder.txt
 create mode 100644 arch/arm64/boot/dts/thunder.dts

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
