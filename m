From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?=
        <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/4] Sunxi: Add SMP support on A83T
Date: Mon, 11 Dec 2017 08:49:57 +0100
Message-ID: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello everyone,

This series adds SMP support for Allwinner Sun8i-a83t
with MCPM (Multi-Cluster Power Management).
Series information:
	- Based on last linux-next (next-20171211)
	- Had dependencies on Chen Yu's patch that add MCPM
	support:
	https://patchwork.kernel.org/patch/6402801/

Patch 01: Convert the mcpm driver (initially for A80) to be able
to use it for A83T. This SoC has a bit flip that needs to be handled.
Patch 02: Add registers nodes (prcm, cpucfg and r_cpucfg) needed
for MCPM.
Patch 03: Add CCI-400 node for a83t.
Patch 04: Fix the use of virtual timers that hangs the kernel in
case of SMP support.

If you have any remarks/questions, let me know.
Thank you in advance,
Mylène

Mylène Josserand (4):
  ARM: sunxi: mcpm: Add support for A83T
  arm: dts: sun8i: a83t: Add registers needed for MCPM
  arm: dts: sun8i: a83t: Add CCI-400 node
  arm: dts: sun8i: a83t: Set timer node to use phy timer

 arch/arm/boot/dts/sun8i-a83t.dtsi | 57 +++++++++++++++++++++++++
 arch/arm/mach-sunxi/Kconfig       |  1 +
 arch/arm/mach-sunxi/mcpm.c        | 90 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 143 insertions(+), 5 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
