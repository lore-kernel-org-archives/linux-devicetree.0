From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 0/4] phy: rcar-gen3-usb2: add support for r8a77995
Date: Tue, 10 Oct 2017 14:58:26 +0900
Message-ID: <1507615110-26206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest phy.git / next branch
(the commit id = 415060b21f318e009d865b4bcbf8f220ebc36964)

After this patch set is applied, a usb 2.0 host node that is combined
with usb 2.0 peripheral needs 'dr_mode = "otg";' property.

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
  phy: rcar-gen3-usb2: cleanup the role_{store,show}()
  phy: rcar-gen3-usb2: add SoC-specific parameter for dedicated pins
  phy: rcar-gen3-usb2: add binding for r8a77995

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 95 +++++++++++++++-------
 2 files changed, 68 insertions(+), 29 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
