From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 4/4] MAINTAINERS: Add entry for Actions Semi Owl SoCs DMA driver
Date: Thu, 26 Jul 2018 10:36:58 +0530
Message-ID: <20180726050658.1399-5-manivannan.sadhasivam@linaro.org>
References: <20180726050658.1399-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726050658.1399-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, dan.j.williams@intel.com, afaerber@suse.de, robh+dt@kernel.org, dmaengine@vger.kernel.org, liuwei@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add entry for Actions Semi Owl SoCs DMA driver under ARM/ACTIONS.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09b54e9ebc6f..56d9c7715c2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1145,12 +1145,14 @@ F:	arch/arm/boot/dts/owl-*
 F:	arch/arm64/boot/dts/actions/
 F:	drivers/clk/actions/
 F:	drivers/clocksource/owl-*
+F:	drivers/dma/owl-dma.c
 F:	drivers/pinctrl/actions/*
 F:	drivers/soc/actions/
 F:	include/dt-bindings/power/owl-*
 F:	include/linux/soc/actions/
 F:	Documentation/devicetree/bindings/arm/actions.txt
 F:	Documentation/devicetree/bindings/clock/actions,s900-cmu.txt
+F:	Documentation/devicetree/bindings/dma/owl-dma.txt
 F:	Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
 F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
 F:	Documentation/devicetree/bindings/timer/actions,owl-timer.txt
-- 
2.17.1
