From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v3 0/4] Enable rk3066 VOP and HDMI for MK808
Date: Sat,  2 Mar 2019 11:41:12 +0100
Message-ID: <20190302104116.1535-1-jbx6244@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Version: V3

Title: Enable rk3066 VOP and HDMI for MK808.

This patch serie only works in combination with a MK808 TV stick and
a rk3066 processor. Other boxes and tablets with a rk3066
need extra software for power management and lcd's.

What does it do:

With these kernel patches a MK808 can show 2 penguins and a console
on a DVI-D monitor in combination with a framebuffer.

Not tested:

HDMI TV
DRM
Xorg
Display managers
Android
etc.

Problems:

DRM functions keep changing every rc
With v5.0-rc8 the monitor doesn't blank on poweroff, it freezes
Fixed screen size for DVI-D.
HDMI sound not included.
etc.

///////////////////////////////////////////

Changes V2 > V3:

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

 .../bindings/display/rockchip/rk3066-hdmi.txt      |  72 ++
 arch/arm/boot/dts/rk3066a-mk808.dts                |  29 +
 arch/arm/boot/dts/rk3066a.dtsi                     |  52 ++
 drivers/gpu/drm/rockchip/Kconfig                   |   8 +
 drivers/gpu/drm/rockchip/Makefile                  |   1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 911 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rk3066_hdmi.h             | 226 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
 9 files changed, 1302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rk3066-hdmi.txt
 create mode 100644 drivers/gpu/drm/rockchip/rk3066_hdmi.c
 create mode 100644 drivers/gpu/drm/rockchip/rk3066_hdmi.h

-- 
2.11.0
