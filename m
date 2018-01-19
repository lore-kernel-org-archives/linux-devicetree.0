From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: [PATCH v4 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Fri, 19 Jan 2018 16:40:48 +0100
Message-ID: <1516376459-25672-2-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1516376459-25672-1-git-send-email-aleksandar.markovic@rt-rk.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516376459-25672-1-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Hogan <james.hogan@mips.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Miodrag Dinic <miodrag.dinic@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton@mips.com>

Document a binding for the MIPS Cluster Power Controller (CPC) that
allows the device tree to specify where the CPC registers are located.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/power/mti,mips-cpc.txt | 8 ++++++++
 MAINTAINERS                                              | 1 +
 2 files changed, 9 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt

diff --git a/Documentation/devicetree/bindings/power/mti,mips-cpc.txt b/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
new file mode 100644
index 0000000..c6b8251
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
@@ -0,0 +1,8 @@
+Binding for MIPS Cluster Power Controller (CPC).
+
+This binding allows a system to specify where the CPC registers are
+located.
+
+Required properties:
+compatible : Should be "mti,mips-cpc".
+regs: Should describe the address & size of the CPC register region.
diff --git a/MAINTAINERS b/MAINTAINERS
index 1899480..cca71b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9108,6 +9108,7 @@ MIPS GENERIC PLATFORM
 M:	Paul Burton <paul.burton@mips.com>
 L:	linux-mips@linux-mips.org
 S:	Supported
+F:	Documentation/devicetree/bindings/power/mti,mips-cpc.txt
 F:	arch/mips/generic/
 F:	arch/mips/tools/generic-board-config.sh
 
-- 
2.7.4
