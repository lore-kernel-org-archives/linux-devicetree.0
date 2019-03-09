From: Harini Katakam <harini.katakam@xilinx.com>
Subject: [PATCH] arm64: zynqmp: dt: Add TI PHY quirk
Date: Sat, 9 Mar 2019 16:46:58 +0530
Message-ID: <1552130218-21505-1-git-send-email-harini.katakam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, =mark.rutland@arm.com, michal.simek@xilinx.com, harini.katakam@xilinx.com, sudeep.holla@arm.com
Cc: devicetree@vger.kernel.org, harinikatakamlinux@gmail.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add TI PHY strap ctrl quirk for all the HW where applicable.

Signed-off-by: Harini Katakam <harini.katakam@xilinx.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts      | 1 +
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts      | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
index 11cc671..2421ec7 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
@@ -89,6 +89,7 @@
 		ti,rx-internal-delay = <0x8>;
 		ti,tx-internal-delay = <0xa>;
 		ti,fifo-depth = <0x1>;
+		ti,dp83867-rxctrl-strap-quirk;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index cef8167..2a3b665 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -110,6 +110,7 @@
 		ti,rx-internal-delay = <0x8>;
 		ti,tx-internal-delay = <0xa>;
 		ti,fifo-depth = <0x1>;
+		ti,dp83867-rxctrl-strap-quirk;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
index af4d868..1780ed2 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
@@ -21,6 +21,7 @@
 		ti,rx-internal-delay = <0x8>;
 		ti,tx-internal-delay = <0xa>;
 		ti,fifo-depth = <0x1>;
+		ti,dp83867-rxctrl-strap-quirk;
 	};
 	/* Cleanup from RevA */
 	/delete-node/ phy@21;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index d4ad19a..8f45614 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -55,6 +55,7 @@
 		ti,rx-internal-delay = <0x8>;
 		ti,tx-internal-delay = <0xa>;
 		ti,fifo-depth = <0x1>;
+		ti,dp83867-rxctrl-strap-quirk;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 94cf509..93ce7eb 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -111,6 +111,7 @@
 		ti,rx-internal-delay = <0x8>;
 		ti,tx-internal-delay = <0xa>;
 		ti,fifo-depth = <0x1>;
+		ti,dp83867-rxctrl-strap-quirk;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index 460adc3..8bb0001 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -106,6 +106,7 @@
 		ti,rx-internal-delay = <0x8>;
 		ti,tx-internal-delay = <0xa>;
 		ti,fifo-depth = <0x1>;
+		ti,dp83867-rxctrl-strap-quirk;
 	};
 };
 
-- 
2.7.4
