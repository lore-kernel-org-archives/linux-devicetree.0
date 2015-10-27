From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3 1/4] extcon: arizona: Add extcon specific device tree binding document
Date: Tue, 27 Oct 2015 16:01:56 +0000
Message-ID: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Subsystem specific bindings for the Arizona devices are being factored
out of the MFD binding document into separate documents for each
subsystem. This patch adds a binding document that covers the existing
extcon specific bindings.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---

Changes since v2:
 - Moved the maintainer updates into a separate patch

Thanks,
Charles

 .../devicetree/bindings/extcon/extcon-arizona.txt  |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-arizona.txt

diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
new file mode 100644
index 0000000..e1705fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
@@ -0,0 +1,15 @@
+Cirrus Logic Arizona class audio SoCs
+
+These devices are audio SoCs with extensive digital capabilities and a range
+of analogue I/O.
+
+This document lists Extcon specific bindings, see the primary binding document:
+  ../mfd/arizona.txt
+
+Optional properties:
+
+  - wlf,hpdet-channel : Headphone detection channel.
+    ARIZONA_ACCDET_MODE_HPL or 1 - Headphone detect mode is set to HPDETL
+    ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to HPDETR
+    If this node is not mentioned or if the value is unknown, then
+    headphone detection mode is set to HPDETL.
-- 
1.7.2.5
