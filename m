From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/6] phy: renesas: rcar-gen3-usb2: add gpio handling for R-Car D3
Date: Fri, 15 Dec 2017 14:45:20 +0900
Message-ID: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest linux-phy / next branch
(commit id = 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323).

This new feature will be used by the renesas_usbhs driver on R-Car D3.

Changes from v1:
 - Drop "renesas," from the names of gpio property.
 - Change function names of "enable_" to "control_" or "set_" that
   will enable/disable irq or vbus.

Yoshihiro Shimoda (6):
  phy: renesas: rcar-gen3-usb2: call INIT_WORK() anyway
  phy: renesas: rcar-gen3-usb2: unify OBINTEN handling
  phy: renesas: rcar-gen3-usb2: change the function name to
    set_vbus_ctrl()
  phy: renesas: rcar-gen3-usb2: use prefix "has_otg_pins_" for dedicated
    pins handling
  phy: renesas: rcar-gen3-usb2: add rcar_gen3_role_swap_ops
  phy: renesas: rcar-gen3-usb2: add gpio handling

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 276 ++++++++++++++++-----
 2 files changed, 213 insertions(+), 65 deletions(-)

-- 
1.9.1
