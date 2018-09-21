From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/8] phy: renesas: rcar-gen3-usb2: re-design for all R-Car Gen3 SoCs
Date: Fri, 21 Sep 2018 20:53:16 +0900
Message-ID: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the linux-phy / next branch (the commit id is
53706a1168631fa5bf2e6d47de4647ea7e69f270).

Since all R-Car Gen3 SoCs have dedicated otg pins in fact,
the previous code was not good to handle it. So, this patch set
changes the design for all R-Car Gen3 SoCs.


Yoshihiro Shimoda (8):
  dt-bindings: rcar-gen3-phy-usb2: add no-otg-pins property
  phy: renesas: rcar-gen3-usb2: fix vbus_ctrl for role sysfs
  phy: renesas: rcar-gen3-usb2: Rename has_otg_pins to uses_otg_pins
  phy: renesas: rcar-gen3-usb2: Check a property to use otg pins
  phy: renesas: rcar-gen3-usb2: unify OBINTEN handling
  phy: renesas: rcar-gen3-usb2: change a condition "dr_mode"
  phy: renesas: rcar-gen3-usb2: add conditions for uses_otg_pins ==
    false
  phy: renesas: rcar-gen3-usb2: add is_otg_channel to use "role" sysfs

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 80 +++++++++++++---------
 2 files changed, 48 insertions(+), 34 deletions(-)

-- 
1.9.1
