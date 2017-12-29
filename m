From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?=
        <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/5] Sunxi: Add SMP support on A83T
Date: Fri, 29 Dec 2017 11:55:01 +0100
Message-ID: <20171229105506.24851-1-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello everyone,

This is a V2 of my series that adds SMP support for Allwinner sun8i-a83t
with MCPM (Multi-Cluster Power Management).
Based on last linux-next (next-20171222).

Changes since v1:
    - Add Chen Yu's patch in my series (see path 01)
    - Add new compatibles for prcm and cpucfg registers for sun8i-a83t.
    Create two functions to separate the DT parsing of sun9i-a80 and
    sun8i-a83t.
    - Thanks to Maxime's review: order device tree's nodes according
    to physical addresses, remove unused label and fix registers' sizes.
    Update the commit log and commit title of my last patch (see
    patch 05).

Patch 01: Patch from Chen Yu Tsai that adds SMP support on A80
with MCPM
Patch 02: Convert the MCPM driver to use it for A83T. This SoC has a
bit flip that needs to be handled.
Patch 03: Add registers nodes (prcm, cpucfg and r_cpucfg) needed
for MCPM.
Patch 04: Add CCI-400 node for a83t.
Patch 05: Fix the use of virtual timers that hangs the kernel in
case of SMP support.

If you have any remarks/questions, let me know.
Thank you in advance,
Mylène

Chen-Yu Tsai (1):
  ARM: sun9i: Support SMP on A80 with Multi-Cluster Power Management
    (MCPM)

Mylène Josserand (4):
  ARM: sunxi: mcpm: Add support for A83T
  arm: dts: sun8i: a83t: Add registers needed for MCPM
  arm: dts: sun8i: a83t: Add CCI-400 node
  arm: dts: sun8i: a83t: Fix undefined offset with virtual timer

 arch/arm/boot/dts/sun8i-a83t.dtsi |  57 +++++
 arch/arm/mach-sunxi/Kconfig       |  11 +
 arch/arm/mach-sunxi/Makefile      |   1 +
 arch/arm/mach-sunxi/mcpm.c        | 513 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 582 insertions(+)
 create mode 100644 arch/arm/mach-sunxi/mcpm.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
