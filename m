From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v3, 4/6] ARM: dts: ls1021a: add 1588 external trigger stamp fifo support
Date: Mon, 21 Jan 2019 18:41:41 +0800
Message-ID: <20190121104143.46782-5-yangbo.lu@nxp.com>
References: <20190121104143.46782-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190121104143.46782-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch is to add external trigger stamp fifo support
for 1588 timer.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None.
Changes for v3:
	- None.
---
 arch/arm/boot/dts/ls1021a.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index ed09412..ad75959 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -706,6 +706,7 @@
 			fsl,tmr-fiper1  = <999999995>;
 			fsl,tmr-fiper2  = <99990>;
 			fsl,max-adj     = <499999999>;
+			fsl,extts-fifo;
 		};
 
 		enet0: ethernet@2d10000 {
-- 
1.7.1
