From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH V3 0/6] stmmac: add some fixes for stm32
Date: Tue, 5 Mar 2019 09:29:22 +0100
Message-ID: <1551774568-11732-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

For common stmmac:
	- Add support to set CSR Clock range selection in DT
For stm32mpu:
	- Glue codes to support magic packet
	- Glue codes to support all PHY config :
		PHY_MODE (MII,GMII, RMII, RGMII) and in normal,
		PHY wo crystal (25Mhz),
		PHY wo crystal (50Mhz), No 125Mhz from PHY config
For stm32mcu:
	- Add Ethernet support for stm32h7

Changes in V3:
	- Reverse for syscfg management because it is manage by these patches
	  https://lkml.org/lkml/2018/12/12/133
	  https://lkml.org/lkml/2018/12/12/134
	  https://lkml.org/lkml/2018/12/12/131
	  https://lkml.org/lkml/2018/12/12/132


Christophe Roullier (6):
  net: ethernet: stmmac: manage Ethernet WoL for stm32mp157c.
  net: ethernet: stmmac: update to support all PHY config for
    stm32mp157c.
  dt-bindings: net: stmmac: add phys config properties
  net: ethernet: stmmac: add management of clk_csr property
  dt-bindings: net: stmmac: remove syscfg clock property
  ARM: dts: stm32: Add Ethernet support on stm32h7 SOC and activate it
    for eval and disco boards

 .../devicetree/bindings/net/stm32-dwmac.txt        |   9 +-
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           |  15 +++
 arch/arm/boot/dts/stm32h743.dtsi                   |  13 ++
 arch/arm/boot/dts/stm32h743i-disco.dts             |  17 +++
 arch/arm/boot/dts/stm32h743i-eval.dts              |  17 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 135 +++++++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   3 +
 7 files changed, 183 insertions(+), 26 deletions(-)

-- 
2.7.4
