From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/3] phy: renesas: rcar-gen3-usb2: enable/disable independent irqs
Date: Thu, 11 Apr 2019 19:27:33 +0900
Message-ID: <1554978456-20794-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest linux-phy.git / next branch with
the following patch:
 https://patchwork.kernel.org/patch/10894105/
 https://patchwork.kernel.org/patch/10894113/

Since the previous code enabled/disabled the irqs both OHCI and EHCI,
it is possible to cause unexpected interruptions. To avoid this,
this patch creates multiple phy instances from phandle and
enables/disables independent irqs by the instances.

Changes from v1 [1]:
 - Rebased on the Biju-san's patch as above.
 - Revise typo on the commit log of patch 1.
 - Add deprecated value 0 on patch 1.
 - Add Reviewed-by tags from Simon-san and Fabrizio-san on patch 2 and 3.
 - Add Tested-by tag from Fabrizio-san on patch 3.
 - Use enum instead of definitions.
 - Add more a comment into rcar_gen3_get_dr_mode().
 - Change name of tmp to mode and move the prototype into the loop.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=99561):

Yoshihiro Shimoda (3):
  dt-bindings: phy: rcar-gen3-phy-usb2: Revise #phy-cells property
  phy: renesas: rcar-gen3-usb2: Use pdev's device pointer on dev_vdbg()
  phy: renesas: rcar-gen3-usb2: enable/disable independent irqs

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   8 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 195 ++++++++++++++++++---
 2 files changed, 173 insertions(+), 30 deletions(-)

-- 
2.7.4
