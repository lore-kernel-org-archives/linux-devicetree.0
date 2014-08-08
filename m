From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 1/5] ARM: shmobile: r8a7740: document MSTP clock support
Date: Fri,  8 Aug 2014 16:23:08 +0200
Message-ID: <1407507792-8121-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1407507792-8121-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1407507792-8121-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au
Cc: linux-sh@vger.kernel.org, mturquette@linaro.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
index 8a92b5f..b3c0617 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
@@ -11,6 +11,7 @@ Required Properties:
 
   - compatible: Must be one of the following
     - "renesas,r7s72100-mstp-clocks" for R7S72100 (RZ) MSTP gate clocks
+    - "renesas,r8a7740-mstp-clocks" for R8A7740 (R-Mobile A1) MSTP gate clocks
     - "renesas,r8a7779-mstp-clocks" for R8A7779 (R-Car H1) MSTP gate clocks
     - "renesas,r8a7790-mstp-clocks" for R8A7790 (R-Car H2) MSTP gate clocks
     - "renesas,r8a7791-mstp-clocks" for R8A7791 (R-Car M2) MSTP gate clocks
-- 
1.8.4.5

