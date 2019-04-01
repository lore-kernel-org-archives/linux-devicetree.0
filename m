From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] phy: renesas: rcar-gen3-usb2: enable/disable independent irqs
Date: Mon,  1 Apr 2019 21:01:20 +0900
Message-ID: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Since the previous code enabled/disabled the irqs both OHCI and EHCI,
it is possible to cause unexpected interruptions. To avoid this,
this patch creates multiple phy instances from phandle and
enables/disables independent irqs by the instances.

Yoshihiro Shimoda (3):
  dt-bindings: phy: rcar-gen3-phy-usb2: Revise #phy-cells property
  phy: renesas: rcar-gen3-usb2: Use pdev's device pointer on dev_vdbg()
  phy: renesas: rcar-gen3-usb2: enable/disable independent irqs

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   7 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 191 +++++++++++++++++----
 2 files changed, 168 insertions(+), 30 deletions(-)

-- 
2.7.4
