Return-Path: <SRS0=Paxx=RQ=mediatek.com=stanley.chu@kernel.org>
From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v4 5/7] dt-bindings: scsi: ufs: Add document for ufs-mediatek
Date: Wed, 13 Mar 2019 12:10:09 +0800
Message-ID: <1552450211-7149-7-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1552450211-7149-1-git-send-email-stanley.chu@mediatek.com>
References: <1552450211-7149-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, chunfeng.yun@mediatek.com, kishon@ti.com, martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, pedrom.sousa@synopsys.com
Cc: vivek.gautam@codeaurora.org, subhashj@codeaurora.org, liwei213@huawei.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuohong.wang@mediatek.com, peter.wang@mediatek.com, chun-hung.wu@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Add UFS and UFS PHY node document for Mediatek SoC chips.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 .../devicetree/bindings/ufs/ufs-mediatek.txt  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt

diff --git a/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt b/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
new file mode 100644
index 000000000000..9594e1cd7ecf
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
@@ -0,0 +1,44 @@
+* Mediatek Universal Flash Storage (UFS) Host Controller
+
+UFS nodes are defined to describe on-chip UFS hardware macro.
+Each UFS Host Controller should have its own node.
+
+To bind UFS PHY with UFS host controller, the controller node should
+contain a phandle reference to UFS M-PHY node.
+
+Required properties for UFS nodes:
+- compatible         : Compatible list, contains the following controller:
+                       "mediatek,mt8183-ufshci" for MediaTek UFS host controller
+                       present on MT81xx chipsets.
+- reg                : Address and length of the UFS register set.
+- phys               : phandle to m-phy.
+- clocks             : List of phandle and clock specifier pairs.
+- clock-names        : List of clock input name strings sorted in the same
+                       order as the clocks property. "ufs-clk" is mandatory.
+- freq-table-hz      : Array of <min max> operating frequencies stored in the same
+                       order as the clocks property. If this property is not
+                       defined or a value in the array is "0" then it is assumed
+                       that the frequency is set by the parent clock or a
+                       fixed rate clock source.
+- vcc-supply         : Power to the UFS device.
+- vcc-fixed-regulator: Specify that vcc-supply is a fixed regulator.
+
+Example:
+
+	ufsphy: phy@11fa0000 {
+		...
+	};
+
+	ufshci@11270000 {
+		compatible = "mediatek,mt8183-ufshci";
+		reg = <0 0x11270000 0 0x2300>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
+		phys = <&ufsphy>;
+
+		clocks = <&infracfg_ao INFRACFG_AO_UFS_CG>;
+		clock-names = "ufs-clk";
+		freq-table-hz = <0 0>;
+
+		vcc-supply = <&mt_pmic_vemc_ldo_reg>;
+		vcc-fixed-regulator;
+	};
-- 
2.18.0
