From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: reset: Add HI3670 reset controller binding
Date: Fri, 15 Feb 2019 11:19:54 +0530
Message-ID: <20190215054955.788-2-manivannan.sadhasivam@linaro.org>
References: <20190215054955.788-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215054955.788-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guodong.xu@linaro.org, john.stultz@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

HI3670 SoC is architecturally same as the HI3660 SoC. Hence, the same
driver is reused for HI3670 SoC and the binding is documented here which
uses the fallback approach.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/reset/hisilicon,hi3660-reset.txt   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
index 2bf3344b2a02..2df4bddeb688 100644
--- a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
+++ b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
@@ -5,11 +5,12 @@ Please also refer to reset.txt in this directory for common reset
 controller binding usage.
 
 The reset controller registers are part of the system-ctl block on
-hi3660 SoC.
+hi3660 and hi3670 SoCs.
 
 Required properties:
-- compatible: should be
-		 "hisilicon,hi3660-reset"
+- compatible: should be one of the following:
+		 "hisilicon,hi3660-reset" for HI3660
+		 "hisilicon,hi3670-reset", "hisilicon,hi3660-reset" for HI3670
 - hisi,rst-syscon: phandle of the reset's syscon.
 - #reset-cells : Specifies the number of cells needed to encode a
   reset source.  The type shall be a <u32> and the value shall be 2.
-- 
2.17.1
