From: Randy Li <ayaka@soulik.info>
Subject: [PATCH v9 0/2] the fixup for the USB HOST1 at rk3288 platform
Date: Fri, 21 Oct 2016 02:37:05 +0800
Message-ID: <1476988627-14953-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, randy.li@rock-chips.com, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

changelog:
v9
 use a work_queue to reset usb phy to prevent access mutex lock at interrupter
 runtime.
v8
  minior fixup
v7
  add the forgot dummy phy_reset() for the generic phy is disabled.
v7
  Some minor fixup
v6
  Send the last two patches
v5
  A few modification at style, add the missing doc in the last 
  commit.
v4
  1. Adding the reset callback in struct phy_ops.
  2. Moving the reset into phy rockchip usb.
  3. Trying to call a reset when dwc2 wakeup in rk3288.
v3
 Rebased from previous commit
v2
 Rebased from previous commit
v1
 orignal from google

Randy Li (2):
  usb: dwc2: assert phy reset when waking up in rk3288 platform
  ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset

 arch/arm/boot/dts/rk3288.dtsi |  4 ++++
 drivers/usb/dwc2/core.h       |  1 +
 drivers/usb/dwc2/core_intr.c  | 11 +++++++++++
 drivers/usb/dwc2/platform.c   |  9 +++++++++
 4 files changed, 25 insertions(+)

-- 
2.7.4
