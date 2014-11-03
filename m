From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2] pinctrl: dra: dt-bindings: Fix output pull up/down
Date: Mon, 3 Nov 2014 12:09:52 +0200
Message-ID: <1415009392-6627-1-git-send-email-rogerq@ti.com>
References: <1414752745-13696-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1414752745-13696-1-git-send-email-rogerq@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: tony@atomide.com
Cc: nm@ti.com, balbi@ti.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

For PIN_OUTPUT_PULLUP and PIN_OUTPUT_PULLDOWN we must not set the
PULL_DIS bit which disables the PULLs.

PULL_ENA is a 0 and using it in an OR operation is a NOP, so don't
use it in the PIN_OUTPUT_PULLUP/DOWN macros.

Fixes: 23d9cec07c58 ("pinctrl: dra: dt-bindings: Fix pull enable/disable")

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 include/dt-bindings/pinctrl/dra.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/pinctrl/dra.h b/include/dt-bindings/pinctrl/dra.h
index 3d33794..7448edf 100644
--- a/include/dt-bindings/pinctrl/dra.h
+++ b/include/dt-bindings/pinctrl/dra.h
@@ -40,8 +40,8 @@
 
 /* Active pin states */
 #define PIN_OUTPUT		(0 | PULL_DIS)
-#define PIN_OUTPUT_PULLUP	(PIN_OUTPUT | PULL_ENA | PULL_UP)
-#define PIN_OUTPUT_PULLDOWN	(PIN_OUTPUT | PULL_ENA)
+#define PIN_OUTPUT_PULLUP	(PULL_UP)
+#define PIN_OUTPUT_PULLDOWN	(0)
 #define PIN_INPUT		(INPUT_EN | PULL_DIS)
 #define PIN_INPUT_SLEW		(INPUT_EN | SLEWCONTROL)
 #define PIN_INPUT_PULLUP	(PULL_ENA | INPUT_EN | PULL_UP)
-- 
1.8.3.2

