From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] dt-bindings: mmc: Add HI3670 MMC controller binding
Date: Thu, 28 Feb 2019 21:15:09 +0530
Message-ID: <20190228154511.17566-2-manivannan.sadhasivam@linaro.org>
References: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, amit.kucheria@linaro.org, guodong.xu@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

HI3670 SoC is architecturally same as the HI3660 SoC. Hence, the same
K3 specific designware driver is reused for HI3670 SoC and the binding
is documented with fallback approach for compatible property.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
index 07242d141773..36c4bea675d5 100644
--- a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
@@ -13,6 +13,8 @@ Required Properties:
 
 * compatible: should be one of the following.
   - "hisilicon,hi3660-dw-mshc": for controllers with hi3660 specific extensions.
+  - "hisilicon,hi3670-dw-mshc", "hisilicon,hi3660-dw-mshc": for controllers
+     with hi3670 specific extensions.
   - "hisilicon,hi4511-dw-mshc": for controllers with hi4511 specific extensions.
   - "hisilicon,hi6220-dw-mshc": for controllers with hi6220 specific extensions.
 
-- 
2.17.1
