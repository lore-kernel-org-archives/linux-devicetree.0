From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
Date: Wed, 21 Nov 2018 17:06:56 -0800 (PST)
Message-ID: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, Megan Wachs <megan@sifive.com>, Wesley Terpstra <wesley@sifive.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, paul@pwsan.com
List-Id: devicetree@vger.kernel.org


For IP blocks that are generated from the public, open-source
sifive-blocks repository, describe the version numbering policy
that its maintainers intend to use, upon request from Rob
Herring <robh@kernel.org>.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Megan Wachs <megan@sifive.com>
Cc: Wesley Terpstra <wesley@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---

Hi Rob, please let me know if this document works with your
requirements, or if some changes are needed.  - Paul

 .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt

diff --git a/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
new file mode 100644
index 000000000000..b899e5c6e00c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
@@ -0,0 +1,38 @@
+DT compatible string versioning for SiFive open-source IP blocks
+
+This document describes the version specification for DT "compatible"
+strings for open-source SiFive IP blocks.  HDL for these IP blocks
+can be found in this public repository:
+
+https://github.com/sifive/sifive-blocks
+
+IP block-specific DT compatible strings are contained within the HDL,
+in the form "sifive,<ip-block-name><integer version number>".
+
+An example is "sifive,uart0" from:
+
+https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
+
+Until these IP blocks (or IP integration) support version
+autodiscovery, the maintainers of these IP blocks intend to increment
+the suffixed number in the compatible string whenever the software
+interface to these IP blocks changes, or when the functionality of the
+underlying IP blocks changes in a way that software should be aware of.
+
+Driver developers can use compatible string "match" values such as
+"sifive,uart0" to indicate that their driver is compatible with the
+register interface and functionality associated with the relevant
+upstream sifive-blocks commits.  It is expected that most drivers will
+match on these IP block-specific compatible strings.
+
+DT data authors, when writing data for a particular SoC, should
+continue to specify an SoC-specific compatible string value, such as
+"sifive,fu540-c000-uart".  This way, if SoC-specific
+integration-specific bug fixes or workarounds are needed, the kernel
+or other system software can match on this string to apply them.  The
+IP block-specific compatible string (such as "sifive,uart0") should
+then be specified as a subsequent value.
+
+An example of this style:
+
+    compatible = "sifive,fu540-c000-uart", "sifive,uart0";
-- 
2.19.1
