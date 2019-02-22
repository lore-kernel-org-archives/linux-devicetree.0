From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH V2 3/8] dt-bindings: net: stmmac: add phys config properties
Date: Fri, 22 Feb 2019 09:28:04 +0100
Message-ID: <1550824089-19961-4-git-send-email-christophe.roullier@st.com>
References: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, christophe.roullier@st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add properties to support all Phy config
 PHY_MODE	(MII,GMII, RMII, RGMII) and in normal, PHY wo crystal (25Mhz),
 PHY wo crystal (50Mhz), No 125Mhz from PHY config.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 Documentation/devicetree/bindings/net/stm32-dwmac.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.txt b/Documentation/devicetree/bindings/net/stm32-dwmac.txt
index 1341012..f42dc68 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.txt
@@ -24,9 +24,9 @@ Required properties:
 	       encompases the glue register, and the offset of the control register.
 
 Optional properties:
-- clock-names:     For MPU family "mac-clk-ck" for PHY without quartz
-- st,int-phyclk (boolean) :  valid only where PHY do not have quartz and need to be clock
-	           by RCC
+- clock-names:     For MPU family "eth-ck" for PHY without quartz
+- st,eth_clk_sel (boolean) : set this property in RGMII PHY when you do not want use 125Mhz
+- st,eth_ref_clk_sel (boolean) :  set this property in RMII mode when you have PHY without crystal 50MHz
 
 Example:
 
-- 
2.7.4
