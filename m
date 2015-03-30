From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/6] ahci: st: Update the DT example for how to obtain the PHY.
Date: Mon, 30 Mar 2015 16:17:08 +0100
Message-ID: <1427728632-10846-3-git-send-email-peter.griffin@linaro.org>
References: <1427728632-10846-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427728632-10846-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

The example is wrong in that the phys property should take a
phandle to the phy port.

Also with the changing over to generic PHY type constants we also
update that as well.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/ata/ahci-st.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/ahci-st.txt b/Documentation/devicetree/bindings/ata/ahci-st.txt
index 0574a77..1331202 100644
--- a/Documentation/devicetree/bindings/ata/ahci-st.txt
+++ b/Documentation/devicetree/bindings/ata/ahci-st.txt
@@ -11,7 +11,7 @@ Required properties:
  - reset-names	   :   Associated names must be; "pwr-dwn" and "sw-rst"
  - clocks	   : The phandle for the clock
  - clock-names	   :   Associated name must be; "ahci_clk"
- - phys		   : The phandle for the PHY device
+ - phys		   : The phandle for the PHY port
  - phy-names	   :   Associated name must be; "ahci_phy"
 
 Example:
@@ -21,7 +21,7 @@ Example:
 		reg             = <0xfe380000 0x1000>;
 		interrupts      = <GIC_SPI 157 IRQ_TYPE_NONE>;
 		interrupt-names = "hostc";
-		phys	        = <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
+		phys	        = <&phy_port0 PHY_TYPE_SATA>;
 		phy-names       = "ahci_phy";
 		resets	        = <&powerdown STIH416_SATA0_POWERDOWN>,
 				  <&softreset STIH416_SATA0_SOFTRESET>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
