From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800 Ethernet controller
Date: Thu, 22 Oct 2015 15:02:37 +0100
Message-ID: <1445522558-5808-2-git-send-email-mans@mansr.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445522558-5808-1-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds a binding for the Aurora VLSI NB8800 Ethernet controller
using the "aurora,nb8800" compatible string.  When used in Sigma
Designs chips a few additional control registers are available.
This variant is indicated by the "sigma,smp8640-ethernet" compatible
string.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 .../devicetree/bindings/net/aurora,nb8800.txt      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/aurora,nb8800.txt

diff --git a/Documentation/devicetree/bindings/net/aurora,nb8800.txt b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
new file mode 100644
index 0000000..c19f615
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
@@ -0,0 +1,26 @@
+* Aurora VLSI AU-NB8800 Ethernet controller
+
+Required properties:
+- compatible: Should be "aurora,nb8800", "sigma,smp8640-ethernet"
+	The latter indicates presence of extra features added by Sigma Designs.
+- reg: Should be MMIO address space of the device
+- interrupts: Should contain the interrupt specifier for the device
+- interrupt-parent: Should be a phandle for the interrupt controller
+- clocks: Should be a phandle for the clock for the device
+
+Common properties described in ethernet.txt:
+- local-mac-address
+- mac-address
+- max-speed
+- phy-mode
+
+Example:
+
+ethernet@26000 {
+	compatible = "aurora,nb8800";
+	reg = <0x10000 0x800>;
+	interrupts = <42>;
+	clocks = <&sys_clk>;
+	max-speed = <1000>;
+	phy-connection-type = "rgmii";
+};
-- 
2.5.3
