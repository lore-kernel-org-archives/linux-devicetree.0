From: Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx bindings
Date: Tue, 11 Jun 2019 21:20:53 +0200
Message-ID: <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, robh@kernel.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY in
RX mode.

Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
---
Changelog
v3-v4
- @Laurent I know I told you I could remove the snps,dphy-frequency on V3 but
  it is really useful for me here. I removed all other the proprietary
  properties except this one. Do you still think it must be removed?
- Frequency units @Rob

 .../devicetree/bindings/phy/snps,dw-dphy-rx.txt    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt

diff --git a/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
new file mode 100644
index 0000000..50603e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
@@ -0,0 +1,29 @@
+Synopsys DesignWare MIPI Rx D-PHY block details
+
+Description
+-----------
+
+The Synopsys MIPI D-PHY controller supports MIPI-DPHY in receiver mode.
+Please refer to phy-bindings.txt for more information.
+
+Required properties:
+- compatible		: Shall be "snps,dw-dphy-rx".
+- #phy-cells		: Must be 1.
+- bus-width		: Size of the test interface data bus (8 bits->8 or
+			  12bits->12).
+- snps,dphy-frequency	: Frequency at which D-PHY should start, configurable.
+			  Check Synopsys databook. (-kHz)
+- reg			: Test interface register. This correspondes to the
+			  physical base address of the controller and size of
+			  the device memory mapped registers; Check Synopsys
+			  databook.
+
+Example:
+
+	mipi_dphy_rx1: dphy@d00003040 {
+		compatible = "snps,dw-dphy-rx";
+		#phy-cells = <1>;
+		bus-width = <12>;
+		snps,dphy-frequency = <300000>;
+		reg = <0xd0003040 0x20>;
+	};
-- 
2.7.4
