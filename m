From: Yasha Cherikovsky <yasha.che3@gmail.com>
Subject: [RFC v2 6/7] dt-binding: mips: Document Realtek SoC DT bindings
Date: Mon,  1 Oct 2018 13:29:51 +0300
Message-ID: <20181001102952.7913-7-yasha.che3@gmail.com>
References: <20181001102952.7913-1-yasha.che3@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001102952.7913-1-yasha.che3@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
Cc: Yasha Cherikovsky <yasha.che3@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree binding doc for Realtek MIPS SoCs.

It includes a compatible string for the Realtek RTL8186 SoC.

Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/mips/realtek.txt | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/realtek.txt

diff --git a/Documentation/devicetree/bindings/mips/realtek.txt b/Documentation/devicetree/bindings/mips/realtek.txt
new file mode 100644
index 000000000000..09d19758168a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/realtek.txt
@@ -0,0 +1,9 @@
+Realtek MIPS SoC device tree bindings
+
+1. SoCs
+
+Each device tree must specify a compatible value for the Realtek SoC
+it uses in the compatible property of the root node. The compatible
+value must be one of the following values:
+
+  realtek,rtl8186-soc
-- 
2.19.0
