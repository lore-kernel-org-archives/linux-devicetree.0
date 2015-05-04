From: Suman Tripathi <stripathi@apm.com>
Subject: [PATCH v4 3/3] Documentation: mmc: Update Arasan SDHC documentation to support 4.9a version of Arasan SDHC controller.
Date: Mon,  4 May 2015 19:09:52 +0530
Message-ID: <1430746792-32574-4-git-send-email-stripathi@apm.com>
References: <1430746792-32574-1-git-send-email-stripathi@apm.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1430746792-32574-1-git-send-email-stripathi@apm.com>
Sender: linux-mmc-owner@vger.kernel.org
To: chris@printf.net, anton@enomsg.org, arnd@arndb.de, michal.simek@xilinx.com
Cc: linux-mmc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ddutile@redhat.com, jcm@redhat.com, mlangsdo@redhat.com, patches@apm.com, Suman Tripathi <stripathi@apm.com>
List-Id: devicetree@vger.kernel.org

This patch updates Arasan SDHC documentation to support
4.9a version of Arasan SDHC controller.

Signed-off-by: Suman Tripathi <stripathi@apm.com>
---
 Documentation/devicetree/bindings/mmc/arasan,sdhci.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt b/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
index 98ee2ab..6dd3d60 100644
--- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
+++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
@@ -8,7 +8,8 @@ Device Tree Bindings for the Arasan SDHCI Controller
   [3] Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

 Required Properties:
-  - compatible: Compatibility string. Must be 'arasan,sdhci-8.9a'
+  - compatible: Compatibility string. Must be 'arasan,sdhci-8.9a' or
+                'arasan,sdhci-4.9a'
   - reg: From mmc bindings: Register location and length.
   - clocks: From clock bindings: Handles to clock inputs.
   - clock-names: From clock bindings: Tuple including "clk_xin" and "clk_ahb"
--
1.8.2.1

