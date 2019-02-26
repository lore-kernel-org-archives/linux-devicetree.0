Return-Path: <SRS0=jiu+=RB=gmail.com=chunkeey@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH] ARM: dts: qcom: ipq4019: enlarge PCIe BAR range
Date: Tue, 26 Feb 2019 01:12:01 +0100
Message-Id: <20190226001201.23456-1-chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>
List-ID: <devicetree@vger.kernel.org>

David Bauer reported that the VDSL modem (attached via PCIe)
on his AVM Fritz!Box 7530 was complaining about not having
enough space in the BAR. A closer inspection of the old
qcom-ipq40xx.dtsi pulled from the GL-iNet repository listed:

| qcom,pcie@80000 {
|	compatible = "qcom,msm_pcie";
|	reg = <0x80000 0x2000>,
|	      <0x99000 0x800>,
|	      <0x40000000 0xf1d>,
|	      <0x40000f20 0xa8>,
|	      <0x40100000 0x1000>,
|	      <0x40200000 0x100000>,
|	      <0x40300000 0xd00000>;
|	reg-names = "parf", "phy", "dm_core", "elbi",
|			"conf", "io", "bars";

Matching the reg-names with the listed reg leads to
<0xd00000> as the size for the "bars".

Cc: stable@vger.kernel.org
BugLink: https://www.mail-archive.com/openwrt-devel@lists.openwrt.org/msg45212.html
Reported-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 78b24385b269..5578e3aa9f84 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -395,8 +395,8 @@
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x81000000 0 0x40200000 0x40200000 0 0x00100000
-				  0x82000000 0 0x40300000 0x40300000 0 0x400000>;
+			ranges = <0x81000000 0 0x40200000 0x40200000 0 0x00100000>,
+				 <0x82000000 0 0x40300000 0x40300000 0 0x00d00000>;
 
 			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "msi";
-- 
2.20.1
