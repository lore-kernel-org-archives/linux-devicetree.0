From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH 1/2] Documentation: synopsys-dw-mshc: add binding for resets
Date: Sun,  6 Mar 2016 15:47:41 +0700
Message-ID: <1457254062-22677-1-git-send-email-guodong.xu@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, jh80.chung@samsung.com, ulf.hansson@linaro.org, shawn.lin@rock-chips.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Cc: Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Add resets property to synopsys-dw-mshc bindings. It is intended to
represent the hardware reset signal present internally in some host
controller IC designs.

See Documentation/devicetree/bindings/reset/reset.txt for details.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt
index 8636f5a..4e00e85 100644
--- a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt
@@ -39,6 +39,10 @@ Required Properties:
 
 Optional properties:
 
+* resets: phandle + reset specifier pair, intended to represent hardware
+  reset signal present internally in some host controller IC designs.
+  See Documentation/devicetree/bindings/reset/reset.txt for details.
+
 * clocks: from common clock binding: handle to biu and ciu clocks for the
   bus interface unit clock and the card interface unit clock.
 
-- 
1.9.1

