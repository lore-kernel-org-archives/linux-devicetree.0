From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH v2 2/5] Documentation: DT: Add bindings for Spreadtrum Sharkl
 Platform
Date: Fri, 17 Oct 2014 17:54:22 +0800
Message-ID: <1413539665-11484-3-git-send-email-chunyan.zhang@spreadtrum.com>
References: <sprd-1017-v2>
 <1413539665-11484-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1413539665-11484-1-git-send-email-chunyan.zhang@spreadtrum.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sprdlinux@freelists.org
List-Id: devicetree@vger.kernel.org

Adds Spreadtrum's prefix "sprd" to vendor-prefixes file.
Adds the devicetree binding documentation for Spreadtrum's serial
and Sharkl3 SoC based on the Sharkl Platform which is the 64-bit
SoC Platform of Spreadtrum.

Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
 Documentation/devicetree/bindings/arm/sprd.txt     |   11 +++++++++++
 .../devicetree/bindings/serial/sprd-serial.txt     |    6 ++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 3 files changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sprd.txt
 create mode 100644 Documentation/devicetree/bindings/serial/sprd-serial.txt

diff --git a/Documentation/devicetree/bindings/arm/sprd.txt b/Documentation/devicetree/bindings/arm/sprd.txt
new file mode 100644
index 0000000..40b40d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sprd.txt
@@ -0,0 +1,11 @@
+Spreadtrum Sharkl Platforms Device Tree Bindings
+----------------------------------------------------
+
+Sharkl is a Spreadtrum's SoC Platform which is based
+on ARM 64-bit processor.
+
+Sharkl3 FPGA board with Sharkl3 SoC based on the
+Sharkl Platform shall have the following properties.
+
+Required root node properties:
+        - compatible = "sprd,sharkl3-fpga", "sprd,sharkl3";
diff --git a/Documentation/devicetree/bindings/serial/sprd-serial.txt b/Documentation/devicetree/bindings/serial/sprd-serial.txt
new file mode 100644
index 0000000..c97b0a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/sprd-serial.txt
@@ -0,0 +1,6 @@
+* Spreadtrum serial UART
+
+Required properties:
+- compatible: must be "sprd,serial"
+- reg: offset and length of the register set for the device
+- interrupts: exactly one interrupt specifier
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ac7269f..5dbf7db 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -129,6 +129,7 @@ smsc	Standard Microsystems Corporation
 snps 	Synopsys, Inc.
 solidrun	SolidRun
 spansion	Spansion Inc.
+sprd	Spreadtrum Communications Inc.
 st	STMicroelectronics
 ste	ST-Ericsson
 stericsson	ST-Ericsson
-- 
1.7.9.5
