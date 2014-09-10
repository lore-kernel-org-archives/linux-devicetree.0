From: Frank Li <Frank.Li@freescale.com>
Subject: [Patch v3 net-next 12/12] ARM: dts: imx6sx: add multi-queue support enet
Date: Thu, 11 Sep 2014 02:30:45 +0800
Message-ID: <1410373845-5801-13-git-send-email-Frank.Li@freescale.com>
References: <1410373845-5801-1-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1410373845-5801-1-git-send-email-Frank.Li@freescale.com>
Sender: netdev-owner@vger.kernel.org
To: b38611@freescale.com, davem@davemloft.net, netdev@vger.kernel.org, lznuaa@gmail.com
Cc: shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, Frank Li <Frank.Li@freescale.com>
List-Id: devicetree@vger.kernel.org

Enable 3 queues suppport for ethernet

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 arch/arm/boot/dts/imx6sx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index f4b9da6..0a03260 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -776,6 +776,8 @@
 					 <&clks IMX6SX_CLK_ENET_PTP>;
 				clock-names = "ipg", "ahb", "ptp",
 					      "enet_clk_ref", "enet_out";
+				fsl,num-tx-queues=<3>;
+				fsl,num-rx-queues=<3>;
 				status = "disabled";
                         };
 
-- 
1.9.1
