From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 11/26] dt-bindings: Document mti,mips-cpc binding
Date: Tue, 30 Aug 2016 18:29:14 +0100
Message-ID: <20160830172929.16948-12-paul.burton@imgtec.com>
References: <20160830172929.16948-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160830172929.16948-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document a binding for the MIPS Cluster Power Controller (CPC) which
simply allows the device tree to specify where the CPC registers should
be mapped.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/misc/mti,mips-cpc.txt | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/mti,mips-cpc.txt

diff --git a/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt b/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
new file mode 100644
index 0000000..92eb08f
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
@@ -0,0 +1,8 @@
+Binding for MIPS Cluster Power Controller (CPC).
+
+This binding allows a system to specify where the CPC registers should be
+mapped using device tree.
+
+Required properties:
+compatible : Should be "mti,mips-cpc".
+regs: Should describe the address & size of the CPC register region.
-- 
2.9.3
