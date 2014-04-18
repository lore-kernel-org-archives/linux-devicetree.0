From: Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: [PATCH 3/6] net/fsl_pq_mdio: Document supported compatibles
Date: Fri, 18 Apr 2014 07:21:30 -0500
Message-ID: <1397823693-27977-3-git-send-email-Shruti@Freescale.com>
References: <1397823693-27977-1-git-send-email-Shruti@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397823693-27977-1-git-send-email-Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The device tree binding(s) document has fallen out of sync with the
driver code. Update the list of supported devices to reflect current
driver capabilities

Signed-off-by: Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/net/fsl-tsec-phy.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
index d2ea460..14b72fc 100644
--- a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
+++ b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
@@ -8,7 +8,16 @@ of how to define a PHY.
 Required properties:
   - reg : Offset and length of the register set for the device
   - compatible : Should define the compatible device type for the
-    mdio.  Currently, this is most likely to be "fsl,gianfar-mdio"
+    mdio. Currently supported strings/devices are:
+	- "fsl,gianfar-tbi"
+	- "fsl,gianfar-mdio"
+	- "fsl,etsec2-tbi"
+	- "fsl,etsec2-mdio"
+	- "fsl,ucc-mdio"
+	- "fsl,fman-mdio"
+    When device_type is "mdio", the following strings are also considered:
+	- "gianfar"
+	- "ucc_geth_phy"
 
 Example:
 
-- 
1.8.3.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
