From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v2 0/5] Add support for the R_CCU on Allwinner
 H3/A64 SoCs
Date: Thu, 16 Mar 2017 01:28:03 +0800
Message-ID: <20170315172808.64011-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBUXTUXDAKGQEWLYWBWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner SoCs after sun6i-a31 nearly all have a R_CCU in PRCM part.
(V3s and R40 do not have it, as they have even no PRCM)

This patch adds support for the ones on H3/A64.

Some clock/reset values are reserved for easier extending the support to
A31/A23, but for this I think some changes to the PRCM MFD should be made,
see [1] (Although this is only a sketch).

The r_pio device node is also added for A64, as the driver is already
merged, and its depends (r_ccu) is now met.

[1] https://github.com/wens/linux/commits/sunxi-ng-prcm

Icenowy Zheng (5):
  dt-bindings: update device tree binding for Allwinner PRCM CCUs
  clk: sunxi-ng: add support for PRCM CCUs
  arm64: allwinner: a64: add r_ccu node
  ARM: sun8i: h3: switch apb0-related clocks to r_ccu
  arm64: allwinner: a64: add R_PIO pinctrl node

 .../devicetree/bindings/clock/sunxi-ccu.txt        |  18 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |  46 ++---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  30 +++
 drivers/clk/sunxi-ng/Kconfig                       |   6 +
 drivers/clk/sunxi-ng/Makefile                      |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                 | 211 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-r.h                 |  27 +++
 include/dt-bindings/clock/sun8i-r-ccu.h            |  59 ++++++
 include/dt-bindings/reset/sun8i-r-ccu.h            |  53 ++++++
 9 files changed, 419 insertions(+), 32 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r.h
 create mode 100644 include/dt-bindings/clock/sun8i-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-r-ccu.h

-- 
2.12.0
