From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/5] mfd: arizona: Add DT binding documentation for CODEC 32k clock source
Date: Sat, 28 Feb 2015 14:54:25 +0000
Message-ID: <1425135268-32340-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee@kernel.org
Cc: sameo@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index bfef000..7ca7c1f 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -36,6 +36,11 @@ Optional properties:
   - wlf,reset : GPIO specifier for the GPIO controlling /RESET
   - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
 
+  - wlf,clk32k-src : Set input source for the CODEC 32kHz clock. This can be
+    set to None (will be derived internally from SYSCLK), MCLK1, or MCLK2.
+    Defines (ARIZONA_32KZ_xxxx) can be found in <dt-bindings/mfd/arizona.txt>.
+    The default if this entry is not present is MCLK2.
+
   - wlf,gpio-defaults : A list of GPIO configuration register values. Defines
     for the appropriate values can found in <dt-bindings/mfd/arizona.txt>. If
     absent, no configuration of these registers is performed. If any entry has
-- 
1.7.2.5
