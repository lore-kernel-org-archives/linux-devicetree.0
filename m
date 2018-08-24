From: Hanjie Lin <hanjie.lin@amlogic.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: add DT bindings for Amlogic Meson
 PCIe Phy controller
Date: Fri, 24 Aug 2018 15:33:25 +0800
Message-ID: <1535096006-152091-2-git-send-email-hanjie.lin@amlogic.com>
References: <1535096006-152091-1-git-send-email-hanjie.lin@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535096006-152091-1-git-send-email-hanjie.lin@amlogic.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Yixun Lan <yixun.lan@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Yue Wang <yue.wang@amlogic.com>

The Meson-PCIE-PHY controller supports the 5-Gbps data rate
of the PCI Express Gen 2 specification and is backward compatible
with the 2.5-Gbps Gen 1.1 specification with only
inferred idle detection supported on Amlogic SoCs.

Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Yue Wang <yue.wang@amlogic.com>
---
 .../bindings/phy/amlogic,meson-pcie-phy.txt         | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt b/Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt
new file mode 100644
index 0000000..e2f0a27
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt
@@ -0,0 +1,21 @@
+* Amlogic Meson AXG PCIE PHY binding
+
+Required properties:
+- compatible:	Should be
+	- "amlogic,axg-pcie-phy"
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+- reg:		The base address and length of the registers
+- resets:	phandle to the reset lines
+- reset-names:	must contain "phy" and "peripheral"
+	- "phy"	PHY reset
+Optional properties:
+- phy-supply:	see phy-bindings.txt in this directory
+
+Example:
+	pcie_phy: pcie-phy@ff644000 {
+		#phy-cells = <0>;
+		compatible = "amlogic,axg-pcie-phy";
+		reg = <0x0 0xff644000 0x0 0x2000>;
+		resets = <&reset RESET_PCIE_PHY>;
+		reset-names = "phy";
+	};
-- 
2.7.4
