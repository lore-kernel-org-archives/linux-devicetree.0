Return-Path: <SRS0=Paxx=RQ=mediatek.com=stanley.chu@kernel.org>
From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v4 4/7] dt-bindings: phy: Add document for phy-mtk-ufs
Date: Wed, 13 Mar 2019 12:10:08 +0800
Message-ID: <1552450211-7149-6-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1552450211-7149-1-git-send-email-stanley.chu@mediatek.com>
References: <1552450211-7149-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, chunfeng.yun@mediatek.com, kishon@ti.com, martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, pedrom.sousa@synopsys.com
Cc: vivek.gautam@codeaurora.org, subhashj@codeaurora.org, liwei213@huawei.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuohong.wang@mediatek.com, peter.wang@mediatek.com, chun-hung.wu@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Add UFS M-PHY node document for MediaTek SoC chips.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 .../devicetree/bindings/phy/phy-mtk-ufs.txt   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt b/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
new file mode 100644
index 000000000000..dc6c9933b08d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
@@ -0,0 +1,36 @@
+MediaTek Universal Flash Storage (UFS) M-PHY binding
+--------------------------------------------------------
+
+UFS M-PHY nodes are defined to describe on-chip UFS M-PHY hardware macro.
+Each UFS M-PHY node should have its own node.
+
+To bind UFS M-PHY with UFS host controller, the controller node should
+contain a phandle reference to UFS M-PHY node.
+
+Required properties for UFS M-PHY nodes:
+- compatible         : Compatible list, contains the following controller:
+                       "mediatek,mt8183-ufsphy" for ufs phy
+                       persent on MT81xx chipsets.
+- reg                : Address and length of the UFS M-PHY register set.
+- #phy-cells         : This property shall be set to 0
+- clocks             : List of phandle and clock specifier pairs.
+- clock-names        : List of clock input name strings sorted in the same
+                       order as the clocks property. "unipro-clk" and
+                       "mp-clk" are mandatory.
+
+Example:
+
+	ufsphy: phy@11fa0000 {
+		compatible = "mediatek,mt8183-ufsphy";
+		reg = <0 0x11fa0000 0 0xc000>;
+		#phy-cells = <0>;
+
+		clocks = <&infracfg_ao INFRACFG_AO_UNIPRO_SCK_CG>,
+			 <&infracfg_ao INFRACFG_AO_UFS_MP_SAP_BCLK_CG>;
+		clock-names = "unipro-clk", "mp-clk";
+	};
+
+	ufshci@11270000 {
+		...
+		phys = <&ufsphy>;
+	};
-- 
2.18.0
