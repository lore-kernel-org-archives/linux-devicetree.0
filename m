From: thor.thayer@linux.intel.com
Subject: [PATCHv2 3/3] arm64: dts: stratix10: add sdram ecc
Date: Fri, 27 Apr 2018 13:37:18 -0500
Message-ID: <1524854238-19394-4-git-send-email-thor.thayer@linux.intel.com>
References: <1524854238-19394-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524854238-19394-1-git-send-email-thor.thayer@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bp@alien8.de, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, thor.thayer@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the Stratix10 ECC Manager and SDRAM EDAC nodes to the
device tree.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2  Remove unused SysMan syscon
    Remove unused SDRAM ECC register defines
    Remove unused address, size and range from device tree.
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index c89d0c307f8d..688391f3bf78 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -387,5 +387,17 @@
 			resets = <&rst WATCHDOG3_RESET>;
 			status = "disabled";
 		};
+
+		eccmgr {
+			compatible = "altr,socfpga-s10-ecc-manager";
+			interrupts = <0 15 4>, <0 95 4>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			sdramedac {
+				compatible = "altr,sdram-edac-s10";
+				interrupts = <16 4>, <48 4>;
+			};
+		};
 	};
 };
-- 
2.7.4
