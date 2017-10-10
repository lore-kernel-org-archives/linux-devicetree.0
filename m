From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 0/4] phy: rcar-gen3-usb2: add support for r8a77995
Date: Tue, 10 Oct 2017 18:41:26 +0900
Message-ID: <1507628490-7944-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest phy.git / next branch
(the commit id = 415060b21f318e009d865b4bcbf8f220ebc36964)

After this patch set is applied, a usb 2.0 host node that is combined
with usb 2.0 peripheral needs 'dr_mode = "otg";' property.

Changes from v4:
 - Remove the role_show() modification in patch 2.
 - Remove a new function rcar_gen3_otg_change_role() in patch 2 because adding
   this will be complecated patch code and this is unnecessary for now.
 - Add a new function rcar_gen3_get_phy_mode() to get current phy mode
   for comparing the new mode into a line in patch 2.
 - Rebase patch 3.

Changes from v3:
 - Use enum phy_mode in patch 2.
 - Remove "can_role_swap" parameter and revise the commit log in patch 2
   because a case of "can_role_swap = true" and "has_otg = false" is
   not supported for role swap at the moment.
 - Changes the name of "has_otg" to "has_otg_pins" in patch 3.
 - Use of_device_get_match_data() instead of of_match_device()
 - Add "Reviewed-by:" into patch No.1, 2 and 4. (Simon-san, Thanks!)
  - Since patch No.3 is changed in big at v4, I dropped his "Reviewed-by".

Changes from v2:
 - Revise the commit log ("SoCs" is not third-person singular present).

Changes from v1:
 - Revise typo "wronly" to "wrongly".
 - Remove RCAR_GEN3_PHY_HAS_DEDICATED_PINS from generic gen3 entry in
   patch 3/4
 - Remove the driver change from patch 4/4.
 - Revise the commit log of patch 4/4.

Yoshihiro Shimoda (4):
  phy: rcar-gen3-usb2: check dr_mode for otg mode
  phy: rcar-gen3-usb2: use enum phy_mode in the role_store()
  phy: rcar-gen3-usb2: add SoC-specific parameter for dedicated pins
  phy: rcar-gen3-usb2: add binding for r8a77995

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 70 ++++++++++++++--------
 2 files changed, 48 insertions(+), 24 deletions(-)

-- 
1.9.1
