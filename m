From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3 2/4] regulator: arizona: Add regulator specific device tree binding document
Date: Tue, 27 Oct 2015 16:01:57 +0000
Message-ID: <1445961719-1020-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Subsystem specific bindings for the Arizona devices are being factored
out of the MFD binding document into separate documents for each
subsystem. This patch adds a binding document that covers the existing
regulator specific bindings.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

Changes since v2:
 - Moved the core regulators back into the MFD component
 - Moved the maintainer updates into a separate patch

Thanks,
Charles

 .../bindings/regulator/arizona-regulator.txt       |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/arizona-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/arizona-regulator.txt b/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
new file mode 100644
index 0000000..443564d
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
@@ -0,0 +1,17 @@
+Cirrus Logic Arizona class audio SoCs
+
+These devices are audio SoCs with extensive digital capabilities and a range
+of analogue I/O.
+
+This document lists regulator specific bindings, see the primary binding
+document:
+  ../mfd/arizona.txt
+
+Optional properties:
+  - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
+
+Optional subnodes:
+  - ldo1 : Initial data for the LDO1 regulator, as covered in
+    Documentation/devicetree/bindings/regulator/regulator.txt
+  - micvdd : Initial data for the MICVDD regulator, as covered in
+    Documentation/devicetree/bindings/regulator/regulator.txt
-- 
1.7.2.5
