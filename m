From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 1/2] syscon: dt-bindings: Add binding doc for Broadcom iProc CDRU
Date: Wed,  6 Sep 2017 17:27:41 -0700
Message-ID: <1504744062-5941-2-git-send-email-ray.jui@broadcom.com>
References: <1504744062-5941-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504744062-5941-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add binding document for Broadcom iProc's Chip Device Resource Unit
(CDRU). Multiple iProc based chips have this CDRU block that contains
miscellaneous registers for chip or device configurations. Start with
Stingray specific compatible string for the initial binding

Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 .../devicetree/bindings/mfd/brcm,iproc-cdru.txt          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt

diff --git a/Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt b/Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt
new file mode 100644
index 0000000..82f82e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt
@@ -0,0 +1,16 @@
+Broadcom iProc Chip Device Resource Unit (CDRU)
+
+Various Broadcom iProc SoCs have a set of registers that provide various
+chip specific device and resource configurations. This node allows access to
+these CDRU registers via syscon.
+
+Required properties:
+- compatible: should contain:
+		"brcm,sr-cdru", "syscon" for Stingray
+- reg: base address and range of the CDRU registers
+
+Example:
+	cdru: syscon@6641d000 {
+		compatible = "brcm,sr-cdru", "syscon";
+		reg = <0 0x6641d000 0 0x400>;
+	};
-- 
2.1.4
