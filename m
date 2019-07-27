From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 4/4] MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver
Date: Sat, 27 Jul 2019 14:04:15 +0200
Message-ID: <20190727120415.15859-5-martin.blumenstingl@googlemail.com>
References: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com, paul.burton@mips.com, ralf@linux-mips.org
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, hauke@hauke-m.de, mark.rutland@arm.com, ms@dev.tdt.de, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The mainline PCIe PHY driver has it's own devicetree node. Update the
clock alias so the mainline driver finds the clocks.

The first PCIe PHY is located at 0x1f106800 and exists on VRX200, ARX300
and GRX390.
The second PCIe PHY is located at 0x1f700400 and exists on ARX300 and
GRX390.
The third PCIe PHY is located at 0x1f106a00 and exists onl on GRX390.
Lantiq's board support package (called "UGW") names these registers
"PDI".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/mips/lantiq/xway/sysctrl.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index b4323b2214e2..156a95ac5c72 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -468,14 +468,14 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1f203018.usb2-phy", "phy", 1, 2, PMU_ANALOG_USB0_P);
 		clkdev_add_pmu("1f203034.usb2-phy", "phy", 1, 2, PMU_ANALOG_USB1_P);
 		/* rc 0 */
-		clkdev_add_pmu("1d900000.pcie", "phy", 1, 2, PMU_ANALOG_PCIE0_P);
+		clkdev_add_pmu("1f106800.phy", "phy", 1, 2, PMU_ANALOG_PCIE0_P);
 		clkdev_add_pmu("1d900000.pcie", "msi", 1, 1, PMU1_PCIE_MSI);
-		clkdev_add_pmu("1d900000.pcie", "pdi", 1, 1, PMU1_PCIE_PDI);
+		clkdev_add_pmu("1f106800.phy", "pdi", 1, 1, PMU1_PCIE_PDI);
 		clkdev_add_pmu("1d900000.pcie", "ctl", 1, 1, PMU1_PCIE_CTL);
 		/* rc 1 */
-		clkdev_add_pmu("19000000.pcie", "phy", 1, 2, PMU_ANALOG_PCIE1_P);
+		clkdev_add_pmu("1f700400.phy", "phy", 1, 2, PMU_ANALOG_PCIE1_P);
 		clkdev_add_pmu("19000000.pcie", "msi", 1, 1, PMU1_PCIE1_MSI);
-		clkdev_add_pmu("19000000.pcie", "pdi", 1, 1, PMU1_PCIE1_PDI);
+		clkdev_add_pmu("1f700400.phy", "pdi", 1, 1, PMU1_PCIE1_PDI);
 		clkdev_add_pmu("19000000.pcie", "ctl", 1, 1, PMU1_PCIE1_CTL);
 	}
 
@@ -499,9 +499,9 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1e101000.usb", "otg", 1, 0, PMU_USB0);
 		clkdev_add_pmu("1e106000.usb", "otg", 1, 0, PMU_USB1);
 		/* rc 2 */
-		clkdev_add_pmu("1a800000.pcie", "phy", 1, 2, PMU_ANALOG_PCIE2_P);
+		clkdev_add_pmu("1f106a00.pcie", "phy", 1, 2, PMU_ANALOG_PCIE2_P);
 		clkdev_add_pmu("1a800000.pcie", "msi", 1, 1, PMU1_PCIE2_MSI);
-		clkdev_add_pmu("1a800000.pcie", "pdi", 1, 1, PMU1_PCIE2_PDI);
+		clkdev_add_pmu("1f106a00.pcie", "pdi", 1, 1, PMU1_PCIE2_PDI);
 		clkdev_add_pmu("1a800000.pcie", "ctl", 1, 1, PMU1_PCIE2_CTL);
 		clkdev_add_pmu("1e10b308.eth", NULL, 0, 0, PMU_SWITCH | PMU_PPE_DP);
 		clkdev_add_pmu("1da00000.usif", "NULL", 1, 0, PMU_USIF);
@@ -526,10 +526,10 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1e101000.usb", "otg", 1, 0, PMU_USB0 | PMU_AHBM);
 		clkdev_add_pmu("1f203034.usb2-phy", "phy", 1, 0, PMU_USB1_P);
 		clkdev_add_pmu("1e106000.usb", "otg", 1, 0, PMU_USB1 | PMU_AHBM);
-		clkdev_add_pmu("1d900000.pcie", "phy", 1, 1, PMU1_PCIE_PHY);
+		clkdev_add_pmu("1f106800.phy", "phy", 1, 1, PMU1_PCIE_PHY);
 		clkdev_add_pmu("1d900000.pcie", "bus", 1, 0, PMU_PCIE_CLK);
 		clkdev_add_pmu("1d900000.pcie", "msi", 1, 1, PMU1_PCIE_MSI);
-		clkdev_add_pmu("1d900000.pcie", "pdi", 1, 1, PMU1_PCIE_PDI);
+		clkdev_add_pmu("1f106800.phy", "pdi", 1, 1, PMU1_PCIE_PDI);
 		clkdev_add_pmu("1d900000.pcie", "ctl", 1, 1, PMU1_PCIE_CTL);
 		clkdev_add_pmu(NULL, "ahb", 1, 0, PMU_AHBM | PMU_AHBS);
 
-- 
2.22.0
