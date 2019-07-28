From: Ronen Krupnik <ronenk@amazon.com>
Subject: [PATCH 1/2] dt-bindings: amazon: add Amazon Annapurna Labs Alpine support
Date: Sun, 28 Jul 2019 22:51:34 +0300
Message-ID: <20190728195135.12661-2-ronenk@amazon.com>
References: <20190728195135.12661-1-ronenk@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190728195135.12661-1-ronenk@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, barakw@amazon.com, dwmw@amazon.co.uk, benh@amazon.com, jonnyc@amazon.com, talel@amazon.com, hhhawa@amazon.com, hanochu@amazon.com, Ronen Krupnik <ronenk@amazon.com>
List-Id: devicetree@vger.kernel.org

This patch adds DT bindings info for Amazon Annapurna Labs Alpine SOC
and related reference boards.

Signed-off-by: Ronen Krupnik <ronenk@amazon.com>
---
 .../devicetree/bindings/arm/amazon,alpine.txt | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amazon,alpine.txt

diff --git a/Documentation/devicetree/bindings/arm/amazon,alpine.txt b/Documentation/devicetree/bindings/arm/amazon,alpine.txt
new file mode 100644
index 000000000000..58817208421b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amazon,alpine.txt
@@ -0,0 +1,23 @@
+Amazon Annapurna Labs Alpine v3 Platform Device Tree Bindings
+---------------------------------------------------------------
+
+Platforms based on Amazon Annapurna Labs Alpine SoC architecture
+shall follow the following scheme:
+
+SoCs
+----
+
+Each device tree root node must specify which exact SoC in alpine
+architecture it uses, using one of the following compatible values:
+
+- alpine v3
+  compatible = "amazon,alpine-v3";
+
+Boards
+------
+
+Each device tree must specify which one or more of the following
+board-specific compatible values:
+
+- alpine-v3 Evaluation Platform (EVP)
+  compatible = "amazon,alpine-v3-evp";
-- 
2.21.0
