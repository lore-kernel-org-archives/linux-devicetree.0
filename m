From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 13/26] dt-bindings: Document mti,mips-cdmm binding
Date: Tue, 30 Aug 2016 18:29:16 +0100
Message-ID: <20160830172929.16948-14-paul.burton@imgtec.com>
References: <20160830172929.16948-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160830172929.16948-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document a binding for the MIPS Common Device Memory Map (CDMM) which
simply allows the device tree to specify where the CDMM registers should
be mapped.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt

diff --git a/Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt b/Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt
new file mode 100644
index 0000000..5b0fc40
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt
@@ -0,0 +1,8 @@
+Binding for MIPS Common Device Memory Map (CDMM) bus.
+
+This binding allows a system to specify where the CDMM registers should be
+mapped using device tree.
+
+Required properties:
+compatible : Should be "mti,mips-cdmm".
+regs: Should describe the address & size of the CDMM register region.
-- 
2.9.3
