From: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: [PATCH v2 1/2] phy: rcar-gen2: add fallback binding
Date: Thu,  3 Mar 2016 09:38:37 +0900
Message-ID: <1456965518-13615-2-git-send-email-horms+renesas@verge.net.au>
References: <1456965518-13615-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456965518-13615-1-git-send-email-horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In the case of Renesas R-Car hardware we know that there are generations of
SoCs, e.g. Gen 2 and Gen 3. But beyond that its not clear what the
relationship between IP blocks might be. For example, I believe that
r8a7790 is older than r8a7791 but that doesn't imply that the latter is a
descendant of the former or vice versa.

We can, however, by examining the documentation and behaviour of the
hardware at run-time observe that the current driver implementation appears
to be compatible with the IP blocks on SoCs within a given generation.

For the above reasons and convenience when enabling new SoCs a
per-generation fallback compatibility string scheme being adopted for
drivers for Renesas SoCs.

Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
---
v2
* Use renesas,rcar-gen2-usb-phy rather than renesas,usb-phy-gen2 as
  the new compatibility string to fit in with the preferred scheme
  for new compatibility string names.
---
 Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 8 +++++++-
 drivers/phy/phy-rcar-gen2.c                             | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
index d564ba4f1cf6..feb1c3c102c2 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
@@ -7,6 +7,12 @@ Required properties:
 - compatible: "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
 	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
 	      "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
+	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 compatible device.
+
+	      When compatible with the generic version, nodes must list the
+	      SoC-specific version corresponding to the platform first
+	      followed by the generic version.
+
 - reg: offset and length of the register block.
 - #address-cells: number of address cells for the USB channel subnodes, must
 		  be <1>.
@@ -34,7 +40,7 @@ the USB channel; see the selector meanings below:
 Example (Lager board):
 
 	usb-phy@e6590100 {
-		compatible = "renesas,usb-phy-r8a7790";
+		compatible = "renesas,usb-phy-r8a7790","renesas,rcar-gen2-usb-phy";
 		reg = <0 0xe6590100 0 0x100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/drivers/phy/phy-rcar-gen2.c b/drivers/phy/phy-rcar-gen2.c
index c7a05996d5c1..97d4dd6ea924 100644
--- a/drivers/phy/phy-rcar-gen2.c
+++ b/drivers/phy/phy-rcar-gen2.c
@@ -195,6 +195,7 @@ static const struct of_device_id rcar_gen2_phy_match_table[] = {
 	{ .compatible = "renesas,usb-phy-r8a7790" },
 	{ .compatible = "renesas,usb-phy-r8a7791" },
 	{ .compatible = "renesas,usb-phy-r8a7794" },
+	{ .compatible = "renesas,rcar-gen2-usb-phy" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rcar_gen2_phy_match_table);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
