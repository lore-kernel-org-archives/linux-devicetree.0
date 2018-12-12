Return-Path: <SRS0=dIfH=OV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1845 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbeLLTbk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Dec 2018 14:31:40 -0500
From: Timo Alho <talho@nvidia.com>
Subject: [PATCH 4/4] dt-bindings: firmware: Add bindings for Tegra210 BPMP
Date: Wed, 12 Dec 2018 21:31:28 +0200
Message-ID: <1544643088-17678-5-git-send-email-talho@nvidia.com>
In-Reply-To: <1544643088-17678-1-git-send-email-talho@nvidia.com>
References: <1544643088-17678-1-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: treding@nvidia.com, sivaramn@nvidia.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Timo Alho <talho@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

The BPMP is a specific processor in Tegra210 chip, which is designed
for boot process handling, assisting in entering deep low power states
(suspend to ram), and offloading DRAM memory clock scaling on some
platforms.

Signed-off-by: Timo Alho <talho@nvidia.com>
---
 .../bindings/firmware/nvidia,tegra210-bpmp.txt     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
new file mode 100644
index 0000000..de1fb62
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
@@ -0,0 +1,36 @@
+NVIDIA Tegra210 Boot and Power Management Processor (BPMP)
+
+The Boot and Power Management Processor (BPMP) is a co-processor found
+in Tegra210 SoC. It is designed to handle the early stages of the boot
+process as well as to assisting in entering deep low power state
+(suspend to ram), and also offloading DRAM memory clock scaling on
+some platforms. The binding document defines the resources that would
+be used by the BPMP T210 firmware driver, which can create the
+interprocessor communication (IPC) between the CPU and BPMP.
+
+Required properties:
+- name : Should be bpmp
+- compatible
+    Array of strings
+    One of:
+    - "nvidia,tegra210-bpmp"
+- reg: physicall base address and length for HW synchornization primitives
+       1) base address and length to Tegra 'atomics' hardware
+       2) base address and length to Tegra 'semaphore' hardware
+- interrupts: specifies the interrupt number for receiving messages ("rx")
+              and for triggering messages ("tx")
+
+Optional properties:
+- #clock-cells : Should be 1 for platforms where DRAM clock control is
+                 offloaded to bpmp.
+
+Example:
+
+bpmp {
+	compatible = "nvidia,tegra210-bpmp";
+	reg = <0x0 0x70016000 0x0 0x2000
+	       0x0 0x60001000 0x0 0x1000>;
+	interrupts = <0 6 IRQ_TYPE_NONE>,
+		     <0 4 IRQ_TYPE_EDGE_RISING>;
+	interrupt-names = "tx", "rx";
+};
-- 
2.7.4
