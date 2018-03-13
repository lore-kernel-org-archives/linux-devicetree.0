From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.14 113/140] dt-bindings: Document mti,mips-cpc binding
Date: Tue, 13 Mar 2018 16:25:16 +0100
Message-ID: <20180313152505.770942823@linuxfoundation.org>
References: <20180313152458.201155692@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313152458.201155692@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, Rob Herring <robh@kernel.org>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, James Hogan <jhogan@kernel.org>
List-Id: devicetree@vger.kernel.org

4.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Paul Burton <paul.burton@mips.com>

commit aece34cd576c7625181b0488a8129c1e165355f7 upstream.

Document a binding for the MIPS Cluster Power Controller (CPC) that
allows the device tree to specify where the CPC registers are located.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Patchwork: https://patchwork.linux-mips.org/patch/18512/
Signed-off-by: James Hogan <jhogan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 Documentation/devicetree/bindings/power/mti,mips-cpc.txt |    8 ++++++++
 MAINTAINERS                                              |    1 +
 2 files changed, 9 insertions(+)

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
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9001,6 +9001,7 @@ MIPS GENERIC PLATFORM
 M:	Paul Burton <paul.burton@mips.com>
 L:	linux-mips@linux-mips.org
 S:	Supported
+F:	Documentation/devicetree/bindings/power/mti,mips-cpc.txt
 F:	arch/mips/generic/
 F:	arch/mips/tools/generic-board-config.sh
 
