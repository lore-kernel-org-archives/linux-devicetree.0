From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 2/6] ahci: st: Update the DT example for how to obtain the PHY.
Date: Wed, 25 Feb 2015 13:36:13 +0000
Message-ID: <1424871377-1795-3-git-send-email-peter.griffin@linaro.org>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

The example is wrong in that the phys property should take a
phandle to the phy port.

Also with the changing over to generic PHY type constants we also
update this as well.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
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
