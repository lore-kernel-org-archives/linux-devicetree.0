From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 098/167] ARM: dts: qcom: ipq4019: fix PCI range
Date: Tue,  3 Sep 2019 12:24:10 -0400
Message-ID: <20190903162519.7136-98-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Mathias Kresin <dev@kresin.me>, John Crispin <john@phrozen.org>, Andy Gross <andy.gross@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Mathias Kresin <dev@kresin.me>

[ Upstream commit da89f500cb55fb3f19c4b399b46d8add0abbd4d6 ]

The PCI range is invalid and PCI attached devices doen't work.

Signed-off-by: Mathias Kresin <dev@kresin.me>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Andy Gross <andy.gross@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 78db67337ed4a..2c3168d95a2d5 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -387,7 +387,7 @@
 			#size-cells = <2>;
 
 			ranges = <0x81000000 0 0x40200000 0x40200000 0 0x00100000
-				  0x82000000 0 0x48000000 0x48000000 0 0x10000000>;
+				  0x82000000 0 0x40300000 0x40300000 0 0x400000>;
 
 			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "msi";
-- 
2.20.1
