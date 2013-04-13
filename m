From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 2/6] DT: add documentation for the Ralink MIPS SoCs
Date: Sat, 13 Apr 2013 10:50:22 +0200
Message-ID: <1365843026-11015-2-git-send-email-blogic@openwrt.org>
References: <1365843026-11015-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1365843026-11015-1-git-send-email-blogic@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Gabor Juhos <juhosg@openwrt.org>
List-Id: devicetree@vger.kernel.org

From: Gabor Juhos <juhosg@openwrt.org>

This patch adds binding documentation for the
compatible values of the Ralink MIPS SoCs.

Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
---
 Documentation/devicetree/bindings/mips/ralink.txt |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ralink.txt

diff --git a/Documentation/devicetree/bindings/mips/ralink.txt b/Documentation/devicetree/bindings/mips/ralink.txt
new file mode 100644
index 0000000..43fc03c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ralink.txt
@@ -0,0 +1,17 @@
+Ralink MIPS SoC device tree bindings
+
+1. SoCs
+
+Each device tree must specify a compatible value for the Ralink SoC
+it uses in the compatible property of the root node. The compatible
+value must be one of the following values:
+
+  ralink,rt2880-soc
+  ralink,rt3050-soc
+  ralink,rt3052-soc
+  ralink,rt3350-soc
+  ralink,rt3352-soc
+  ralink,rt3883-soc
+  ralink,rt5350-soc
+  ralink,mt7620-soc
+
-- 
1.7.10.4
