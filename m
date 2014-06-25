From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v2 1/2] Documentation: Document Hisilicon hix5hd2 sata PHY
Date: Wed, 25 Jun 2014 17:14:07 +0800
Message-ID: <1403687648-29082-2-git-send-email-zhangfei.gao@linaro.org>
References: <1403687648-29082-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403687648-29082-1-git-send-email-zhangfei.gao@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, arnd@arndb.de, mark.rutland@arm.com, haifeng.yan@linaro.org, jchxue@gmail.com, zhangfei.gao@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jiancheng Xue <xuejiancheng@huawei.com>
List-Id: devicetree@vger.kernel.org

From: Jiancheng Xue <xuejiancheng@huawei.com>

Add necessary binding documentation SATA PHY on Hisilicon hix5hd2 soc.

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---
 .../devicetree/bindings/phy/hix5hd2-sata-phy.txt   |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt b/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt
new file mode 100644
index 0000000..296168b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt
@@ -0,0 +1,22 @@
+Hisilicon hix5hd2 SATA PHY
+-----------------------
+
+Required properties:
+- compatible: should be "hisilicon,hix5hd2-sata-phy"
+- reg: offset and length of the PHY registers
+- #phy-cells: must be 0
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+Optional Properties:
+- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
+- hisilicon,power-reg: offset and bit number within peripheral-syscon,
+	register of controlling sata power supply.
+
+Example:
+	sata_phy: phy@f9900000 {
+		compatible = "hisilicon,hix5hd2-sata-phy";
+		reg = <0xf9900000 0x10000>;
+		#phy-cells = <0>;
+		hisilicon,peripheral-syscon = <&peripheral_ctrl>;
+		hisilicon,power-reg = <0x8 10>;
+	};
-- 
1.7.9.5
