From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 0/4] Enable rk3066 VOP and HDMI for MK808
Date: Sat, 30 Mar 2019 10:56:35 +0100
Message-ID: <20190330095639.14626-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For testing only.

Version: V6

Title: Enable rk3066 VOP and HDMI for MK808.

This patch serie only works in combination with a MK808 TV stick and
a rk3066 processor. Other boxes and tablets with a rk3066
need extra software for power management and lcd's.

What does it do:

With these kernel patches a MK808 can show 2 penguins and a console
on a DVI-D monitor in combination with a framebuffer.

Not tested:

HDMI TV
HDCP
DRM
Xorg
Display managers
Android
etc.

Problems:

DRM functions keep changing every rc.
With v5.1-rc1 the monitor doesn't blank on poweroff, it freezes
due to a patch revert some time ago.

  drm/rockchip: shutdown drm subsystem on shutdown
    https://patchwork.kernel.org/patch/10556151/
  drm/rockchip: Allow driver to be shutdown on reboot/kexec
    https://patchwork.kernel.org/patch/10556135/
  [for-4.20] Revert "drm/rockchip: Allow driver to be shutdown on reboot/kexec"
    https://patchwork.kernel.org/patch/10714725/

DVI-D monitors without CEA modes can add a fixed mode
to the kernel command line as workaround.
For example: video=HDMI-A-1:1280x720@60

HDMI sound not included.
etc.

///////////////////////////////////////////
Changes V6:

rk3066_hdmi.c
  add goto err_cleanup_hdmi to rk3066_hdmi_bind function
  small text style changes

///////////////////////////////////////////
Changes V5:

rockchip,rk3066-hdmi.txt
  add Reviewed-by tag

rk3066_hdmi.c
  change order in unbind function
  add goto err_disable_i2c to rk3066_hdmi_bind function
  change dev_foobar calls to their DRM_* equivalents
  remove rk3066_hdmi_i2c_irq function
  use define constants in rk3066_hdmi_encoder_enable function
  add comment to rk3066_hdmi_config_phy function
  small text style changes
  remove DVI-D support

rk3066_hdmi.h
  add define constants

///////////////////////////////////////////
Changes V4:

rockchip,rk3066-hdmi.txt
  change document name

rk3066_hdmi.c
  add more info in commit message
  replace deprecated drmP.h include
  small text style changes
  explain vic variable
  remove enc_in_format
  change lock name
  change regmap name
  change cmp name
  replace hdmi->dev by dev
  use sentinel
  use HDMI_VIDEO_VSYNC_OFFSET_SHIFT define
  remove unused module macros
  change driver name for dmesg

///////////////////////////////////////////
Changes V3:

updated to v5.0-rc8
removed patches that are already added to linux-next

rk3066_hdmi.c
  removed gpl text
  small style changes
  removed unused includes
  add include for:
    drm_helper_hpd_irq_event
    drm_helper_probe_single_connector_modes
  update drm_hdmi_avi_infoframe_from_display_mode function call

rk3066_hdmi.h
  removed gpl text

rk3066a.dtsi
  add extra port for hdmi connector node

rk3066a-mk808.dts
  add hdmi connector node
  connect hdmi_out with hdmi_con_in

rk3066-hdmi.txt
  add extra port for hdmi connector node

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

Johan Jonker (2):
  ARM: dts: rockchip: rk3066a-mk808: enable vop0 and hdmi nodes
  dt-bindings: display: rockchip: add document for rk3066 hdmi

Zheng Yang (2):
  drm: rockchip: introduce rk3066 hdmi
  ARM: dts: rockchip: add rk3066 hdmi nodes

 .../display/rockchip/rockchip,rk3066-hdmi.txt      |  72 ++
 arch/arm/boot/dts/rk3066a-mk808.dts                |  29 +
 arch/arm/boot/dts/rk3066a.dtsi                     |  52 ++
 drivers/gpu/drm/rockchip/Kconfig                   |   8 +
 drivers/gpu/drm/rockchip/Makefile                  |   1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 869 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rk3066_hdmi.h             | 229 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
 9 files changed, 1263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.txt
 create mode 100644 drivers/gpu/drm/rockchip/rk3066_hdmi.c
 create mode 100644 drivers/gpu/drm/rockchip/rk3066_hdmi.h

-- 
2.11.0
