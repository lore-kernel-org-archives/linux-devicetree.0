From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v3 1/8] phy: miphy28lp: Add Device Tree bindings for the
 MiPHY28lp
Date: Fri, 26 Sep 2014 10:54:10 +0200
Message-ID: <1411721657-9924-2-git-send-email-gabriel.fernandez@linaro.org>
References: <1411721657-9924-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411721657-9924-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, alexandre torgue <alexandre.torgue@st.com>
List-Id: devicetree@vger.kernel.org

The MiPHY28lp is a Generic PHY which can serve various SATA or PCIe
or USB3 devices.

Signed-off-by: alexandre torgue <alexandre.torgue@st.com>
Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 .../devicetree/bindings/phy/phy-miphy28lp.txt      | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-miphy28lp.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt b/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
new file mode 100644
index 0000000..f7cfc5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
@@ -0,0 +1,126 @@
+STMicroelectronics STi MIPHY28LP PHY binding
+============================================
+
+This binding describes a miphy device that is used to control PHY hardware
+for SATA, PCIe or USB3.
+
+Required properties (controller (parent) node):
+- compatible	: Should be "st,miphy28lp-phy".
+- st,syscfg	: Should be a phandle of the system configuration register group
+		  which contain the SATA, PCIe or USB3 mode setting bits.
+
+Required nodes	:  A sub-node is required for each channel the controller
+		   provides. Address range information including the usual
+		   'reg' and 'reg-names' properties are used inside these
+		   nodes to describe the controller's topology. These nodes
+		   are translated by the driver's .xlate() function.
+
+Required properties (port (child) node):
+- #phy-cells	: Should be 1 (See second example)
+		  Cell after port phandle is device type from:
+			- MIPHY_TYPE_SATA
+			- MIPHY_TYPE_PCI
+			- MIPHY_TYPE_USB3
+- reg		: Address and length of the register set for the device.
+- reg-names	: The names of the register addresses corresponding to the registers
+		  filled in "reg". Is can also contain the offset of the system configuration
+		  registers used as glue-logic to setup the device for SATA/PCIe or USB3
+		  devices.
+- resets	: phandle to the parent reset controller.
+- reset-names	: Associated name must be "miphy-sw-rst".
+
+Optional properties (port (child) node):
+- st,osc-rdy		: to check the MIPHY0_OSC_RDY status in the glue-logic. This
+			  is not available in all the MiPHY. For example, for STiH407, only the
+			  MiPHY0 has this bit.
+- st,osc-force-ext	: to select the external oscillator. This can change from
+			  different MiPHY inside the same SoC.
+- st,sata_gen		: to select which SATA_SPDMODE has to be set in the SATA system config
+			  register.
+- st,px_rx_pol_inv	: to invert polarity of RXn/RXp (respectively negative line and positive
+			  line).
+
+example:
+
+		miphy28lp_phy: miphy28lp@9b22000 {
+			compatible = "st,miphy28lp-phy";
+			st,syscfg = <&syscfg_core>;
+			#address-cells	= <1>;
+			#size-cells	= <1>;
+			ranges;
+
+			phy_port0: port@9b22000 {
+				reg = <0x9b22000 0xff>,
+				      <0x9b09000 0xff>,
+				      <0x9b04000 0xff>,
+				      <0x114 0x4>, /* sysctrl MiPHY cntrl */
+				      <0x818 0x4>, /* sysctrl MiPHY status*/
+				      <0xe0  0x4>, /* sysctrl PCIe */
+				      <0xec  0x4>; /* sysctrl SATA */
+				reg-names = "sata-up",
+					    "pcie-up",
+					    "pipew",
+					    "miphy-ctrl-glue",
+					    "miphy-status-glue",
+					    "pcie-glue",
+					    "sata-glue";
+				#phy-cells = <1>;
+				st,osc-rdy;
+				reset-names = "miphy-sw-rst";
+				resets = <&softreset STIH407_MIPHY0_SOFTRESET>;
+			};
+
+			phy_port1: port@9b2a000 {
+				reg = <0x9b2a000 0xff>,
+				      <0x9b19000 0xff>,
+				      <0x9b14000 0xff>,
+				      <0x118 0x4>,
+				      <0x81c 0x4>,
+				      <0xe4  0x4>,
+				      <0xf0  0x4>;
+				reg-names = "sata-up",
+					    "pcie-up",
+					    "pipew",
+					    "miphy-ctrl-glue",
+					    "miphy-status-glue",
+					    "pcie-glue",
+					    "sata-glue";
+				#phy-cells = <1>;
+				st,osc-force-ext;
+				reset-names = "miphy-sw-rst";
+				resets = <&softreset STIH407_MIPHY1_SOFTRESET>;
+			};
+
+			phy_port2: port@8f95000 {
+				reg = <0x8f95000 0xff>,
+				      <0x8f90000 0xff>,
+				      <0x11c 0x4>,
+				      <0x820 0x4>;
+				reg-names = "pipew",
+				    "usb3-up",
+				    "miphy-ctrl-glue",
+				    "miphy-status-glue";
+				#phy-cells = <1>;
+				reset-names = "miphy-sw-rst";
+				resets = <&softreset STIH407_MIPHY2_SOFTRESET>;
+			};
+		};
+
+
+Specifying phy control of devices
+=================================
+
+Device nodes should specify the configuration required in their "phys"
+property, containing a phandle to the miphy device node and an index
+specifying which configuration to use, as described in phy-bindings.txt.
+
+example:
+		sata0: sata@9b20000  {
+			...
+			phys		= <&phy_port0 MIPHY_TYPE_SATA>;
+			...
+		};
+
+Macro definitions for the supported miphy configuration can be found in:
+
+include/dt-bindings/phy/phy-miphy28lp.h
-- 
1.9.1
