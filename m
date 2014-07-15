From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/6] ARM: rockchip: add initial support for rk3288
Date: Wed, 16 Jul 2014 00:58 +0200
Message-ID: <1471578.ILeMmG2DL6@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds the initial support for Rockchip rk3288 socs including
debug uart and devicetree files for the rk3288 evaluation board and
enables these boards to boot into an initramfs.

The series depends on an updated bootloader, which must start the timer
supplying the architected timer, which we will hopefully get in the next
days. It also depends on the patch
    "irqchip: gic: Add binding probe for ARM GIC400"
which will hopefully make it into the irqchip tree shortly.


Heiko Stuebner (6):
  dt-bindings: arm: add arm,cortex-a12 cpu compatible property
  ARM: rockchip: add debug uart used by rk3288
  ARM: Kconfig: set default gpio number for rockchip SoCs
  ARM: rockchip: enable support for RK3288 SoCs
  ARM: dts: rockchip: add core rk3288 dtsi
  ARM: dts: add rk3288 evaluation board

 Documentation/devicetree/bindings/arm/cpus.txt |   1 +
 arch/arm/Kconfig                               |   1 +
 arch/arm/Kconfig.debug                         |  12 +-
 arch/arm/boot/dts/rk3288-evb-act8846.dts       | 136 ++++++
 arch/arm/boot/dts/rk3288-evb-rk808.dts         |  19 +
 arch/arm/boot/dts/rk3288-evb.dtsi              |  77 ++++
 arch/arm/boot/dts/rk3288.dtsi                  | 561 +++++++++++++++++++++++++
 arch/arm/mach-rockchip/Kconfig                 |   1 +
 arch/arm/mach-rockchip/rockchip.c              |   1 +
 9 files changed, 808 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rk3288-evb-act8846.dts
 create mode 100644 arch/arm/boot/dts/rk3288-evb-rk808.dts
 create mode 100644 arch/arm/boot/dts/rk3288-evb.dtsi
 create mode 100644 arch/arm/boot/dts/rk3288.dtsi

-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
