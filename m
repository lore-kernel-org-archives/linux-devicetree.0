From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: [PATCH 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Fri, 15 Dec 2017 17:51:59 +0100
Message-ID: <1513356723-7393-2-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1513356723-7393-1-git-send-email-aleksandar.markovic@rt-rk.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513356723-7393-1-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, James Hogan <james.hogan@mips.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Miodrag Dinic <miodrag.dinic@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton@mips.com>

Document a binding for the MIPS Cluster Power Controller (CPC) which
simply allows the device tree to specify where the CPC registers should
be mapped.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
---
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
2.7.4
