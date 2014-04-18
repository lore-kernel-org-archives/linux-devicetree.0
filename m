From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/5] ARM: sun6i: Switch to enable-method for SMP
Date: Fri, 18 Apr 2014 21:01:48 +0200
Message-ID: <1397847713-28418-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The recent introduction of CPU_METHOD_OF_DECLARE allowed to deprecate
one more fiel of the struct machine_desc.

Switch to it for the Allwinner A31 SoC.

Maxime Ripard (5):
  Documentation: dt: bindings: Document ARM PSCI enable method
  ARM: sun6i: Use CPU_METHOD_OF_DECLARE
  Documentation: dt: bindings: Document Allwinner A31 enable method
  ARM: sun6i: Define the A31 CPUs enable-method
  ARM: sun6i: Retire the smp field in A31 machine

 Documentation/devicetree/bindings/arm/cpus.txt |  2 ++
 arch/arm/boot/dts/sun6i-a31.dtsi               |  1 +
 arch/arm/mach-sunxi/common.h                   | 19 -------------------
 arch/arm/mach-sunxi/platsmp.c                  |  3 +--
 arch/arm/mach-sunxi/sunxi.c                    |  3 ---
 5 files changed, 4 insertions(+), 24 deletions(-)
 delete mode 100644 arch/arm/mach-sunxi/common.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
