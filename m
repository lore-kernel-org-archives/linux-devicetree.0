From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 0/7] Enable rk3066 VOP and HDMI for MK808
Date: Sat, 29 Dec 2018 14:33:11 +0100
Message-ID: <20181229133318.18128-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

DISCLAIMER: Use at your own risk.
For testing only!

Version: V2

Title: Enable rk3066 VOP and HDMI for MK808.

This patch serie only works in combination with a MK808 TV stick and
a rk3066 processor. Other boxes and tablets with a rk3066
need extra software for power management and lcd's.

What does it do:

With these 7 kernel patches a MK808 can show 2 penquins and a console
on a DVI-D monitor in combination with a framebuffer.

Not tested:

HDMI TV
DRM
Xorg
Display managers
Android
etc.

Problems:

Fixed screen size for DVI-D.
HDMI sound not included.
etc.

///////////////////////////////////////////

# How to make rkfs.cpio

find . | cpio -o --format=newc > ../rkfs.cpio

# How to compile/flash

make menuconfig  ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
make -j4  ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-

cp ./arch/arm/boot/zImage ../zImage-dtb
cat ./arch/arm/boot/dts/rk3066a-mk808.dtb >> ../zImage-dtb
../tools/rkcrc -k ../zImage-dtb ../mk808.img
sudo ../tools/rkflashtool w 0x4000 0x8000 < ../mk808.img
sudo ../tools/rkflashtool b

///////////////////////////////////////////

Finley Xiao (1):
  clk: rockchip: rk3188: add CLK_SET_RATE_PARENT for lcdc dclk

Johan Jonker (2):
  ARM: dts: rockchip: rk3066: add HCLK_HDMI to pmu node
  ARM: dts: rockchip: rk3066a-mk808: enable vop0 and hdmi nodes

Mark Yao (2):
  drm: rockchip: vop: add rk3066 vop definitions
  ARM: dts: rockchip: add rk3066 vop display nodes

Zheng Yang (2):
  drm: rockchip: introduce rk3066 hdmi
  ARM: dts: rockchip: add rk3066 hdmi nodes

 .../bindings/display/rockchip/rockchip-vop.txt     |   1 +
 arch/arm/boot/dts/rk3066a-mk808.dts                |  12 +
 arch/arm/boot/dts/rk3066a.dtsi                     |  92 ++
 drivers/clk/rockchip/clk-rk3188.c                  |   4 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   8 +
 drivers/gpu/drm/rockchip/Makefile                  |   1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 928 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rk3066_hdmi.h             | 235 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        | 110 +++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |  53 ++
 12 files changed, 1445 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/rockchip/rk3066_hdmi.c
 create mode 100644 drivers/gpu/drm/rockchip/rk3066_hdmi.h

-- 
2.11.0
